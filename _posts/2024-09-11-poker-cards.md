---
title: 扑克牌花色种类数
tags: 
- Probability theory
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/poker card suits.jpg
---

从扑克牌牌堆（不包含大小王）中随机抽取 $n$ 张扑克牌，这 $n$ 张扑克牌中花色的种类数满足何种分布，又如何随 $n$ 变化。
<!--more-->

## 无穷副扑克牌组成的牌堆

在无穷牌堆中，随机抽取一张扑克牌，其为指定花色的概率恒为 $\displaystyle{\frac14}$。

### 花色种类数为 $\mathbf{1}$ 的概率

1. **选择花色**  
	在 $4$ 种花色中选取 $1$ 种花色，共 $\displaystyle{\binom41}$ 种选择方法。
2. **每种花色的牌数**  
	一张牌为指定花色的概率为 $\displaystyle{\frac14}$，共 $n$ 张牌，因此每张牌均为指定花色的概率为 $\displaystyle{\left(\frac14\right)^n}$。
3. **总结果**  
	$$P(1)=\displaystyle\binom41\times\left(\displaystyle\frac14\right)^n=\left(\displaystyle\frac14\right)^{n-1}$$

### 花色种类数为 $\mathbf{2}$ 的概率（$\mathbf{n\geq2}$）

1. **选择花色**  
	在 $4$ 种花色中选取 $2$ 种花色，共 $\displaystyle{\binom42}$ 种选择方法。
2. **每种花色的牌数**  
	假设选择的两种花色为 $A$ 和 $B$，其中花色 $A$ 有 $k$ 张牌（$1\leq k\leq n-1$），则此概率为 $\displaystyle{\binom nk\left(\frac14\right)^k\left(\frac14\right)^{n-k}}$。
