---
title: Kabsch算法——衡量两个结构间的几何偏差
tags:
- Algorithm
- Code
- Python
- MATLAB
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Singular-Value-Decomposition.svg/531px-Singular-Value-Decomposition.svg.png
---

Kabsch算法以Wolfgang Kabsch的名字命名，是一种计算最佳旋转矩阵的方法，该矩阵可以最小化两组点之间的RMSD。   
<!--more-->
[^Kabsch]

[^Kabsch]:[Kabsch, W. A solution for the best rotation to relate two sets of vectors. *Acta Crystallographica Section A: Crystal Physics, Diffraction, Theoretical and General Crystallography* 32.5 (1976): 922-923.](https://doi.org/10.1107/S0567739476001873) 

假设 $\mathbf P$ 和 $\mathbf Q$ 为两组点的坐标（N×3矩阵），首先平移两组坐标，使它们的质心与坐标系的原点重合。    
然后计算协方差矩阵 $\mathbf H$ :

$$\mathbf H =\mathbf P^T\mathbf Q$$

随后对 $\mathbf H$ 进行奇异值分解：

$$\mathbf H=\mathbf {U\Sigma V}^T$$

接着判断是否需要旋转矩阵以确保符合右手坐标系：

$$d={\rm sgn}\left(\det\left(\mathbf{VU}^T\right)\right)$$

则最佳旋转矩阵 $\mathbf R$ 为

$$\mathbf R=\mathbf V \begin{pmatrix}1&0&0\\0&1&0\\0&0&d\end{pmatrix}\mathbf U^T$$

---

Python实现：

```python
import numpy as np

def lrms(P, Q):
    
    N = P.shape[0];
    
    P_center = np.dot(np.ones((1,N)), P) / N;
    Q_center = np.dot(np.ones((1,N)), Q) / N;
    
    P = P - np.dot(np.ones((N,1)), P_center);
    Q = Q - np.dot(np.ones((N,1)), Q_center);
    
    H = np.dot(np.transpose(P), Q)

    U, S, V = np.linalg.svd(H)
    d = (np.linalg.det(U) * np.linalg.det(V))

    if d < 0.0:
        U[:, -1] = -U[:, -1]

    R = np.dot(U, V);
    T = Q_center - np.dot(P_center, R);
    diff = np.dot(P, R) - Q;
    lrms = np.sqrt((diff * diff).sum() / N)
    
    return lrms, R, T
```

MATLAB实现：

```matlab
function [lrms, R, T] = LRMS(P, Q)

    N = size(P,1);

    P_center = ones(1,N) * P / N;
    Q_center = ones(1,N) * Q / N;

    P = P - ones(N,1) * P_center;
    Q = Q - ones(N,1) * Q_center;

    H = transpose(P) * Q;
    [U, ~, V] = svd(H);
    V = transpose(V);

    if det(U * V) < 0
        U(:,end)=-U(:,end);
    end

    R = U * V;
    T = Q_center - P_center * R;
    Diff = P * R - Q;
    lrms = sqrt(sum(sum(Diff.*Diff))/N);

end
```