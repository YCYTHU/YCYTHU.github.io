---
title: 便捷地沿化学键分割分子的Bash脚本
tags: 
- Code
- Bash
- Quantum Chemistry
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/covalent bonds.jpg
---
此脚本便捷地将分子沿指定的化学键分割成两个片段，并分别生成这两个片段的Gaussian输入文件，随后通过作业调度系统调用Gaussian完成量子化学计算。
<!--more-->

<a class="button button--success button--rounded" href="/assets/CleaveBond.sh"><i class="fas fa-download"></i>下载CleaveBond.sh</a>

## 使用方法

通过命令行指定分子结构文件（`structureFile`为包含分子结构信息的文件）、化学键（`atom1 atom2`为化学键两端原子的编号）以及其他自定义选项：

```bash
CleaveBond.sh structureFile atom1 atom2 [--reserve(-r) <生成片段的规则>] [--charge(-c) <电荷>] [--spin(-s) <自旋多重度>] [--template(-t) <模板文件>]  [--nprocs(-n) <核心数>] [--memory(-m) <内存>] [--postpone(-p)]
```

此脚本会按照用户指令生成一个或两个片段的Gaussian输入文件并通过Slurm或PBS作业调度系统调用Gaussian进行计算。

### 选项说明

- `--reserve(-r)`：沿指定化学键将分子分割成两个片段后保留片段的规则，可选值包括：
	- `both`（**为两个片段都生成Gaussian输入文件，默认**）
	- `first`（仅生成编号为`atom1`的原子所在片段的Gaussian输入文件）
	- `second`（仅生成编号为`atom2`的原子所在片段的Gaussian输入文件）
	- `small`（仅生成原子数较少片段的输入文件，两片段原子数相同时等同于`first`）
	- `large`（仅生成原子数较多片段的输入文件，两片段原子数相同时等同于`second`）
- `--charge(-c)`：片段的电荷 **（以`n`开头表示负数，如`n1`表示`-1`）**，如果只提供一个参数，则为生成的所有片段使用相同的参数，如果提供两个参数，则将第一个参数应用于编号为`atom1`的原子所在的片段，而将第二个参数应用于编号为`atom2`的原子所在的片段，**默认为0**
- `--spin(-s)`：片段的自旋多重度，如果后跟一个参数，则为生成的所有片段使用相同的参数，如果后跟两个参数，则将第一个参数应用于编号为`atom1`的原子所在的片段，而将第二个参数应用于编号为`atom2`的原子所在的片段，**默认为2**
- `--template (-t)`：Gaussian输入模板文件，模板文件中分子名称使用`[name]`替代，分子坐标使用`[geometry]`替代，若不指定模板文件则会尝试从`structureFile`中读取（当`structureFile`为`.gjf`、`.fchk/.fch`或`.log/.out`文件时），若其中不包含计算设置则默认使用 B3LYP-D3(BJ)/6-31G* 方法进行几何优化
- `--nprocs (-n)`：计算所用核心数（Gaussian关键词`%NProcShared=`），**默认为16**
- `--memory (-m)`：计算所用内存大小（Gaussian关键词`%Mem=`），以GB为单位，**默认为核心数的三倍**
- `--postpone(-p)`：只生成输入文件与提交脚本，不向作业调度系统提交任务

### 示例

- 示例1：将`structureFile.gjf`中的分子沿`7`号和`34`号原子形成的化学键分割

```bash
CleaveBond.sh structureFile.gjf 7 34
```

- 示例2：将`structureFile.gjf`中的分子沿`7`号和`34`号原子形成的化学键分割，仅保留`7`号原子所在的片段

```bash
CleaveBond.sh structureFile.gjf 7 34 --reserve first
```

- 示例3：将`PhCz.fchk`中的苯基咔唑分子沿`11`号和`22`号原子形成的化学键分割，仅保留原子数较多的咔唑片段，片段带一个负电荷，自旋多重度为1，计算使用8核心，24GB内存

```bash
CleaveBond.sh PhCz.fchk 11 22 --reserve large -c n1 -s 1 -n 8 -m 24
```

