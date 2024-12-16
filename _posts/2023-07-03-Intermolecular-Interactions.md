---
title: 分子间相互作用
tags: 
- Chemistry
- Physics
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png/640px-Schematic_of_the_electrostatic_interaction_between_two_dipolar_molecules.png
mathjax_autoNumber: true
aside:
  toc: true
modify_date: 2023-07-10
---

为什么范德华作用随距离 $r^{-6}$ 衰减，为什么压紧的铅块会粘在一起，胶体为什么能够稳定存在？本文对分子之间的相互作用进行简要介绍。
<!--more-->

## 分子间相互作用

### 静电相互作用

#### 离子-偶极相互作用

一个电荷为 $Ze$ 的离子与偶极矩为 $\mu$ 的偶极之间的的相互作用可以写为：

$$\color{blue}{U_{\mathrm{id}}=\frac{Z\boldsymbol{\mu r}}{r^3}=\frac{Z\mu\cos\theta}{r^2}}\tag{1}$$

其中 $\theta$ 为偶极矩与连接离子偶极的向量之间的夹角。若偶极的取向依Boltzmann分布，则相互作用能的热力学平均为：

$$\langle U(r)\rangle\equiv\frac{\int_0^\pi U(r,\theta)e^{-\frac{U(r,\theta)}{kT}}\sin\theta\mathrm{d}\theta}{\int_0^\pi e^{-\frac{U(r,\theta)}{kT}}\sin\theta\mathrm{d}\theta}\tag{2}\label{mid}$$

符号 $\langle\ \rangle$ 代表热力学平均。其中 $U(r,\theta)=\frac{Z\mu\cos\theta}{r^2}$，将其分为距离部分 $U_0(r)=\frac{Z\mu}{r^2}$ 与角度部分 $f(\theta)=\cos\theta$。令 $\beta=-\frac{U_0(r)}{kT}$，代入式 $\eqref{mid}$ 得到：

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\int_0^\pi f(\theta)e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta}{\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta}\nonumber\\&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta\right)\nonumber\end{align}\tag{3}$$

将 $e^{\beta f(\theta)}$ 展开为泰勒级数，当 $\beta f(\theta)\ll1$ 时：

$$\begin{align}\int_0^\pi e^{\beta f(\theta)}\sin\theta\mathrm{d}\theta&\simeq\int_0^\pi\left[1+\beta f(\theta)+\frac{\beta^2f^2(\theta)}{2}+\cdots\right]\sin\theta\mathrm{d}\theta\nonumber\\&=2+0+\frac{\beta^2}{3}+\cdots\nonumber\end{align}\tag{4}$$

因此

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(2+\frac{\beta^2}{3}+\cdots\right)\nonumber\\&=\frac{U_0(r)}{2+\frac{\beta^2}{3}+\cdots}\left(\frac{2\beta}{3}+\cdots\right)\nonumber\\&=\frac{\beta}{3}U_0(r)+\cdots\nonumber\end{align}\tag{5}$$

因此离子-偶极相互作用的热力学平均为：

$$\color{red}{\langle U(r)\rangle=-\frac{Z^2\mu^2}{3kTr^4}}\tag{6}\label{id}$$

#### 离子-诱导偶极相互作用

由于诱导偶极总与连接偶极到离子的向量平行，因此离子与诱导偶极的相互作用能为：

$$\color{blue}{U_\mathrm{iid}=-\frac{Z\mu_\mathrm{ind}}{r^2}}\tag{7}$$

诱导偶极的大小取决于极化率 $\alpha$ 与电场强度 $\vert\mathbf{E}\vert$：

$$\mu_\mathrm{ind}=\alpha\vert\mathbf{E}\vert\tag{8}$$

因此：

$$\color{red}{U_\mathrm{iid}=-\frac{Z^2\alpha}{r^4}}\tag{9}\label{iid}$$

从式 $\eqref{id}$ 与式 $\eqref{iid}$ 发现，无论是固有偶极还是诱导偶极，离子与偶极之间的相互作用都以 $r^{-4}$ 衰减。

#### 偶极-偶极相互作用

考虑两个具有永久偶极矩 $\boldsymbol{\mu}_1,\boldsymbol{\mu}_2$ 的极性分子，两个偶极子将发生静电相互作用，这一相互作用可以利用矢量形式写为：

$$\color{blue}{U_\mathrm{dd}=\frac{\boldsymbol{\mu}_1\boldsymbol{\mu}_2}{r^3}-3\frac{(\boldsymbol{\mu}_1\boldsymbol{r})(\boldsymbol{\mu}_2\boldsymbol{r})}{r^5}}\tag{10}$$