3. **总结果**  
	$${P(2)=\displaystyle\binom42\times\sum_{k=1}^{n-1}\displaystyle\binom nk\left(\displaystyle\frac14\right)^k\left(\displaystyle\frac14\right)^{n-k}=\displaystyle\frac{3\cdot(2^{n-1}-1)}{4^{n-1}}}\quad(\mathrm{Theorem\ 1})$$
	
	化简过程利用了[Theorem 1](#theorem-1)，证明过程见附录。

### 花色种类数为 $\mathbf{3}$ 的概率（$\mathbf{n\geq3}$）

1. **选择花色**  
	在 $4$ 种花色中选取 $3$ 种花色，共 $\displaystyle{\binom43}$ 种选择方法。
2. **每种花色的牌数**  
	假设选择的三种花色为 $A$、 $B$ 和 $C$，其中花色 $A$ 有 $x$ 张牌（$1\leq x\leq n-2$），花色 $B$ 有 $y$ 张牌（$1\leq y\leq n-x-1$），则此概率为 $\displaystyle{\binom nx\binom {n-x}y\left(\frac14\right)^x\left(\frac14\right)^y\left(\frac14\right)^{n-x-y}}$。
3. **总结果**  
	$$\begin{align}P(3)&=\binom43\times\sum_{x=1}^{n-2}\sum_{y=1}^{n-x-1}\binom nx\binom {n-x}y\left(\frac14\right)^x\left(\frac14\right)^y\left(\frac14\right)^{n-x-y}\\&=\left(\frac14\right)^{n-1}\times\sum_{x=1}^{n-2}\sum_{y=1}^{n-x-1}\binom nx\binom {n-x}y\\&=\left(\frac14\right)^{n-1}\times\sum_{x=1}^{n-2}\binom nx\left(2^{n-x}-2\right)\quad\quad(\mathrm{Theorem\ 1})\\&=\left(\frac14\right)^{n-1}\times\left[\sum_{x=1}^{n-2}2^{n-x}\binom nx-2\sum_{x=1}^{n-2}\binom nx\right]\\&=\left(\frac14\right)^{n-1}\times\left[\sum_{x=1}^{n-2}2^{n-x}\binom{n}{n-x}-2\left(2^n-2-n\right)\right]\\&=\left(\frac14\right)^{n-1}\times\left[\sum_{k=2}^{n-1}2^{k}\binom{n}{k}-2\left(2^n-2-n\right)\right]\quad\quad(k=n-x)\\&=\left(\frac14\right)^{n-1}\times\left[\left(3^n-1-2n-2^n\right)-2\left(2^n-2-n\right)\right]\quad\quad(\mathrm{Theorem\ 2})\\&=\frac{3\cdot(3^{n-1}-2^n+1)}{4^{n-1}}\end{align}$$
	
	化简过程利用了[Theorem 1](#theorem-1)与[Theorem 2](#theorem-2)，证明过程见附录。

### 花色种类数为 $\mathbf{4}$ 的概率（$\mathbf{n\geq4}$）

仿照前文的方法，得到 $n$ 张牌中花色种类数为 $4$ 的概率为：

$$\begin{align}P(4)&=\binom44\times\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}\sum_{z=1}^{n-x-y-1}\binom nx\binom{n-x}{y}\binom{n-x-y}{z}\left(\frac14\right)^x\left(\frac14\right)^y\left(\frac14\right)^z\left(\frac14\right)^{n-x-y-z}\\&=\left(\frac14\right)^n\times\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}\sum_{z=1}^{n-x-y-1}\binom nx\binom{n-x}{y}\binom{n-x-y}{z}\\&=\left(\frac14\right)^n\times\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}\binom nx\binom{n-x}{y}\left(2^{n-x-y}-2\right)\quad\quad(\mathrm{Theorem\ 1})\\&=\left(\frac14\right)^n\times\left[\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}2^{n-x-y}\binom nx\binom{n-x}{y}-2\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}\binom nx\binom{n-x}{y}\right]\\&=\left(\frac14\right)^n\times\left\{\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}2^{n-x-y}\binom nx\binom{n-x}{y}-2\left[\sum_{x=1}^{n-3}\binom nx\left(2^{n-x}-2-n+x\right)\right]\right\}\quad\quad(\mathrm{Theorem\ 1})\\&=\left(\frac14\right)^n\times\left\{\sum_{x=1}^{n-3}\sum_{y=1}^{n-x-2}2^{n-x-y}\binom nx\binom{n-x}{n-x-y}-2\left[\sum_{x=1}^{n-3}2^{n-x}\binom{n}{n-x}+\sum_{x=1}^{n-3}x\binom nx-(n+2)\left(2^n-2-n-\binom n2\right)\right]\right\}\quad\quad(\mathrm{Theorem\ 1})\\&=\left(\frac14\right)^n\times\left\{\sum_{x=1}^{n-3}\sum_{k=2}^{n-x-1}2^k\binom nx\binom{n-x}{k}-2\left[\sum_{j=3}^{n-1}2^{j}\binom{n}{j}+\sum_{x=1}^{n-3}x\binom nx-(n+2)\left(2^n-2-n-\binom n2\right)\right]\right\}\quad\quad(j=n-x, k=n-x-y)\\&=\left(\frac14\right)^n\times\left\{\sum_{x=1}^{n-3}\binom nx\left[3^{n-x}-1-2(n-x)-2^{n-x}\right]-2\left[\left(3^n-1-2n-4\binom n2-2^n\right)+\left(n2^{n-1}-n-n(n-1)-(n-2)\binom n2\right)-(n+2)\left(2^n-2-n-\binom n2\right)\right]\right\}\quad\quad(\mathrm{Theorem\ 2,\ 3})\\&=\left(\frac14\right)^n\times\left\{\sum_{x=1}^{n-3}3^{n-x}\binom{n}{n-x}-(2n+1)\left(2^n-2-n-\binom n2\right)+2\sum_{x=1}^{n-3}x\binom nx-\sum_{x=1}^{n-3}2^{n-x}\binom{n}{n-x}-[2\cdot3^n+4n+6-2^n(n+6)]\right\}\quad\quad(\mathrm{Theorem\ 1})\\&=\left(\frac14\right)^n\times\left\{\sum_{j=3}^{n-1}3^{j}\binom{n}{j}-(2n+1)\left(2^n-2-n-\binom n2\right)+2\sum_{x=1}^{n-3}x\binom nx-\sum_{j=3}^{n-1}2^{j}\binom{n}{j}-[2\cdot3^n+4n+6-2^n(n+6)]\right\}\\&=\left(\frac14\right)^n\times\left\{\left[4^n-1-3n-9\binom n2-3^n\right]-(2n+1)\left(2^n-2-n-\binom n2\right)+2\left[n2^{n-1}-n-n(n-1)-(n-2)\binom n2\right]-\left[3^n-1-2n-4\binom n2-2^n\right]-[2\cdot3^n+4n+6-2^n(n+6)]\right\}\quad\quad(\mathrm{Theorem\ 2,\ 3})\\&=\left(\frac14\right)^n\times\left[4^n-4\cdot3^n-4+6\cdot2^n\right]\\&=\frac{4^{n-1}-3^n-1+3\cdot2^{n-1}}{4^{n-1}}\end{align}$$

