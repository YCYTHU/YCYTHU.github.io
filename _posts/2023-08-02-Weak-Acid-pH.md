<!-----
title: 快速近似计算溶液pH值及误差
tags: Chemistry
cover: /assets/images/weak acid/cover.jpg
aside:
  toc: true
----->
由于弱酸（弱碱）溶液中存在多种质子化形态，因此在计算弱酸溶液的pH值时常常面临一元高次方程的求解。即使求解一元弱酸时也要手搓三次方程，而对于多元酸的情况，在不使用计算器时手搓四次及以上方程几乎是不可能的，因此在允许的误差范围内引入适当的近似简化计算是十分必要的。
<!--more-->

下面的表格总结了不同情况下适用的近似公式及其误差，这些公式的推导过程见下文。

<style>
	#conclusion {
		display: table;
	}
	#conclusion td {
		text-align: center;
		border:none;
	}
	#conclusion td.gray {
		color: #BBB;
	}
</style>
<div  align="center">
	<table id="conclusion">
		<thead style="border-bottom: 1px solid #555;">
			<tr>
				<td>种类</td>
				<td>近似式</td>
				<td>适用条件</td>
				<td>最大误差</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td rowspan="2" style="border-bottom: 1px solid #999;">$\mathrm{HA(Strong)}$</td>
				<td>$\sqrt{K_\mathrm{w}}+\frac{c}{2}$</td>
				<td>$c<\frac{\sqrt{K_\mathrm{w}}}{2}$</td>
				<td>$<9$</td>
			</tr>
			<tr style="border-bottom: 1px solid #999;">
				<td>$c+\frac{\sqrt{K_\mathrm{w}}}{c}$</td>
				<td>$c>2\sqrt{K_\mathrm{w}}$</td>
				<td>$<9$</td>
			</tr>
			<tr>
				<td rowspan="7" style="border-bottom: 1px solid #999;">$\mathrm{HA(Weak)}$</td>
				<td>$\sqrt{cK_\mathrm{a}+K_\mathrm{w}}$</td>
				<td>$K_\mathrm{a}\ll\sqrt{K_\mathrm{w}}$</td>
				<td>$<9$</td>
			</tr>
			<tr>
				<td class="gray">$\sqrt{K_\mathrm{w}}+\frac{cK_\mathrm{a}}{2\sqrt{K_\mathrm{w}}}$</td>
				<td class="gray">$K_\mathrm{a}\ll\sqrt{K_\mathrm{w}}\ \&\ cK_\mathrm{a}\ll K_\mathrm{w}$</td>
				<td class="gray">$<9$</td>
			</tr>
			<tr>
				<td class="gray">$\sqrt{cK_\mathrm{a}}$</td>
				<td class="gray">$K_\mathrm{a}\ll\sqrt{K_\mathrm{w}}\ \&\ cK_\mathrm{a}\gg K_\mathrm{w}$</td>
				<td class="gray">$<9$</td>
			</tr>
			<tr>
				<td>$\frac{-K_\mathrm{a}+\sqrt{K_\mathrm{a}^2+4cK_\mathrm{a}}}{2}$</td>
				<td>$K_\mathrm{a}\gg\sqrt{K_\mathrm{w}}\ \&\ c\gg\sqrt{K_\mathrm{w}}$</td>
				<td>$<9$</td>
			</tr>
			<tr>
				<td class="gray">$\sqrt{cK_\mathrm{a}}-\frac{K_\mathrm{a}}{2}$</td>
				<td class="gray">$c\gg K_\mathrm{a}\gg\sqrt{K_\mathrm{w}}$</td>
				<td class="gray">$<9$</td>
			</tr>
			<tr>
				<td class="gray">$c$</td>
				<td class="gray">$K_\mathrm{a}\gg c\gg \sqrt{K_\mathrm{w}}$</td>
				<td class="gray">$<9$</td>
			</tr>
			<tr style="border-bottom: 1px solid #999;">
				<td>$\sqrt{K_\mathrm{w}}+\frac{c}{2}$</td>
				<td>$K_\mathrm{a}\gg\sqrt{K_\mathrm{w}}\ \&\ c\ll\sqrt{K_\mathrm{w}}$</td>
				<td>$<9$</td>
			</tr>
		</tbody>
	</table>
</div>

接下来从一元酸开始介绍可用于快速计算pH值的近似公式，并分析这些公式所引入的误差对最终结果的影响，随后将公式延伸到二元酸与多元酸。作为最简单的情况，先从**一元强酸**开始推导。

# 一元强酸

对于分析浓度为 $c$ 的一元强酸 $\mathrm{HA}$ 水溶液，先列出电荷平衡等式：

