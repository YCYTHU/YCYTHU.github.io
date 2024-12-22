#!/bin/bash
SCRIPT_DIR=/WORK/qiaoj_work/YCY
#$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
if [ $# -lt 1 ]; then
    echo `date +"%Y-%m-%d %H:%M:%S"`" Help AutoExSts.sh" >> $SCRIPT_DIR/STAT
    echo 'usage: AutoExSts.sh MoleculeName -S opt -T sp -n 24 -m 72 -t template.gjf'
    echo 'option:-S [task type for singlet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
    echo '       -T [task type for triplet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
    echo '       -N [number of states, default: 4]'
    echo '       -R [index of root, default: 1]'
    echo '       -n [number of cores, default: 16]'
    echo '       -m [memory in GB, default: three times of number of cores]'
    echo '       -s [template gjf file for singlet excited states, profiles from ground state will be used if not defined]' 
    echo '       -t [template gjf file for triplet excited states, profiles from ground state will be used if not defined]' 
    echo '       -x [customize additional suffix for filenames]' 
    echo '       -c [export FMO cube files of ground state and hole-electron cube files of excited state root]' 
    echo '       -e [print FMO energys and excitation energys to a text file]' 
    echo '       -p [generate input file(s) without submitting task(s)]' 
    exit 1
fi
echo `date +"%Y-%m-%d %H:%M:%S"`" Exec AutoExSts.sh" >> $SCRIPT_DIR/STAT

MULTIWFN_CMD=Multiwfn_noGUI
GAUSSIAN_CMD=g16
FORMCHK_CMD=formchk
SCHEDULER=SLURM

NPROC_DEFAULT=16
MEM_DEFAULT=$((3*$NPROC_DEFAULT))
NSTATES_DEFAULT=4
ROOT_DEFAULT=1

EXPORT_CUBE=false
PRINT_ENERGY=false
POSTPONE=false

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
    exit 1
fi
while getopts ":cepn:m:s:t:x:N:R:S:T:" opt
do
    case $opt in
        c) EXPORT_CUBE=true;;
        e) PRINT_ENERGY=true;;
        p) POSTPONE=true;;
        n) NPROC=$OPTARG;;
        m) MEM=$OPTARG;;
        s) TEMPLATE_SINGLET=$OPTARG;;
        t) TEMPLATE_TRIPLET=$OPTARG;;
        x) SUFFIX=_$OPTARG;;
        N) NSTATES=$OPTARG;;
        R) ROOT=$OPTARG;;
        S) SINGLET=$OPTARG;;
        T) TRIPLET=$OPTARG;;
        :) echo "$OPTARG option need an argument"
           echo "    <ERROR> Missing argument" >> $SCRIPT_DIR/STAT
           exit 1;;
        ?) echo 'usage: AutoExSts.sh MoleculeName -S opt -T sp -n 24 -m 72 -t template.gjf'
           echo 'option:-S [task type for singlet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
           echo '       -T [task type for triplet excited states, enumeration of {none, sp, opt, optfreq}, default: none]'
           echo '       -N [number of states, default: 4]'
           echo '       -R [index of root, default: 1]'
           echo '       -n [number of cores, default: 16]'
           echo '       -m [memory in GB, default: three times of number of cores]'
           echo '       -s [template gjf file for singlet excited states, profiles from ground state will be used if not defined]' 
           echo '       -t [template gjf file for triplet excited states, profiles from ground state will be used if not defined]' 
           echo '       -x [customize additional suffix for filenames]' 
           echo '       -c [export FMO cube files of ground state and hole-electron cube files of excited state root]' 
           echo '       -e [print FMO energys and excitation energys to a text file]' 
           echo '       -p [generate input file(s) without submitting task(s)]' 
           echo "    <ERROR> Unknown option" >> $SCRIPT_DIR/STAT
           exit 1;;
    esac
done
shift $(($OPTIND - 1))