化简过程利用了[Theorem 1](#theorem-1)、[Theorem 2](#theorem-2)与[Theorem 3](#theorem-3)，证明过程见附录。验证 $P(1)+P(2)+P(3)+P(4)\equiv1$，计算正确。

### 汇总

<table style="display: table;text-align: center;">
	<tbody>
		<tr>
			<td>$n$</td><td>$1$</td><td>$2$</td><td>$3$</td><td>$n\geq4$</td>
		</tr>
		<tr>
			<td>$P(1)$</td><td>$1$</td><td>$\displaystyle\frac14$</td><td>$\displaystyle\frac{1}{16}$</td><td>$\displaystyle\left(\frac14\right)^{n-1}$</td>
		</tr>
		<tr>
			<td>$P(2)$</td><td>$0$</td><td>$\displaystyle\frac34$</td><td>$\displaystyle\frac{9}{16}$</td><td>$\displaystyle\frac{3\cdot(2^{n-1}-1)}{4^{n-1}}$</td>
		</tr>
		<tr>
			<td>$P(3)$</td><td>$0$</td><td>$0$</td><td>$\displaystyle\frac{6}{16}$</td><td>$\displaystyle\frac{3\cdot(3^{n-1}-2^n+1)}{4^{n-1}}$</td>
		</tr>
		<tr>
			<td>$P(4)$</td><td>$0$</td><td>$0$</td><td>$0$</td><td>$\displaystyle\frac{4^{n-1}-3^n-1+3\cdot2^{n-1}}{4^{n-1}}$</td>
		</tr>
	</tbody>
</table>
<p style="text-align: center;"><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/poker card/poker card infinite.svg" width="400"/></p>

## 一副扑克牌的牌堆

在一副扑克牌中，每种花色都只有 $13$ 张牌，牌堆中一共52张牌。从牌堆中随机抽取 $n$ 张牌，一共有 $\displaystyle\binom{52}{n}$ 情况（$1\leq n\leq52$）。

### 花色种类数为 $\mathbf{1}$ 的概率（$\mathbf{n\leq13}$）

1. **选择花色**  
	在 $4$ 种花色中选取 $1$ 种花色，共 $\displaystyle{\binom41}$ 种选择方法。
2. **每种花色的牌数**  
	全部 $n$ 张扑克牌都来自相同的花色，共 $\displaystyle\binom{13}{n}$ 种选择方法。
3. **总结果**  
	$$P(1)=\frac{\displaystyle\binom41\binom{13}{n}}{\displaystyle\binom{52}{n}}$$

### 花色种类数为 $\mathbf{2}$ 的概率（$\mathbf{2\leq n\leq26}$）

1. **选择花色**  
	在 $4$ 种花色中选取 $2$ 种花色，共 $\displaystyle{\binom42}$ 种选择方法。
2. **每种花色的牌数**  
	假设其中一种花色具有 $k$ 张牌，此时 $k$ 的取值范围为 $\max(1,n-13)\leq k\leq\min(n-1,13)$，则另一种花色具有 $n-k$ 张牌。共 $\displaystyle\binom{13}{k}\binom{13}{n-k}$ 种选择方法。
3. **总结果**  
	$$P(2)=\frac{\displaystyle\binom42\sum_{k=\max(1,n-13)}^{\min(n-1,13)}\binom{13}{k}\binom{13}{n-k}}{\displaystyle\binom{52}{n}}=\begin{cases}\frac{\displaystyle\binom42\left[\binom{26}{n}-2\binom{13}{n}\right]}{\displaystyle\binom{52}{n}}&2\leq n\leq13\\~\\\frac{\displaystyle\binom42\binom{26}{n}}{\displaystyle\binom{52}{n}}&14\leq n\leq26\end{cases}\quad\quad(\mathrm{Theorem\ 4})$$
	
	化简过程利用了[Theorem 4](#theorem-4)，证明过程见附录。

### 花色种类数为 $\mathbf{3}$ 的概率（$\mathbf{3\leq n\leq39}$）

仿照前文方法，可以得到花色种类数为 $3$ 的概率为：

$$P(3)=\frac{\displaystyle\binom43\sum_{x+y+z=n}\binom{13}{x}\binom{13}{y}\binom{13}{z}}{\displaystyle\binom{52}{n}}=\begin{cases}\frac{\displaystyle\binom43\left[\binom{39}{n}-3\binom{26}{n}+3\binom{13}{n}\right]}{\displaystyle\binom{52}{n}}&3\leq n\leq13\\~\\\frac{\displaystyle\binom43\left[\binom{39}{n}-3\binom{26}{n}\right]}{\displaystyle\binom{52}{n}}&14\leq n\leq26\\~\\\frac{\displaystyle\binom43\binom{39}{n}}{\displaystyle\binom{52}{n}}&27\leq n\leq39\end{cases}$$

### 花色种类数为 $\mathbf{4}$ 的概率（$\mathbf{4\leq n\leq52}$）

由于 $P(1)+P(2)+P(3)+P(4)\equiv1$，因此得到：

$$P(4)=\begin{cases}\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}+6\binom{26}{n}-4\binom{13}{n}}{\displaystyle\binom{52}{n}}&4\leq n\leq13\\~\\\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}+6\binom{26}{n}}{\displaystyle\binom{52}{n}}&14\leq n\leq26\\~\\\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}}{\displaystyle\binom{52}{n}}&27\leq n\leq39\\~\\1&40\leq n\leq52\end{cases}$$