设 $\theta_1,\theta_2$ 分别是两个偶极矩与连接两偶极的向量之间的夹角, $\phi$ 是两个偶极矩分别与连接两偶极的向量确定的两个平面之间的二面角。则 $U_\mathrm{dd}$ 可以写为 $(\theta_1,\theta_2,\phi)$ 的函数：

$$U_\mathrm{dd}=\frac{\mu_1\mu_2}{r^3}(\sin\theta_1\sin\theta_2\cos\phi-2\cos\theta_1\cos\theta_2)\tag{11}$$

相互作用能 $U_\mathrm{dd}$ 的角度部分对 $\theta_1,\theta_2,\phi$ 的切片填色图如图1所示。

<div align=center><img width="75%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/dipole-dipole-orientation.png" alt="图1：偶极-偶极相互作用能角度部分的切片填色图"></div>
<div align=center><font color="#999999">图1：偶极-偶极相互作用能角度部分的切片填色图</font></div>

如果两个偶极的取向并不固定，而是依照Boltzmann分布，则对所有的角度进行加权平均可得净的相互作用能，为偶极之间距离 $r$ 的函数。

$$\langle U(r)\rangle\equiv\langle U(r,\Theta_1,\Theta_2,\phi)e^{-\frac{U(r,\Theta_1,\Theta_2,\phi)}{kT}}\rangle\tag{12}$$

其中

$$U(r,\Theta_1,\Theta_2,\phi)=\frac{\mu_1\mu_2}{r^3}(\sin\Theta_1\sin\Theta_2\cos\phi-2\cos\Theta_1\cos\Theta_2)\tag{13}$$

将 $U(r,\Theta_1,\Theta_2,\phi)$ 分为距离部分 $U_0(r)$ 与角度部分 $f(\Omega)$：

$$\begin{align}&U_0(r)=\frac{\mu_1\mu_2}{r^3}\tag{14a}\\&f(\Omega)=\sin\Theta_1\sin\Theta_2\cos\phi-2\cos\Theta_1\cos\Theta_2\tag{14b}\end{align}$$

$U(r)$ 的角度平均：

$$\langle U(r)\rangle\equiv\frac{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi U_0(r)f(\Omega)e^{-\frac{U_0(r)f(\Omega)}{kT}}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{-\frac{U_0(r)f(\Omega)}{kT}}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}\tag{15}\label{meandd}$$

定义 $\beta=-\frac{U_0(r)}{kT}$，注意到：

$$\frac{\mathrm{d}}{\mathrm{d}\beta}\ln\left(\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\right)=\frac{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi f(\Omega)e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}{\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2}\tag{16}\label{log}$$

因此只需要考虑积分：

$$\begin{align}I&=\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi e^{\beta f(\Omega)}\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\nonumber\\&\simeq\int_0^{2\pi}\mathrm{d}\phi\int_0^\pi\int_0^\pi\left[1+\beta f(\Omega)+\frac{\beta^2f^2(\Omega)}{2}+\cdots\right]\sin\Theta_1\sin\Theta_2\mathrm{d}\Theta_1\mathrm{d}\Theta_2\nonumber\\&=8\pi\left(1+\frac{\beta^2}{3}+\cdots\right)\nonumber\end{align}\tag{17}\label{intI}$$

将式 $\eqref{log}\eqref{intI}$ 带入到式 $\eqref{meandd}$，得到：

$$\begin{align}\langle U(r)\rangle&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\ln(I)\nonumber\\&=U_0(r)\frac{\mathrm{d}}{\mathrm{d}\beta}\left[\ln(8\pi)+\ln\left(1+\frac{\beta^2}{3}+\cdots\right)\right]\nonumber\\&\simeq U_0(r)\times\frac{2\beta}{3}\times\left(1-\frac{\beta^2}{3}+\cdots\right)\nonumber\\&\approx\frac{2\beta}{3}U_0(r)\nonumber\end{align}\tag{18}\label{dd2}$$

由于相同的构型被考虑两次，因此将式 $\eqref{dd2}$ 乘以 $\frac12$ 得到：

$$\color{red}{\langle U(r)\rangle=-\frac{1}{3kT}\frac{\mu_1^2\mu_2^2}{r^6}}\tag{19}$$

#### 偶极-诱导偶极相互作用

偶极在远处产生的电场的电场强度为：