$$[\mathrm{H}^+]=[\mathrm{A}^-]+[\mathrm{OH}^-]\tag{1}$$

将水的自耦电离平衡代入：

$$[\mathrm{H}^+]=[\mathrm{A}^-]+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{2}\label{Stronge}$$

由于 $\mathrm{HA}$ 为强酸，故而 $[\mathrm{A}^-]=c$，利用一元二次方程求根公式得到：

$$[\mathrm{H}^+]=\frac{c+\sqrt{c^2+4K_\mathrm{w}}}{2}\tag{3}\label{StrongH}$$

虽然式 $\eqref{StrongH}$ 作为求解氢离子浓度的公式已经较为简便，但是作为后续推导其他近似式的“演练”，此处仍对式 $\eqref{StrongH}$ 进行一定的近似化简。考虑无量纲量 $t=\frac{c}{\sqrt{K_\mathrm{w}}}$，代入式 $\eqref{StrongH}$ 得到：

$$\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}=\frac{t+\sqrt{t^2+4}}{2}\tag{4}\label{Strongt}$$

使用泰勒展开对式 $\eqref{Strongt}$ 进行近似，得到：

$$[\mathrm{H}^+]=\begin{cases}\frac{c}{2}+\sqrt{K_\mathrm{w}}+\color{red}{\omicron(c^2)}&c<\frac{\sqrt{K_\mathrm{w}}}{2}\\\frac{3c}{4}+\frac{\sqrt{3K_\mathrm{w}}}{2}+\color{red}{\omicron(c^2)}&\frac{\sqrt{K_\mathrm{w}}}{2}<c<2\sqrt{K_\mathrm{w}}\\c+\frac{K_\mathrm{w}}{c}+\color{red}{\omicron(\frac{1}{c^2})}&c>2\sqrt{K_\mathrm{w}}\end{cases}\tag{5}\label{Strong}$$

其中红色部分示出误差的量级。式 $\eqref{Strong}$ 计算值与式 $\eqref{StrongH}$ 计算值的关系如图1所示：

<div align=center><object data="/assets/images/weak acid/Strong Acid.svg" type="image/svg+xml" width="75%"></object></div>
<div align=center><font color="#999999">图1：一元强酸pH近似公式及误差</font></div>

式 $\eqref{Strong}$ 定义的函数是一个分段函数，在实际应用中第一段与第三段使用频率最高。与传统近似公式（式 $\eqref{StrongTra}$ ）不同，式 $\eqref{Strong}$ 的这两段函数多保留了一项，因而适用范围更广一些，这在图2中得到体现。

$$[\mathrm{H}^+]=\begin{cases}\sqrt{K_\mathrm{w}}&c<\frac{\sqrt{K_\mathrm{w}}}{1000}\\c&c>5\sqrt{K_\mathrm{w}}\end{cases}\tag{6}\label{StrongTra}$$

<div align=center><object data="/assets/images/weak acid/Approx Strong Acid.svg" type="image/svg+xml" width="75%"></object></div>
<div align=center><font color="#999999">图2：两种近似公式误差的比较</font></div>

而且由式 $\eqref{Strong}$ 发现，当酸溶液浓度很小时（$c<\frac{\sqrt{K_\mathrm{w}}}{2}$），氢离子浓度的增加速率只有酸浓度增加速率的 $\frac12$，也即从表象上看似乎只有一半的强酸发生了解离。这在后文一元弱酸的讨论中会再次出现。

# 一元弱酸

在分析浓度为 $c$ 的一元弱酸溶液中，$[\mathrm{A}^-]=\frac{cK_a}{[\mathrm{H}^+]+K_a}$，将其代入式 $\eqref{Stronge}$，得到：

$$[\mathrm{H}^+]=\frac{cK_a}{[\mathrm{H}^+]+K_a}+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{7}\label{Weake}$$

化简后得到关于氢离子浓度的三次方程：

$$[\mathrm{H}^+]^3+K_\mathrm{a}[\mathrm{H}^+]^2-(cK_\mathrm{a}+K_\mathrm{w})[\mathrm{H}^+]-K_\mathrm{a}K_\mathrm{w}=0\tag{8}\label{WeakH}$$

同样进行换元，令：

$$\begin{align}&h=\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}\\&t=\frac{c}{\sqrt{K_\mathrm{w}}}\\&p=\frac{K_\mathrm{a}}{\sqrt{K_\mathrm{w}}}\end{align}\tag{9}\label{Weakt}$$

均为无量纲量，代入式 $\eqref{WeakH}$ 得到：

$$h^3+ph^2-(tp+1)h-p=0\tag{10}\label{Weak3}$$