PRINT_FMO_ENERGY() {
rand_name=`date +%s%N | md5sum | cut -c 1-8`
cat > $rand_name".txt" << EOF 
0
q
EOF
$MULTIWFN_CMD $1".fchk" < $rand_name".txt" > $1"_$rand_name.txt"
echo "当前数据来自：$1" >> $1"_Energy.txt"
grep -E 'HOMO|LUMO' $1"_$rand_name.txt"  >> $1"_Energy.txt"
rm -f $1"_$rand_name.txt"
rm -f $rand_name".txt"
}

EXPORT_FMO_CUBE() {
rand_name=`date +%s%N | md5sum | cut -c 1-8`
cat > $rand_name".txt" << EOF 
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
$MULTIWFN_CMD $1".fchk" < $rand_name".txt" > /dev/null
mv h.cub $1"_HOMO.cub"
mv l.cub $1"_LUMO.cub"
rm -f $rand_name".txt"
}

GEN_GJF_FROM_TMPL() {
rand_name=`date +%s%N | md5sum | cut -c 1-8`
cat > $rand_name".txt" << EOF 
100
2
10
$2
n
0
q
EOF
$MULTIWFN_CMD $1 < $rand_name".txt" > /dev/null
rm -f $rand_name".txt"
}

GEN_SLURM_SUB() {
cat > $2".txt" << EOF 
#!/bin/bash
#SBATCH -J $2
#SBATCH -p cnall
#SBATCH -N 1
#SBATCH -o %j.stdout
#SBATCH -e %j.stderr
#SBATCH --no-requeue
#SBATCH --ntasks-per-node=$3

$GAUSSIAN_CMD $2.gjf
$FORMCHK_CMD $2.chk
EOF
if [ "$4" = true ];then
cat >> $2".txt" << EOF 
echo "当前数据来自：$2" >> $1_Energy.txt
logTail=\`tail -n 1 $2.log\`
if ! [[ \$logTail =~ "Normal termination of Gaussian" ]];then
    echo "Error!!! Gaussian did NOT terminate normally" >> $1_Energy.txt
    exit 1
fi
grep 'Excited State\ ' $2.log | tail -$5 >> $1_Energy.txt
EOF
fi
if [ "$6" = true ];then
cat >> $2".txt" << eof 
rand_name=\`date +%s%N | md5sum | cut -c 1-8\`
cat > \$rand_name".txt" << EOF 
18
1
$2.log
$7
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
$MULTIWFN_CMD $2.fchk < \$rand_name".txt" > /dev/null
mv hole.cub $2_hole.cub
mv electron.cub $2_electron.cub
rm -f \$rand_name".txt"
eof
fi
}

GEN_PBS_SUB() {
cat > $2".txt" << EOF 
#!/bin/bash
#PBS -N $2
#PBS -q medium
#PBS -l nodes=1:ppn=$3
#PBS -l walltime=320:00:00

source /home/scicons/profiles/profile.g16
export GAUSS_SCRDIR=\`mktemp -d\`
cd \$PBS_O_WORKDIR
cat \$PBS_NODEFILE
env > env
$GAUSSIAN_CMD $2.gjf
$FORMCHK_CMD $2.chk
rm -f \$GAUSS_SCRDIR
EOF
if [ "$4" = true ];then
cat >> $2".txt" << EOF 
echo "当前数据来自：$2" >> $1_Energy.txt
logTail=\`tail -n 1 $2.log\`
if ! [[ \$logTail =~ "Normal termination of Gaussian" ]];then
    echo "Error!!! Gaussian did NOT terminate normally" >> $1_Energy.txt
    exit 1
fi
grep 'Excited State\ ' $2.log | tail -$5 >> $1_Energy.txt
EOF
fi
if [ "$6" = true ];then
cat >> $2".txt" << eof 
rand_name=\`date +%s%N | md5sum | cut -c 1-8\`
cat > \$rand_name".txt" << EOF 
18
1
$2.log
$7
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
$MULTIWFN_CMD $2.fchk < \$rand_name".txt" > /dev/null
mv hole.cub $2_hole.cub
mv electron.cub $2_electron.cub
rm -f \$rand_name".txt"
eof
fi
}

if [ "$PRINT_ENERGY" = true ]; then
    PRINT_FMO_ENERGY $FILENAME
fi
if [ "$EXPORT_CUBE" = true ]; then
    EXPORT_FMO_CUBE $FILENAME
fi

tmpl_rand_name=`date +%s%N | md5sum | cut -c 1-8`
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
        cp $FILENAME".gjf" $tmpl_rand_name".gjf"
        TDDFT="td=(singlets,nstates=$NSTATES_DEFAULT,root=$ROOT_DEFAULT)"
        sed -i "s/#[^.]*/& $TDDFT/" $tmpl_rand_name".gjf"
        sed -i "s/$FILENAME/[name]/" $tmpl_rand_name".gjf"
        GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" $tmpl_rand_name".gjf"`
        head -$(($GEOMETRY_LINE-1)) $tmpl_rand_name".gjf" > template.gjf
        rm -f $tmpl_rand_name".gjf"
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
        if [ -z "$MEM_IS_WRITTEN" ];then
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

    SINGLET_FILENAME=$FILENAME"_S"$SINGLET_ROOT"_"$SINGLET$SUFFIX
    GEN_GJF_FROM_TMPL $FILENAME".fchk" $SINGLET_FILENAME".gjf"
    rm -f template.gjf
    if [ "$SCHEDULER" = SLURM ]; then
        GEN_SLURM_SUB $FILENAME $SINGLET_FILENAME $SINGLET_NPROC $PRINT_ENERGY $SINGLET_NSTATES $EXPORT_CUBE $SINGLET_ROOT
        [ "$POSTPONE" = false ] && sbatch $SINGLET_FILENAME".txt"
    elif [ "$SCHEDULER" = PBS ]; then
        GEN_PBS_SUB $FILENAME $SINGLET_FILENAME $SINGLET_NPROC $PRINT_ENERGY $SINGLET_NSTATES $EXPORT_CUBE $SINGLET_ROOT
        [ "$POSTPONE" = false ] && qsub $SINGLET_FILENAME".txt"
    else
        echo "Error!!! unknown scheduler"
        echo "    <ERROR> Unknown scheduler" >> $SCRIPT_DIR/STAT
        exit 1
    fi
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
        cp $FILENAME".gjf" $tmpl_rand_name".gjf"
        TDDFT="td=(triplets,nstates=$NSTATES_DEFAULT,root=$ROOT_DEFAULT)"
        sed -i "s/#[^.]*/& $TDDFT/" $tmpl_rand_name".gjf"
        sed -i "s/$FILENAME/[name]/" $tmpl_rand_name".gjf"
        GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" $tmpl_rand_name".gjf"`
        head -$(($GEOMETRY_LINE-1)) $tmpl_rand_name".gjf" > template.gjf
        rm -f $tmpl_rand_name".gjf"
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
        if [ -z "$MEM_IS_WRITTEN" ];then
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

    TRIPLET_FILENAME=$FILENAME"_T"$TRIPLET_ROOT"_"$TRIPLET$SUFFIX
    GEN_GJF_FROM_TMPL $FILENAME".fchk" $TRIPLET_FILENAME".gjf"
    rm -f template.gjf
    if [ "$SCHEDULER" = SLURM ]; then
        GEN_SLURM_SUB $FILENAME $TRIPLET_FILENAME $TRIPLET_NPROC $PRINT_ENERGY $TRIPLET_NSTATES $EXPORT_CUBE $TRIPLET_ROOT
        [ "$POSTPONE" = false ] && sbatch $TRIPLET_FILENAME".txt"
    elif [ "$SCHEDULER" = PBS ]; then
        GEN_PBS_SUB $FILENAME $TRIPLET_FILENAME $TRIPLET_NPROC $PRINT_ENERGY $TRIPLET_NSTATES $EXPORT_CUBE $TRIPLET_ROOT
        [ "$POSTPONE" = false ] && qsub $TRIPLET_FILENAME".txt"
    else
        echo "Error!!! unknown scheduler"
        echo "    <ERROR> Unknown scheduler" >> $SCRIPT_DIR/STAT
        exit 1
    fi
fi