$$\mathbf{E}=\frac{3(\boldsymbol{\mu}\cdot\hat{\mathbf{r}})\hat{\mathbf{r}}-\boldsymbol{\mu}}{r^3}\tag{20}$$

在极坐标 $(r,\theta)$ 下 $\mathbf{E}$ 可表示为：

$$\mathbf{E}(\mathbf{r},\theta)=\frac{\mu}{r^3}\left(2\cos\theta\hat{\mathbf{r}}+\sin\theta\hat{\boldsymbol{\theta}}\right)\tag{21}$$

场强的大小：

$$\vert\mathbf{E}\vert=\frac{\mu}{r^3}(3\cos^2\theta+1)^\frac12\tag{22}$$

由极化率与场强的大小可得诱导偶极的大小：

$$\mu_\mathrm{ind}=\frac{\alpha\mu}{r^3}(3\cos^2\theta+1)^\frac12\tag{23}$$

相互作用能 $U_\mathrm{did}=\mu_{ind}\vert\mathbf{E}\vert$，因此偶极与诱导偶极之间的相互作用能可写作：

$$\color{blue}{U_\mathrm{did}=-\frac{\mu^2\alpha}{r^6}(3\cos^2\theta+1)}\tag{24}$$

与前文的离子-诱导偶极相互作用相类似，诱导偶极的方向总与场强的方向平行，因此无需依Boltzmann分布进行热力学平均，只需对角度 $\theta$ 进行平均。由于 $\langle\cos^2\theta\rangle=\frac13$，因此：

$$\color{red}{\langle U(r)\rangle=-\frac{2\mu^2\alpha}{r^6}}\tag{25}$$

#### 诱导偶极-诱导偶极相互作用

在任何时刻，分子某一侧的电荷可能会比另一侧稍微不平衡，从而产生瞬时偶极矩，该偶极矩会诱导附近的其他分子产生诱导偶极矩。 瞬时偶极矩可能使得分子间的静电势能降低，在两个分子之间产生轻微的吸引力。 由于两个偶极子是动态相关的，因此随着时间的推移，吸引力的平均值不为零。这种相互作用的精确计算非常复杂，但是基于两个耦合的电荷振子的量子力学模型对理解该问题有很大帮助。

考虑两个相距 $r$  的一维谐振子，势能 $V(r)=\frac12m\omega_0^2r_i^2$，可以写出两个谐振子的定态薛定谔方程：

$$\begin{align}&\left(-\frac{\hbar^2}{2m}\frac{\partial^2}{\partial r_1^2}\right)\Psi_1+\frac12m\omega_0r_1^2\Psi_1=E_1\Psi_1\tag{26a}\label{osc1}\\&\left(-\frac{\hbar^2}{2m}\frac{\partial^2}{\partial r_2^2}\right)\Psi_2+\frac12m\omega_0r_2^2\Psi_2=E_2\Psi_2\tag{26b}\label{osc2}\end{align}$$

从式 $\eqref{osc1}\eqref{osc2}$ 解得能量：

$$\begin{align}&E_1=\left(n_1+\frac12\right)\hbar\omega_0\quad n_1=0,1,2,\dots\tag{27a}\\&E_2=\left(n_2+\frac12\right)\hbar\omega_0\quad n_2=0,1,2,\dots\tag{27b}\end{align}$$

如果每个谐振子还带有电荷，则它们之间的静电能：

$$U_\mathrm{elstat}=\frac{1}{4\pi\varepsilon_0}\left(\frac{q^2}{r}-\frac{q^2}{r+r_2}-\frac{q^2}{r-r_1}+\frac{q^2}{r-r_1+r_2}\right)\tag{28}$$

当 $r\gg r_1,r\gg r_2$ 时：

$$U_\mathrm{elstat}\simeq-\frac{q^2r_1r_2}{2\pi\varepsilon_0r^3}\tag{29}$$

系统总势能：

$$U_\mathrm{tot}=\frac12m\omega_0^2r_1^2+\frac12m\omega_0^2r_2^2-\frac{q^2r_1r_2}{2\pi\varepsilon_0r^3}\tag{30}$$

为将总势能配方，令：

