---
title: 晶体场分裂能的计算
tags: 
- Chemistry
- Zhihu
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Dxz_orbital.png/480px-Dxz_orbital.png
---
<!--more-->
<style>
	#coordinates_o {
		display: table;
		width: unset;
		text-align: center;
		margin: 0 auto;
	}
	#coordinates_o td {
		border: none;
	}
	#coordinates_t {
		display: table;
		width: unset;
		text-align: center;
		margin: 0 auto;
	}
	#coordinates_t td {
		border: none;
	}
</style>

<i class="fas fa-link"></i> [请问为什么正八面体场的分裂能：正四面体场的分裂能=9:4啊？](https://www.zhihu.com/question/514327100/answer/2344700568)

<i class="fas fa-calculator"></i> [在线计算晶体场分裂能](/chemistry-collections/Crystal-Field-Splitting-Diagram.html)

<i class="fas fa-code"></i> [MATLAB计算代码](/2023/06/03/Crystal-Field-Splitting-Diagram.html)

## 晶体场理论

晶体场理论中，配体被认为是与中心原子无共价作用的点电荷。使用算符 $V$ 来描述配体与d轨道电子之间的静电排斥。由于我们只讨论静电引起的轨道能量变化，因此库仑积分或共振积分：    

$$H_{pq}=\int\psi_p^*V\psi_qd\tau$$

其中 $\psi_p$ 和 $\psi_q$ 为已归一化的波函数。重叠积分：

$$S_{pq}=\int\psi_p^*\psi_qd\tau=\delta_{pq}$$

则轨道能量 $E_k$ 满足行列式：  

$$\left| H_{pq}-S_{pq}E_k \right|=0$$

也即 $E_k$ 为矩阵 $H_{pq}$ 的特征值。接下来求解矩阵 $H_{pq}$。

考虑配体与中心原子间的静电排斥，对于每个配体：

$$V_i=\frac{Z_ie^2}{r_i}$$

其中 $Z_i$ 为配体电荷数，$r_i$ 为中心原子与配体点电荷的距离。对全部的 $N$ 个配体：  

$$V=\sum_{i=1}^{N}{V_i}=\sum_{i=1}^{N}\frac{Z_ie^2}{r_i}$$

其中 $\displaystyle{\frac{1}{r_i}}$ 可以用球谐函数展开：

$$\frac{1}{r_i}=\sum_{l=0}^{\infty}\sum_{m=-l}^{m=+l}{\frac{4\pi}{2l+1}(\frac{r_S^l}{r_L^{l+1}})Y_{lm}(\theta_i,\phi_i)Y_{lm}(\theta_j,\phi_j)}$$

其中 $r_S$ 表示距配体或电子较近的一方的距离， $r_L$ 则表示距较远的一方的距离。故而：

$$H_{pq}=\sum_{i=1}^{N}{}\sum_{l=0}^{\infty}{}\sum_{m=-l}^{m=+l}{\frac{4{\pi}Z_ie^2}{2l+1}Y_{lm}(\theta_i,\phi_i)\int\psi_p^*[\frac{r_S^l}{r_L^{l+1}}]_iY_{lm}(\theta,\phi)\psi_qd\tau}$$ 

考虑 $d$ 轨道波函数：

$$\begin{array}{l} \psi_1=d_{x^2-y^2}&=(1/\sqrt{2})R_{3d}[Y_{22}+Y_{22}^*]\\ \psi_2=d_{xz}&=(1/\sqrt{2})R_{3d}[Y_{21}+Y_{21}^*]\\ \psi_3=d_{z^2}&=R_{3d}Y_{20}\\ \psi_4=d_{yz}&=-(i/\sqrt{2})R_{3d}[Y_{21}-Y_{21}^*]\\ \psi_5=d_{xy}&=-(i/\sqrt{2})R_{3d}[Y_{22}-Y_{22}^*] \end{array}$$

令：

$$\alpha_l^i=Z_ie^2\int_0^\infty{(R_{3d})^2}[\frac{r_S^l}{r_L^{l+1}}]_ir^2dr$$

并构造配体位置函数 $D_{lm}^i$ 和 $G_{lm}^i$：

$$\begin{align}&D_{00}^i=\alpha_0^i\\~\\&D_{20}^i=\alpha_2^i(3\cos\theta_i^2-1)\\&D_{21}^i=\alpha_2^i\sin\theta_i\cos\theta_i\cos\phi_i\\&D_{22}^i=\alpha_2^i\sin\theta_i\cos2\phi_i\\~\\&D_{40}^i=\alpha_4^i\left(35/3\cos^4\theta_i-10\cos^2\theta_i+1\right)\\&D_{41}^i=\alpha_4^i\sin\theta_i\cos\theta_i\left(7/3\cos^2\theta_i-1\right)\cos\phi_i\\&D_{42}^i=\alpha_4^i\sin^2\theta_i(7\cos^2\theta_i-1)\cos2\phi\\&D_{43}^i=\alpha_4^i\sin^3\theta_i\cos\theta_i\cos3\phi_i\\&D_{44}^i=\alpha_4^i\sin^4\theta_i\cos4\phi_i\\~\\&G_{21}^i=\alpha_2^i\sin\theta_i\cos\theta_i\sin2\phi_i\\&G_{22}^i=\alpha_2^i\sin^2\theta_i\sin2\phi_i\\~\\&G_{41}^i=\alpha_4^i\sin\theta_i\cos\theta_i\left(7/3\cos^2\theta_i-1\right)\sin\phi_i\\&G_{42}^i=\alpha_4^i\sin^2\theta_i(7\cos^2\theta_i-1)\sin\phi_i\\&G_{43}^i=\alpha_4^i\sin^3\theta_i\cos\theta_i\sin3\phi_i\\&G_{44}^i=\alpha_4^i\sin^4\theta_i\sin4\phi_i\end{align}$$

令 $\displaystyle{D_{lm}=\sum_{i=1}^N{D_{lm}^i}}$ ，$N$ 为总配体个数。则 $H_{pq}$ 可简化为：

$$\begin{align}&H_{11}=D_{00}-\frac17D_{20}+\frac{1}{56}D_{40}+\frac{5}{24}D_{44}\\&H_{12}=\frac37D_{21}-\frac{5}{28}D_{41}+\frac{5}{12}D_{43}\\&H_{13}=-\frac{\sqrt3}{7}D_{22}+\frac{5\sqrt3}{84}D_{42}\\&H_{14}=-\frac37G_{21}+\frac{5}{28}G_{41}+\frac{5}{12}G_{43}\\&H_{15}=\frac{5}{24}G_{44}\\&H_{22}=D_{00}+\frac{1}{14}D_{20}-\frac{1}{14}D_{40}+\frac{3}{14}D_{22}+\frac{5}{42}D_{42}\\&H_{23}=\frac{\sqrt3}{7}D_{21}+\frac{5\sqrt3}{14}D_{41}\\&H_{24}=\frac{3}{14}G_{22}+\frac{5}{42}G_{42}\\&H_{25}=\frac37G_{21}-\frac{5}{28}G_{41}+\frac{5}{12}G_{43}\\&H_{33}=D_{00}+\frac17D_{20}+\frac{3}{28}D_{40}\\&H_{34}=\frac{\sqrt3}{7}G_{21}+\frac{5\sqrt3}{14}G_{41}\\&H_{35}=-\frac{\sqrt3}{7}G_{22}+\frac{5\sqrt3}{84}G_{42}\\&H_{44}=D_{00}+\frac{1}{14}D_{20}-\frac{1}{14}D_{40}-\frac{3}{14}D_{22}-\frac{5}{42}D_{42}\\&H_{45}=\frac37D_{21}-\frac{5}{28}D_{41}-\frac{5}{12}D_{43}\\&H_{55}=D_{00}-\frac17D_{20}+\frac{1}{56}D_{40}-\frac{5}{24}D_{44}\end{align}$$

## 计算示例

### 正八面体 

在正八面体构型的配合物中，六个配体在球坐标系下的位置分别为

<table id="coordinates_o"> <tr> <td>$\text{Ligand}$</td> <td colspan="2">$\text{Coordinates}$</td> </tr> <tr> <td></td> <td>$\theta_i$</td> <td>$\phi_i$</td> </tr> <tr> <td>$\text{A}$</td> <td>$0$</td> <td>$-$</td> </tr> <tr> <td>$\text{B}$</td> <td>$\pi$</td> <td>$-$</td> </tr> <tr> <td>$\text{C}$</td> <td>$\pi/2$</td> <td>$0$</td> </tr> <tr> <td>$\text{D}$</td> <td>$\pi/2$</td> <td>$\pi$</td> </tr> <tr> <td>$\text{E}$</td> <td>$\pi/2$</td> <td>$3\pi/2$</td> </tr> <tr> <td>$\text{F}$</td> <td>$\pi/2$</td> <td>$\pi/2$</td> </tr> </table>

代入上述表达式，得：

$$\begin{align}&H_{11}=6\alpha_0+\alpha_4\\&H_{22}=6\alpha_0-\frac{2}{3}\alpha_4\\&H_{33}=6\alpha_0+\alpha_4\\&H_{44}=6\alpha_0-\frac{2}{3}\alpha_4\\&H_{55}=6\alpha_0-\frac{2}{3}\alpha_4\end{align}$$

其余 $H_{pq}$ 均为0。由于能量 $E_k$ 为矩阵 $H_{pq}$ 的特征值，故：

$$\begin{align}&E_{1,3}=6\alpha_0+\alpha_4&(二重)\\&E_{2,4,5}=6\alpha_0-\frac{2}{3}\alpha_4&(三重) \end{align}$$

因此正八面体场分裂能： 

$$\Delta_\mathrm{oct}=E_{1,3}-E_{2,4,5}=\frac{5}{3}\alpha_4$$

### 正四面体：

在正四面体构型的配合物中，四个配体在球坐标系下的位置分别为

<table id="coordinates_o"> <tr> <td>$\text{Ligand}$</td> <td colspan="2">$\text{Coordinates}$</td> </tr> <tr> <td></td> <td>$\theta_i$</td> <td>$\phi_i$</td> </tr> <tr> <td>$\text{A}$</td> <td>$\arccos(\sqrt{3}/3)$</td> <td>$0$</td> </tr> <tr> <td>$\text{B}$</td> <td>$\arccos(\sqrt{3}/3)$</td> <td>$\pi$</td> </tr> <tr> <td>$\text{C}$</td> <td>$\arccos(-\sqrt{3}/3)$</td> <td>$3\pi/2$</td> </tr> <tr> <td>$\text{D}$</td> <td>$\arccos(-\sqrt{3}/3)$</td> <td>$\pi/2$</td> </tr></table>

代入表达式，得：

$$\begin{align}&H_{11}=4\alpha_0+\frac{8}{27}\alpha_4\\&H_{22}=4\alpha_0+\frac{8}{27}\alpha_4\\&H_{33}=4\alpha_0-\frac{4}{9}\alpha_4\\&H_{44}=4\alpha_0+\frac{8}{27}\alpha_4\\&H_{55}=4\alpha_0-\frac{4}{9}\alpha_4 \end{align}$$

其余 $H_{pq}$ 均为0。因此：  

$$\begin{align}&E_{1,2,4}=4\alpha_0+\frac{8}{27}\alpha_4&(三重)\\&E_{3,5}=4\alpha_0-\frac{4}{9}\alpha_4&(二重) \end{align}$$

则正四面体场分裂能： 

$$\Delta_\mathrm{tet}=E_{1,2,4}-E_{3,5}=\frac{20}{27}\alpha_4$$

进一步得到：

$$\frac{\Delta_\mathrm{tet}}{\Delta_\mathrm{oct}}=\frac{4}{9}$$  

## 参考：  
[1] Bethe, H. 1929. vol. 3. Ann Physik 133.    
[2] Companion, AL & Komarynsky, MA. 1964. Crystal field splitting diagrams. Journal of Chemical Education 41: 257.   