### 汇总

<table style="display: table;text-align: center;">
	<tbody>
		<tr>
			<td>$n$</td><td>$1$</td><td>$2$</td><td>$3$</td><td>$4\leq n\leq13$</td><td>$14\leq n\leq26$</td><td>$27\leq n\leq39$</td><td>$40\leq n\leq52$</td>
		</tr>
		<tr>
			<td>$P(1)$</td><td>$1$</td><td>$\displaystyle\frac{4}{17}$</td><td>$\displaystyle\frac{22}{425}$</td><td>$\frac{\displaystyle4\binom{13}{n}}{\displaystyle\binom{52}{n}}$</td><td>$0$</td><td>$0$</td><td>$0$</td>
		</tr>
		<tr>
			<td>$P(2)$</td><td>$0$</td><td>$\displaystyle\frac{13}{17}$</td><td>$\displaystyle\frac{234}{425}$</td><td>$\frac{\displaystyle6\binom{26}{n}-12\binom{13}{n}}{\displaystyle\binom{52}{n}}$</td><td>$\frac{\displaystyle6\binom{26}{n}}{\displaystyle\binom{52}{n}}$</td><td>$0$</td><td>$0$</td>
		</tr>
		<tr>
			<td>$P(3)$</td><td>$0$</td><td>$0$</td><td>$\displaystyle\frac{169}{425}$</td><td>$\frac{\displaystyle4\binom{39}{n}-12\binom{26}{n}+12\binom{13}{n}}{\displaystyle\binom{52}{n}}$</td><td>$\frac{\displaystyle4\binom{39}{n}-12\binom{26}{n}}{\displaystyle\binom{52}{n}}$</td><td>$\frac{\displaystyle4\binom{39}{n}}{\displaystyle\binom{52}{n}}$</td><td>$0$</td>
		</tr>
		<tr>
			<td>$P(4)$</td><td>$0$</td><td>$0$</td><td>$0$</td><td>$\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}+6\binom{26}{n}-4\binom{13}{n}}{\displaystyle\binom{52}{n}}$</td><td>$\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}+6\binom{26}{n}}{\displaystyle\binom{52}{n}}$</td><td>$\frac{\displaystyle\binom{52}{n}-4\binom{39}{n}}{\displaystyle\binom{52}{n}}$</td><td>$1$</td>
		</tr>
	</tbody>
</table>
<p style="text-align: center;"><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/poker card/poker card single.svg" width="400"/></p>

## 两种摸牌方式的对比

下图展示了两种摸牌方式花色种类数的期望随 $n$ 的变化，可以发现从一副牌组成的牌堆中摸牌的花色期望数始终大于由无穷副扑克牌组成的牌堆。这是因为从一副牌组成的牌堆中摸牌时摸一张牌以后再摸到相同花色的牌的概率会降低。

<p style="text-align: center;"><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/poker card/poker card expected value.svg" width="400"/></p>

## Appendix

### Theorem 1

$$\color{red}{\sum_{k=0}^n\binom nk=2^n}$$

证明过程略。

### Theorem 2

$$\color{red}{\sum_{k=0}^np^k\binom nk=(p+1)^n}$$

证明：

$$\sum_{k=0}^np^k\binom nk=\sum_{k=0}^n\binom nk\cdot p^k\cdot1^{n-k}=(p+1)^n$$

### Theorem 3

$$\color{red}{\sum_{k=1}^nk\binom nk=n2^{n-1}}$$

证明：

$$\begin{align}\sum_{k=1}^nk\binom nk&=\sum_{k=1}^n\frac{k\cdot n!}{k!(n-k)!}\\&=\sum_{k=1}^n\frac{n\cdot(n-1)!}{(k-1)!(n-k)!}\\&=n\sum_{k=1}^n\binom{n-1}{k-1}\\&=n2^{n-1}\end{align}$$

### Theorem 4

$$\color{red}{\sum_{k=0}^r\binom mk\binom{n}{r-k}=\binom{m+n}{r}}$$

证明过程可参考[维基百科](https://en.wikipedia.org/wiki/Vandermonde%27s_identity)。