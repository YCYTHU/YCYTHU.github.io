---
title: 理想聚合物链端到端距离的分布
tags: 
- Probability theory
- Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Ideal_chain_random_walk.svg/480px-Ideal_chain_random_walk.svg.png
mathjax_autoNumber: true
---
<!--more-->

## Freely Jointed Chain (Gaussian) model

假定键长固定为 $\ell$, 键可以绕一端的原子自由旋转，则每个键向量 $\vec{r}$ 的概率分布:

$$\zeta(\vec{r})=\frac{1}{4\pi \ell^2}\cdot\delta(|\vec{r}|-\ell)$$

假定键之间没有相互作用，分布独立，则 $N$ 个键向量的概率分布为单独概率分布的乘积：

$$G(\{\vec{r}_i\})=\prod_{i=1}^N\zeta(\vec{r}_i)$$

聚合物链端到端的距离向量 $\vec{R}$ 由 $N$ 个键向量共同决定：

$$\vec{R}=\sum_{i=1}^N\vec{r}_i$$

由于聚合物中 $N$ 很大，$\vec{R}$ 的概率分布符合随机游走模型[^RW]：

[^RW]:[Random walk](https://en.wikipedia.org/wiki/Random_walk)

$$G(\vec{R})=\left(\frac{3}{2\pi N\ell^2}\right)^\frac32e^{-\frac{3\vert\vec{R}\vert^2}{2N\ell^2}}$$

$\vert\vec{R}\vert$ 的期望：

$$\langle\vec{R}^2\rangle^{\frac12}=N^{\frac12}\ell$$

###  Entropic elasticity

玻尔兹曼公式：

$$S=k_B\ln\Omega$$

由于：

$$G(\vec{R})=\frac{\Omega(\vec{R})}{\int\Omega(\vec{R}){\rm d}\vec{R}}$$

因此得到：

$$S(\vec{R})=k_B\ln G(\vec{R})+k_B\ln\int\Omega(\vec{R}){\rm d}\vec{R}=-\frac{3k_B\vert\vec{R}\vert^2}{2N\ell^2}+S_0$$

其中 $S_0$ 是一个与 $\vec{R}$ 无关的常数。

Helmholtz自由能：

$$A(\vec{R})=U_0-TS(\vec{R})=\frac{3k_BT\vert\vec{R}\vert^2}{2N\ell^2}+A_0$$

其中 $A_0$ 是与 $\vec{R}$ 无关的常数。因此：

$$\vec{F}=-\frac{\partial A(\vec{R})}{\partial\vec{R}}=-\frac{3k_BT}{N\ell^2}\vec{R}$$

## Freely Rotating Chain

在前文模型的基础上，考虑到键向量之间存在固定的夹角 $\theta$，故键向量之间不独立：

$$\langle\vec{r}_i,\vec{r}_j\rangle=\ell^2(-\cos\theta)^{\vert j-i \vert}$$

$\vec{R}^2$ 的期望：

$$\langle\vec{R},\vec{R}\rangle=\begin{bmatrix}1&-\cos\theta&(-\cos\theta)^2&\cdots&(-\cos\theta)^{N-1}\\-\cos\theta&1&-\cos\theta&\cdots&(-\cos\theta)^{N-2}\\(-\cos\theta)^2&-\cos\theta&1&\cdots&(-\cos\theta)^{N-3}\\\vdots&\vdots&\vdots&\ddots&\vdots\\(-\cos\theta)^{N-1}&(-\cos\theta)^{N-2}&(-\cos\theta)^{N-3}&\cdots&1\end{bmatrix}$$

化简，得到距离的期望：

$$\langle\vec{R}^2\rangle^{\frac12}=\left(\frac{1-\cos\theta}{1+\cos\theta}\right)^{\frac12}N^{\frac12}\ell$$

## Hindered Rotation model

在前文的基础上，除了键角以外，如果还考虑到二面角 $\phi$ 并不是均匀分布的，则应用类似的方法得到距离的期望：

$$\langle\vec{R}^2\rangle^{\frac12}=\left(\frac{1-\cos\theta}{1+\cos\theta}\right)^{\frac12}\left(\frac{1+\langle\cos\phi\rangle}{1-\langle\cos\phi\rangle}\right)^{\frac12}N^{\frac12}\ell$$

其中 $\langle\cos\phi\rangle$ 依Boltzmann分布由势能 $U(\phi)$ 定义（$\phi$ 之间是不相关的）：

$$\langle\cos\phi\rangle=\frac{\int_o^{2\pi}\cos\phi\cdot e^{-\frac{U(\phi)}{kT}}{\rm d}\phi}{\int_o^{2\pi}e^{-\frac{U(\phi)}{kT}}{\rm d}\phi}$$
