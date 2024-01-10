#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
if [ $# -lt 1 ]; then
    echo "Help AutoExSts.sh at "`date +"%Y-%m-%d %H:%M:%S"` >> $SCRIPT_DIR/STAT
    echo 'usage: AutoExSts.sh MoleculeName -S opt -T sp -n 24 -m 72 -t template.gjf'
    echo 'option:-[S task type for singlet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
    echo '       -[T task type for triplet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
    echo '       -[N number of states, default: 4]'
    echo '       -[R index of root, default: 1]'
    echo '       -[n number of cores, default: 16]'
    echo '       -[m memory in GB, default: three times of number of cores]'
    echo '       -[s template gjf file for singlet excited states, profiles from ground state will be used if not defined]' 
    echo '       -[t template gjf file for triplet excited states, profiles from ground state will be used if not defined]' 
    echo '       -[e print FMO energys and excitation energys to a text file]' 
    echo '       -[c export FMO cube files of ground state and hole-electron cube files of excited state root]' 
    exit 1
fi
echo "Exec AutoExSts.sh at "`date +"%Y-%m-%d %H:%M:%S"` >> $SCRIPT_DIR/STAT

NPROC_DEFAULT=16
MEM_DEFAULT=$((3*$NPROC_DEFAULT))
NSTATES_DEFAULT=4
ROOT_DEFAULT=1
EXPORT_CUBE=false
PRINT_ENERGY=false

FILENAME=$1
if [ -f $FILENAME".gjf" ] && [ -f $FILENAME".fchk" ] && [ -f $FILENAME".log" ];then
    logTail=`tail -n 1 $FILENAME".log"`
    if ! [[ $logTail =~ "Normal termination of Gaussian" ]];then
        echo "Error!!! Gaussian did NOT terminate normally"
        echo "    <ERROR> Abnormal Gaussian log file" >> $SCRIPT_DIR/STAT
        exit 1
    fi
    dos2unix $FILENAME".gjf"
    shift 1
else
    echo "Error!!! one or more of $FILENAME.gjf/.fchk/.log does NOT exist"
    echo "    <ERROR> Missing Gaussian files" >> $SCRIPT_DIR/STAT
fi
while getopts ":cen:m:s:t:N:R:S:T:" opt
do
    case $opt in
        c) EXPORT_CUBE=true;;
        e) PRINT_ENERGY=true;;
        n) NPROC=$OPTARG;;
        m) MEM=$OPTARG;;
        s) TEMPLATE_SINGLET=$OPTARG;;
        t) TEMPLATE_TRIPLET=$OPTARG;;
        N) NSTATES=$OPTARG;;
        R) ROOT=$OPTARG;;
        S) SINGLET=$OPTARG;;
        T) TRIPLET=$OPTARG;;
        :) echo "$OPTARG option need an argument"
           echo "    <ERROR> Missing argument" >> $SCRIPT_DIR/STAT
           exit 1;;
        ?) echo 'usage: AutoExSts.sh MoleculeName -S opt -T sp -n 24 -m 72 -t template.gjf'
           echo 'option:-[S task type for singlet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
           echo '       -[T task type for triplet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
           echo '       -[N number of states, default: 4]'
           echo '       -[R index of root, default: 1]'
           echo '       -[n number of cores, default: 16]'
           echo '       -[m memory in GB, default: three times of number of cores]'
           echo '       -[s template gjf file for singlet excited states, profiles from ground state will be used if not defined]' 
           echo '       -[t template gjf file for triplet excited states, profiles from ground state will be used if not defined]' 
           echo '       -[e print FMO energys and excitation energys to a text file]' 
           echo '       -[c export FMO cube files of ground state and hole-electron cube files of excited state root]' 
           echo "    <ERROR> Unknown option" >> $SCRIPT_DIR/STAT
           exit 1;;
    esac
done
shift $(($OPTIND - 1))

print_FMO_energy() {
cat > script.txt << EOF 
0
q
EOF
Multiwfn_noGUI $1".fchk" < script.txt > $1"_Multiwfn.txt"
echo "当前数据来自：$1" >> $1"_Energy.txt"
grep -E 'HOMO|LUMO' $1"_Multiwfn.txt"  >> $1"_Energy.txt"
rm -f $1"_Multiwfn.txt"
rm -f script.txt
}

