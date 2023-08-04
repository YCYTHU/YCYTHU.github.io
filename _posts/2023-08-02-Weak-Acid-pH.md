---
title: 快速近似计算酸溶液pH值及误差
tags: Chemistry
cover: /assets/images/molecule skeleton/cover.png
---
由于弱酸（弱碱）溶液中存在多种质子化形态，因此在计算弱酸溶液的pH值时常常面临一元高次方程的求解。即使求解一元弱酸时也要手搓三次方程，而对于多元酸的情况，手搓四次及以上方程几乎是不可能的，因此在允许的误差范围内引入适当的近似是十分必要的。
<!--more-->

本文从一元酸开始介绍可用于快速计算pH值的近似公式，并分析这些公式所引入的误差对最终结果的影响，随后将公式延伸到二元酸与多元酸。作为最简单的情况，先从**一元强酸**开始推导。

# 一元强酸

对于分析浓度为 $c$ 的一元强酸 $\mathrm{HA}$ 水溶液，先列出电荷平衡等式：

$$[\mathrm{H}^+]=[\mathrm{A}^-]+[\mathrm{OH}^-]\tag{1}$$

将水的自耦电离平衡代入：

$$[\mathrm{H}^+]=[\mathrm{A}^-]+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{2}$$

由于 $\mathrm{HA}$ 为强酸，故而 $[\mathrm{A}^-]=c$，利用一元二次方程求根公式得到：

$$[\mathrm{H}^+]=\frac{c+\sqrt{c^2+4K_\mathrm{w}}}{2}\tag{3}$$

虽然式3作为求解氢离子浓度的公式已经较为简便，但是作为后续推导其他近似式的“演练”，此处仍对式3进行一定的近似化简。考虑无量纲量 $t=\frac{c}{\sqrt{K_\mathrm{w}}}$，代入式3得到：

$$\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}=\frac{t+\sqrt{t^2+4}}{2}\tag{4}$$

使用泰勒展开对式4进行近似，得到：

$$[\mathrm{H}^+]=\left\{\begin{align}&\frac{c}{2}+\sqrt{K_\mathrm{w}}+\color{red}{\omicron(c^2)}&&c<\frac{\sqrt{K_\mathrm{w}}}{2}\\&\frac{3c}{4}+\frac{\sqrt{3K_\mathrm{w}}}{2}+\color{red}{\omicron(c^2)}&&\frac{\sqrt{K_\mathrm{w}}}{2}<c<2\sqrt{K_\mathrm{w}}\\&c+\frac{K_\mathrm{w}}{c}+\color{red}{\omicron(\frac{1}{c^2})}&&c>2\sqrt{K_\mathrm{w}}\end{align}\right.\tag{5}$$

其中红色部分示出误差的量级。式5计算值与式3计算值的关系如图1所示：

<div align=center><object data="/assets/images/weak acid/Strong Acid.svg" type="image/svg+xml" width="75%"></object></div>
<div align=center><font color="#999999">图1：一元强酸pH近似公式及误差</font></div>

式5定义的函数是一个分段函数，在实际应用中第一段与第三段使用频率最高。与传统近似公式（式6）不同，式5的这两段函数多保留了一项，因而适用范围更广一些，这在图2中得到体现。

$$[\mathrm{H}^+]=\left\{\begin{align}&\sqrt{K_\mathrm{w}}&&c<\frac{\sqrt{K_\mathrm{w}}}{1000}\\&c&&c>5\sqrt{K_\mathrm{w}}\end{align}\right.\tag{6}$$

<div align=center><object data="/assets/images/weak acid/Approx Strong Acid.svg" type="image/svg+xml" width="75%"></object></div>
<div align=center><font color="#999999">图2：两种近似公式误差的比较</font></div>

而且由式5发现，当酸溶液浓度很小时（$c<\frac{\sqrt{K_\mathrm{w}}}{2}$），氢离子浓度的增加速率只有酸浓度增加速率的 $\frac12$，也即从表象上看似乎只有一半的强酸发生了解离。

# 一元弱酸

在分析浓度为 $c$ 的一元弱酸溶液中，$[\mathrm{A}^-]=\frac{cK_a}{[\mathrm{H}^+]+K_a}$，将其代入式2，得到：

$$[\mathrm{H}^+]=\frac{cK_a}{[\mathrm{H}^+]+K_a}+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{7}$$

化简后得到关于氢离子浓度的三次方程：

$$[\mathrm{H}^+]^3+K_\mathrm{a}[\mathrm{H}^+]^2-(cK_\mathrm{a}+K_\mathrm{w})[\mathrm{H}^+]-K_\mathrm{a}K_\mathrm{w}=0\tag{8}$$

同样进行换元，令：

$$\begin{align}&h=\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}\\&t=\frac{c}{\sqrt{K_\mathrm{w}}}\\&p=\frac{K_\mathrm{a}}{\sqrt{K_\mathrm{w}}}\end{align}\tag{9}$$

均为无量纲量，代入式8得到：

$$h^3+ph^2-(tp+1)h-p=0\tag{10}$$

虽然式10存在解析解，但是这种近似方式并不适合推广到四次及更高次的方程上，因此此处不采用对解析解进行近似的方式推导近似公式。

## 情况一：$t\ll1,p\ll1$

该情况比如极稀的苯酚溶液。此时式10近似为：

$$h^3-h=0\tag{11}$$

该方程的正实数解是 $h=1$，又因为：

$$\begin{align}&\lim_{t\to0,p\to0}\left(\frac{\partial h}{\partial t}\right)=\lim_{t\to0,p\to0}\left(\frac{hp}{3h^2+2hp-tp-1}\right)=0\\&\lim_{t\to0,p\to0}\left(\frac{\partial h}{\partial p}\right)=\lim_{t\to0,p\to0}\left(\frac{th+1-h^2}{3h^2+2hp-tp-1}\right)=0\end{align}\tag{12}$$

因此此时氢离子浓度

$$[\mathrm{H}^+]=\sqrt{K_\mathrm{w}}+\omicron(c^2,K_\mathrm{a}^2)\tag{13}$$

## 情况二：$t\gg1,p\gg1$

该情况比如 $c=0.01\ \mathrm{M}$ 的甲酸溶液。此时式10的正实数解满足 $h>1$，这可以由函数 $f(h)=h^3+ph^2-(tp+1)h-p$ 的单调性判断。将式9代入到式7，得到：

$$h=\frac{tp}{h+p}+\frac{1}{h}\tag{14}$$

由于 $t,p$ 均远大于 $1$，因此 $\frac{tp}{h+p}\gg\frac{1}{h}$，忽略式14等号右侧第二项从而化简为二次方程，解得：

$$h=\frac{-p+\sqrt{p^2+4pt}}{2}\tag{15}$$