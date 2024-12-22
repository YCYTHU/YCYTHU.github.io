---
title: 聚合物中的几率效应
tags: 
- Probability theory
- Chemistry
cover: 
---
<!--more-->

假设存在由 $n$ 个球组成的一维阵列（图1）:

<div align=center><img class="image image--lg" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/polymer probability/figure1.png"/></div>
<div align=center><font color="#999999">图1：$n$ 个球组成的一维阵列</font></div>

随机挑选两颗相邻的球并取走得到两个空位（图2），然后不断重复这一过程：

<div align=center><img class="image image--lg" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/polymer probability/figure2.png"></div>
<div align=center><font color="#999999">图2：随机挑选两颗球（红框内的两颗球）并取走，取走后得到两个空位</font></div>

由于被取走的球的位置是随机的，因此可能会存在某颗球两侧没有相邻的球（图3），这样的球不会被挑选取走：

<div align=center><img class="image image--lg" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/polymer probability/figure3.png"></div>
<div align=center><font color="#999999">图3：红框内的球两侧没有相邻的球，在接下来的取球过程中不会被挑选取走</font></div>

重复取球过程直至没有球剩余或者没有球可以被挑选取走。此时阵列中剩余的球的数量记为 $s$，当 $n$ 趋于无穷的时候，$s$ 的数学期望如何。

---

记 $s$ 的数学期望为 $E(s\vert n)=f(n)$，将 $n$ 个球的一维阵列按顺序编号 $1,2,3,\dots,n$。在第一次取球过程中，有可能

- 取走 $1$ 号与 $2$ 号球，原问题简化为 $n'=0$ 和 $n'=n-2$ 的情况
- 取走 $2$ 号与 $3$ 号球，原问题简化为 $n'=1$ 和 $n'=n-3$ 的情况
- 取走 $3$ 号与 $4$ 号球，原问题简化为 $n'=2$ 和 $n'=n-4$ 的情况
- $\dots$
- 取走 $n-1$ 号与 $n$ 号球，原问题简化为 $n'=n-2$ 和 $n'=0$ 的情况

由于每种情况是等可能的并且重复了两次，因此：

$$f(n)=\frac{2}{n-1}\sum_{i=1}^{n-2}f(i)\tag{1}$$

因此：

$$\begin{align}&(n-1)f(n)=2\sum_{i=1}^{n-2}f(i)\tag{2}\label{rec_n}\\&nf(n+1)=2\sum_{i=1}^{n-2}f(i)+2f(n-1)\tag{3}\label{rec_n1}\end{align}$$

将式 $\eqref{rec_n}$ 与式 $\eqref{rec_n1}$ 作差得到递推关系：

$$nf(n+1)-(n-1)f(n)-2f(n-1)=0\tag{4}\label{rec}$$

对于 $n=1,2$ 的情况，显然有 $f(1)=1,f(2)=0$。对式 $\eqref{rec}$ 应用Z变换得到：

$$\left[zF'(z)-F(z)\right]-z\left[zF'(z)-F(z)\right]-2z^2F(z)=0\tag{5}$$

化简得到：

$$\frac{F(z)}{F'(z)}=-\frac{z^2-z}{2z^2-z+1}\tag{6}$$

解得：

$$F(z)=C\cdot\frac{ze^{-2z}}{(z-1)^2}\tag{7}$$

代入初值条件并进行逆变换得到：

$$f(n)=\frac{(-2)^{n+1}}{\Gamma(n+2)}+\frac{\Gamma(n+3,-2)}{e^2\Gamma(n+2)}\tag{8}$$

因此当 $n$ 趋于无穷的时候，$\displaystyle{E(s\vert n)\sim\frac{n}{e^2}}$

$$\lim_{n\to\infty}\frac{E(s\vert n)}{n}=\frac{1}{e^2}\tag{9}\label{ratio}$$

---

假设将一条无限长的聚乙烯醇进行缩醛化，由于缩醛化总是发生在相邻的羟基上，且位置是随机的，因此可能存在一些不能缩醛化的独立羟基（图4）。

<div align=center><img class="image image--lg" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/polymer probability/figure4.png"></div>
<div align=center><font color="#999999">图4：无限长聚乙烯醇的缩醛化</font></div>

根据式$\eqref{ratio}$，缩醛化过程中羟基的转化率为 $\displaystyle{\left(1-\frac{1}{e^2}\right)}\approx86.5\%$。