export_FMO_cube() {
cat > script.txt << EOF 
200
3
h
2
3
l
2
0
q
EOF
Multiwfn_noGUI $1".fchk" < script.txt > Multiwfn_out.txt
mv h.cub $1"_HOMO.cub"
mv l.cub $1"_LUMO.cub"
rm -f script.txt
rm -f Multiwfn_out.txt
}

gen_gjf_from_tmpl() {
cat > script.txt << EOF 
100
2
10
$2
n
0
q
EOF
Multiwfn_noGUI $1 < script.txt > Multiwfn_out.txt
rm -f script.txt
rm -f Multiwfn_out.txt
}

gen_sub() {
cat > $1".txt" << EOF 
#!/bin/bash
#SBATCH -J $1
#SBATCH -p cnall
#SBATCH -N 1
#SBATCH -o stdout.%j
#SBATCH -e stderr.%j
#SBATCH --no-requeue
#SBATCH --ntasks-per-node=$2

g16 $1.gjf
formchk $1.chk
EOF
if [ "$3" = true ];then
cat >> $1".txt" << EOF 
echo "当前数据来自：$1" >> ${1//${1:(-3)}/_Energy.txt}
logTail=\`tail -n 1 $1.log\`
    if ! [[ \$logTail =~ "Normal termination of Gaussian" ]];then
        echo "Error!!! Gaussian did NOT terminate normally" >> ${1//${1:(-3)}/_Energy.txt}
        exit 1
    fi
grep 'Excited State\ ' $1.log | tail -$4 >> ${1//${1:(-3)}/_Energy.txt}
EOF
fi
if [ "$5" = true ];then
cat >> $1".txt" << eof 
cat > script.txt << EOF 
18
1
$1.log
$6
1
2
10
1
11
1
0
0
0
q
EOF
Multiwfn_noGUI $1.fchk < script.txt > Multiwfn_out.txt
mv hole.cub $1_hole.cub
mv electron.cub $1_electron.cub
rm -f script.txt
rm -f Multiwfn_out.txt
eof
fi
}

if [ "$PRINT_ENERGY" = true ]; then
    print_FMO_energy $FILENAME
fi
if [ "$EXPORT_CUBE" = true ]; then
    export_FMO_cube $FILENAME
fi

if [ -n "$SINGLET" ] && [ "$SINGLET" != "none" ];then
    if [ -n "$TEMPLATE_SINGLET" ];then
        if [[ -f "$TEMPLATE_SINGLET" ]];then
            echo "using profiles from $TEMPLATE_SINGLET for singlet excited states"
            cp $TEMPLATE_SINGLET template.gjf
        else
            echo "Error!!! template file $TEMPLATE_SINGLET not exist"
            echo "    <ERROR> Missing singlet template file" >> $SCRIPT_DIR/STAT
            exit
        fi
    else
        echo "using profiles from $FILENAME.gjf for singlet excited states"
        cp $FILENAME".gjf" temp.gjf
        TDDFT="td=(singlets,nstates=$NSTATES_DEFAULT,root=$ROOT_DEFAULT)"
        sed -i "s/#[^.]*/& $TDDFT/" temp.gjf
        sed -i "s/$FILENAME/[name]/" temp.gjf
        GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" temp.gjf`
        head -$(($GEOMETRY_LINE-1)) temp.gjf > template.gjf
        rm -f temp.gjf
        sed -i "$(($GEOMETRY_LINE-1))a [geometry]" template.gjf
        echo >> template.gjf
    fi
    sed -e 's/opt=[^\ ]*\ //' -e 's/opt=[^.]*//' -e 's/opt//' -e 's/freq=[^\ ]*\ //' -e 's/freq=[^.]*//' -e 's/freq//' -i template.gjf
    case $SINGLET in
        sp) ;;
        opt) sed -i "s/#[^.]*/& opt/" template.gjf;;
        optfreq) sed -i "s/#[^.]*/& opt freq/" template.gjf;;
        *) echo 'Error!!! wrong option for singlet task type'
           echo "    <ERROR> Unknown argument for -S" >> $SCRIPT_DIR/STAT
           exit 1;;
    esac

    if [ -n "$NPROC" ];then
        SINGLET_NPROC=$NPROC
        sed -i "s/%nprocshared=[0-9]\{1,\}/%nprocshared=$SINGLET_NPROC/" template.gjf
        NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            sed -i "1i %nprocshared=$SINGLET_NPROC" template.gjf
        fi
    else
        NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            SINGLET_NPROC=$NPROC_DEFAULT
            sed -i "1i %nprocshared=$SINGLET_NPROC" template.gjf
        else
            SINGLET_NPROC=${NPROC_IS_WRITTEN/\%nprocshared=/}
        fi
    fi
    echo "using $SINGLET_NPROC cores for singlet excited states"

    if [ -n "$MEM" ];then
        SINGLET_MEM=$MEM
        sed -i "s/%mem=[0-9]\{1,\}/%mem=$SINGLET_MEM/" template.gjf
        MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
        if [ -z "$MEM_IS_WRITTEN" ];then
            sed -i "1i %mem=$SINGLET_MEM" template.gjf
        fi
    else
        MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            SINGLET_MEM=$MEM_DEFAULT
            sed -i "1i %mem=$SINGLET_MEM" template.gjf
        else
            SINGLET_MEM=${MEM_IS_WRITTEN/\%mem=/}
        fi
    fi
    echo "using "$SINGLET_MEM"GB memory for singlet excited states"

    if [ -n "$NSTATES" ];then
        SINGLET_NSTATES=$NSTATES
        sed -i "s/nstates=[0-9]\{1,\}/nstates=$SINGLET_NSTATES/" template.gjf
        NSTATES_IS_WRITTEN=`grep -io 'nstates=[0-9]\{1,\}' template.gjf`
        if [ -z "$NSTATES_IS_WRITTEN" ];then
            sed -i "s/#[^.]*/& td=nstates=$SINGLET_NSTATES/" template.gjf
        fi
    else
        NSTATES_IS_WRITTEN=`grep -io 'nstates=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            SINGLET_NSTATES=$NSTATES_DEFAULT
            sed -i "s/#[^.]*/& td=nstates=$SINGLET_NSTATES/" template.gjf
        else
            SINGLET_NSTATES=${NSTATES_IS_WRITTEN/nstates=/}
        fi
    fi
    echo "setting nstates=$SINGLET_NSTATES for singlet excited states"

    if [ -n "$ROOT" ];then
        SINGLET_ROOT=$ROOT
        sed -i "s/root=[0-9]\{1,\}/root=$SINGLET_ROOT/" template.gjf
        ROOT_IS_WRITTEN=`grep -io 'root=[0-9]\{1,\}' template.gjf`
        if [ -z "$ROOT_IS_WRITTEN" ];then
            sed -i "s/#[^.]*/& td=root=$SINGLET_ROOT/" template.gjf
        fi
    else
        ROOT_IS_WRITTEN=`grep -io 'root=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            SINGLET_ROOT=$ROOT_DEFAULT
            sed -i "s/#[^.]*/& td=root=$SINGLET_ROOT/" template.gjf
        else
            SINGLET_ROOT=${ROOT_IS_WRITTEN/root=/}
        fi
    fi
    echo "setting root=$SINGLET_ROOT for singlet excited states"

    gen_gjf_from_tmpl $FILENAME".fchk" $FILENAME"_S"$SINGLET_ROOT".gjf"
    rm -f template.gjf
    gen_sub $FILENAME"_S"$SINGLET_ROOT $SINGLET_NPROC $PRINT_ENERGY $SINGLET_NSTATES $EXPORT_CUBE $SINGLET_ROOT
    sbatch $FILENAME"_S"$SINGLET_ROOT".txt"
