---
title: 使用Python绘制着色分子骨架展示原子属性
tags: 
- Chemistry
- Code
- Python
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/cover.png
---
在图像中展现原子电荷分布或原子对某物理量的贡献时如果直接将数值标在原子上面，不仅不直观而且还难以辨认。一种解决办法是通过原子的颜色来表现这些属性的正负和大小。
<!--more-->

虽然使用VMD观看.pqr文件可以满足此着色要求，但是VMD的自由度较低，不仅**着色方案十分有限**，而且**不易以矢量格式保存**，有时对于一些**骨架复杂的分子**（如多硼酸根）还**难以同时展现各片段的性质**。使用Python处理.mol文件（V3000格式）绘制**分子骨架**并依据原子属性进行着色可以很好地弥补这一缺陷，效果如下图所示。下面对程序的实现进行介绍。

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Caffeine.svg" type="image/svg+xml" width="75%"></object>
</div>

## 实现

程序需要numpy和matplotlib用于计算与绘图：

```python
import numpy as np
import matplotlib.pyplot as plt
```

将分子的骨架视作图，于是可以利用原子坐标与键连关系（邻接矩阵）来描述。在常用的分子格式中，.mol文件在保存原子坐标的同时还保存了成键信息，适合用于绘制分子骨架。程序包括两个子函数`mol2graph()`和`graph2coords()`。第一个函数接受.mol文件路径作为参数，随后依次读取坐标信息和键连信息并分别返回存储这些信息的矩阵`coordinates`和`bond_matrix`。

```python
def mol2graph(mol_path):
    mol_file=open(mol_path)
    mol_data=mol_file.readlines()
    atoms_number=int(mol_data[5].split()[3])
    bonds_number=int(mol_data[5].split()[4])
    
    coordinates=[]
    bond_matrix=np.zeros([bonds_number,bonds_number])
    
    for i in range(atoms_number):
        coordinates.append(mol_data[i+7].split()[4:6])
        
    for i in range(bonds_number):
        bond_pair=mol_data[i+atoms_number+9].split()[4:6]
        bond_matrix[int(bond_pair[0])-1][int(bond_pair[1])-1]=1
        bond_matrix[int(bond_pair[1])-1][int(bond_pair[0])-1]=1
    
    coordinates=np.array(coordinates,dtype=np.float32)
    mol_file.close()
    
    return coordinates,bond_matrix
```

函数`graph2coords()`依据邻接矩阵在坐标中插入`numpy.nan`，方便直接使用`plt.plot()`绘图。

```python
def graph2coords(XYCoords,A):
    [i,j]=np.nonzero(A)
    p=np.argsort(np.maximum(i,j))
    i=i[p]
    j=j[p]
    
    X=np.array([XYCoords[i,0],XYCoords[j,0]])
    Y=np.array([XYCoords[i,1],XYCoords[j,1]])
    X=np.vstack((X,np.full((1,len(i)),np.nan)))
    Y=np.vstack((Y,np.full((1,len(i)),np.nan)))
    X=X.T.flatten()
    Y=Y.T.flatten()
    
    return X,Y
```

程序定义的绘图函数`drawmol2D()`接受4个参数：

- `mol_path`：包含分子结构信息的.mol文件的路径
- `colormap`：着色使用的colormap
- `array`：着色的依据，比如原子电荷
- `scale`：当设置为0时，绘图时使用统一的原子半径；当设置为非0值时依据`array`的值对原子半径进行放缩，半径等于`abs(scale*array)`

函数中首先调用前文的两个子函数得到用于绘图的两个向量`x,y`，随后利用`plt.plot()`函数绘制化学键。各原子则使用`plt.scatter()`函数依据`array`参数的值绘制为填充圆形，着色方案使用`colormap`参数。

```python
def drawmol2D(mol_path,colormap,array,scale):
    coordinates,bond_matrix=mol2graph(mol_path)
    x,y=graph2coords(coordinates,bond_matrix)
    fig,ax=plt.subplots()
    ax.set_aspect(1)
    ax.set_axis_off()
    
    if scale:
        size=abs(scale*array)
    else:
        size=1000
    
    ax.plot(x,y,color='k',linestyle='-',linewidth=8.0,zorder=1)
    plt.scatter(coordinates[:,0],coordinates[:,1],s=size,c=array,marker='o',cmap=colormap,linewidths=5.0,edgecolors='k',zorder=2)     
    
    cb=plt.colorbar(fraction=0.018,pad=0.1)
    cb.ax.tick_params(labelsize=16)
    ax.set_xlim((1.2*min(coordinates[:,0]),1.2*max(coordinates[:,0])))
    ax.set_ylim((1.2*min(coordinates[:,1]),1.2*max(coordinates[:,1])))
```

