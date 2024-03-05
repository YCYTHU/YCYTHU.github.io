#!/bin/bash
SCRIPT_DIR=/WORK/qiaoj_work/YCY
#$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
if [ $# -lt 1 ]; then
    echo `date +"%Y-%m-%d %H:%M:%S"`" Help AutoOrca.sh" >> $SCRIPT_DIR/STAT
    echo 'usage: AutoOrca.sh fileName --template template1.inp template2.inp --suffix suffix1 suffix2 -n 12 -m 3000'
    echo 'option: --template(-t) [template input file(s) for ORCA]'
    echo '        --suffix(-s) [customize suffix(es) for filename(s)]'
    echo '        --nprocs(-n) [number of cores, default: 16]'
    echo '        --memory(-m) [memory per core in MB, default: 3000]'
    echo '        --postpone(-p) [generate input file(s) without submitting task(s)]'
    exit 1
fi
echo `date +"%Y-%m-%d %H:%M:%S"`" Exec AutoOrca.sh" >> $SCRIPT_DIR/STAT

MULTIWFN_CMD=Multiwfn_noGUI
ORCA_CMD=/apps/soft/orca/orca.5.0.1/orca
SCHEDULER=SLURM
NCORES_DEFAULT=16
MEM_DEFAULT=3000

POSTPONE=false

GEOMETRY=$1
FILENAME=${1%.*}
shift 1
while [[ $1 == -* ]]
do
    case $1 in
        --nprocs|-n)
            NCORES=$2
            shift 2
            ;;
        --memory|-m)
            MEM=$2
            shift 2
            ;;
        --template|-t)
            shift 1
            while [ -n "$1" ] && (! [[ $1 == -* ]])
            do
                TEMPLATE[${#TEMPLATE[*]}]=$1
                shift 1
            done
            ;;
        --suffix|-s)
            shift 1
            while [ -n "$1" ] && (! [[ $1 == -* ]])
            do
                SUFFIX[${#SUFFIX[*]}]=$1
                shift 1
            done
            ;;
        --postpone|-p)
            POSTPONE=true
            shift 1
            ;;
        *)
            echo 'usage: AutoOrca.sh fileName --template template1.inp template2.inp --suffix suffix1 suffix2 -n 12 -m 3000'
            echo 'option: --template(-t) [template input file(s) for ORCA]'
            echo '        --suffix(-s) [customize suffix(es) for filename(s)]'
            echo '        --nprocs(-n) [number of cores, default: 16]'
            echo '        --memory(-m) [memory per core in MB, default: 3000]'
            echo "    <ERROR> Unknown option" >> $SCRIPT_DIR/STAT
            exit 1;;
    esac    
done
if [ ${#TEMPLATE[*]} -eq 0 ]; then
    echo "Error!!! at least one template file is required"
    echo "    <ERROR> Missing template files" >> $SCRIPT_DIR/STAT
    exit 1
elif [ ${#TEMPLATE[*]} -ne ${#SUFFIX[*]} ]; then
    echo "Error!!! the number of template files and the number of suffixes are not equal"
    echo "    <ERROR> Templates' and suffixes' number are not equal" >> $SCRIPT_DIR/STAT
    exit 1
fi

GEN_INP_FROM_TMPL() {
rand_txt_name=`date +%s%N | md5sum | cut -c 1-8`
cat > $rand_txt_name".txt" << EOF 
100
2
12
$3
-100
$2
0
q
EOF
$MULTIWFN_CMD $1 < $rand_txt_name".txt" > /dev/null
rm -f $rand_txt_name".txt"
}

GEN_SLURM_SUB() {
cat > $1".txt" << EOF 
#!/bin/bash
#SBATCH -J $1
#SBATCH -p cnall
#SBATCH -N 1
#SBATCH -o stdout.%j
#SBATCH -e stderr.%j
#SBATCH --no-requeue
#SBATCH --ntasks-per-node=$2

module load compilers/gcc/v12.2.0
module load mpi/openmpi/v4.1.4-gcc12
module load soft/orca/v5.0.1

$ORCA_CMD $1.inp >> $1.out
EOF
}

GEN_PBS_SUB() {
cat > $1".txt" << EOF 
#!/bin/bash
#PBS -N $1
#PBS -q medium
#PBS -l nodes=1:ppn=$2
#PBS -l walltime=320:00:00

$ORCA_CMD $1.inp >> $1.out
EOF
}

for ((index=0;index<${#TEMPLATE[*]};index++)) 
do
    tmpl=${TEMPLATE[index]}
    suffix=${SUFFIX[index]}
    rand_inp_name=`date +%s%N | md5sum | cut -c 1-8`
    cp $tmpl $rand_inp_name".inp"

    if [ -n "$NCORES" ]; then
        sed -i "s/nprocs\ \{1,\}[0-9]\{1,\}/nprocs   $NCORES/" $rand_inp_name".inp"
        NCORES_IS_WRITTEN=`grep -io 'nprocs\ \{1,\}[0-9]\{1,\}' $rand_inp_name".inp"`
        if [ -z "$NCORES_IS_WRITTEN" ]; then
            sed -i "1i %pal nprocs   $NCORES end" $rand_inp_name".inp"
        fi
    else
        NCORES_IS_WRITTEN=`grep -io 'nprocs\ \{1,\}[0-9]\{1,\}' $rand_inp_name".inp"`
        if [ -z "$NCORES_IS_WRITTEN" ]; then
            NCORES=$NCORES_DEFAULT
            sed -i "1i %pal nprocs   $NCORES end" $rand_inp_name".inp"
        else
            NCORES=${NCORES_IS_WRITTEN/nprocs/}
        fi
    fi
    echo using $NCORES cores for $FILENAME"_$suffix.inp"

    if [ -n "$MEM" ]; then
        sed -i "s/%maxcore\ \{1,\}[0-9]\{1,\}/%maxcore  $MEM/" $rand_inp_name".inp"
        MEM_IS_WRITTEN=`grep -io '%maxcore\ \{1,\}[0-9]\{1,\}' $rand_inp_name".inp"`
        if [ -z "$NCORES_IS_WRITTEN" ]; then
            sed -i "1i %maxcore  $MEM" $rand_inp_name".inp"
        fi
    else
        MEM_IS_WRITTEN=`grep -io '%maxcore\ \{1,\}[0-9]\{1,\}' $rand_inp_name".inp"`
        if [ -z "$MEM_IS_WRITTEN" ]; then
            MEM=$MEM_DEFAULT
            sed -i "1i %maxcore  $MEM" $rand_inp_name".inp"
        else
            MEM=${MEM_IS_WRITTEN/\%maxcore/}
        fi
    fi
    echo using $MEM"MB" memory per core for $FILENAME"_$suffix.inp"

    GEN_INP_FROM_TMPL $GEOMETRY $rand_inp_name".inp" $FILENAME"_"$suffix".inp"
    rm -f $rand_inp_name".inp"
    if [ "$SCHEDULER" = SLURM ]; then
        GEN_SLURM_SUB $FILENAME"_"$suffix $NCORES
        [ "$POSTPONE" = false ] && sbatch $FILENAME"_"$suffix".txt"
    elif [ "$SCHEDULER" = PBS ]; then
        GEN_PBS_SUB $FILENAME"_"$suffix $NCORES
        [ "$POSTPONE" = false ] && qsub $FILENAME"_"$suffix".txt"
    else
        echo "Error!!! unknown scheduler"
    fi
done
