---
title: 分子间相互作用
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png/640px-Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png
mathjax_autoNumber: true
---

本文从经典的角度考察分子之间的相互作用。 在必要时使用量子力学理解分子间相互作用。
<!--more-->

# 分子间相互作用

将分子间相互作用分为静电、诱导、色散、交换排斥以及混合项：

$$E_{int}=E_{elstat}+E_{ind}+E_{disp}+E_{exrep}+E_{mix}$$

下文将分别进行讨论。

## 角度相关的相互作用

### 离子-偶极相互作用

一个电荷为 $Ze$ 的离子与偶极矩为 $\mu$ 的偶极之间的的相互作用可以写为：

$$\color{blue}{U_{id}=\frac{Z\boldsymbol{\mu r}}{r^3}=\frac{Z\mu\cos\theta}{r^2}}$$

其中 $\theta$ 为偶极矩与连接离子偶极的向量之间的夹角。若偶极的取向依Boltzmann分布，则相互作用能的热力学平均为：

$$\langle U(r)\rangle\equiv\frac{\int_0^\pi U(r,\theta)e^{-\frac{U(r,\theta)}{kT}}\sin\theta\mathrm{d}\theta}{\int_0^\pi e^{-\frac{U(r,\theta)}{kT}}\sin\theta\mathrm{d}\theta}$$

其中 $U(r,\theta)=\frac{Z\mu\cos\theta}{r^2}$，将其分为距离部分 $U_0(r)=\frac{Z\mu}{r^2}$ 与角度部分 $f(\theta)=\cos\theta$。令 $\beta=-\frac{U_0(r)}{kT}$，代入式(3)得到：

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\int_0^\pi f(\theta)e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta}{\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta}\nonumber\\&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta\right)\end{align}$$

将 $\beta f(\theta)$ 展开为泰勒级数，当 $\beta f(\theta)\ll1$ 时：

$$\begin{align}\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta&\simeq\left[1+\beta f(\theta)+\frac{\beta^2f^2(\theta)}{2}+\cdots\right]\sin\theta\mathrm{d}\theta\nonumber\\&=2+0+\frac{\beta^2}{3}+\cdots\end{align}$$

因此

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(2+\frac{\beta^2}{3}+\cdots\right)\\&=\frac{U_0(r)}{2+\frac{\beta^2}{3}+\cdots}\left(\frac{2\beta}{3}+\cdots\right)\\&=\frac{\beta}{3}U_0(r)+\cdots\end{align}$$

因此离子-偶极相互作用的热力学平均为：

$$\color{red}{\langle U(r)\rangle=-\frac{Z^2\mu^2}{3kTr^4}}$$

### 离子-诱导偶极相互作用

由于诱导偶极的方向总与连接偶极到离子的向量方向相反，因此离子与诱导偶极的相互作用能为：

$$\color{blue}{U_{iid}=-\frac{Z\mu_{ind}}{r^2}}$$

诱导偶极的大小取决于极化率 $\alpha$ 与电场强度 $\vert\mathbf{E}\vert$：

$$\mu_{ind}=\alpha\vert\mathbf{E}\vert$$

因此：

$$\color{red}{U_{iid}=-\frac{Z^2\alpha}{r^4}}$$

从式(9)与式(12)发现，无论是固有偶极还是诱导偶极，离子与偶极之间的相互作用都以 $r^{-4}$ 衰减。

### 偶极-偶极相互作用

考虑两个具有永久偶极矩 $\boldsymbol{\mu}_1,\boldsymbol{\mu}_2$ 的极性分子，两个偶极子将发生静电相互作用，这一相互作用可以利用矢量形式写为：

$$\color{blue}{U_{dd}=\frac{\boldsymbol{\mu}_1\boldsymbol{\mu}_2}{r^3}-3\frac{(\boldsymbol{\mu}_1\boldsymbol{r})(\boldsymbol{\mu}_2\boldsymbol{r})}{r^5}}$$

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

$$\color{red}{\langle U(r)\rangle=-\frac{1}{3kT}\frac{\mu_1^2\mu_2^2}{r^6}}$$

### 偶极-诱导偶极相互作用

偶极在远处产生的电场的电场强度为：

$$\mathbf{E}=\frac{3(\boldsymbol{\mu}\cdot\hat{\mathbf{r}})\hat{\mathbf{r}}-\boldsymbol{\mu}}{r^3}$$

在极坐标 $(r,\theta)$ 下 $\mathbf{E}$ 可表示为：

$$\mathbf{E}(\mathbf{r},\theta)=\frac{\mu}{r^3}\left(2\cos\theta\hat{\mathbf{r}}+\sin\theta\hat{\theta}\right)$$

场强的大小：

$$\vert\mathbf{E}\vert=\frac{\mu}{r^3}(3\cos^2\theta+1)^\frac12$$

由极化率与场强的大小可得诱导偶极的大小：

$$\mu_{ind}=\frac{\alpha\mu}{r^3}(3\cos^2\theta+1)^\frac12$$

相互作用能 $U_{did}=\mu_{ind}\vert\mathbf{E}\vert$，因此偶极与诱导偶极之间的相互作用能可写作：

