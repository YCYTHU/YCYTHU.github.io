---
title: Hückel 分子轨道理论的解与可视化
tags: 
- Chemistry
- Code
- Python
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/cover.jpg
mathjax_autoNumber: true
---
Hückel分子轨道理论（HMO）由 Erich Hückel 于 1930 年提出，是一种将分子轨道作为原子轨道的线性组合进行处理的简单方法。在此方法中，$\pi$ 轨道被认为与 $\sigma$ 轨道完全分离。后者被认为只是为分子提供刚性的骨架但不影响 $\pi$ 轨道的性质。本文介绍了一种通过绘制着色分子骨架以可视化 HMO 解的方法。
<!--more-->

## 理论基础

考虑由 $n$ 个正交归一的原子轨道 $\vert\phi_1\rangle,\vert\phi_2\rangle,\dots,\vert\phi_n\rangle$ 构成的基，假定分子轨道可以写为原子轨道线性组合的方式:

$$\vert\psi_g\rangle=\sum_{i=1}^nc_i\vert\phi_i\rangle\quad\left(\sum_{i=1}^nc_i^2=1\right)$$

因此 $\psi_g$ 的能量：

$$\begin{align}&&E&=\frac{\langle\psi_g\vert\hat{H}\vert\psi_g\rangle}{\langle\psi_g\vert\psi_g\rangle}\\&&&=\frac{\sum_{i=1}^n\sum_{j=1}^nc_ic_j\langle\phi_i\vert\hat{H}\vert\psi_j\rangle}{\sum_{i=1}^n\sum_{j=1}^nc_ic_j\langle\phi_i\vert\psi_j\rangle}\end{align}$$

由变分原理，为找到能使 $E$ 最小的系数 $c_i$，需要：

$$\frac{\partial E}{\partial c_i}=0\quad i=1,2,\dots,n$$

记 $H_{ij}=\langle\phi_i\vert\hat{H}\vert\psi_j\rangle,S_{ij}=\langle\phi_i\vert\psi_j\rangle$，上式转化为

$$\color{red}{\begin{bmatrix}H_{11}-ES_{11}&H_{12}-ES_{12}&\cdots&H_{1n}-ES_{1n}\\H_{21}-ES_{21}&H_{22}-ES_{22}&\cdots&H_{2n}-ES_{2n}\\\vdots&\vdots&\ddots&\vdots\\H_{n1}-ES_{n1}&H_{n2}-ES_{n2}&\cdots&H_{nn}-ES_{nn}\end{bmatrix}\begin{bmatrix}c_1\\c_2\\\vdots\\c_n\end{bmatrix}=0}\label{se}$$

$c_1=c_2=\dots=c_n=0$ 是上式的一个平凡解，为使式 $\eqref{se}$ 具有非平凡解，则矩阵 $\begin{bmatrix}H_{ij}-ES_{ij}\end{bmatrix}$ 行列式应为0。

$$\begin{vmatrix}H_{11}-ES_{11}&H_{12}-ES_{12}&\cdots&H_{1n}-ES_{1n}\\H_{21}-ES_{21}&H_{22}-ES_{22}&\cdots&H_{2n}-ES_{2n}\\\vdots&\vdots&\ddots&\vdots\\H_{n1}-ES_{n1}&H_{n2}-ES_{n2}&\cdots&H_{nn}-ES_{nn}\end{vmatrix}=0\label{det}$$

为简化计算，在 HMO 中，$H_{ij}$ 与 $S_{ij}$ 被进一步近似：

$$\begin{align}&H_{ij}=\begin{cases}\alpha&i=j\\\beta&i,j\ \mathrm{adjacent}\\0&\mathrm{otherwise}\end{cases}\\&S_{ij}=\delta_{ij}\end{align}$$

因此将一个分子的 $\pi$ 骨架视作图，其邻接矩阵为 $A$，则式 $\eqref{det}$ 转化为

$$\color{red}{\vert(\alpha-E)\mathrm{I}_n+\beta A\vert=0}$$

令 $x=\frac{\alpha-E}{\beta}$，则上式转化为：

$$\vert x\mathrm{I}_n+A\vert=0$$

