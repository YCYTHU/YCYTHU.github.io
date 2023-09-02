---
title: 立方体内均匀分布粒子之间距离的分布
tag: Jottings
cover: /assets/images/particles in cube/particles in cube.jpg
---
假设许多无大小的粒子在边长为 $\ell$ 的立方体内均匀分布，数密度为 $\rho$。随机选取两个粒子，记它们之间的距离为 $d$，则随机变量 $d$ 应满足何种分布。
<!--more-->

随机变量 $d$ 的概率密度函数在 $d=r$ 处的值正比于距离某粒子 $r$ 处其他粒子的数量。由于粒子在立方体内均匀分布，因此此值正比于半径为 $r$ 的球体在立方体内的表面积。该面积是 $r$ 的分段函数：

$$\mathrm{Area}(r)=\begin{cases}4\pi r^2&0<r\leq\frac{\ell}{2}\\2\pi(3r\ell-4r^2)&\frac{\ell}{2}<r\leq\frac{\sqrt2}{2}\ell\\2\pi(3r\ell-4r^2)+24r\left[r\cos^{-1}\left(\frac{\ell^2}{4r^2-\ell^2}\right)-\ell\cos^{-1}\left(\frac{\ell}{\sqrt{4r^2-\ell^2}}\right)\right]&\frac{\sqrt2}{2}\ell<r\leq\frac{\sqrt3}{2}\ell\end{cases}$$

<div align=center><img width="75%" src="\assets\images\particles in cube\area.svg"></div>
<div align=center><font color="#999999">图1：球体在立方体内的表面积与半径 $r$ 的关系</font></div>

因此：

$$\mathrm{pdf}(r)=N\rho\cdot\mathrm{Area}(r)$$

其中 $N$ 为归一化系数。