---
title: 逐步加成聚合反应的聚合度
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/3/36/Step-growth_polymerization.jpg
mathjax_autoNumber: true
---
在双官能团单体的逐步加成聚合过程中，假设每一步均为可逆反应且平衡常数相同，单体初始浓度为 $c_0$。在反应**达到平衡**后，单体浓度为 $c_1$，聚合度为 $i\ (i\in\mathbb{N}^+)$ 的聚合物的浓度为 $c_i$。
<!--more-->

则相邻聚合度的聚合物浓度满足：

$$\frac{c_{i+1}}{c_i\cdot c_1}=K$$

定义无量纲数 $\alpha_i=\frac{c_i}{c_0}$，则上式改写为：

$$\frac{\alpha_{i+1}}{c_0\cdot\alpha_i\cdot\alpha_1}=K$$

因此有递推关系：

$$\alpha_{i+1}=c_0K\cdot\alpha_i\alpha_1$$

故 $\alpha_i$ 的通项公式：

$$\alpha_i=(c_0K)^{i-1}{\alpha_1}^i$$

故聚合度为 $i$ 的单体的摩尔分数 $x_i$：

$$x_i=\frac{\alpha_i}{\sum_{k=1}\alpha_k}=(1-c_0K\alpha_1)(c_0K\alpha_1)^{i-1}$$

式(5)要求 $c_0K\alpha_1<1$，后文会证明这一条件始终成立。从式(5)得到转化率（反应程度）$\color{red}{p=c_0K\alpha_1}$。假设单体相对分子质量为 $M$，由此可以得到数均分子量[^sum1]与重均分子量[^sum2]：

$$\begin{align}&\bar{M_n}=\frac{\sum_{i=1}i\cdot x_i}{\sum_{i=1}x_i}\cdot M=(1-c_0K\alpha_1)M\sum_{i=1}i(c_0K\alpha_1)^{i-1}=\color{red}{\frac{M}{1-c_0K\alpha_1}}\\\nonumber\\&\bar{M_w}=\frac{\sum_{i=1}i^2\cdot x_i}{\sum_{i=1}i\cdot x_i}\cdot M=\frac{\sum_{i=1}i^2\cdot(c_0K\alpha_1)^i}{\sum_{i=1}i\cdot(c_0K\alpha_1)^i}\cdot M=\color{red}{\frac{M(1+c_0K\alpha_1)}{1-c_0K\alpha_1}}\end{align}$$

因此多分散系数 $\color{red}{d=\frac{\bar{M_w}}{\bar{M_n}}=1+c_oK\alpha_1}$

---

至此，聚合度相关参数已被表示为关于 $c_0,K,\alpha_1$ 的函数。其中 $c_0,K$ 均为已知参数，下文求解 $\alpha_1$ 的表达式并证明 $c_0K\alpha_1<1$。

体系满足物料守恒方程：

$$\sum_{i=1}i\cdot\alpha_i=1$$

解得[^sum1]：

$$\color{red}{\alpha_1=\frac{2c_0K+1-\sqrt{4c_0K+1}}{2(c_0K)^2}}$$

容易证明 $c_0K\alpha_1<1$，而且当 $c_0K$ 较大时可以估计反应程度 $p=c_0K\alpha_1$ 接近 $1$ 的速度：

$$p=c_0K\alpha_1=1-\frac{1}{\sqrt{c_0K}}+\omicron\left(\frac{1}{c_0K}\right)$$

---

将 $\alpha_1$ 的表达式代入前文的聚合反应的相关参数的表达式，得到：

$$\begin{align}&p=1-\frac{\sqrt{4c_0K+1}-1}{2c_0K}\\\nonumber\\&\bar{M_n}=\frac{2Mc_0K}{\sqrt{4c_0K+1}-1}\\\nonumber\\&\bar{M_w}=M\sqrt{4c_0K+1}\\\nonumber\\&d=2-\frac{\sqrt{4c_0K+1}-1}{2c_0K}\end{align}$$

通过将式(12~13)进行泰勒展开，可以估计平衡聚合度随 $c_0K$ 增大的速率。

$$\begin{align}&\frac{\bar{M_n}}{M}=\sqrt{c_0K}+\frac12+\omicron\left(\frac{1}{\sqrt{c_0K}}\right)\\\nonumber\\&\frac{\bar{M_w}}{M}=2\sqrt{c_0K}+\omicron\left(\frac{1}{\sqrt{c_0K}}\right)\end{align}$$

[^sum1]:$\alpha<1$ 时，$\sum_{n=1}^\infty n\alpha^n=\frac{\alpha}{(1-\alpha)^2}$
[^sum2]:$\alpha<1$ 时，$\sum_{n=1}^\infty n^2\alpha^n=\frac{\alpha^2+\alpha}{(1-\alpha)^3}$