因此求 $x$ 也即求矩阵 $A$ 的特征值。各原子轨道的系数组成的向量为矩阵 $\begin{bmatrix}x\mathrm{I}_n+A\end{bmatrix}$ 的零向量，因此也是矩阵 $A$ 的特征向量。因而**求 HMO 的解相当于求 $\pi$ 骨架邻接矩阵的特征值与特征向量**。

## Python 实现

在[《使用Python绘制着色分子骨架展示原子属性》](/2023/07/26/Molecule-Skeleton.html)一文中笔者介绍了将.mol文件（V3000格式）转换为邻接矩阵的函数`mol2graph`，故在这里不重复介绍这部分内容。在得到邻接矩阵后，只需要调用`numpy.linalg.eig()`函数计算邻接矩阵的特征值与特征向量即可得到 HMO 的解。

在前面提到文章中笔者还介绍了绘图函数`drawmol2D`用于绘制分子骨架并依据原子属性着色。此处只需要依次将每条分子轨道中原子轨道的系数作为原子属性传递给函数`drawmol2D`并绘图即可得到每条分子轨道的着色示意图。

最后创建一个.html文件以表格的形式展现每条分子轨道的能量、原子轨道系数与示意图。完整代码如下所示，其中用到的[molecule_skeleton.py文件可在此下载](https://cdn.jsdelivr.net/gh/ycythu/assets@main/molecule_skeleton.py)

```python
import numpy as np
import matplotlib.pyplot as plt
import molecule_skeleton

def Hückel(mol_path,colormap,scale,folder):
    _,bond_matrix=molecule_skeleton.mol2graph(mol_path)
    eigen=np.linalg.eig(bond_matrix)
    index=np.argsort(-eigen[0])
    energy=eigen[0][index]
    orbital=eigen[1][:,index]
    max_orbital=np.max(abs(orbital))
    table=[]
    
    for i in range(len(energy)):
        molecule_skeleton.drawmol2D(mol_path,colormap,orbital[:,i],scale,vmin=-max_orbital,vmax=max_orbital,)
        plt.savefig(folder+'orbital_'+str(i)+'.svg')
        plt.close()
        table.append('<tr><td>'+str(i+1)+'</td><td>'+str(-round(energy[i],3))+'</td><td><img src="'+folder+'orbital_'+str(i)+'.svg"></td></tr>\n')
    
    head=['<html><head><style>table {width: 100%;text-align: center;border: 1.5px solid;}table tr {}table td {border: 1px solid;}table td img {width: 40%;}</style></head><body><table><thead><tr><td>Index</td><td>(α-E)/β</td><td>Orbital</td></tr></thead><tbody>\n']
    end=['</tbody></table></body></html>']
    data=head+table+end
    html_path=folder+'table.html'
    html=open(html_path,"w")
    html.writelines(data)
    html.close()
    
def main():
    mol_path="molecule.mol"
    folder="C:/hückel/"
    Hückel(mol_path,'coolwarm',0,folder)

if __name__=='__main__':
    main()
```

## 效果展示

利用此程序计算苯分子的 HMO 并可视化如下。红色与蓝色分别代表原子轨道的系数为正或负，颜色的深浅指示了系数绝对值的大小。

<style>
    #HMO {
        display: table;
        width: 100%;
        text-align: center;
    }
    #HMO thead {
        font-weight: bold;
    }
    #HMO tbody {
        font-family: Times New Roman;
    }
    #HMO td img {
        width: 40%;
    }
</style>

<table id="HMO"><thead><tr><td>Index</td><td>(α-E)/β</td><td>Orbital</td></tr></thead><tbody>
<tr><td>1</td><td>-2.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_0.svg" alt="orbital_0"></td></tr>
<tr><td>2</td><td>-1.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_1.svg" alt="orbital_1"></td></tr>
<tr><td>3</td><td>-1.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_2.svg" alt="orbital_2"></td></tr>
<tr><td>4</td><td>1.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_3.svg" alt="orbital_3"></td></tr>
<tr><td>5</td><td>1.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_4.svg" alt="orbital_4"></td></tr>
<tr><td>6</td><td>2.0</td><td><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/hückel method/orbital_5.svg" alt="orbital_5"></td></tr>
</tbody></table>