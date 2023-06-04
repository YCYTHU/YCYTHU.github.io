---
title: 多项式系数的确定
permalink: /jottings/polynomial-coeffcients.html
---
<!--more-->

假设存在一个关于 $x$ 的**正整系数多项式** $p(x)$

$$p(x)=\sum_{i=0}^na_ix^i\quad(a_i\in\mathbb{N}^+)$$

项数 $n$ 与每一项的系数 $a_n$ 均未知。最少需要几个 $x_i$ 与对应的 $p(x_i)$ 便可以确定项数与每一项的系数？

- 第一步，令 $x_1=1$ 得到 $p(x_1)$
- 第二步，任取 $x_2\in\mathbb{N}^+$ 且 $x_2>p(x_1)$，得到 $p(x_2)$
- 第三步，将 $p(x_2)$ 转换成 $x_2$ 进制下的表示，每一位上的数值对应多项式每一项的系数

因此只需要**两个** $[x_i,p(x_i)]$ 对便可确定 $p(x)$ 的项数与每一项的系数。之所以要求 $x_2>p(x_1)$ 是了保证 $x_2>a_i\quad(i\in\{0,1,2,\dots,n\})$。