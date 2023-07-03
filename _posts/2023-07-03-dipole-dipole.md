---
title: 偶极-偶极相互作用
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png/640px-Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png
mathjax_autoNumber: true
---
考虑两个具有永久偶极矩 $\boldsymbol{\mu}_1,\boldsymbol{\mu}_2$ 的极性分子，两个偶极子将发生静电相互作用，这一相互作用可以利用矢量形式写为：
<!--more-->

$$U_{dd}=\frac{\boldsymbol{\mu}_1\boldsymbol{\mu}_2}{r^3}-3\frac{(\boldsymbol{\mu}_1\boldsymbol{r})(\boldsymbol{\mu}_2\boldsymbol{r})}{r^5}$$

设 $\theta_1,\theta_2$ 分别是两个偶极矩与连接两偶极的向量之间的夹角, $\phi$ 是两个偶极矩分别与连接两偶极的向量确定的两个平面之间的二面角。则 $U_{dd}$ 可以写为 $(\theta_1,\theta_2,\phi)$ 的函数：

$$U_{dd}=\frac{\mu_1\mu_2}{r^3}(\sin\theta_1\sin\theta_2\cos\phi-2\cos\theta_1\cos\theta_2)$$

如果两个偶极的取向并不固定，而是依照Boltzmann分布，则对所有的角度进行加权平均可得净的相互作用能，为偶极之间距离 $r$ 的函数。

$$\langle U(r)\rangle\equiv\langle U(r,\Theta_1,\Theta_2,\phi)e^{-\frac{U(r,\Theta_1,\Theta_2,\phi)}{kT}}\rangle$$

其中

$$U(r,\Theta_1,\Theta_2,\phi)=\frac{\mu_1\mu_2}{r^3}(\sin\Theta_1\sin\Theta_2\cos\phi-2\cos\Theta_1\cos\Theta_2)$$

符号 $\langle\ \rangle$ 代表热力学平均。将 $U(r,\Theta_1,\Theta_2,\phi)$ 分为距离部分 $U_0(r)$ 与角度部分 $f(\Omega)$：

$$\begin{align}&U_0(r)=\frac{\mu_1\mu_2}{r^3}\\&f(\Omega)=\sin\Theta_1\sin\Theta_2\cos\phi-2\cos\Theta_1\cos\Theta_2\end{align}$$

$U(r)$ 的角度平均：

$$\langle U(r)\rangle\equiv\frac{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi U_0(r)f(\Omega)e^{-\frac{U_0(r)f(\Omega)}{kT}}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{-\frac{U_0(r)f(\Omega)}{kT}}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}$$

定义 $\beta=-\frac{U_0(r)}{kT}$，注意到：

$$\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\right)=\frac{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi f(\Omega)e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}$$

因此只需要考虑积分：

$$\begin{align}I&=\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\nonumber\\&\simeq\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi\left[1+\beta f(\Omega)+\frac{\beta^2f^2(\Omega)}{2}+\cdots\right]\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\nonumber\\&=8\pi\left(1+\frac{\beta^2}{3}+\cdots\right)\end{align}$$

将式(8)(9)带入到式(7)，得到：

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln(I)\nonumber\\&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\left[\ln(8\pi)+\ln\left(1+\frac{\beta^2}{3}+\cdots\right)\right]\nonumber\\&\simeq U_0(r)\times\frac{2\beta}{3}\times\left(1-\frac{\beta^2}{3}+\cdots\right)\nonumber\\&\approx\frac{2\beta}{3}U_0(r)\end{align}$$

由于相同的构型被考虑两次，因此将式(10)乘以 $\frac12$ 得到：

$$\langle U(r)\rangle=-\frac{1}{3kT}\frac{\mu_1^2\mu_2^2}{r^6}$$