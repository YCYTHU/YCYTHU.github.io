---
title: 利用MATLAB进行荧光衰减的分析与拟合
tags: 
- Code
- MATLAB
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/conical flask.jpg
aside:
  toc: true
---
处于激发态的分子会通过辐射方式或非辐射的方式返回到基态，通过拟合短激发脉冲后分子荧光强度的衰减曲线可以得到分子处于激发态的平均时间 $\tau$。
<!--more-->

<a class="button button--success button--rounded" href="/assets/FluorDecay.m"><i class="fas fa-download"></i>下载FluorDecay</a>

## 理论模型

在大多数情况下，荧光强度的衰减过程符合单指数或多指数模型，可以使用式 $\eqref{multiExp}$ 描述，其中指数项的数量 $N$ 一般不超过 $4$。

$$R(t)=A+\sum_{i=1}^NB_i\exp(-t/\tau_i)\tag{1}\label{multiExp}$$

式 $\eqref{multiExp}$ 中，$A$ 为背景项，$B_i$ 与 $\tau_i$ 分别为指前因子与特征寿命。指前因子 $B_i$ 可以为正数，代表荧光衰减过程；也可以为负数，代表荧光的增长过程。

在荧光衰减的实际测量中，荧光信号的初始上升部分并非是瞬时、无限短的，而是受激发光脉冲的影响。在数据拟合时，如果仅拟合无信号进一步生成的区域中的数据，则可以将激发光脉冲的影响排除在外，使用式 $\eqref{multiExp}$ 进行拟合，这种拟合方法称为尾部拟合（Tail Fit）。如果必须拟合荧光衰减的初始部分数据以得到短荧光寿命样品的荧光寿命信息，则需要考虑光脉冲宽度等其他效应的影响，此时样品响应函数 $X(t)$ 由仪器响应函数 $E(t)$ 与样品衰减模型 $R(t)$ 共同决定，如式 $\eqref{conv}$ 所示。这种拟合方法称为反卷积拟合（Reconvolution Fit）。

$$X(t)=\int_0^tE(t')R(t-t')\mathrm{d}t'\tag{2}\label{conv}$$

## 数据拟合

