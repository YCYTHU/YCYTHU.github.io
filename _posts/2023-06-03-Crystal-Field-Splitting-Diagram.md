---
title: 利用MATLAB计算晶体场d轨道分裂能
tags: 
- Chemistry
- Code
- MATLAB
cover: https://upload.wikimedia.org/wikipedia/commons/6/66/Square_planar.png
modify_date: 2023-07-28
---
笔者在[往期文章](/2022/02/12/Crystal-Field-Splitting-Energy.html)中介绍了八面体与四面体场d轨道分裂能的计算方法。借助于MATLAB，笔者开发了一款简易的MATLAB App，实现常见与不常见对称性的晶体场的分裂能的计算。[源代码及依赖文件在此处下载。](https://cdn.jsdelivr.net/gh/ycythu/assets@main/CFSD.zip)
<!--more-->

程序运行后的界面如图1所示。左上角的微调器可以选择配体的数量（不小于1），中间的两列表格显示配体在球坐标系下的方位角。通过编辑表格中的数值可以改变配体的位置，同时可在程序最右侧的3D查看器中查看当前的构型。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/CFSD/Figure1.png" alt="图1：程序初始界面"></div>
<div align=center><font color="#999999">图1：程序初始界面</font></div>

通过左侧中间的下拉菜单可以选择预设好的配位形式（图2），包括平面正三角、正四面体、正八面体等。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/CFSD/Figure2.png" alt="图2：通过下拉菜单选择预设几何构型"></div>
<div align=center><font color="#999999">图2：通过下拉菜单选择预设几何构型</font></div>

当构型设置完成后，点击菜单右侧 **Calculate!** 按钮进行分裂能的计算，随后界面左下角的四列表格显示的是能量信息，第一列是以Dq为单位的能量近似值，第二到第四列是能量的解析解的系数（图3）。

表格右侧的绘图区会显示当前构型的分裂能级图（相同的能量只绘制一条线），MATLAB命令行中会打印构型信息与能量信息。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/CFSD/Figure3.png" alt="图3：点击 Calculate! 按钮后得到正四面体构型的能级分裂"></div>
<div align=center><font color="#999999">图3：点击 <b>Calculate!</b> 按钮后得到正四面体构型的能级分裂</font></div>

在3D查看器的左侧有5个选项，勾选后会显示轨道等值面（图4），轨道序号与左下角表格顺序相对应。

<div align=center><img width="60%" src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/CFSD/Figure4.png" alt="图4：勾选Orbital 5后显示 $d_{z^2}$ 轨道等值面"></div>
<div align=center><font color="#999999">图4：勾选Orbital 5后显示 $d_{z^2}$ 轨道等值面</font></div>

---

App中关键函数的源代码及解析如下

```matlab
function Calc(~,~)

    CN_Data=Rot_CN(CN_Data);
    Phi=transpose(CN_Data(:,1));
    Theta=transpose(CN_Data(:,2));

    b=[12;1];
    c=[6;1];
```

函数`Calc`首先将坐标轴与配合物的惯性主轴对齐，随后获取配体位置（过程省略）。`Phi`与`Theta`分别表示每个配体在球坐标系中的方位角与仰角（弧度制）。向量`b`和`c`的第一个值代表了将 $\alpha_2,\alpha_4$ 转换为 $\mathrm{Dq}$ 的系数；第二个值为任取的值，用于确定 $\alpha_2,\alpha_4$ 前的系数（$\alpha_0$ 前的系数等于配体的个数）。

随后定义配体位置函数并构建哈密顿矩阵，其含义见[往期介绍](/2022/02/12/Crystal-Field-Splitting-Energy.html)。

```matlab
D_00_m=zeros(2,size(CN_Data,1));
D_20_m=b*(3*cos(Theta).^2-1);
D_40_m=c*((35*cos(Theta).^4)/3-10*cos(Theta).^2+1);
D_21_m=b*sin(Theta).*cos(Theta).*cos(Phi);
D_22_m=b*sin(Theta).*cos(2*Phi);
D_41_m=c*sin(Theta).*cos(Theta).*((7*cos(Theta).^2)/3-1).*cos(Phi);
D_42_m=c*sin(Theta).^2.*(7*cos(Theta).^2-1).*cos(2*Phi);
D_43_m=c*sin(Theta).^3.*cos(Theta).*cos(3*Phi);
D_44_m=c*sin(Theta).^4.*cos(4*Phi);
G_21_m=b*sin(Theta).*cos(Theta).*sin(2*Phi);
G_22_m=b*sin(Theta).^2.*sin(2*Phi);
G_41_m=c*sin(Theta).*cos(Theta).*((7*cos(Theta).^2)/3-1).*sin(Phi);
G_42_m=c*sin(Theta).^2.*(7*cos(Theta).^2-1).*sin(2*Phi);
G_43_m=c*sin(Theta).^3.*cos(Theta).*sin(3*Phi);
G_44_m=c*sin(Theta).^4.*sin(4*Phi);

D_00=sum(D_00_m,2);
D_20=sum(D_20_m,2);
D_40=sum(D_40_m,2);
D_21=sum(D_21_m,2);
D_22=sum(D_22_m,2);
D_41=sum(D_41_m,2);
D_42=sum(D_42_m,2);
D_43=sum(D_43_m,2);
D_44=sum(D_44_m,2);
G_21=sum(G_21_m,2);
G_22=sum(G_22_m,2);
G_41=sum(G_41_m,2);
G_42=sum(G_42_m,2);
G_43=sum(G_43_m,2);
G_44=sum(G_44_m,2);

H_11=D_00-D_20/7+D_40/56+5*D_44/24;
H_12=3*D_21/7-5*D_41/28+5*D_43/12;
H_13=-(sqrt(sym(3))/7)*D_22+(5*sqrt(sym(3))/84)*D_42;
H_14=-3*G_21/7+5*G_41/28+5*G_43/12;
H_15=5*G_44/24;
H_22=D_00+D_20/14-D_40/14+3*D_22/14+5*D_42/42;
H_23=(sqrt(sym(3))/7)*D_21+(5*sqrt(sym(3))/14)*D_41;
H_24=3*G_22/14+5*G_42/42;
H_25=3*G_21/7-5*G_41/28+5*G_43/12;
H_33=D_00+D_20/7+3*D_40/28;
H_34=(sqrt(sym(3))/7)*G_21+(5*sqrt(sym(3))/14)*G_41;
H_35=-(sqrt(sym(3))/7)*G_22+(5*sqrt(sym(3))/84)*G_42;
H_44=D_00+D_20/14-D_40/14-3*D_22/14-5*D_42/42;
H_45=3*D_21/7-5*D_41/28-5*D_43/12;
H_55=D_00-D_20/7+D_40/56-5*D_44/24;

Hamilton=cat(3,[H_11(1) H_12(1) H_13(1) H_14(1) H_15(1);
            H_12(1) H_22(1) H_23(1) H_24(1) H_25(1);
            H_13(1) H_23(1) H_33(1) H_34(1) H_35(1);
            H_14(1) H_24(1) H_34(1) H_44(1) H_45(1);
            H_15(1) H_25(1) H_35(1) H_45(1) H_55(1)], ...
            [H_11(2) H_12(2) H_13(2) H_14(2) H_15(2);
            H_12(2) H_22(2) H_23(2) H_24(2) H_25(2);
            H_13(2) H_23(2) H_33(2) H_34(2) H_35(2);
            H_14(2) H_24(2) H_34(2) H_44(2) H_45(2);
            H_15(2) H_25(2) H_35(2) H_45(2) H_55(2)]);
```

与之前的介绍不同的是，为了确定 $\alpha_2,\alpha_4$ 前的系数，配体位置函数均定义为向量，哈密顿矩阵新增一个维度，为 $5\times5\times2$ 的矩阵。

随后将哈密顿矩阵进行对角化，得到能量与轨道贡献。利用向量`b`和`c`组成的矩阵的逆计算`Coefficient`，为 $5\times2$ 矩阵，表示每个能量的 $\alpha_2,\alpha_4$ 前的系数。

$$\begin{bmatrix}\frac16&-\frac16\\-1&2\end{bmatrix}=\begin{bmatrix}12&1\\6&1\end{bmatrix}^{-1}$$

```matlab
[Orbital,Energy_redun1]=eig(double(Hamilton(:,:,1)));
Orbital=Orbital./sqrt(sum(Orbital.^2));
Energy_redun1=diag(Energy_redun1);
[~,Energy_redun2]=eig(double(Hamilton(:,:,2)));
Energy_redun2=diag(Energy_redun2);
Energy_redun=double([Energy_redun1,Energy_redun2]);
Coefficient=real(Energy_redun)*[1/6 -1/6;-1 2];
Coefficient(abs(Coefficient)<1e-15)=0;
Energy=strtrim(rats(real(Energy_redun(:,1))));
```

最后将结果传递给其他函数，打印结果并结束。

```matlab
alpha0=num2str(size(CN_Data,1)*ones(5,1));
alpha2=strtrim(rats(Coefficient(:,1)));
alpha4=strtrim(rats(Coefficient(:,2)));
Results=table(Energy,alpha0,alpha2,alpha4);
set(Result_table,'Data',Results);

yline(Result_Axes,real(Energy_redun(:,1)),LineWidth=2,Color='r');
ylim(Result_Axes,[1.2*min(real(Energy_redun(:,1))),1.2*max(real(Energy_redun(:,1)))]);

disp(CN_Table);
disp(Results);
```