fi

if [ -n "$TRIPLET" ] && [ "$TRIPLET" != "none" ];then
    if [ -n "$TEMPLATE_TRIPLET" ];then
        if [[ -f "$TEMPLATE_TRIPLET" ]];then
            echo "using profiles from $TEMPLATE_TRIPLET for triplet excited states"
            cp $TEMPLATE_TRIPLET template.gjf
        else
            echo "Error!!! template file $TEMPLATE_TRIPLET not exist"
            echo "    <ERROR> Missing triplet template file" >> $SCRIPT_DIR/STAT
            exit
        fi
    else
        echo "using profiles from $FILENAME.gjf for triplet excited states"
        cp $FILENAME".gjf" temp.gjf
        TDDFT="td=(triplets,nstates=$NSTATES_DEFAULT,root=$ROOT_DEFAULT)"
        sed -i "s/#[^.]*/& $TDDFT/" temp.gjf
        sed -i "s/$FILENAME/[name]/" temp.gjf
        GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" temp.gjf`
        head -$(($GEOMETRY_LINE-1)) temp.gjf > template.gjf
        rm -f temp.gjf
        sed -i "$(($GEOMETRY_LINE-1))a [geometry]" template.gjf
        echo >> template.gjf
    fi
    sed -e 's/opt=[^\ ]*\ //' -e 's/opt=[^.]*//' -e 's/opt//' -e 's/freq=[^\ ]*\ //' -e 's/freq=[^.]*//' -e 's/freq//' -i template.gjf
    case $TRIPLET in
        sp) ;;
        opt) sed -i "s/#[^.]*/& opt/" template.gjf;;
        optfreq) sed -i "s/#[^.]*/& opt freq/" template.gjf;;
        *) echo 'Error!!! wrong option for triplet task type'
           echo "    <ERROR> Unknown argument for -T" >> $SCRIPT_DIR/STAT
           exit 1
    esac

    if [ -n "$NPROC" ];then
        TRIPLET_NPROC=$NPROC
        sed -i "s/%nprocshared=[0-9]\{1,\}/%nprocshared=$TRIPLET_NPROC/" template.gjf
        NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            sed -i "1i %nprocshared=$TRIPLET_NPROC" template.gjf
        fi
    else
        NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            TRIPLET_NPROC=$NPROC_DEFAULT
            sed -i "1i %nprocshared=$TRIPLET_NPROC" template.gjf
        else
            TRIPLET_NPROC=${NPROC_IS_WRITTEN/\%nprocshared=/}
        fi
    fi
    echo "using $TRIPLET_NPROC cores for triplet excited states"

    if [ -n "$MEM" ];then
        TRIPLET_MEM=$MEM
        sed -i "s/%mem=[0-9]\{1,\}/%mem=$TRIPLET_MEM/" template.gjf
        MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
        if [ -z "$MEM_IS_WRITTEN" ];then
            sed -i "1i %mem=$TRIPLET_MEM" template.gjf
        fi
    else
        MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            TRIPLET_MEM=$MEM_DEFAULT
            sed -i "1i %mem=$TRIPLET_MEM" template.gjf
        else
            TRIPLET_MEM=${MEM_IS_WRITTEN/\%mem=/}
        fi
    fi
    echo "using "$TRIPLET_MEM"GB memory for triplet excited states"

    if [ -n "$NSTATES" ];then
        TRIPLET_NSTATES=$NSTATES
        sed -i "s/nstates=[0-9]\{1,\}/nstates=$TRIPLET_NSTATES/" template.gjf
        NSTATES_IS_WRITTEN=`grep -io 'nstates=[0-9]\{1,\}' template.gjf`
        if [ -z "$NSTATES_IS_WRITTEN" ];then
            sed -i "s/#[^.]*/& td=nstates=$TRIPLET_NSTATES/" template.gjf
        fi
    else
        NSTATES_IS_WRITTEN=`grep -io 'nstates=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            TRIPLET_NSTATES=$NSTATES_DEFAULT
            sed -i "s/#[^.]*/& td=nstates=$TRIPLET_NSTATES/" template.gjf
        else
            TRIPLET_NSTATES=${NSTATES_IS_WRITTEN/nstates=/}
        fi
    fi
    echo "setting nstates=$TRIPLET_NSTATES for triplet excited states"

    if [ -n "$ROOT" ];then
        TRIPLET_ROOT=$ROOT
        sed -i "s/root=[0-9]\{1,\}/root=$TRIPLET_ROOT/" template.gjf
        ROOT_IS_WRITTEN=`grep -io 'root=[0-9]\{1,\}' template.gjf`
        if [ -z "$ROOT_IS_WRITTEN" ];then
            sed -i "s/#[^.]*/& td=root=$TRIPLET_ROOT/" template.gjf
        fi
    else
        ROOT_IS_WRITTEN=`grep -io 'root=[0-9]\{1,\}' template.gjf`
        if [ -z "$NPROC_IS_WRITTEN" ];then
            TRIPLET_ROOT=$ROOT_DEFAULT
            sed -i "s/#[^.]*/& td=root=$TRIPLET_ROOT/" template.gjf
        else
            TRIPLET_ROOT=${ROOT_IS_WRITTEN/root=/}
        fi
    fi
    echo "setting root=$TRIPLET_ROOT for triplet excited states"

    gen_gjf_from_tmpl $FILENAME".fchk" $FILENAME"_T"$TRIPLET_ROOT".gjf"
    rm -f template.gjf
    gen_sub $FILENAME"_T"$TRIPLET_ROOT $TRIPLET_NPROC $PRINT_ENERGY $TRIPLET_NSTATES $EXPORT_CUBE $TRIPLET_ROOT
    sbatch $FILENAME"_T"$TRIPLET_ROOT".txt"
fi

