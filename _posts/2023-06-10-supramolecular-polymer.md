---
title: 超分子聚合物的聚合度
tags: Chemistry
cover: 
mathjax_autoNumber: true
---
在逐步加成聚合过程中，假设每一步均为可逆反应且平衡常数相同，单体初始浓度为 $c_0$。在反应达到平衡后，单体浓度为 $c_1$，聚合度为 $i$ 的聚合物的浓度为 $c_i$。
<!--more-->

则相邻聚合度的聚合物浓度满足：

$$\frac{c_{i+1}}{c_i\cdot c_1}=K\quad(i\in\mathbb{N}^+)$$

定义无量纲数 $\alpha_i=\frac{c_i}{c_0}$，则上式改写为：

$$\frac{\alpha_{i+1}}{c_0\cdot\alpha_i\cdot\alpha_1}=K\quad(i\in\mathbb{N}^+)$$

因此有递推关系：

$$\alpha_{i+1}=c_0K\cdot\alpha_i\alpha_1\quad(i\in\mathbb{N}^+)$$

故 $\alpha_i$ 的通项公式：

$$\alpha_i=(c_0K)^{i-1}{\alpha_1}^i$$

故聚合度为 $i$ 的单体的摩尔分数 $x_i$：

$$x_i=\frac{\alpha_i}{\sum_{k=1}\alpha_k}=(1-c_0K\alpha_1)(c_0K\alpha_1)^{i-1}$$

式(5)要求 $c_0K\alpha_1<1$，后文会证明这一条件始终成立。假设单体相对分子之质量为 $M$，由此可以得到数均分子量与重均分子量[^sum]：

$$\begin{align}&\bar{M_n}=\frac{\sum_{i=1}i\cdot x_i}{\sum_{i=1}x_i}\cdot M=(1-c_0K\alpha_1)M\sum_{i=1}i(c_0K\alpha_1)^{i-1}=\frac{M}{1-c_0K\alpha_1}\\\nonumber\\&\bar{M_w}=\frac{\sum_{i=1}i^2\cdot x_i}{\sum_{i=1}i\cdot x_i}\cdot M=\frac{\sum_{i=1}i^2\cdot(c_0K\alpha_1)^i}{\sum_{i=1}i\cdot(c_0K\alpha_1)^i}\cdot M=\frac{M(1+c_0K\alpha_1)}{1-c_0K\alpha_1}\end{align}$$

[^sum]:所需的两个数列求和公式$\sum_{n=1}^\infty n\alpha^n=\frac{\alpha}{(1-\alpha)^2}$,$\sum_{n=1}^\infty n^2\alpha^n=\frac{\alpha^2+\alpha}{(1-\alpha)^3$

因此多分散性系数 $d=\frac{\bar{M_w}}{\bar{M_n}}=1+c_oK\alpha_1$

---

至此，聚合度相关参数已被表示为关于 $c_0,K,\alpha_1$ 的函数。其中 $c_0,K$ 均为已知参数，下文求解 $\alpha_1$ 的表达式。
