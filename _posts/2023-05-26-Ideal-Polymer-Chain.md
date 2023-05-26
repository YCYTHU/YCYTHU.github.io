---
title: 理想聚合物链端到端距离的分布
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Ideal_chain_random_walk.svg/480px-Ideal_chain_random_walk.svg.png
mathjax_autoNumber: true
---

<!--more-->

# Freely Jointed Chain (Gaussian) model

假定键长固定为 $\ell$, 键可以绕一端的原子自由旋转，则每个键向量 $\vec{r}$ 的概率分布:

$$\zeta(\vec{r})=\frac{1}{4\pi l^2}\cdot\delta(|\vec{r}|-\ell)$$

假定键之间没有相互作用，分布独立，则 $N$ 个键向量的概率分布为单独概率分布的乘积：

$$G(\{\vec{r}_i\})=\prod_{i=1}^N\zeta(\vec{r}_i)$$

聚合物链端到端的距离向量 $\vec{R}$ 由 $N$ 个键向量共同决定：

$$\vec{R}=\sum_{i=1}^N\vec{r}_i$$

$\vec{R}$ 的概率分布符合随机游走模型：

$$G(\vec{R})=\left(\frac{3}{2\pi N\ell^2}\right)^\frac32e^{-\frac{3|\vec{R}|^2}{2N\ell^2}}$$

$|\vec{R}|$ 的期望：

$$\langle\vec{R}^2\rangle^{\frac12}=N^{\frac12}\ell$$