---
title: 多稳态化学反应
tags: 
- Chemistry
- Zhihu
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Grafico_con_MATLAB_di_una_superficie.png/500px-Grafico_con_MATLAB_di_una_superficie.png
---
<!--more-->

<i class="fas fa-link"></i> [化学反应是否会存在多个平衡状态？](https://www.zhihu.com/question/580134256/answer/2879465170)

化学反应会存在不止一个稳态。假设某系统中存在 $\mathrm{S,X,Y,P}$ 四种物质，它们之间存在如下反应：

$$\begin{array}{rll}\mathrm{S+Y}&\stackrel{k_1}{\longrightarrow}&2\mathrm{X}\\~\\2\mathrm{X}&\stackrel{k_2}{\longrightarrow}&\mathrm{X+Y}\\~\\\mathrm{X+Y}&\stackrel{k_3}{\longrightarrow}&\mathrm{Y+P}\\~\\\mathrm{X}&\stackrel{k_4}{\longrightarrow}&\mathrm{P}\\\end{array}$$

假设该系统空间上是均匀的，底物 $\rm{S}$ 的浓度由外界控制保持定值，因此并入 $k_1$ ，则 $\rm{X,Y}$ 的浓度随时间的变化;

$$\begin{align}&\frac{d\rm{X}}{dt}=2k_1\rm{Y}-k_2\rm{X}^2-k_3\rm{XY}-k_4\rm{X}\\~\\&\frac{d\rm{Y}}{dt}=-k_1\rm{Y}+k_2\rm{X}^2 \end{align}$$

令 $\displaystyle{\frac{d\rm{X}}{dt}=\frac{d\rm{Y}}{dt}=0}$ ，可以解出该系统的稳态，$k_1k_2-4k_3k_4>0$ 时有三个稳态， 等于 $0$ 时有两个稳态，小于 $0$ 时仅有一个稳态（接下来的讨论假设其为正）：

$$\begin{align} &\rm{X_1}=\rm{Y_1}=0\\~\\ &\rm{X_2}=\frac{k_1-\sqrt{k_1^2-\frac{4k_1k_3k_4}{k_2}}}{2k_3},\quad\rm{Y_2}=\frac{k_2{\rm{X_2}}^2}{k_1}\\~\\ &\rm{X_3}=\frac{k_1+\sqrt{k_1^2-\frac{4k_1k_3k_4}{k_2}}}{2k_3},\quad\rm{Y_3}=\frac{k_2{\rm{X_3}}^2}{k_1} \end{align}$$

通过数学处理可知第一个、第三个稳态总是局部稳定的，而第二个是局部不稳定的。 

假设 $k_1=8,k_2=1,k_3=1,k_4=1.5$ ，则浓度的三个稳定点分别为 $(0,0),\ (2,0.5),\ (6,4.5)$ 。图1画出了一些不同的 $(\rm{X,Y})$ 起始浓度下系统状态的流线图。

<div align=center><img class="image image--xl" src="https://pic1.zhimg.com/v2-7817d2452ec009d3bbd60a088bfd6f81_r.jpg"/></div>
<div align=center><font color="#999999">图1：不同的 $\rm{X,Y}$ 起始浓度下系统状态的流线图（实心圆点代表起始状态，系统状态沿对应颜色线条变化，蓝色箭头指示向量方向，长度指示变化速率）</font></div>

如果改变初始浓度，系统可能达不到原来的平衡状态，而落入另一稳态。比如从蓝色起始点变为绿色/红色起始点，系统会落入不同的稳态。下面的动画更形象地展现了这一点。

<div align=center><video width="400" controls><source src="/assets/images/20230207.mp4" type="video/mp4"></source></video></div>