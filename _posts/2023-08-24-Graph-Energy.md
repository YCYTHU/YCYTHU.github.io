---
title: $\pi$ 骨架的线性共轭与交叉共轭——图的能量
tags: 
- Chemistry
- Graph theory
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/6n-graf.svg/640px-6n-graf.svg.png
mathjax_autoNumber: true
---
对于一个具有 $n$ 个顶点，$m$ 条边的图 $G$，其邻接矩阵 $A$ 的特征值为 $\lambda_1,\lambda_2,\dots,\lambda_n$，定义图 $G$ 的能量：
<!--more-->

$$E(G)=\sum_{i=1}^n\vert\lambda_i\vert\quad(\lambda_1\geq\lambda_2\geq\dots\geq\lambda_n)\label{def}$$

由于 $A$ 为图 $G$ 的邻接矩阵，故 $\mathrm{Tr}(A)=0$，因此：

$$\sum_{i=1}^n\lambda_i=0\label{sum0}$$

由式 $\eqref{def}$ 以及 $\eqref{sum0}$ 得到：

$$\sum\{\lambda_i:\lambda_i<0\}=-\frac{E(G)}{2}\label{neg2}$$

此概念的用途之一是计算 Hückel 方法下 $\pi$ 骨架的能量。如果将一个分子的 $\pi$ 骨架视作图并应用 Hückel 方法，则其电子能量之和

$$E_\pi=n\alpha+\frac{E(G)}{2}\beta$$

在有机化学中，交叉共轭的稳定化作用被认为不如线性共轭（图1）。利用前文的概念，此观点的数学表述为

$$E(G_{线性})>E(G_{交叉})$$

<div align=center><img width="75%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/graph energy/path_cross.svg" alt="图1：环戊二烯阳离子的线性共轭结构（左）与交叉共轭结构（右）"></div>
<div align=center><font color="#999999">图1：环戊二烯阳离子的线性共轭结构（左）与交叉共轭结构（右）</font></div>

这可以使用下面的 Coulson integral formula[^Coulson]加以证明。

[^Coulson]:[On the calculation of the energy in unsaturated hydrocarbon molecules](https://doi.org/10.1017/S0305004100017175)

$$E(G)=\frac{1}{\pi}\int_{-\infty}^{+\infty}\left(n-\frac{ix\phi'(ix)}{\phi(ix)}\right)\mathrm{d}x=\frac{1}{\pi}\int_{-\infty}^{+\infty}\left(n-x\frac{\mathrm{d}}{\mathrm{d}x}\ln\phi(ix)\right)\mathrm{d}x\label{Coulson}$$

首先对式 $\eqref{Coulson}$ 进行证明。考虑复数域上的函数 $\phi(z)$ 在闭曲线 $\gamma$ （图2）上的积分：

$$\frac{1}{2\pi i}\int_\gamma\left(\frac{z\phi'(z)}{\phi(z)}-n\right)\mathrm{d}z$$

<div align=center><img width="40%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/graph energy/gamma_curve.png" alt="图2：闭曲线 $\gamma$"></div>
<div align=center><font color="#999999">图2：闭曲线 $\gamma$</font></div>

由留数定理知该积分等于 $\gamma$ 内部所有极点（也即 $\phi(z)$ 的所有负零点 $z_1,z_2,\dots,z_r$）的留数之和：

$$\frac{1}{2\pi i}\int_\gamma\left(\frac{z\phi'(z)}{\phi(z)}-n\right)\mathrm{d}z=\sum_{i=1}^r\mathrm{Res}\left(\frac{z\phi'(z)}{\phi(z)}-n,z_i\right)=\sum_{i=1}^rz_i\label{res}$$

当闭曲线 $\gamma$ 的半径趋于无穷大时，由于 $\phi(z)$ 具有特征多项式的形式，故半圆部分对积分的贡献为 $0$，因此该积分的值全部由沿 $y$ 轴的积分所贡献（$z=iy$）：

$$\frac{1}{2\pi i}\int_\gamma\left(\frac{z\phi'(z)}{\phi(z)}-n\right)\mathrm{d}z=\frac{1}{2\pi}\int_{-\infty}^{+\infty}\left(\frac{iy\phi'(iy)}{\phi(iy)}-n\right)\mathrm{d}y\label{inty}$$

由式 $\eqref{res}$ 与式 $\eqref{inty}$ 得：

$$\frac{1}{2\pi}\int_{-\infty}^{+\infty}\left(\frac{iy\phi'(iy)}{\phi(iy)}-n\right)\mathrm{d}y=\sum_{i=1}^rz_i$$

由于 $\phi(z)$ 的所有负零点 $z_1,z_2,\dots,z_r$ 即为邻接矩阵 $A$ 的所有负特征值，结合式 $\eqref{neg2}$，得到：

$$\frac{1}{2\pi}\int_{-\infty}^{+\infty}\left(\frac{iy\phi'(iy)}{\phi(iy)}-n\right)\mathrm{d}y=-\frac{E(G)}{2}$$

将积分变量由 $y$ 换为 $x$ 并做简单整理，得到：

$$E(G)=\frac{1}{\pi}\int_{-\infty}^{+\infty}\left(n-\frac{ix\phi'(ix)}{\phi(ix)}\right)\mathrm{d}x$$

Coulson integral formula 得证。如果 $G$ 是无环图，则其特征多项式可以表示为

$$\phi(x)=\sum_{k\geq0}(-1)^km_k(G)x^{n-2k}$$

其中 $m_k$ 为 $k$ 边匹配的数量。将其代入式 $\eqref{Coulson}$ 整理得到：

$$E(G)=\frac{1}{\pi}\int_{-\infty}^{+\infty}\frac{\mathrm{d}x}{x^2}\ln\left(\sum_{k\geq0}m_k(G)x^{2k}\right)$$

因此对于节点数确定的无环图，星 $S_n$ 的能量最小，道路 $P_n$ 的能量最大，对于其它所有的树 $T_n$ 有：

$$E(S_n)<E(T_n)<E(P_n)$$

由于 $P_n$ 对应 $\pi$ 骨架的线性共轭形式，而 $T_n$ 对应交叉共轭形式，故交叉共轭的稳定化作用不如线性共轭。