虽然式 $\eqref{Weak3}$ 存在解析解，但是这种近似方式并不适合推广到四次及更高次的方程上，因此此处不采用对解析解进行近似的方式推导近似公式。不过通过物理意义可以确定式 $\eqref{Weak3}$ 的正整数解满足 $h>1$，这在接下来的讨论中会用到。

## 情况一：$p\ll1$

该情况比如苯酚溶液。此时式 $\eqref{Weak3}$ 近似为：

$$h^3-(tp+1)h=0\tag{11}\label{Weak31}$$

式 $\eqref{Weak31}$ 的正实数解为 $h=\sqrt{tp+1}$，因此氢离子浓度：

$$[\mathrm{H}^+]=\sqrt{cK_\mathrm{a}+K_\mathrm{w}}\tag{12}\label{Weak31s}$$

特别地，对于两种特殊情况，式 $\eqref{Weak31s}$ 还可以进一步化简。

### 情况1a：$tp\ll1$

当 $tp\to0$ 时，$\sqrt{tp+1}\sim\frac{tp}{2}+1$，因此当 $cK_\mathrm{a}\ll K_\mathrm{w}$ 时氢离子浓度简化为：

$$[\mathrm{H}^+]=\sqrt{K_\mathrm{w}}+\frac{cK_\mathrm{a}}{2\sqrt{K_\mathrm{w}}}\tag{13}$$

### 情况1b：$tp\gg1$

当 $tp\to+\infty$ 时，$\sqrt{tp+1}\sim\sqrt{tp}$，因此当 $cK_\mathrm{a}\gg K_\mathrm{w}$ 时氢离子浓度简化为：

$$[\mathrm{H}^+]=\sqrt{cK_\mathrm{a}}\tag{14}\label{Weak31bs}$$

## 情况二：$p\gg1,t\gg1$

该情况比如 $c=0.01\ \mathrm{M}$ 的甲酸溶液。将式 $\eqref{Weakt}$ 代入到式 $\eqref{Weake}$ ，得到：

$$h=\frac{tp}{h+p}+\frac{1}{h}\tag{15}$$

由于 $t,p\gg1$ 且 $h>1$，因此 $\frac{tp}{h+p}\gg\frac{1}{h}$，忽略式 $\eqref{Weak31bs}$ 等号右侧第二项从而化简为二次方程，解得：

$$h=\frac{-p+\sqrt{p^2+4pt}}{2}\tag{16}$$

特别地，对于两种特殊情况，式 $\eqref{Weak31s}$ 还可以进一步化简。

### 情况2a：$t\gg p\gg1$

当 $t\gg p$ 时，$\frac{-p+\sqrt{p^2+4pt}}{2}\sim\sqrt{tp}-\frac{p}{2}$，因此当 $c\gg K_\mathrm{a}$ 时氢离子浓度简化为：

$$[\mathrm{H}^+]=\sqrt{cK_\mathrm{a}}-\frac{K_\mathrm{a}}{2}\tag{17}$$

### 情况2b：$1\ll t\ll p$

当 $t\ll p$ 时，$\frac{-p+\sqrt{p^2+4pt}}{2}\sim t$，因此当 $c\ll K_\mathrm{a}$ 时氢离子浓度简化为：

$$[\mathrm{H}^+]=c\tag{18}$$

## 情况三：$p\gg1,t\ll1$

此情况比如 $c=10^{-10}\ \mathrm{M}$ 的甲酸溶液。由化学直觉知式 $\eqref{Weak3}$ 的解 $h\approx1$（极稀的酸酸溶液pH值约为7）。又由于：

$$\begin{align}&\left.\left(\frac{\partial h}{\partial t}\right)\right|_{t\to0,p\to\infty,h\approx1}=\left.\left(\frac{hp}{3h^2+2hp-tp-1}\right)\right|_{t\to0,p\to\infty,h\approx1}\simeq\frac{1}{2}\\&\left.\left(\frac{\partial h}{\partial p}\right)\right|_{t\to0,p\to\infty,h\approx1}=\left.\left(\frac{th+1-h^2}{3h^2+2hp-tp-1}\right)\right|_{t\to0,p\to\infty,h\approx1}\simeq0\end{align}\tag{19}$$

因此氢离子浓度

$$h=1+\frac{t}{2}\tag{20}$$

$$[\mathrm{H}^+]=\sqrt{K_\mathrm{w}}+\frac{c}{2}\tag{21}\label{Weak3s}$$

# 二元弱酸

二元弱酸 $\mathrm{H_2A}$ 溶液的电荷平衡式：

$$[\mathrm{H}^+]=[\mathrm{HA}^-]+2[\mathrm{A}^{2-}]+[\mathrm{OH}^-]\tag{22}$$

代入分布系数表达式：

