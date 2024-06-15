---
title: 荧光衰减的分析与拟合
tags: 
- Code
- Fortran
cover: /assets/images/moles on seasaw.jpg
---
分子吸收光子并从其基态电子能级跃迁到第一激发电子能级，随后处于激发态的分子会通过辐射方式或非辐射方式返回到基态。在分子水平上，$\tau$ 对应于分子在返回基态之前处于激发态的平均时间，可以使用短激发脉冲激发分子并记录荧光强度衰减的方法来实验测量。
<!--more-->

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

$$\mathrm{DW}=\frac{\displaystyle\sum_{i=n_\mathrm{L}+1}^{n_\mathrm{H}}(Y_i-Y_{i-1})^2}{\displaystyle\sum_{i=n_\mathrm{L}}^{n_\mathrm{H}}Y_i^2}$$


其中 $n_\mathrm{L}$ 和 $n_\mathrm{H}$ 分别是拟合范围的下限和上限。不同指数项数量拟合的Durbin–Watson参数不能相互比较，对于单、双和三指数衰减模型的拟合，Durbin–Watson参数分别小于 $1.7$、$1.75$ 和 $1.8$ 表示拟合度较差。