## 应用示例

### 鸟嘌呤与胞嘧啶的相互作用

下面的示例使用该程序依据Hirshfeld电荷绘制GC碱基对的着色分子骨架。

```python
def main():
    mol_path="GC.mol"
    chg_path="GC.txt"
    chg_file=open(chg_path)
    chg=chg_file.readlines()
    chg_file.close()
    chg=np.array([float(x) for x in chg])
    drawmol2D(mol_path,"coolwarm",chg,20000)

if __name__=='__main__':
    main()
```

效果如下所示。可以明显观察到两个羰基氧和杂环的氮原子带有相当多的负电荷，而橙色的氢原子带有明显的正电荷，与杂原子形成氢键。

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Guanine-Cytosine-chg.svg" type="image/svg+xml" width="75%"></object>
</div>

这两个分子之间的相互作用可以通过IGMH方法来考察，通过将delta-g划分为原子的贡献[^dg]并依此着色可以直观地表现出不同原子对相互作用贡献的大小，如下图所示。观察发现形成氢键的原子对分子间相互作用的贡献最大。

[^dg]:[使用Multiwfn做IGMH分析非常清晰直观地展现化学体系中的相互作用](http://sobereva.com/621)

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Guanine-Cytosine-dg.svg" type="image/svg+xml" width="75%"></object>
</div>

### 二苯甲酮的三重态

原子布居等原子属性也适合用此方法展示。比如二苯甲酮在三重态下存在单电子，下面的图片展示了Becke划分下各原子的贡献。可以观察到羰基的氧原子和碳原子贡献最大，也即单电子主要布居在羰基上。除此之外，苯环上羰基邻、对位的碳原子也有一定的贡献。

```python
def main():
    mol_path="BP.mol"
    chg_path="BP.txt"
    chg_file=open(chg_path)
    chg=chg_file.readlines()
    chg_file.close()
    chg=np.array([float(x) for x in chg])
    drawmol2D(mol_path,"viridis",chg,20000)

if __name__=='__main__':
    main()
```

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Benzophenone.svg" type="image/svg+xml" width="60%"></object>
</div>

### D-$\pi$-A结构分子的激发态特征

分子激发态的电子特征可以通过考察空穴-电子分布[^HE]来分析，下图示出了PXZ-TRZ分子[^PT]的单重态中每个原子对空穴-电子的贡献百分比。可以发现空穴主要分布在左侧给电子的PXZ基团上，而电子则主要分布在右侧吸电子的TRZ基团上。

[^HE]:[使用Multiwfn做空穴-电子分析全面考察电子激发特征](http://sobereva.com/434)
[^PT]:[Tanaka H, Shizu K, Miyazaki H, et al. Efficient green thermally activated delayed fluorescence (TADF) from a phenoxazine–triphenyltriazine (PXZ–TRZ) derivative\[J\]. Chemical Communications, 2012, 48(93): 11392-11394.](https://doi.org/10.1039/C2CC36237F)

<div align="center">
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/PXZ-TRZ-hole.svg" type="image/svg+xml" width="45%"></object>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/PXZ-TRZ-electron.svg" type="image/svg+xml" width="45%"></object>
</div>

PXZ-TRZ分子的激发态与基态的电子分布存在差异，使用IFCT方法可以分析激发过程中的电子转移[^IFCT]，显示分子中哪些片段增加或减少了电子。下图示出了激发过程中原子的电荷净转移量，正数代表给出电子，负数代表接受电子。由下图发现电荷转移特征与空穴-电子分布相吻合，PXZ基团在激发过程中给出电子，TRZ基团接受了电子。

[^IFCT]:[在Multiwfn中通过IFCT方法计算电子激发过程中任意片段间的电子转移量](http://sobereva.com/433)

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/PXZ-TRZ-CT.svg" type="image/svg+xml" width="75%"></object>
</div>

## 色彩图

Matplotlib有许多内置的颜色图，下面示出具有连续颜色的色彩图。

<div align=center>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/PUSc.svg" type="image/svg+xml" width="100%"></object>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Sc.svg" type="image/svg+xml" width="100%"></object>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/S2c.svg" type="image/svg+xml" width="100%"></object>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Dc.svg" type="image/svg+xml" width="100%"></object>
<object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/molecule skeleton/Cc.svg" type="image/svg+xml" width="100%"></object>
</div>