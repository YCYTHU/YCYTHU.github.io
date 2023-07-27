---
title: 使用Python绘制分子着色图展示物理量的原子贡献
tags: 
- Chemistry
- Python
cover: 
---
在图像中展现原子电荷分布或原子对某物理量的贡献时如果直接将数值标在原子上面，不仅不直观而且还难以辨认。一种解决办法是通过原子的颜色来表现这些属性的正负和大小。
<!--more-->

虽然使用VMD观看.pqr文件可以满足此着色要求，但是VMD的自由度较低，不仅着色方案**十分有限**，而且不易以**矢量格式**保存二维的分子骨架示意图。使用Python处理.mol文件并依据原子属性进行着色可以很好地弥补这一缺陷，效果如下图所示。下面对程序的实现进行介绍。

<object data="/assets/images/molecule skeleton/Caffeine.svg" type="image/svg+xml"></object>

程序需要numpy和matplotlib用于计算与绘图：

```python
import numpy as np
import matplotlib.pyplot as plt
```

将分子的骨架视作图，于是可以利用原子坐标与键连关系（邻接矩阵）来描述。在常用的分子格式中，.mol文件在保存原子坐标的同时还保存了成键信息，适合用于绘制分子骨架。程序首先读取.mol文件并将其转化为节点坐标与邻接矩阵。

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

随后依据邻接矩阵在坐标矩阵（N×2）中插入NaN，方便直接使用plt.plot()直接绘图。

```python
def graph2coords(A,XYCoords):
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