---
title: 分布系数曲线的极值点
tags: 
- Chemistry
- Zhihu
cover: https://upload.wikimedia.org/wikipedia/commons/1/16/H3PO4_speciation.png
---
<!--more-->

<i class="fas fa-link"></i> [分布系数图中一种粒子的分布系数最大时对应的pH如何求解？](https://www.zhihu.com/question/599839749/answer/3019879596)


**先以二元酸为例，随后推广到 $n$ 元酸碱。**

二元酸 $\rm{H_2A}$ 的中间形态的分布系数：

$$\delta({\mathrm{HA}^-})=\frac{K_\mathrm{a1}[\mathrm{H}^+]}{[\mathrm{H^+}]^2+K_\mathrm{a1}{[\mathrm{H^+}]}+K_\mathrm{a1}K_\mathrm{a2}}$$

若要求极大值，则只需 $\delta({\mathrm{HA}^-})$ 对 $\delta({\mathrm{HA}^-})[\mathrm{H^+}]$ 一阶导数为 $0$，二阶导数小于 $0$。解得

$$\rm{pH}=\frac{pK_{a1}+pK_{a2}}{2}$$

不过对于多元酸的情况，不能简单地推广为相邻 $\mathrm{p}K_a$ 的算术平均值，比如对于 $K_\mathrm{a1}=10^{-6.8},\ K_\mathrm{a2}=10^{-7.2},\ K_\mathrm{a3}=10^{-7.6}$ 的三元酸，$\rm{H_2A^-}$ 的分布系数极值点并不为 $7.0$：

$$\begin{align}&\left.\delta({\mathrm{H_2A}^-})\right\vert_\mathrm{pH=7.0}=0.413\\&\left.\delta({\mathrm{H_2A}^-})\right\vert_\mathrm{pH=6.9}=0.417\end{align}$$

对于 $n$ 元酸（碱），写出分布系数表达式：

$$\delta(\mathrm{H}_{n-j}\mathrm{A}^{j-})=\frac{\prod_{k=1}^jK_{\mathrm{a}k}{[\mathrm{H^+}]^{n-j}}}{\sum_{t=0}^n\left(\prod_{k=1}^tK_{\mathrm{a}k}\right){[\mathrm{H^+}]^{n-t}}}\quad(0<j<n)$$

极大值满足如下条件：

$$\frac{\mathrm{d}\delta(\mathrm{H}_{n-j}\mathrm{A}^{j-})}{\mathrm{d}[\mathrm{H^+}]}=0$$

$$\frac{\mathrm{d}^2\delta(\mathrm{H}_{n-j}\mathrm{A}^{j-})}{\mathrm{d}[\mathrm{H^+}]^2}<0$$


可以得到 $[\mathrm{H^+}]$ 是

$$\color{red}{\sum_{t=0}^n\left[(j-t)\left(\prod_{k=1}^tK_{\mathrm{a}k}\right){[\mathrm{H^+}]}^{n-t}\right]=0}$$

的一个正实数解。下证红色方程有且仅有一个正实数解。考虑多项式函数：

$$P(x)=\sum_{t=0}^n\left[(j-t)\left(\prod_{k=1}^tK_{ak}\right)x^{n-t}\right]$$
  
以 $P^{(i)}(x)$ 表示 $\displaystyle{\frac{\mathrm{d}^i}{\mathrm{d}x^i}P(x)}$，特别的，$P^{(0)}(x)=P(x)$。    

可以发现：

- $P^{(n-j)}(0)=0$
- $P^{(n-j)}(x)$ 在 $[0,+\infty)$ 上单调递增
-  $\forall i\in\{0,1,2,\dots,n-j\}$，$P^{(i)}(0)<0$。     
- $\forall i\in\{0,1,2,\dots,n-j\}$，当 $x\to+\infty$ 时 $P^{(i)}(x)$ 发散到 $+\infty$。    

因此 $P(x)$ 在 $[0,+\infty)$ 上有且仅有一个零点。由分布系数的意义知其为分布系数曲线的极大值点。