$$\begin{align}&\omega_s=\sqrt{\frac{m\omega_0^2-\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}\tag{31a}\\&\omega_a=\sqrt{\frac{m\omega_0^2+\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}\tag{31b}\end{align}$$

则总能量可改写为：

$$U_\mathrm{tot}=\frac12m\omega_s^2\frac{(r_1+r_2)^2}{2}+\frac12m\omega_a^2\frac{(r_1-r_2)^2}{2}\tag{32}$$

因此考虑静电式势能后的基态能量为 $\frac12(\hbar\omega_s+\hbar\omega_a)$，与不考虑静电势能时的基态能量之差：

$$\begin{align}\Delta U(r)&=\frac12(\hbar\omega_s+\hbar\omega_a)-2\times\frac12\hbar\omega_0\nonumber\\&=\frac12\hbar\left(\sqrt{\frac{m\omega_0^2-\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}+\sqrt{\frac{m\omega_0^2+\frac{q^2}{2\pi\varepsilon_0r^3}}{m}}-2\omega_0\right)\nonumber\\&\simeq-\frac{\hbar q^4}{32\pi^2\varepsilon_0^2m^2\omega_0^3r^6}\quad\left(\frac{q^2}{4\pi\varepsilon_0r^2}\ll\frac12m\omega_0r\right)\nonumber\end{align}\tag{33}\label{deltaU}$$

接下来将参数 $q,m\omega_0^2,\hbar\omega_0$ 替换为可测量。平衡状态下，振子2受到的电场力与内部“拉力”相等：

$$\vert q\vert E=m\omega_0^2r_2\tag{34}\label{idid1}$$

诱导偶极：

$$\mu_\mathrm{ind}=\vert q\vert r_2=\alpha E\tag{35}\label{idid2}$$

联立式 $\eqref{idid1}\eqref{idid2}$，得到：

$$\frac{q^2}{m\omega_0^2}=\alpha\tag{36}\label{ididalpha}$$

使用电离能 $I$ 替代 $\hbar\omega_0$，并把式 $\eqref{ididalpha}$ 代入式 $\eqref{deltaU}$，得：

$$\Delta U(r)=-\frac{\alpha^2I}{32\pi^2\varepsilon_0^2r^6}\tag{37}$$

前文的讨论基于一维量子谐振子，而实际上分子处于三维空间。而且若两个分子具有不同的极化率 $\alpha_1,\alpha_2$ 和电离能 $I_1,I_2$，则相互作用能（原子单位制）：

$$\color{red}{U_\mathrm{idid}(r)=-\frac{3\alpha_1\alpha_2}{2r^6}\left(\frac{I_1I_2}{I_1+I_2}\right)}\tag{38}$$

#### 范德华相互作用

前文中的偶极-偶极相互作用（Keesom）、偶极-诱导偶极相互作用（Debye）与诱导偶极-诱导偶极相互作用（London）项具有相同的 $r^{-6}$ 距离依赖性，统称为范德华相互作用。

$$\begin{align}U_{\mathrm{vdW}}(r)&=U_{\mathrm{Keesom}}(r)+U_{\mathrm{Debye}}(r)+U_{\mathrm{London}}(r)\nonumber\\&=-\frac{1}{r^6}\left[\frac{\mu_1^2\mu_2^2}{3kT}+2\mu_1^2\alpha_2+\frac{3\alpha_1\alpha_2}{2}\left(\frac{I_1I_2}{I_1+I_2}\right)\right]\nonumber\end{align}\tag{39}$$

#### 交换排斥

Pauli不相容原理指出每个轨道上只能有两个电子。当原子彼此靠近时轨道发生重叠，即电子在某种程度上处于同一轨道上。 这迫使轨道发生变化并导致原子之间的排斥。我们不知道交换排斥力的确切数学形式，一般有如下几种模型：

- 硬球模型

$$u(r)=\left\{\begin{matrix}&\infty&r<\sigma\nonumber\\&0&r\geq\sigma\nonumber\end{matrix}\right.$$

- 幂级数

$$u(r)\propto r^{-n}\quad n>0\nonumber$$

- 指数模型

$$u(r)\propto \exp\left(-\frac{r}{\sigma}\right)\quad \sigma>0\nonumber$$

将交换排斥与范德华作用结合，Lennard-Jones势 $V_\mathrm{LJ}(r)=4\epsilon\left[\left(\frac{\sigma}{r}\right)^{12}-\left(\frac{\sigma}{r}\right)^6\right]$ 由于其在数学上非常简单而被广泛研究（图2）。

<div align=center><img width="75%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/LJ-potential.png" alt="图2：Lennard-Jones势"></div>
<div align=center><font color="#999999">图2：Lennard-Jones势</font></div>

### 第二维利系数

目前我们分析了两个分子之间的净相互作用，更进一步地，我们可以为这种相互作用提供一种量度。对压强 $p$ 进行virial展开：

$$\frac{p}{kT}=\rho+B_2(T)\rho^2+B_3(T)\rho^3+\cdots\tag{40}\label{virial}$$

其中 $\rho$ 是粒子的数密度。如果所有的 $B_i=0$，那么式 $\eqref{virial}$ 变为理想气体（粒子间无相互作用）状态方程，因此系数 $B_i$ 包含了有关分子间相互作用的信息。第二维利系数的定义是：

$$B_2(T)=-\frac{1}{2V}\int_V\exp\left[-\frac{u(\mathbf{r}_1,\mathbf{r}_2,\boldsymbol{\Omega}_1,\boldsymbol{\Omega}_2)}{kT}-1\right]\mathrm{d}\mathbf{r}_1\mathrm{d}\mathbf{r}_2\mathrm{d}\boldsymbol{\Omega}_1\mathrm{d}\boldsymbol{\Omega}_2\tag{41}\label{secvir}$$

对于球形粒子组成的各向同性系统，式 $\eqref{secvir}$ 可以简化为：

$$B_2(T)=-2\pi\int_0^\infty\exp\left[-\frac{u(r)}{kT}-1\right]r^2\mathrm{d}r\tag{42}$$

其中 $r=\vert\mathbf{r}_1-\mathbf{r}_2\vert$。第三维利系数与第四维利系数也与第二维利系数相关：

$$\begin{align}&B_3=\frac58B_2^2\nonumber\\&B_4=\left(-\frac{89}{280}+\frac{219\sqrt2}{2240\pi}+\frac{4131}{2240\pi}\arccos\frac{1}{\sqrt3}\right)B_2^3\nonumber\end{align}\tag{43}$$

维利方程也可以应用于溶质之间的相互作用，并且可以定义有效第二维利系数。例如，稀蛋白质溶液的有效第二维利系数可以根据光散射数据进行计算。

### 电介质与介电屏蔽

溶液中的静电效应可以从Debye–Hückel理论来理解。在介电常数为 $\varepsilon_r$ 的电介质中，应用Poisson方程将电势 $\phi$ 与电荷密度 $\rho$ 关联起来：

$$\varepsilon_r\varepsilon_0\nabla^2\phi(x,y,z)=-\rho(x,y,z)\tag{44}\label{pos}$$

如果假设体系是球对称的，那么在球坐标系下，式 $\eqref{pos}$ 改写为：

$$\frac{\varepsilon_r\varepsilon_0}{r^2}\frac{\partial}{\partial r}\left(r^2\frac{\partial\phi}{\partial r}\right)=-\rho(r)\tag{45}\label{rpos}$$

假定体系中离子依Boltzmann分布，那么电荷密度 $\rho$：

$$\rho(r)=Zec_0\exp\left[-\frac{Ze\phi(r)}{kT}\right]\tag{46}\label{rhobo}$$

将式 $\eqref{rhobo}$ 带入到式 $\eqref{rpos}$ 中，得到Poisson-Boltzmann方程：

$$\frac{\varepsilon_r\varepsilon_0}{r^2}\frac{\partial}{\partial r}\left(r^2\frac{\partial\phi}{\partial r}\right)=-\sum_iZ_iec_{i0}\exp\left[-\frac{Z_ie\phi(r)}{kT}\right]\tag{47}$$

这样的偏微分方程很难求解，不过如果对指数进行级数展开，可以得到相对容易的近似版本：

$$\nabla^2\phi(r)=\kappa^2\phi(r)\quad\kappa^2=\frac{\sum_ic_{i0}Z_i^2e^2}{\varepsilon_r\varepsilon_0kT}\tag{48}\label{pbe}$$

注意到 $\kappa^{-1}$ 具有长度量纲，将 $\lambda_\mathrm{D}=\kappa^{-1}$ 称为Debye半径或Debye–Hückel屏蔽长度，是溶液中电荷的净静电效应及其能持续多远的一种度量。从式 $\eqref{pbe}$ 解出 $\phi(r)$ 的表达式：

$$\color{red}{\phi(r)=\frac{Ze}{4\pi\varepsilon_r\varepsilon_0(1+\kappa R)}\frac{e^{\kappa(R-r)}}{r}}\tag{49}\label{dhphi}$$

其中 $R$ 为离子半径。式 $\eqref{dhphi}$ 说明在溶液中静电效应并非以 $r^{-1}$ 的速度衰减，而是以 $\frac{e^{-\kappa r}}{r}$ 的更快速度衰减，如图3所示。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/DH-theory.png" alt="图3：真空中和溶液中两种衰减速度的对比"></div>
<div align=center><font color="#999999">图3：真空中和溶液中两种衰减速度的对比</font></div>

从Debye–Hückel理论还可以获得关于超额化学势（或活度系数 $\gamma$ ）的方程：

$$kT\ln\gamma=-\frac{\kappa Z^2e^2}{8\pi\varepsilon_r\varepsilon_0(1+2\kappa R)}\tag{50}$$

### 平均力势（PMF）

平均力势描述了体系的自由能如何随分子间或分子内坐标而变化，即沿所选坐标的自由能面。对于具有 $N$ 个粒子的系统，作用于粒子 $i$ 的平均力指固定粒子 $1,\dots,n$ 的构型时粒子 $n+1,\dots,N$ 对粒子 $i$ 的力的加权平均。

$$-\nabla_i\omega^{(n)}=\frac{\int e^{-\frac{V}{kT}}(-\nabla_iV)\mathrm{d}q_{n+1}\dots\mathrm{d}q_{N}}{\int e^{-\frac{V}{kT}}\mathrm{d}q_{n+1}\dots\mathrm{d}q_{N}},\ i=1,2,\dots,n\tag{51}\label{pmf}$$

式 $\eqref{pmf}$ 中 $-\nabla_i\omega^{(n)}$ 是粒子 $i$ 上的平均力，$\omega^{(n)}$ 即为平均力势。对于 $n=2$ 的情形，$\omega^{(2)}(r)$ 表示将两个粒子从无限远拉到相距 $r$ 时的平均功，这与径向分布函数 $g(r)$ 相关联：

$$g(r)=\exp\left[-\frac{\omega^{(2)}(r)}{kT}\right]\tag{52}$$

## 宏观体的相互作用

第一部分讨论了两个小分子之间的相互作用，对于蛋白质，固体表面这类可视作由许多小分子组成的宏观体，它们之间的相互作用可从势能的加和性出发进行讨论。

### 分子与无限大平面的相互作用

将分子视为几何上的点，假定距分子 $r$ 处的势能具有 $u(r)=-\frac{C}{r^n}$ 的形式。考虑一个由许多分子构成的无限大平面和距离平面 $r$ 的一个分子。将它们之间的相互作用视作分子与一系列半径为 $x$ 的圆环的相互作用的和：

$$W_\mathrm{pw}(r)=-C\rho\int_r^\infty\mathrm{d}z\int_0^\infty\frac{2\pi x\mathrm{d}x}{(z^2+x^2)^\frac n2}\tag{53}$$

其中 $\rho$ 为粒子数密度。$W_\mathrm{pw}(r)$ 具有初等形式的解：

$$\color{red}{W_\mathrm{pw}(r)=-\frac{2\pi C\rho}{(n-2)(n-3)}\frac{1}{r^{n-3}}}\tag{54}\label{wpw}$$

从式 $\eqref{wpw}$ 发现，$W_\mathrm{pw}(r)$ 正比于距离 $r$ 的 $(3-n)$ 次幂，说明分子与无限大平面的相互作用相较于分子间相互作用表现出更“长程”的特征。对于 $n=6$ 的情况，$W_\mathrm{pw}(r)=-\frac{\pi C\rho}{6r^3}$ 表现出距离的立方反比特征。

### 球体与无限大平面的相互作用

在几何点与无限大平面相互作用的基础上，我们可以进一步考察半径为 $R$ 的球体与相距 $r$ 的无限大平面的相互作用。将球体与无限大平面的相互作用视作一系列平行于平面（距离为 $z$）的圆片与无限大平面的相互作用之和：

$$W_\mathrm{sw}(r)=-\frac{2\pi^2C\rho^2}{(n-2)(n-3)}\int_0^{2R}\frac{(2R-z)z\mathrm{d}z}{(r+z)^{n-3}}\tag{55}\label{wsw}$$

当 $r\ll R$ 时，式 $\eqref{wsw}$ 化简为：

$$\color{red}{W_\mathrm{sw}(r)=-\frac{4\pi^2C\rho^2R}{(n-2)(n-3)(n-4)(n-5)}\frac{1}{r^{n-5}}}\tag{56}$$

### 球体间的相互作用

对球体间相互作用的描述在胶体理论中发挥着重要作用。两个中心距离为 $r$ 的半径为 $R$ 的球体，假定其具有范德华形式的势能（$r^{-6}$ 的距离依赖性），则两个球体间的相互作用等于对两个球体内部全部粒子的积分，略去过程，得到势能的形式为：

$$\color{red}{W(r)=-\frac{\pi^2C\rho^2}{6}\left[\frac{2R^2}{r^2-4R^2}+\frac{2R^2}{r^2}+\ln\left(\frac{r^2-4R^2}{r^2}\right)\right]}\tag{57}\label{wss}$$

对式 $\eqref{wss}$ 进行展开可以得到：

$$\begin{align}&W(r)\sim-\frac{16\pi^2C\rho^2R^6}{9}\frac{1}{r^6}+\omicron\left(\frac{1}{r^8}\right)&r\rightarrow+\infty\nonumber\tag{58a}\label{wssinf}\\&W(r)\sim-\frac{\pi^2C\rho^2R}{12(r-2R)}+\omicron\bigg[\ln(r-2R)\bigg]&r\rightarrow2R\tag{58b}\label{wss2r}\end{align}$$

从式 $\eqref{wssinf}\eqref{wss2r}$ 可以看出，当球体之间距离很近时，势能与球表面的距离成反比关系；当球体之间相距很远时，相互作用能与 $r^{-6}$ 呈正比，与单分子下的情形相同（如图4所示）。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/sphere-sphere.png" alt="图4：球体间的相互作用"></div>
<div align=center><font color="#999999">图4：球体间的相互作用</font></div>

### 无限大平面间的相互作用

使用类似的方法可以以面密度的形式给出无限大平面间的相互作用，以避免发散的结果。

$$W_{ww}(r)=-\frac{2\pi C\rho^2}{(n-2)(n-3)}\int_r^\infty\frac{\mathrm{d}z}{z^{n-3}}\tag{59}$$

解得：

$$\color{red}{W_\mathrm{ww}(r)=-\frac{2\pi C\rho^2}{(n-2)(n-3)(n-4)}\frac{1}{r^{n-4}}}\tag{60}\label{www}$$

对于 $n=6$ 的情形，式 $\eqref{www}$ 化简为：

$$W_\mathrm{ww}(r)=-\frac{\pi C\rho^2}{12r^2}\tag{61}\label{wwwn6}$$

该式可以用于粗略估计两个抛光金属表面之间的相互作用强度。假设两个接触面积为 $A=10^{-4}\ \mathrm{m^2}$ 的铅块，它们之间的作用力为：

$$F=-A\cdot\frac{\mathrm{d}W_\mathrm{ww}(r)}{\mathrm{d}r}=-\frac{A\pi C\rho^2}{6r^3}\tag{62}$$

粗略估计 $\frac{\pi C\rho^2}{6}\approx4\times10^{-20}\ \mathrm{J}$，则相互作用力与铅块表面距离（SI）的关系为 $F=\frac{4\times10^{-24}}{r^3}$

$$\begin{array}{c|c}r\ /\ \unicode{x212B}&F\ /\ \mathrm{N}\\\hline1000&4\times10^{-3}\\100&4\\10&4\times10^3\end{array}\nonumber$$

## 带电介观物体

第二部分讨论了中性宏观体间的范德华作用形式，对于带电荷的微粒（如胶体粒子），还要额外考虑溶液中的静电作用。有了第二部分的基础，我们从溶液中的两个平面开始。

### 两个均匀带电的无限大平面

考察两个相互平行的、相距为 $2h$ 的无限大的均匀带电平面，电荷面密度为 $\sigma$，平面之间填充单一抗衡离子。体系的Poisson-Boltzmann方程：

$$\varepsilon_r\varepsilon_0\nabla^2\phi(\mathbf{r})=-\sum_iZ_iec_i\exp\left[-\frac{Z_ie\phi(\mathbf{r})}{kT}\right]\tag{63}\label{pbe2}$$

由于体系具有柱对称性，将式 $\eqref{pbe2}$ 在柱坐标（选平面法向 $\hat{x}$ 为高度方向）下表示：

$$\frac{\mathrm{d}^2\phi(x)}{\mathrm{d}x^2}=-\frac{Zec}{\varepsilon_r\varepsilon_0}\exp\left[-\frac{Ze\phi(\mathbf{r})}{kT}\right]\tag{64}$$

解得：

$$\phi(x)=-\frac{2kT}{Ze}\ln\left[\cos\left(\frac{sx}{h}\right)\right]\tag{65}\label{pbphi}$$

其中 $s$ 是式 $\eqref{tres}$ 的解：

$$s\tan s=\frac{\vert\sigma\vert Zeh}{2kT\varepsilon_r\varepsilon_0}\tag{66}\label{tres}$$

将 $\phi(x)$ 的解析式 $\eqref{pbphi}$ 代入Poisson方程，得到垂直平面方向的电荷密度。如图5所示。

$$\rho(x)=-\varepsilon_r\varepsilon_0\frac{\mathrm{d}^2\phi(x)}{\mathrm{d}x^2}=\frac{2kTs^2\varepsilon_r\varepsilon_0}{Zeh^2}\frac{1}{\cos^2(sx/h)}\tag{67}\label{pbrho}$$

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/charged-layer.png" alt="图5：带电平面间的电势与离子浓度"></div>
<div align=center><font color="#999999">图5：带电平面间的电势与离子浓度</font></div>

由式 $\eqref{pbrho}$ 得到两平面连线中点上和在平面上的电荷密度：

$$\begin{align}&\rho(0)=\frac{2kTs^2\varepsilon_r\varepsilon_0}{Zeh^2}\tag{68a}\\&\rho(h)=\frac{\sigma^2Ze}{2kT\varepsilon_r\varepsilon_0\sin^2(s)}\tag{68b}\end{align}$$

当 $h\rightarrow+\infty$ 时，两平面连线中点上和在平面上的电荷密度：

$$\begin{align}&\rho(0)=\frac{kT\pi^2\varepsilon_r\varepsilon_0}{2Zeh^2}&h\rightarrow+\infty\tag{69a}\\&\rho(h)=\frac{\sigma^2Ze}{2kT\varepsilon_r\varepsilon_0}&h\rightarrow+\infty\tag{69b}\end{align}$$

平面之间的抗衡离子对平面存在渗透压，通过平均场近似得到：

$$p=\frac{2(kTs)^2\varepsilon_r\varepsilon_0}{Z^2e^2h^2}\tag{70}$$

### Gouy-Chapman 理论

如果前文的两个平面处于电解质溶液中，则结果将会变得十分复杂。不妨先考虑处于无限大的水溶液中的一个带电平面，溶液中的电解质为1:1型。则式 $\eqref{pbe2}$ 要改写为：

$$\varepsilon_r\varepsilon_0\nabla^2\phi(\mathbf{r})=en_0\left[\exp\left(-\frac{e\phi}{kT}\right)-\exp\left(\frac{e\phi}{kT}\right)\right]\tag{71}\label{pbe3}$$

其中 $n_0$ 为电解质浓度。式 $\eqref{pbe3}$ 的解为：

$$\phi(x)=\frac{2kT}{e}\ln\frac{1+\gamma\exp(-\kappa x)}{1-\gamma\exp(-\kappa x)}\quad\gamma=\frac{\exp\left(\frac{e\phi_0}{2kT}\right)-1}{\exp\left(\frac{e\phi_0}{2kT}\right)+1}\tag{72}$$

其中 $\phi_0$ 表示平面上的电势，$\kappa^{-1}$ 是Debye–Hückel屏蔽长度（见式 $\eqref{pbe}$）。当 $\phi_0$ 很小时：

$$\phi(x)\simeq\phi_0\exp(-\kappa x)\approx\frac{\sigma}{\varepsilon_r\varepsilon_0\kappa}\exp(-\kappa x)\tag{73}$$

进一步的，考虑两个带电平面的情况，如果假设这两个平面的间距 $2h$ 充分大（弱重叠近似），则两平面间单位面积的排斥能：

$$W_\mathrm{ww}(2h)=\frac{64kTn_0\gamma^2}{\kappa}\exp(-2\kappa h)\tag{74}\label{www2}$$

平面间离子产生的压强：

$$p=64kTn_0\gamma^2\exp(-2\kappa h)\tag{75}$$

使用类似的方法，可以得到两个半径为 $R$ 的球体之间的静电势：

$$W_\mathrm{ss}(r)=\frac{64\pi kTRn_0\gamma^2}{\kappa^2}\exp(-\kappa r)\tag{76}\label{wss2}$$

### DLVO 理论

本文的第二部分讨论了宏观物体间的范德华作用，对于溶液中的带电粒子，还要结合本部分内容再额外考虑静电作用。结合式 $\eqref{www2}\eqref{wss2}$ 描述的静电作用与式 $\eqref{wss2r}\eqref{wwwn6}$ 的范德华作用，在溶液中带电球体或平面之间的相互作用可以写为两部分的加和（图6）。

$$W(r)=W_\mathrm{vdW}(r)+W_\mathrm{elstat}(r)\tag{77}$$

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/Intermolecular Interactions/DLVO.png" alt="图6：DLVO理论描述的微粒间的相互作用"></div>
<div align=center><font color="#999999">图6：DLVO理论描述的微粒间的相互作用</font></div>