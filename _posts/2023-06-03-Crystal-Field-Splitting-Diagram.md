---
title: 利用matlab计算晶体场d轨道分裂能
tags: 
- Chemistry
- matlab
cover: https://upload.wikimedia.org/wikipedia/commons/6/66/Square_planar.png
---
在[往期文章](/2022/02/12/zhihu.html)中介绍了八面体与四面体场d轨道分裂能的计算方法。借助于matlab，可以容易的计算常见与不常见对称性的晶体场的分裂能。
<!--more-->

```matlab
function Energy_rats=crystal_field_splitting_diagram(theta,phi)
```

函数`crystal_field_splitting_diagram`接受两个 $1\times N$ 向量，分别表示每个配体在球坐标系中的方位角与仰角（弧度制）；返回一个 $5\times1$ 向量，表示每个 $d$ 轨道能量与平均值的差（以 $\mathrm{Dq}$ 为单位）。

```matlab
syms alpha0 alpha2 alpha4;
b=[12;1];
c=[6;1];
```

首先定义的三个变量`alpha0 alpha2 alpha4`用于函数末尾的输出部分，不参与计算过程。每条 $d$ 的能量可以表示为

$$E=c_0*\alpha_0+c_2*\alpha_2+c_4*\alpha_4$$

其中 $\alpha_4=6\mathrm{Dq},\alpha_2\approx12\mathrm{Dq}$。向量`b`和`c`的第一个值代表了将 $\alpha_2,\alpha_4$ 转换为 $\mathrm{Dq}$ 的系数；第二个值为任取的值，用于确定 $c_2$ 和 $c_4$ 的值（$c_0$ 的值等于配体的个数）。

```matlab
if(size(theta,2)==size(phi,2))
    num=size(theta,2);
else
    error('Wrong size');
end
```

首先判断接受的向量是否合法，方位角与仰角的大小应当相同。配体的个数`num`定义为输入向量第二个维度的大小。

随后定义配体位置函数与哈密顿矩阵，其含义见[往期介绍](/2022/02/12/zhihu.html)。

```matlab
D_00_m=zeros(2,num);
D_20_m=b*(3*cos(theta).^2-1);
D_40_m=c*((35*cos(theta).^4)/3-10*cos(theta).^2+1);
D_21_m=b*sin(theta).*cos(theta).*cos(phi);
D_22_m=b*sin(theta).*cos(2*phi);
D_41_m=c*sin(theta).*cos(theta).*((7*cos(theta).^2)/3-1).*cos(phi);
D_42_m=c*sin(theta).^2.*(7*cos(theta).^2-1).*cos(2*phi);
D_43_m=c*sin(theta).^3.*cos(theta).*cos(3*phi);
D_44_m=c*sin(theta).^4.*cos(4*phi);
G_21_m=b*sin(theta).*cos(theta).*sin(2*phi);
G_22_m=b*sin(theta).^2.*sin(2*phi);
G_41_m=c*sin(theta).*cos(theta).*((7*cos(theta).^2)/3-1).*sin(phi);
G_42_m=c*sin(theta).^2.*(7*cos(theta).^2-1).*sin(2*phi);
G_43_m=c*sin(theta).^3.*cos(theta).*sin(3*phi);
G_44_m=c*sin(theta).^4.*sin(4*phi);

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

Hamilton=cat(3, ...
            [H_11(1) H_12(1) H_13(1) H_14(1) H_15(1);
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

与之前的介绍不同的是，为了得到 $c_2$ 和 $c_4$ 的值，配体位置函数均定义为向量，哈密顿矩阵新增一个维度，为 $5\times5\times2$ 的矩阵。随后将哈密顿矩阵进行对角化，得到能量：

```matlab
Energy_redun=[eig(Hamilton(:,:,1)) eig(Hamilton(:,:,2))];
```

`Energy_redun`的第一列为以 $\mathrm{Dq}$ 为单位的分裂能，第二列的数值用于确定 $c_2$ 和 $c_4$ 的值：

```matlab
Coefficient=str2num(rats(Energy_redun*[1/6 -1/6;-1 2]));
Coefficient=[num*ones(5,1),Coefficient];
```

得到的`Coefficient`为 $5\times3$ 矩阵，表示每条 $d$ 轨道能量的 $c_0,c_2$ 和 $c_4$。计算`Coefficient`所使用的矩阵是向量`b`和`c`组成的矩阵的逆。

$$\begin{bmatrix}\frac16&-\frac16\\-1&2\end{bmatrix}=\begin{bmatrix}12&1\\6&1\end{bmatrix}^{-1}$$

```matlab
Energy_rats=rats(Energy_redun(:,1));
```

随后可选地将分裂能进行有理化，得到 $5\times1$ 向量`Energy_rats`。最后输出相关结果，结束函数。

```matlab
disp(['Splitting Energy=',rats(max(double(Energy_redun(:,1)))-min(double(Energy_redun(:,1)))),'Dq']);
disp(Energy_rats);
disp(' ');
disp('Symbolic Energy=');
disp({'α0','α2','α4'});
disp(Coefficient);
disp(latex(Coefficient*[alpha0;alpha2;alpha4]));

end
```