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

$$x_i=\frac{\alpha_i}{\sum_{k=1}\alpha_k}$$

假设单体相对分子之质量为 $M$，由此可以得到数均分子量与重均分子量：

$$\begin{align}\bar{M_n}=\frac{\sum_{i=1}\left(i\cdot\frac{\alpha_i}{\sum\alpha}\right)}{\sum}M\\\end{align}$$