---
title: 自动调用Gaussian续算激发态的Bash脚本
tags: 
- Code
- Bash
- Quantum Chemistry
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/excited state.jpg
---
使用Gaussian对分子基态进行结构优化之后，此脚本可依据用户指令自动生成激发态输入文件并通过作业调度系统调用Gaussian继续计算激发态性质。
<!--more-->

<a class="button button--success button--rounded" href="/assets/AutoExSts.sh"><i class="fas fa-download"></i>下载AutoExSts.sh</a>

## 使用方法

在调用Gaussian对分子基态进行结构优化之后，运行此脚本（将`fileName`替换为不含扩展名的文件名）：

```bash
AutoExSts.sh fileName [-S <单重态任务类型>] [-T <三重态任务类型>] [-N <激发态数量>] [-R <感兴趣的激发态>] [-s <单重态模板文件>] [-t <三重态模板文件>] [-x <自定义文件名后缀>] [-n <核心数>] [-m <内存>] [-e] [-c] [-p]
```

此脚本会按照用户指令生成激发态计算输入文件并通过Slurm或PBS作业调度系统调用Gaussian继续计算激发态性质。激发态输入文件名为`[基态文件名]_[S/T][感兴趣的激发态]_[任务类型]_[自定义后缀]`。 

### 选项说明

- `-S`：单重激发态任务类型，可选值包括：
	- `none`（**不计算单重激发态，默认**）
	- `sp`（计算单重激发态单点能）
	- `opt`（优化单重激发态结构）
	- `optfreq`（优化单重激发态结构并进行频率计算）
- `-T`：三重激发态任务类型，可选值包括:
	- `none`（**不计算三重激发态，默认**）
	- `sp`（计算三重激发态单点能）
	- `opt`（优化三重激发态结构）
	- `optfreq`（优化三重激发态结构并进行频率计算）
- `-N`：激发态数量（Gaussian关键词`NStates=`），**默认为4**
- `-R`：感兴趣的激发态（Gaussian关键词`Root=`），**默认为1**
- `-n`：计算所用核心数（Gaussian关键词`%NProcShared=`），**默认为16**
- `-m`：计算所用内存大小（Gaussian关键词`%Mem=`），以GB为单位，**默认为核心数的三倍**
- `-s`：单重激发态任务的输入文件模板，模板文件中分子名称使用`[name]`替代，分子坐标使用`[geometry]`替代，若不指定则**默认使用基态任务的输入文件为模板并使用TDDFT方法**
- `-t`：三重激发态任务的输入文件模板，模板文件中分子名称使用`[name]`替代，分子坐标使用`[geometry]`替代，若不指定则**默认使用基态任务的输入文件为模板并使用TDDFT方法**
- `-x`：在生成的文件名末尾添加额外的自定义后缀，若不指定则只添加`_[S/T][感兴趣的激发态]_[任务类型]`作为后缀
- `-e`：提取基态分子的HOMO与LUMO能量以及各激发态的激发能并汇总到文本文件中
- `-c`：导出基态分子的HOMO与LUMO格点文件（cube）以及感兴趣的激发态的电子-空穴格点文件
- `-p`：只生成输入文件与提交脚本，不向作业调度系统提交任务

### 示例

- 示例1：对`fileName.gjf`中分子的第一单重激发态进行几何优化，不计算三重激发态

```bash
AutoExSts.sh fileName -S opt -T none
```

- 示例2：对第一单重激发态与第一三重激发态进行几何优化，随后对第一单重激发态进行频率计算，每步计算6个激发态

```bash
AutoExSts.sh fileName -S optfreq -T opt -N 6 -R 1
```

- 示例3：使用24核心，72GB内存计算第一单重激发态的单点能，一共计算10个激发态

```bash
AutoExSts.sh fileName -S sp -N 10 -R 1 -n 24 -m 72
```

- 示例4：进行10个单重激发态与5个三重激发态的单点能计算，单重激发态文件名为`fileName_S1_sp_mySuffix`，三重激发态文件名为`fileName_T1_sp`

```bash
AutoExSts.sh fileName -S sp -T none -N 10 -x mySuffix
AutoExSts.sh fileName -S none -T sp -N 5
```

- 示例5：对第一单重激发态与第一三重激发态进行几何优化，单重激发态的计算方法（泛函、基组、溶剂模型等）使用`template_for_singlet.gjf`（文件内容见下方代码块）中的，三重激发态的计算方法与基态相同

```bash
AutoExSts.sh fileName -S opt -T opt -s template_for_singlet.gjf
```

```text
%nprocshared=24
%mem=72GB
%chk=[name].chk
# opt td=(singlets,nstates=4,root=1) b3lyp/6-31g(d) scrf=(smd,solvent=toluene) em=gd3bj

[name]

0 1
[geometry]


```

- 示例6：对第一单重激发态与第一三重激发态进行几何优化，随后提取基态分子的HOMO与LUMO能量以及各激发态的激发能并汇总到文本文件中，然后导出基态分子的HOMO与LUMO格点文件（cube）以及感兴趣的激发态的电子-空穴格点文件

```bash
AutoExSts.sh fileName -S opt -T opt -e -c
```

## 选项优先级

通过`-S`、`-T`、`-N`、`-R`、`-n`、`-m`指定的参数优先级最高，通过`-s`、`-t`指定的模板文件中的参数次高，基态输入文件中定义的参数再次，最后程序才会使用默认的参数。

### 示例

- 示例1：调用脚本时指定了`-S sp`，但指定的模板文件中任务类型为`opt`

> 实际会执行单点能计算

- 示例2：调用脚本时指定了`-N 10`，但指定的模板文件中`nstates=4`

> 实际会计算10个激发态

- 示例3：调用脚本时没有指定`-N`，也没有提供模板文件

> 实际会利用TDDFT方法计算程序默认值4个激发态

- 示例4：调用脚本时没有指定`-n`，也没有提供模板文件，但是基态输入文件中指定了`%NProcShared=4`

> 实际会利用4个核心进行计算

- 示例5：调用脚本时没有指定`-n`，也没有提供模板文件，基态输入文件中也没有指定`%NProcShared`

> 实际会利用程序默认值16个核心进行计算

- 示例6：调用脚本时没有指定`-n`和`-m`，指定的模板文件中提供了`%Mem=30GB`，基态输入文件中没有提供`%NProcShared`信息

> 实际会利用16个核心与30GB内存进行计算

## 可移植性

用户可以通过修改下面的参数使脚本适应不同的使用环境。

```bash
MULTIWFN_CMD=Multiwfn_noGUI  # 调用Multiwfn的命令
GAUSSIAN_CMD=g16             # 调用Gaussian的命令
FORMCHK_CMD=formchk          # 调用formchk的命令
SCHEDULER=SLURM              # 作业调度系统，可指定为SLURM或PBS

NPROC_DEFAULT=16                   # 核心数默认值
MEM_DEFAULT=$((3*$NPROC_DEFAULT))  # 内存默认值（以GB为单位）
NSTATES_DEFAULT=24                 # 激发态数量默认值
ROOT_DEFAULT=1                     # 感兴趣的激发态默认值
```

此外，用户还可以修改`GEN_SLURM_SUB()`与`GEN_PBS_SUB()`函数中的内容来修改任务提交脚本，以导入必需的运行环境或修改其他设置。