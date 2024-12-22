#!/bin/bash
SCRIPT_DIR=/WORK/qiaoj_work/YCY
if [ $# -lt 1 ]; then
    echo `date +"%Y-%m-%d %H:%M:%S"`" Help CleaveBond.sh" >> $SCRIPT_DIR/STAT
    echo 'usage: CleaveBond.sh fileName atom1 atom2 --reserve large -n 16 -m 48'
    echo 'option: --reserve(-r) [reserve one or both of the fragments, enumeration of {both, small, large, first, second}, default: both]'
    echo '        --template(-t) [template input file for Gaussian]'
    echo '        --charge(-c) [charge(s) of fragments, default: 0]'
    echo '        --spin(-s) [spin multiplicity(ies) of fragments, default: 2]'
    echo '        --nprocs(-n) [number of cores, default: 16]'
    echo '        --memory(-m) [memory in GB, default: three times of number of cores]'
    echo '        --postpone(-p) [generate input file(s) without submitting task(s)]'
    exit 1
fi
echo `date +"%Y-%m-%d %H:%M:%S"`" Exec CleaveBond.sh" >> $SCRIPT_DIR/STAT

MULTIWFN_CMD=Multiwfn_noGUI
GAUSSIAN_CMD=g16
FORMCHK_CMD=formchk
SCHEDULER=SLURM

CHARGE_DEFAULT=0
SPIN_DEFAULT=2
NPROC_DEFAULT=16
MEM_DEFAULT=$((3*$NPROC_DEFAULT))
PROFILES_DEFAULT='# opt b3lyp/6-31g* em=gd3bj'

RESERVE=both
POSTPONE=false

FILENAME=$1
FIRST_ATOM=$2
SECOND_ATOM=$3
shift 3
while [[ $1 == -* ]]
do
    case $1 in
    	--reserve|-r)
			RESERVE=$2
			shift 2
			;;
		--template|-t)
			TEMPLATE=$2
            shift 2
            ;;
        --nprocs|-n)
            NPROC=$2
            shift 2
            ;;
        --memory|-m)
            MEM=$2
            shift 2
            ;;
        --postpone|-p)
            POSTPONE=true
            shift 1
            ;;
        --charge|-c)
			shift 1
            while [ -n "$1" ] && (! [[ $1 == -* ]])
            do
                CHARGE[${#CHARGE[@]}]=${1/n/-}
                shift 1
            done
            ;;
        --spin|-s)
			shift 1
            while [ -n "$1" ] && (! [[ $1 == -* ]])
            do
                SPIN[${#SPIN[@]}]=$1
                shift 1
            done
            ;;
        *)
            echo 'usage: CleaveBond.sh fileName atom1 atom2 --reserve large -n 16 -m 48'
    		echo 'option: --reserve(-r) [reserve one or both of the fragments, enumeration of {both, small, large, first, second}, default: both]'
    		echo '        --template(-t) [template input file for Gaussian]'
    		echo '        --charge(-c) [charge(s) of fragments, default: 0]'
    		echo '        --spin(-s) [spin multiplicity(ies) of fragments, default: 2]'
    		echo '        --nprocs(-n) [number of cores, default: 16]'
    		echo '        --memory(-m) [memory in GB, default: three times of number of cores]'
    		echo '        --postpone(-p) [generate input file(s) without submitting task(s)]'
            echo "    <ERROR> Unknown option" >> $SCRIPT_DIR/STAT
            exit 1;;
    esac    
done
if [ ${#CHARGE[@]} -gt 2 ]; then
	echo "Error!!! Too many charge parameters"
	echo "    <ERROR> Too many charge parameters" >> $SCRIPT_DIR/STAT
	exit 1
fi
if [ ${#CHARGE[@]} -eq 1 ]; then
	CHARGE[1]=${CHARGE[0]}
elif [ ${#CHARGE[@]} -eq 0 ];then
	CHARGE[0]=$CHARGE_DEFAULT
	CHARGE[1]=$CHARGE_DEFAULT
fi
if [ ${#SPIN[@]} -gt 2 ]; then
	echo "Error!!! Too many spin parameters"
	echo "    <ERROR> Too many spin parameters" >> $SCRIPT_DIR/STAT
	exit 1
fi
if [ ${#SPIN[@]} -eq 1 ]; then
	SPIN[1]=${SPIN[0]}
elif [ ${#SPIN[@]} -eq 0 ];then
	SPIN[0]=$SPIN_DEFAULT
	SPIN[1]=$SPIN_DEFAULT
fi

getAdjInfo() {
cat > $cmd_rand_name".txt" << EOF 
100
9
0.9
n
0
q
EOF
$MULTIWFN_CMD $1 < $cmd_rand_name".txt" > $mfn_rand_name".txt"
rm -f $cmd_rand_name".txt"
atom_num=`grep -o "Total atoms:\ *[0-9]\{1,\}" $mfn_rand_name".txt" | grep -o "[0-9]\{1,\}"`
grep -o ".*\-\-\-.*\ :" $mfn_rand_name".txt" > $adj_rand_name".txt"
rm -f $mfn_rand_name".txt"
}

BFS() {
	queue[${#queue[@]}]=$2 #待访问顶点
	visited[$2]=1 #记录已访问节点
	while ! [ ${#queue[@]} -eq 0 ]
	do
		atom_index=${queue[0]} #当前顶点
		queue=(${queue[@]:1}) #当前顶点出队
		if [[ "$3" == "first_frag" ]];then
			first_frag[${#first_frag[@]}]=$atom_index
		else
			second_frag[${#second_frag[@]}]=$atom_index
		fi
		adjacent=(`grep "\ $atom_index[a-zA-Z]" $1 | grep -o "[0-9]\{1,\}"`) # 寻找邻接顶点
		for((i=0;i<${#adjacent[@]};i++));do
			if [ ${adjacent[i]} -eq $atom_index ] || [[ ${visited[${adjacent[i]}]} -eq 1 ]];then
				continue #跳过顶点和已被访问的节点
			fi
			queue[${#queue[@]}]=${adjacent[i]} #入队未访问节点
			visited[${adjacent[i]}]=1 #标记该节点已访问
		done
	done
}

splitMol() {
if [[ "$1" == *.fchk ]] || [[ "$1" == *.fch ]];then
cat > $cmd_rand_name".txt" << EOF 
300
7
17
$2
-3
$3
n
-10
0
q
EOF
else
cat > $cmd_rand_name".txt" << EOF 
300
7
17
$2
-3
$3
-10
0
q
EOF
fi
$MULTIWFN_CMD $1 < $cmd_rand_name".txt" > /dev/null
rm -f $cmd_rand_name".txt"
GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" $3`
sed -i "$(($GEOMETRY_LINE-1))c $4 $5" $3
}

GEN_SLURM_SUB() {
cat > $1".txt" << EOF 
#!/bin/bash
#SBATCH -J $1
#SBATCH -p cnall
#SBATCH -N 1
#SBATCH -o %j.stdout
#SBATCH -e %j.stderr
#SBATCH --no-requeue
#SBATCH --ntasks-per-node=$2

$GAUSSIAN_CMD $1.gjf
$FORMCHK_CMD $1.chk
EOF
}

GEN_PBS_SUB() {
cat > $1".txt" << EOF 
#!/bin/bash
#PBS -N $1
#PBS -q medium
#PBS -l nodes=1:ppn=$2
#PBS -l walltime=320:00:00

source /home/scicons/profiles/profile.g16
export GAUSS_SCRDIR=\`mktemp -d\`
cd \$PBS_O_WORKDIR
cat \$PBS_NODEFILE
env > env
$GAUSSIAN_CMD $1.gjf
$FORMCHK_CMD $1.chk
rm -f \$GAUSS_SCRDIR
EOF
}

GEN_TMPL() {
cat > template.gjf << EOF 
%nprocshared=$2
%mem=$3GB
%chk=[name].chk
$1

[name]

$CHARGE_DEFAULT $SPIN_DEFAULT
[geometry]

EOF
}

cmd_rand_name=`date +%s%N | md5sum | cut -c 1-8`
mfn_rand_name=`date +%s%N | md5sum | cut -c 1-8`
adj_rand_name=`date +%s%N | md5sum | cut -c 1-8`
tmpl_rand_name=`date +%s%N | md5sum | cut -c 1-8`

getAdjInfo $FILENAME
sed -i "/\ $FIRST_ATOM[a-zA-Z].*\ $SECOND_ATOM[a-zA-Z]/d" $adj_rand_name".txt"
sed -i "/\ $SECOND_ATOM[a-zA-Z].*\ $FIRST_ATOM[a-zA-Z]/d" $adj_rand_name".txt"

first_frag=()
BFS $adj_rand_name".txt" $FIRST_ATOM first_frag
echo "There are ${#first_frag[@]} atoms in frag 1"
second_frag=()
BFS $adj_rand_name".txt" $SECOND_ATOM second_frag
echo "There are ${#second_frag[@]} atoms in frag 2"
rm -f $adj_rand_name".txt"
if ! [ `expr ${#first_frag[@]} + ${#second_frag[@]}` -eq $atom_num ];then
	echo 'Error!!! sum of the atom number of two fragments does not match the total atom number'
	echo "    <ERROR> Atom number unmatch" >> $SCRIPT_DIR/STAT
	exit 1
fi

if [ -n "$TEMPLATE" ];then
    if [[ -f "$TEMPLATE" ]];then
        echo "using profiles from $TEMPLATE"
        cp $TEMPLATE template.gjf
    else
        echo "Error!!! template file $TEMPLATE does not exist"
        echo "    <ERROR> Missing template file" >> $SCRIPT_DIR/STAT
        exit
    fi
else
	if [[ "$FILENAME" == *.gjf ]];then
		echo "using profiles from $FILENAME"
		cp $FILENAME $tmpl_rand_name".gjf"
		sed -i "s/${FILENAME/.gjf/}/[name]/" $tmpl_rand_name".gjf"
		GEOMETRY_LINE=`awk "/[a-zA-Z]{1,}\ *-?[0-9]{1,}.[0-9]{1,}/{print NR;exit;}" $tmpl_rand_name".gjf"`
		head -$(($GEOMETRY_LINE-1)) $tmpl_rand_name".gjf" > template.gjf
		rm -f $tmpl_rand_name".gjf"
		sed -i "$(($GEOMETRY_LINE-1))a [geometry]" template.gjf
		echo >> template.gjf
	elif [[ "$FILENAME" == *.log ]] || [[ "$FILENAME" == *.out ]];then
		echo "using profiles from $FILENAME"
		PROFILES=`sed -n '/#/,/-/p' $FILENAME | tr '\n' '|' | grep -o '#.*|\ -' | sed 's/| //g'`
		PROFILES=${PROFILES%?}
		NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' $FILENAME`
		if [ -n "$NPROC_IS_WRITTEN" ];then
			NPROC=${NPROC_IS_WRITTEN/\%nprocshared=/}
		fi
		MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
		if [ -n "$MEM_IS_WRITTEN" ];then
			MEM=${MEM_IS_WRITTEN/\%mem=/}
		fi
		GEN_TMPL "$PROFILES" $NPROC $MEM
	elif [[ "$FILENAME" == *.fchk ]] || [[ "$FILENAME" == *.fch ]];then
		echo "using profiles from $FILENAME"
		PROFILES=`sed -n '/#/,/Charge/p' $FILENAME | tr -d '\n'`
		PROFILES=${PROFILES%Charge*}
		GEN_TMPL "$PROFILES" $NPROC_DEFAULT $MEM_DEFAULT
	else
		echo "using B3LYP-D3(BJ)/6-31G* for Gaussian optimization"
		GEN_TMPL "$PROFILES_DEFAULT" $NPROC_DEFAULT $MEM_DEFAULT
	fi
fi

if [ -n "$NPROC" ];then
    sed -i "s/%nprocshared=[0-9]\{1,\}/%nprocshared=$NPROC/" template.gjf
    NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
    if [ -z "$NPROC_IS_WRITTEN" ];then
        sed -i "1i %nprocshared=$NPROC" template.gjf
    fi
else
    NPROC_IS_WRITTEN=`grep -io '%nprocshared=[0-9]\{1,\}' template.gjf`
    if [ -z "$NPROC_IS_WRITTEN" ];then
        NPROC=$NPROC_DEFAULT
        sed -i "1i %nprocshared=$NPROC" template.gjf
    else
        NPROC=${NPROC_IS_WRITTEN/\%nprocshared=/}
    fi
fi

if [ -n "$MEM" ];then
    sed -i "s/%mem=[0-9]\{1,\}/%mem=$MEM/" template.gjf
    MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
    if [ -z "$MEM_IS_WRITTEN" ];then
        sed -i "1i %mem=$MEM" template.gjf
    fi
else
    MEM_IS_WRITTEN=`grep -io '%mem=[0-9]\{1,\}' template.gjf`
    if [ -z "$MEM_IS_WRITTEN" ];then
        MEM=$MEM_DEFAULT
        sed -i "1i %mem=$MEM" template.gjf
    else
        MEM=${MEM_IS_WRITTEN/\%mem=/}
    fi
fi
echo "using $NPROC cores and "$MEM"GB memory"

case $RESERVE in
	both)
		splitMol $FILENAME $(IFS=,; echo "${first_frag[*]}") ${FILENAME/.*/_frag1.gjf} ${CHARGE[0]} ${SPIN[0]}
		splitMol $FILENAME $(IFS=,; echo "${second_frag[*]}") ${FILENAME/.*/_frag2.gjf} ${CHARGE[1]} ${SPIN[1]}
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_frag1}
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_frag2}
		;;
	small)
		if [ ${#second_frag[@]} -lt ${#first_frag[@]} ];then
			splitMol $FILENAME $(IFS=,; echo "${second_frag[*]}") ${FILENAME/.*/_smallFrag.gjf} ${CHARGE[1]} ${SPIN[1]}
		else
			splitMol $FILENAME $(IFS=,; echo "${first_frag[*]}") ${FILENAME/.*/_smallFrag.gjf} ${CHARGE[0]} ${SPIN[0]}
		fi
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_smallFrag}
		;;
	large)
		if [ ${#first_frag[@]} -gt ${#second_frag[@]} ];then
			splitMol $FILENAME $(IFS=,; echo "${first_frag[*]}") ${FILENAME/.*/_largeFrag.gjf} ${CHARGE[0]} ${SPIN[0]}
		else
			splitMol $FILENAME $(IFS=,; echo "${second_frag[*]}") ${FILENAME/.*/_largeFrag.gjf} ${CHARGE[1]} ${SPIN[1]}
		fi
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_largeFrag}
		;;
	first)
		splitMol $FILENAME $(IFS=,; echo "${first_frag[*]}") ${FILENAME/.*/_frag1.gjf} ${CHARGE[0]} ${SPIN[0]}
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_frag1}
		;;
	second)
		splitMol $FILENAME $(IFS=,; echo "${second_frag[*]}") ${FILENAME/.*/_frag2.gjf} ${CHARGE[1]} ${SPIN[1]}
		sub_list[${#sub_list[@]}]=${FILENAME/.*/_frag2}
		;;
	*) 
		echo "Wrong argument"
		exit 1
		;;
esac
rm -f template.gjf
for ((index=0;index<${#sub_list[@]};index++))
do
	if [ "$SCHEDULER" = SLURM ]; then
		GEN_SLURM_SUB ${sub_list[$index]} $NPROC
		[ "$POSTPONE" = false ] && sbatch ${sub_list[$index]}".txt"
	elif [ "$SCHEDULER" = PBS ]; then
		GEN_PBS_SUB ${sub_list[$index]} $NPROC
		[ "$POSTPONE" = false ] && qsub ${sub_list[$index]}".txt"
	else
		echo "Error!!! unknown scheduler"
		echo "    <ERROR> Unknown scheduler" >> $SCRIPT_DIR/STAT
		exit 1
	fi
done
