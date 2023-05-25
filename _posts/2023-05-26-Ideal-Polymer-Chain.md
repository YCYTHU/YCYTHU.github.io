---
title: 理想聚合物链端到端距离的分布
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Ideal_chain_random_walk.svg/480px-Ideal_chain_random_walk.svg.png
mathjax_autoNumber: true
---

<!--more-->

假定键长固定为 $l$, 键可以绕一端的原子自由旋转，则每个键向量 $\vec{r}$ 的概率分布:

$$\zeta(\vec{r})=\frac{1}{4\pi l^2}\cdot\delta(|\vec{r}|-l)$$

假定键之间没有相互作用，分布独立，则 $N$ 个键向量的概率分布为单独概率分布的乘积：

$$G(\{\vec{r}_i\})=\prod_{i=1}^N\zeta(\vec{r}_i)$$

聚合物链端到端的距离向量 $\vec{R}$ 由 $N$ 个键向量共同决定：

$$\vec{R}=\sum_{i=1}^N\vec{r}_i$$

因此 $\vec{R}$ 的概率分布：

$$G(\vec{R})=\int\delta\left(\vec{R}-\sum_{i=1}^N\vec{r}_i\right)G(\{\vec{r}_i\}){\rm d}\{\vec{r}_i\}$$

Dirac $\delta$ 函数：

$$\delta(r)=\frac{1}{(2\pi)^3}\int_{-\infty}^{+\infty}e^{ikr}{\rm d}k$$

因此将 $G(\vec{R})$ 改写为：

$$G(\vec{R})=\frac{1}{(2\pi)^3}\int e^{ik|\vec{R}|}\left(\int e^{ikr}\zeta(\vec{r}){\rm d}\vec{r}\right)^N{\rm d}k=\frac{1}{(2\pi)^3}\int_{-\infty}^{+\infty}ke^{ik|\vec{R}|}\left(\frac{\sin(kl)}{kl}\right)^N{\rm d}k$$