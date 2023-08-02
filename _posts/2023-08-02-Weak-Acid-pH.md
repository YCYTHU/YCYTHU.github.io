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

考虑无量纲量 $t=\frac{c}{\sqrt{K_\mathrm{w}}}$，代入式3得到：

$$\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}=\frac{t+\sqrt{t^2+4}}{2}\tag{4}$$

使用泰勒展开对式4进行近似，得到：

$$[\mathrm{H}^+]=\left\{\begin{align}&\frac{c}{2}+\sqrt{K_\mathrm{w}}&&c<\frac{\sqrt{K_\mathrm{w}}}{2}\\&\frac{3c}{4}+\frac{\sqrt{3K_\mathrm{w}}}{2}&&\frac{\sqrt{K_\mathrm{w}}}{2}<c<2\sqrt{K_\mathrm{w}}\\&c+\frac{K_\mathrm{w}}{c}&&c>2\sqrt{K_\mathrm{w}}\end{align}\right.\tag{5}$$

使用式5计算值与式3计算值的关系如图1所示：

<div align=center><object data="/assets/images/Weak Acid/Strong Acid.svg" type="image/svg+xml" width="75%"></object></div>
<div align=center><font color="#999999">图1：一元强酸pH近似公式</font></div>