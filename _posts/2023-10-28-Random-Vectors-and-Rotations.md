---
title: 三维空间中的随机向量与随机旋转
tag: 
- Probability theory
- Algorithm
- Python
- Code
cover: /assets/images/particles in cube/particles in cube.jpg
aside:
  toc: true
---
<!--more-->
# 球坐标下的球面随机向量

只需要极角 $\theta\in[0,\pi)$ 与方位角 $\varphi\in[0,2\pi)$ 两个参数即可表示球面向量，如果 $\theta,\varphi$ 均在定义域内均匀分布，那么向量是否在球面上均匀分布。

```python
def rand_vec_angles_uniform():
    theta = np.pi * np.random.rand()
    phi = 2 * np.pi * np.random.rand()
    vec =  np.array([np.sin(theta) * np.cos(phi), np.sin(theta) * np.sin(phi), np.cos(theta)])
    return vec
```

使用 `rand_vec_angles_uniform()` 方法采样10000次并统计向量的分布，结果如图1。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_vec_angles_uniform_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_vec_angles_uniform_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图1：球面散点图（左）和向量 $xz$ 平面投影的分布（右）。</font></div>

可以发现向量集中于靠近 $z$ 轴的部分，这是因为单位球面上的面积微元 $\mathrm{d}A=\sin\theta\mathrm{d}\theta\mathrm{d}\varphi$，当 $\sin\theta$ 小的时候面积微元也小，故采样点更加密集。因此我们只需要让采样概率正比于面积微元即可得到均匀分布的球面向量。

$$p(\theta,\varphi)=\frac{1}{4\pi}\sin\theta$$

可以证明这要求 $\cos\theta\sim U(-1,1),\ \varphi\sim U(0,2\pi)$。改进后的代码如下。

```python
def rand_vec_angles_uniform_new():
    xi = np.random.rand() * 2 - 1
    theta = np.arccos(xi)
    phi = 2 * np.pi * np.random.rand()
    vec =  np.array([np.sin(theta) * np.cos(phi), np.sin(theta) * np.sin(phi), xi])
    return vec
```

# 直角坐标下的球面随机向量

## 分量均匀分布

如果向量 $\vec{R}$ 的三个分量 $X,Y,Z$ 均在 $[-1,1)$ 上均匀分布，那么 $\frac{\vec{R}}{\left\vert\vec{R}\right\vert}$ 是否在球面上均匀分布。

```python
def rand_vec_components_uniform():
    vec = np.random.rand(3) * 2 - 1
    vec /= np.linalg.norm(vec)
    return vec
```

使用 `rand_vec_components_uniform()` 生成10000个向量并统计其分布（图2）。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_vec_components_uniform_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_vec_components_uniform_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图2：使用分量均匀分布方法时向量的方位角 $\varphi$ 、极角 $\theta$ 的分布（左）和向量 $xy$ 平面投影的分布（右）。</font></div>

可以发现该方法生成的向量集中于立方体的八个顶点，而非在球面上均匀分布。这是因为在生成向量时立方体的八个顶点附近比球体有更多的空间，因此一种改进方法便是忽略这些“额外”的向量：

```python
def rand_vec_components_uniform_new():
    vec = np.random.rand(3) * 2 - 1
    length = np.linalg.norm(vec)
    while (length > 1):
        vec = np.random.rand(3) * 2 - 1
        length = np.linalg.norm(vec)
    vec /= length
    return vec
```

使用改进后的方法可以实现在球面上的均匀采样（图3），但是由于一部分采样被舍弃，因此采样效率只有 $\frac{\pi}{6}\approx52.4\%$（球体体积除以其外接立方体的体积），大约平均生成两次向量才能得到一个有效的向量。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_vec_components_uniform_new_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_vec_components_uniform_new_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图3：使用改进后的分量均匀分布方法时向量的方位角 $\varphi$ 、极角 $\theta$ 的分布（左）和向量 $xy$ 平面投影的分布（右）。</font></div>

## 分量正态分布

实际上，如果 $\vec{R}$ 的三个分量 $X,Y,Z$ 均满足标准正态分布，那么 $\frac{\vec{R}}{\left\vert\vec{R}\right\vert}$ 在球面上均匀分布。

```python
def rand_vec_components_normal():
    vec = np.random.normal(size=3)
    vec /= np.linalg.norm(vec)
    return vec
```
使用 `rand_vec_components_normal()` 方法采样10000次，统计其分布得到的结果如图4。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_vec_components_normal_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_vec_components_normal_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图4：使用分量正态分布方法时向量的方位角 $\varphi$ 、极角 $\theta$ 的分布（左）和向量 $xy$ 平面投影的分布（右）。</font></div>

# 向量的均匀随机旋转

固定向量经随机均匀旋转后应该以相同的概率指向任何方向，也即新向量在球面上均匀分布。

## 随机欧拉角

如果将向量依次绕 $z,y,x$ 三轴旋转随机的角度，得到的新向量不能在球面上均匀分布。

```python
def rand_rot_euler(old_vec):
    r = R.from_euler('zyx', np.random.rand(3)*2*np.pi)
    new_vec = r.apply(old_vec)
    return new_vec
```

使用 `rand_rot_euler()` 将一固定的随机向量随机旋转10000次并统计分布，结果如图5所示。可以发现新向量由于万向节锁定而集中于 $y$ 轴附近，因此该方法不能实现均匀随机旋转。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_rot_euler_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_rot_euler_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图5：随机欧拉旋转后新向量的方位角 $\varphi$ 、极角 $\theta$ 的分布（左）和新向量 $xy$ 平面投影的分布（右）。</font></div>

## 绕随机轴旋转随机角度

如果将向量绕一随机向量（球面均匀分布）旋转随机的角度，得到的新向量也不能在球面上均匀分布。

```python
def rand_rot_axis_angle(old_vec):
	axis = rand_vec_components_normal()
	angle = np.random.rand() * 2 * np.pi
    r = R.from_rotvec(angle * axis)
    new_vec = r.apply(old_vec)
    return new_vec
```
将 $x^+$ 方向的单位向量利用 `rand_rot_axis_angle()` 旋转10000次得到的结果如图6。当旋转轴与 $x$ 轴相近时无论旋转角度取值如何，新向量均不能远离旧向量，故结果中新向量集中于旧向量周围。因此该方法也不能实现均匀随机旋转。

<div style="display:flex; justify-content:space-evenly;">
    <object data="/assets/images/random vectors and rotations\rand_rot_axis_angle_1.svg" type="image/svg+xml" width="30%"></object>
    <object data="/assets/images/random vectors and rotations\rand_rot_axis_angle_2.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图6：绕随机轴旋转随机角度后新向量的方位角 $\varphi$ 、极角 $\theta$ 的分布（左）和新向量 $xy$ 平面投影的分布（右）。</font></div>

## 四元数

## Gram-Schmidt正交化