在数据拟合时，可以使用[Levenberg–Marquardt算法](https://en.wikipedia.org/wiki/Levenberg%E2%80%93Marquardt_algorithm)最小化 $\chi_g^2$ 来获得最优拟合结果， $\chi_g^2$ 定义为：

$$\chi_g^2=\sum_kw_k^2[F_k-X(t_k)]^2\tag{3}$$

其中 $t_k$ 与 $F_k$ 分别为仪器测量得到的时间与对应的荧光强度数据，$w_k$ 为权重，由噪声类型决定，因此与收集数据的方法紧密相关。例如，通过时间相关单光子计数（TCSPC）或门控单光子计数（MCS）获得的数据服从泊松噪声统计，每个数据点 $F_k$ 的权重 $w_k=1/\sqrt{F_k}$ ，而示波器获取的数据则服从高斯噪声统计，权重 $w_k$ 为常数。

拟合结果的质量可以通过多种方式进行评估。

### 简化卡方统计量 $\chi^2$

简化卡方统计量 $\chi^2$ 定义为每个自由度的卡方：

$$\chi^2=\frac{\chi_g^2}{n}=\frac{\sum_kw_k^2[F_k-X(t_k)]^2}{n}\tag{4}$$

其中 $n$ 为自由的数量，约为数据点的数量减去拟合中使用的参数的数量。相较于 $\chi_g^2$，简化卡方 $\chi^2$ 的值与数据点数和拟合参数数量无关，可以用于比较不同的拟合。对于权重 $w_k=1/\sqrt{F_k}$ 的泊松分布数据，$\chi^2$ 相较于 $1.0$ 越大，表明拟合结果越差，一般而言小于 $1.3$ 的 $\chi^2$ 都是可以接受的。

### 残差

残差数据 $Y_k=w_k[X(t_k)-F_k]$ 是拟合曲线与原始数据之间的加权差值。良好拟合的残差曲线应仅包含分布在零附近的随机噪声，任何偏离随机性的现象都表明拟合不充分，其可能的原因是拟合所使用的指数项较少或仪器伪影。

### 自相关数据

残差的自相关函数定义为：

$$Z_k=\frac{\displaystyle\frac{1}{n_\mathrm{H}-k-n_\mathrm{L}}{\displaystyle\sum_{i=n_\mathrm{L}}^{n_\mathrm{H}-k}}Y_iY_{i+k}}{\displaystyle\frac{1}{n_\mathrm{H}-n_\mathrm{L}}{\displaystyle\sum_{i=n_\mathrm{L}}^{n_\mathrm{H}}}Y_i^2}\tag{5}$$

其中 $n_\mathrm{L}$ 和 $n_\mathrm{H}$ 分别是拟合范围的下限和上限。相较于残差数据 $Y_k$，残差自相关数据 $Z_k$ 能更清楚地表明残差是否完全随机分布。由于每个残差数据点都与自身相关，因此第一个自相关数据点始终为 $1.0$，如果残差是“干净的”，则所有其他自相关数据点都应随机分布在零附近。

### Durbin–Watson参数

Durbin–Watson参数用于检测回归分析残差在滞后 $1$ 处是否存在自相关，其定义为：

$$\mathrm{DW}=\frac{\displaystyle\sum_{i=n_\mathrm{L}+1}^{n_\mathrm{H}}(Y_i-Y_{i-1})^2}{\displaystyle\sum_{i=n_\mathrm{L}}^{n_\mathrm{H}}Y_i^2}\tag{6}$$


其中 $n_\mathrm{L}$ 和 $n_\mathrm{H}$ 分别是拟合范围的下限和上限。不同指数项数量拟合的Durbin–Watson参数不能相互比较，对于单、双和三指数衰减模型的拟合，Durbin–Watson参数分别小于 $1.7$、$1.75$ 和 $1.8$ 表示拟合度较差。

## MATLAB拟合工具

### 创建 FluorDecay 类

通过衰减曲线的时间（横坐标）与光子计数（纵坐标）创建 FluorDecay 类：
```matlab
fd = FluorDecay(time, count);
```

通过衰减曲线的时间（横坐标）、光子计数（纵坐标）与仪器响应函数（IRF）的光子计数创建 FluorDecay 类：
```matlab
fd = FluorDecay(time, count, irf);
```

### 寿命分布分析

在事先并不了解衰减的特定模型时，寿命分布分析是最通用的拟合方法，该分析假设任何荧光衰减都可以通过一系列由固定特征寿命和平滑分布的指前因子组成的指数函数来拟合。

$$R(t)=A+\sum_{i=1}^NB(\tau_i)\exp(-t/\tau_i)\tag{7}\label{LDA}$$

在寿命分布分析中，算法依据指定的寿命分布范围在对数坐标下均匀采样 $N$ 个特征寿命，并拟合指前因子。由于指前因子在拟合过程中被限制为非负，因此无法充分拟合发射增长过程。

```matlab
fd.lifeDistrAnalysis(range, nIntervals);
```

其中`range`为 $1\times2$ 的`double`数组，指定了寿命分布范围的上限与下限；`nIntervals`对应于式 $\eqref{LDA}$ 中的 $N$，一般不大于200。

### 指数分析

指数成分分析使用式 $\eqref{multiExp}$ 拟合最多四个荧光团的衰减，每个荧光团都具有离散的寿命。此外，荧光增长通常也遵循指数动力学，因此可以通过负的指前因子识别。

```matlab
fd.tailFit(guess);
```

其中`guess`为由寿命初猜组成的行向量，长度不超过4，指数衰减拟合的项数等于`guess`的长度。通常情况下，指数模型的项数越多，越容易出现全局最小值外的局部最小值，因此应尝试通过减少参数或固定一些参数来“帮助”算法收敛到全局最小值。

```matlab
fd.fix(name, value);
```

通过`fix()`函数可以设定在拟合过程中要固定的参数及其值，其中`name`为要固定的参数，可选`A`、`B1`、`tau1`、`B2`、`tau2`、`B3`、`tau3`、`B4`、`tau4`。`value`为参数的固定值。如果需要固定多个参数，可以重复输入`name`与`value`。如下代码在拟合时固定常数项 $A=8.56$ 且固定寿命 $\tau_1=2.30$

```matlab
fd.fix("A", 8.56, "tau1", 2.30);
```