$$[\mathrm{H}^+]=\frac{c(K_\mathrm{a_1}[\mathrm{H}^+]+2K_\mathrm{a_1}K_\mathrm{a_2})}{[\mathrm{H}^+]^2+K_\mathrm{a_1}[\mathrm{H}^+]+K_\mathrm{a_1}K_\mathrm{a_2}}+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{23}\label{biWeake}$$

同样定义无量纲量：

$$\begin{align}&h=\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}\\&t=\frac{c}{\sqrt{K_\mathrm{w}}}\\&p_1=\frac{K_\mathrm{a_1}}{\sqrt{K_\mathrm{w}}}\\&p_2=\frac{K_\mathrm{a_2}}{\sqrt{K_\mathrm{w}}}\end{align}\tag{24}\label{biWeakt}$$

式 $\eqref{biWeakt}$ 代入式 $\eqref{biWeake}$ 并化简，得：

$$h^4+p_1h^3+(p_1p_2-tp_1-1)h^2-(2tp_1p_2+p_1)h-p_1p_2=0\tag{25}\label{biWeak4}$$

式 $\eqref{biWeak4}$ 涉及变量较多，分类讨论较复杂，此处只讨论一些特殊情况。

## 情况一：$p_2\ll1$

此时 $\mathrm{HA}^-$ 几乎不发生电离，方程 $\eqref{biWeak4}$ 退化成三次方程 $\eqref{Weak3}$ ，可按一元弱酸情况讨论。

## 情况二：$p_2\gg1,t\ll1$

此时式 $\eqref{biWeak4}$ 中包含 $t$ 的系数可以忽略：

$$h^4+p_1h^3+(p_1p_2-1)h^2-p_1h-p_1p_2=0\tag{26}\label{biWeak2s}$$

方程 $\eqref{biWeak2s}$ 的解为 $h=1$，又因为：

$$\begin{align}&\left.\left(\frac{\partial h}{\partial t}\right)\right|_{t\to0,p_1,p_2\to\infty,h\to1}=\left.\left[\frac{p_1h^2+2p_1p_2h}{4h^3+3p_1h^2+2(p_1p_2-tp_1-1)h-(2tp_1p_2+p_1)}\right]\right|_{t\to0,p_1,p_2\to\infty,h\to1}=\frac{1}{2}\\&\left.\left(\frac{\partial h}{\partial p_1}\right)\right|_{t\to0,p_1,p_2\to\infty,h\to1}=\left.\left[\frac{-h^3+(t-p_2)h^2+p_2}{4h^3+3p_1h^2+2(p_1p_2-tp_1-1)h-(2tp_1p_2+p_1)}\right]\right|_{t\to0,p_1,p_2\to\infty,h\to1}=0\\&\left.\left(\frac{\partial h}{\partial p_1}\right)\right|_{t\to0,p_1,p_2\to\infty,h\to1}=\left.\left[\frac{-p_1h^2+2tp_1h+p_1}{4h^3+3p_1h^2+2(p_1p_2-tp_1-1)h-(2tp_1p_2+p_1)}\right]\right|_{t\to0,p_1,p_2\to\infty,h\to1}=0\end{align}\tag{27}$$

因此氢离子浓度与式 $\eqref{Weak3s}$ 相同：

$$[\mathrm{H}^+]=\sqrt{K_\mathrm{w}}+\frac{c}{2}\tag{28}$$

<!--# 缓冲溶液

此处只考虑一元弱酸 $\mathrm{HA}$ 与其盐 $\mathrm{MA}$ 形成的缓冲溶液，二者浓度分别为 $c_\mathrm{a},c_\mathrm{b}$，弱酸电离常数 $K_\mathrm{a}$。仍然列出电荷平衡等式：

$$[\mathrm{H}^+]+[\mathrm{M}^+]=[\mathrm{A}^-]+[\mathrm{OH}^-]\tag{29}$$

将分布系数与浓度等关系代入得到：

$$[\mathrm{H}^+]+c_\mathrm{b}=\frac{K_\mathrm{a}(c_\mathrm{a}+c_\mathrm{b})}{[\mathrm{H}^+]+K_\mathrm{a}}+\frac{K_\mathrm{w}}{[\mathrm{H}^+]}\tag{30}$$

化简并换元得到：

$$h^3+(p+t_b)h^2-(t_ap+1)h-p=0\tag{31}$$

其中

$$\begin{align}&h=\frac{[\mathrm{H}^+]}{\sqrt{K_\mathrm{w}}}\\&t_a=\frac{c_\mathrm{a}}{\sqrt{K_\mathrm{w}}}\\&t_b=\frac{c_\mathrm{b}}{\sqrt{K_\mathrm{w}}}\\&p=\frac{K_\mathrm{a}}{\sqrt{K_\mathrm{w}}}\end{align}\tag{32}$$-->

