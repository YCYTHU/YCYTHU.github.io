---
title: 自动调用高斯续算激发态的Bash脚本
tags: 
- Code
- Bash
- Gaussian
cover: /assets/images/excited state.jpg
---
使用Gaussian对分子基态进行结构优化之后，此脚本可依据用户指令自动生成激发态输入文件并通过Slurm作业系统调用Gaussian继续计算激发态性质。
<!--more-->

<a class="button button--success button--rounded" href="/assets/AutoExSts.sh"><i class="fas fa-download"></i>下载AutoExSts.sh</a>

## 使用方法

在调用Gaussian对分子基态进行结构优化之后，运行此脚本：

```bash
g16 molecule.gjf
formchk molecule.chk # Gaussian作业完成
AutoExSts.sh molecule -S opt -T opt -n 24 -m 72 # 运行脚本自动续算激发态
```

## 可用选项

- `-S`：指定单重激发态任务类型，可选值包括：
	- `none`（**不计算单重激发态，默认**）
	- `sp`（计算单重激发态单点能）
	- `opt`（优化单重激发态结构）
	- `optfreq`（优化单重激发态结构并进行频率计算）
- `-T`：指定三重激发态任务类型，可选值包括:
	- `none`（**不计算三重激发态，默认**）
	- `sp`（计算三重激发态单点能）
	- `opt`（优化三重激发态结构）
	- `optfreq`（优化三重激发态结构并进行频率计算）
- `-N`：指定激发态数量（Gaussian关键词`NStates=`），**默认为4**
- `-R`：感兴趣的激发态（Gaussian关键词`Root=`），**默认为1**
- `-n`：指定计算所用核心数（Gaussian关键词`%NProcShared=`），**默认为16**
- `-m`：指定计算所用内存大小（Gaussian关键词`%Mem=`），以GB为单位，**默认为核心数的三倍**
- `-s`：指定单重激发态任务的输入文件模板，模板文件中分子名称使用`[name]`替代，分子坐标使用`[geometry]`替代，若不指定则**默认使用基态任务的输入文件为模板并使用TDDFT方法**
- `-t`：指定三重激发态任务的输入文件模板，模板文件中分子名称使用`[name]`替代，分子坐标使用`[geometry]`替代，若不指定则**默认使用基态任务的输入文件为模板并使用TDDFT方法**
- `-e`：提取基态分子的HOMO与LUMO能量以及各激发态的激发能并汇总到文本文件中
- `-c`：导出基态分子的HOMO与LUMO格点文件（cube）以及感兴趣的激发态的电子-空穴格点文件

## 示例

- 示例1：对molecule的第一单重激发态进行几何优化，不计算三重激发态

```bash
AutoExSts.sh molecule -S opt -T none
```

- 示例2：对第一单重激发态与第一三重激发态进行几何优化，随后对第一单重激发态进行频率计算，每步计算6个激发态

```bash
AutoExSts.sh molecule -S optfreq -T opt -N 6 -R 1
```

- 示例3：使用24核心，72GB内存计算第一单重激发态的单点能，一共计算10个激发态

```bash
AutoExSts.sh molecule -S sp -N 10 -R 1 -n 24 -m 72
```

- 示例4：对第一单重激发态与第一三重激发态进行几何优化，单重激发态的计算方法使用template_for_singlet.gjf（文件内容见下方代码块）中的，三重激发态的计算方法与基态相同

```bash
AutoExSts.sh molecule -S opt -T opt -s template_for_singlet.gjf
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

- 示例5：对第一单重激发态与第一三重激发态进行几何优化，随后提取基态分子的HOMO与LUMO能量以及各激发态的激发能并汇总到文本文件中，然后导出基态分子的HOMO与LUMO格点文件（cube）以及感兴趣的激发态的电子-空穴格点文件

```bash
AutoExSts.sh molecule -S opt -T opt -e -c
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