- 示例4：将`PhCz.fchk`中的苯基咔唑分子沿`11`号和`22`号原子形成的化学键分割，第一个片段带一个负电荷，自旋多重度为1，第二个片段为中性，自旋多重度为2

```bash
CleaveBond.sh PhCz.fchk 11 22 --reserve both -c n1 0 -s 1 2
```

- 示例5：将`ethane.pdb`中的乙烷分子沿`1`号和`5`号原子形成的化学键分割，仅保留`1`号原子所在的中性自由基片段，使用1核心，1GB内存，`template_for_radical.gjf`作为模板文件计算

```bash
CleaveBond.sh ethane.pdb 1 5 --reserve first -c 0 -s 2 -n 1 -m 1 -t template_for_radical.gjf
```

- 示例6 **（不推荐）**：将`Phenol.xyz`中的苯酚分子沿`3`号和`12`号原子形成的化学键分割，仅保留原子数较少的氢氧根离子片段，使用1核心，1GB内存计算 **（本例中`-c`和`-s`后分别提供了两个参数，但`--reserve`被指定为`small`，当不确定哪个原子所属的片段原子数较少时不建议使用本方法）**

```bash
CleaveBond.sh ethane.pdb 3 12 --reserve small -c 0 n1 -s 2 1 -n 1 -m 1
```

## 实现思路

将分子视为图，输入文件`structureFile`中包含了节点信息但一般不包括边信息（除`.mol`、`.mol2`等格式外），因此利用Multiwfn计算原子连接性指数 $I_{AB}(r_{AB})$ 判断邻接关系。

$$I_{AB}(r_{AB})=\frac{1}{1+\exp\left[-16\times\left(\frac{4(R_A+R_B)}{3r_{AB}}-1\right)\right]}$$

从图1可以发现，当原子间距离 $r_{AB}$ 接近共价半径和 $(R_A+R_B)$ 时，$I_{AB}$ 接近1。

<div id="Iab"></div>
<div align=center><font color="#999999">图1：$I_{AB}$ 与 $\frac{r_{AB}}{R_A+R_B}$ 之间的关系</font></div>