$$\color{blue}{U_{did}=-\frac{\mu^2\alpha}{r^6}(3\cos^2\theta+1)}$$

与前文的离子-诱导偶极相互作用相类似，诱导偶极的方向总与场强的方向平行，因此无需依Boltzmann分布进行热力学平均，只需对角度 $\theta$ 进行平均。由于 $\langle\cos^2\theta\rangle=\frac13$，因此：

$$\color{red}{\langle U(r)\rangle=-\frac{2\mu^2\alpha}{r^6}}$$

### 诱导偶极-诱导偶极相互作用

在任何时刻，分子某一侧的电荷可能会比另一侧稍微不平衡，从而产生瞬时偶极矩，该偶极矩会诱导附近的其他分子产生诱导偶极矩。 瞬时偶极矩可能使得分子间的静电势能降低，在两个分子之间产生轻微的吸引力。 由于两个偶极子是动态相关的，因此随着时间的推移，吸引力的平均值不为零。这种相互作用的精确计算非常复杂，但是基于两个耦合的电荷振子的量子力学模型对理解该问题有很大帮助。

考虑两个相距 $r$  的一维谐振子，势能 $V(r)=\frac12m\omega_0^2r_i^2$，可以写出两个谐振子的定态薛定谔方程：

$$\begin{align}&\left(-\frac{\hbar^2}{2m}\frac{\partial^2}{\partial r_1^2}\right)\Psi_1+\frac12m\omega_0r_1^2\Psi_1=E_1\Psi_1\\&\left(-\frac{\hbar^2}{2m}\frac{\partial^2}{\partial r_2^2}\right)\Psi_2+\frac12m\omega_0r_2^2\Psi_2=E_2\Psi_2\end{align}$$

从式(30)(31)解得能量：

$$\begin{align}&E_1=\left(n_1+\frac12\right)\hbar\omega_0\quad n_1=0,1,2,\dots\\&E_2=\left(n_2+\frac12\right)\hbar\omega_0\quad n_2=0,1,2,\dots\end{align}$$

如果每个谐振子还带有电荷，则它们之间的静电能：

$$U_{elstat}=\frac{1}{4\pi\varepsilon_0}\left(\frac{q^2}{r}-\frac{q^2}{r+r_2}-\frac{q^2}{r-r_1}+\frac{q^2}{r-r_1+r_2}\right)$$

当 $r\gg r_1,r\gg r_2$ 时：

$$U_{elstat}\simeq-\frac{q^2r_1r_2}{2\pi\varepsilon_0r^3}$$

系统总势能：

$$U_{tot}=\frac12m\omega_0^2r_1^2+\frac12m\omega_0^2r_2^2-\frac{q^2r_1r_2}{2\pi\varepsilon_0r^3}$$

为将总势能配方，令：

$$\begin{align}&\omega_s=\sqrt{\frac{m\omega_0^2-\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}\\&\omega_a=\sqrt{\frac{m\omega_0^2+\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}\end{align}$$

则总能量可改写为：

$$U_{tot}=\frac12m\omega_s^2\frac{(r_1+r_2)^2}{2}+\frac12m\omega_a^2\frac{(r_1-r_2)^2}{2}$$

因此考虑静电式势能后的基态能量为 $\frac12(\hbar\omega_s+\hbar\omega_a)$，与不考虑静电势能时的基态能量之差：

$$\begin{align}\Delta U(r)&=\frac12(\hbar\omega_s+\hbar\omega_a)-2\times\frac12\hbar\omega_0\nonumber\\&=\frac12\hbar\left(\sqrt{\frac{m\omega_0^2-\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}+\sqrt{\frac{m\omega_0^2+\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}-2\omega_0\right)\nonumber\\&\simeq-\frac{\hbar q^4}{32\pi^2\varepsilon_0^2m^2\omega_0^3r^6}\quad\left(\frac{q^2}{4\pi\varepsilon_0r^2}\ll\frac12m\omega_0r\right)\end{align}$$

接下来将参数 $q,m\omega_0^2,\hbar\omega_0$ 替换为可测量。平衡状态下，振子2受到的电场力与内部“拉力”相等：

$$\vert q\vert E=m\omega_0^2r_2$$

诱导偶极：

$$\mu_{ind}=\vert q\vert r_2=\alpha E$$

联立式()()，得到：

$$\frac{q^2}{m\omega_0^2}=\alpha$$

使用电离能 $I$ 替代 $\hbar\omega_0$，并把式()代入式()，得：

$$\Delta U(r)=-\frac{\alpha^2I}{32\pi^2\varepsilon_0^2r^6}$$

前文的讨论基于一维量子谐振子，而实际上分子处于三维空间。而且若两个分子具有不同的极化率 $\alpha_1,\alpha_2$ 和电离能 $I_1,I_2$，则相互作用能（原子单位制）：

$$\color{red}{U_{idid}(r)=-\frac{3\alpha_1\alpha_2}{2r^6}\left(\frac{I_1I_2}{I_1+I_2}\right)}$$