当原子间距离不超过共价半径和的1.15倍时，可以近似认为原子之间形成共价键，此时 $I_{AB}$ 约为0.9，可据此构建邻接关系。当指定了化学键两端的原子后，从邻接关系中删除它们的键连关系并分别以它们为顶点进行图的[广度优先遍历](https://en.wikipedia.org/wiki/Breadth-first_search)，从而得到两个片段。

## 选项优先级

对于电荷与自旋多重度，通过`--charge`和`--spin`指定的参数优先级最高，通过`--template`指定的模板文件中的参数其次，**除此以外程序会使用默认的参数，无论输入文件`structureFile`中是否包含相关信息。**

对于计算所用核心数与内存，通过`--nprocs`和`--memory`指定的参数优先级最高，通过`--template`指定的模板文件中的参数其次，输入文件`structureFile`中若包含相关信息（Gaussian输入输出文件`.gjf`或`.log/.out`）则优先级第三，最后程序才会使用默认的参数。

对于计算所用方法、基组等设置，通过`--template`指定的模板文件中的参数优先级最高，输入文件`structureFile`中若包含相关信息（Gaussian输入输出文件`.gjf`、`.log/.out`或`.fchk/.fch`）则优先级其次，最后程序会使用默认的方法生成计算文件。

### 示例

- 示例1：调用脚本时指定了`--charge n1`，但指定的模板文件中电荷为`0`

> 实际会计算片段的阴离子状态

- 示例2：调用脚本时指定了`--nprocs 12`，但指定的模板文件中`%NProcShared=4`

> 实际会利用12个核心进行计算

- 示例3：调用脚本时没有指定`--spin`，模板文件中自旋多重度为`3`,输入文件`structureFile`中自旋多重度为`1`

> 实际会设置自旋多重度为3

- 示例4：调用脚本时没有指定`--spin`，也没有提供模板文件，输入文件`structureFile`中自旋多重度为`1`

> 实际会设置自旋多重度为程序默认值2

- 示例5：调用脚本时没有指定`--memory`，也没有提供模板文件，输入文件`structureFile`中提供了`%Mem=4GB`

> 实际会利用4GB内存进行计算

## 可移植性

用户可以通过修改下面的参数使脚本适应不同的使用环境。

```bash
MULTIWFN_CMD=Multiwfn_noGUI  # 调用Multiwfn的命令
GAUSSIAN_CMD=g16             # 调用Gaussian的命令
FORMCHK_CMD=formchk          # 调用formchk的命令
SCHEDULER=SLURM              # 作业调度系统，可指定为SLURM或PBS

CHARGE_DEFAULT=0                   # 电荷默认值
SPIN_DEFAULT=2                     # 自旋多重度默认值
NPROC_DEFAULT=16                   # 核心数默认值
MEM_DEFAULT=$((3*$NPROC_DEFAULT))  # 内存默认值（以GB为单位）
```

此外，用户还可以修改`GEN_SLURM_SUB()`与`GEN_PBS_SUB()`函数中的内容来修改任务提交脚本，以导入必需的运行环境或修改其他设置。

<script src="https://cdn.plot.ly/plotly-2.29.1.min.js" charset="utf-8"></script>
<script>
	const x = [0.8,0.812,0.824,0.836,0.848,0.861,0.873,0.885,0.897,0.909,0.921,0.933,0.945,0.958,0.97,0.982,0.994,1.006,1.018,1.03,1.042,1.055,1.067,1.079,1.091,1.103,1.115,1.127,1.139,1.152,1.164,1.176,1.188,1.2,1.212,1.224,1.236,1.248,1.261,1.273,1.285,1.297,1.309,1.321,1.333,1.345,1.358,1.37,1.382,1.394,1.406,1.418,1.43,1.442,1.455,1.467,1.479,1.491,1.503,1.515,1.527,1.539,1.552,1.564,1.576,1.588,1.6,1.612,1.624,1.636,1.648,1.661,1.673,1.685,1.697,1.709,1.721,1.733,1.745,1.758,1.77,1.782,1.794,1.806,1.818,1.83,1.842,1.855,1.867,1.879,1.891,1.903,1.915,1.927,1.939,1.952,1.964,1.976,1.988,2];
	const y = [1,1,1,1,1,1,1,1,1,0.999,0.999,0.999,0.999,0.998,0.998,0.997,0.996,0.995,0.993,0.991,0.989,0.986,0.982,0.978,0.972,0.966,0.958,0.949,0.938,0.926,0.912,0.895,0.876,0.855,0.832,0.806,0.778,0.748,0.716,0.682,0.647,0.61,0.574,0.537,0.5,0.464,0.429,0.395,0.363,0.333,0.304,0.277,0.253,0.23,0.209,0.189,0.172,0.156,0.141,0.128,0.116,0.105,0.095,0.087,0.079,0.071,0.065,0.059,0.054,0.049,0.045,0.041,0.037,0.034,0.031,0.029,0.026,0.024,0.022,0.021,0.019,0.018,0.016,0.015,0.014,0.013,0.012,0.011,0.01,0.01,0.009,0.008,0.008,0.007,0.007,0.006,0.006,0.005,0.005,0.005];
	var Data = [{
		x: x,
		y: y,
		mode: 'lines',
        type: 'scatter',
        line: {width: 3}
	}];
	var Layout = {
            xaxis: {
            	zeroline: false,
        		mirror: true,
        		linecolor: '#000',
        		linewidth: 1.5,
        		tickfont: {size: 16}
            },
            yaxis: {
            	zeroline: false,
        		mirror: true,
        		linecolor: '#000',
        		linewidth: 1.5,
        		tickfont: {size: 16}
            }
        };
	var config = {
        staticPlot: false,
        displaylogo: false,
        responsive: true,
        scrollZoom: false,
        modeBarButtonsToRemove: ['toImage','zoom2d','pan2d','select2d','lasso2d','zoomIn2d','zoomOut2d','autoScale2d']
    };
	Plotly.newPlot("Iab", Data, Layout, config);
</script>