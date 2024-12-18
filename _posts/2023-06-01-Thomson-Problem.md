---
title: Thomson问题
tags: 
- Physics
- Chemistry
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/thomson.png
---

Thomson问题的目标是确定 $N$ 个被约束在单位球表面的电子（点电荷）的最低静电能构型（基于库仑定律）。该问题在化学中的一个应用为[VSEPR理论](https://en.wikipedia.org/wiki/VSEPR_theory)中几何构型的确定。
<!--more-->

$N$ 个电子的坐标分别为 $\vec{r}_i\ (i\in\{1,2,\dots,N\})$，则一对电子之间的静电相互作用能：

$$U_{ij}=\frac{e^2}{4\pi\varepsilon\vert\vec{r}_i-\vec{r}_j\vert}$$

不失一般性地，将 $U_{ij}$ 表示为：

$$U_{ij}=\frac{1}{\vert\vec{r}_i-\vec{r}_j\vert}$$

则全部 $N$ 个电子之间的静电相互作用能：

$$U(N)=\sum_{i<j}\frac{1}{\vert\vec{r}_i-\vec{r}_j\vert}$$

当 $N$ 分别为 $2,3,4,5,6,12$ 时，立体构型分别为对映点、赤道正三角形、正四面体、三角双锥、正八面体与正二十面体。对于其他的 $N$，下表示出了数值解以及体系的对称性，$\vert\sum\vec{r}_i\vert$ 给出了电子位置的向量和，在大部分情况下为 $0$。表格的5~14列包括：

- $v_i$ 是给定边数相交的顶点数
- $e$ 是总边数
- $f_3$ 是三角形面的数量
- $f_4$ 是四边形面的数量
- $\theta_1$ 是最近的电荷对所对应的矢量对的角度

<style>
	#Thomson {
		font-family: Times New Roman, serif;
		font-size: 16px;
		width: 100%;
		display: block;
	}
	#Thomson tbody tr td {
		text-align: center;
	}
</style>

<table id="Thomson">
	<tbody><tr>
		<th><i>N</i>
		</th>
		<th><span><span style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle U_{\textrm {Thom}}}">
			<semantics>
				<mrow>
					<mstyle displaystyle="true" scriptlevel="0">
						<msub>
							<mi>U</mi>
							<mrow >
								<mrow>
									<mtext>Thom</mtext>
								</mrow>
							</mrow>
						</msub>
					</mstyle>
				</mrow>
				<annotation encoding="application/x-tex">{\displaystyle U_{\textrm {Thom}}}</annotation>
			</semantics>
		</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6ba776b9de039391c99a4572d3fc6bb0cc539b9c" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:6.111ex; height:2.509ex;" alt="{\displaystyle U_{\textrm {Thom}}}"></span>
	</th>
	<th>Symmetry</th>
	<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle \left|\sum \mathbf {r} _{i}\right|}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mrow>
						<mo>|</mo>
						<mrow>
							<mo>&#x2211;<!-- ∑ --></mo>
							<msub>
								<mrow>
									<mi mathvariant="bold">r</mi>
								</mrow>
								<mrow>
									<mi>i</mi>
								</mrow>
							</msub>
						</mrow>
						<mo>|</mo>
					</mrow>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle \left|\sum \mathbf {r} _{i}\right|}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3ce4d54738cc0017ba576a8b9e4bf78dc3c30039" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -1.338ex; width:6.938ex; height:3.843ex;" alt="{\displaystyle \left|\sum \mathbf {r} _{i}\right|}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{3}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>3</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{3}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3237279dde958af2bae661ab58048bda1a9fcdac" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="v_{3}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{4}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>4</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{4}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ea4e90b48e691308463d3bbb96548ebda813128f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="v_4"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{5}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>5</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{5}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/359f3c59699e2c4f195988d76a8051d06f7cd7b8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="v_{5}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{6}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>6</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{6}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/46e08689ccb0303b08dd388e7a1d1bc9b996a46e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="{\displaystyle v_{6}}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{7}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>7</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{7}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/2e6ca31ebea2fc901076809c0648a661802111eb" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="{\displaystyle v_{7}}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle v_{8}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>v</mi>
					<mrow>
						<mn>8</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle v_{8}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/f8c0c8cf7e93fecefdff8f583c7751bf0219fa6b" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.182ex; height:2.009ex;" alt="{\displaystyle v_{8}}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle e}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<mi>e</mi>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle e}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/cd253103f0876afc68ebead27a5aa9867d927467" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.083ex; height:1.676ex;" alt="e"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle f_{3}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>f</mi>
					<mrow>
						<mn>3</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle f_{3}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/8e542b30556f75f837f72ea05a3940ddf38937d3" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.193ex; height:2.509ex;" alt="f_{3}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle f_{4}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>f</mi>
					<mrow>
						<mn>4</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle f_{4}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/294f14bcf91a6ff040c4c22b71720764d800fc26" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.193ex; height:2.509ex;" alt="f_{4}"></span>
</th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle \theta _{1}}">
	<semantics>
		<mrow>
			<mstyle displaystyle="true" scriptlevel="0">
				<msub>
					<mi>&#x03B8;<!-- θ --></mi>
					<mrow>
						<mn>1</mn>
					</mrow>
				</msub>
			</mstyle>
		</mrow>
		<annotation encoding="application/x-tex">{\displaystyle \theta _{1}}</annotation>
	</semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7f84b9443d095623e02fd287cd095123d70b0278" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.145ex; height:2.509ex;" alt="\theta _{1}"></span>
</th>
</tr>
<tr>
	<td align="right">2
	</td>
	<td align="right">0.500000000
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{\infty h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mi mathvariant="normal">&#x221E;<!-- ∞ --></mi>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{\infty h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/215df5462bb3f5f3a9e29e4f6fc4bacfea8c6262" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:4.746ex; height:2.509ex;" alt="D_{{\infty h}}"></span>
</td>
<td align="center">0
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="right">2
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="right">180.000°
</td>
</tr>
<tr>
	<td align="right">3
	</td>
	<td align="right">1.732050808
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="center">–
</td>
<td align="right">3
</td>
<td align="right">2
</td>
<td align="center">–
</td>
<td align="right">120.000°
</td>
</tr>
<tr>
	<td align="right">4
	</td>
	<td align="right">3.674234614
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/70cadcc969636b990957852f205868f9f7178840" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.45ex; height:2.509ex;" alt="T_{d}"></span>
</td>
<td align="center">0
</td>
<td align="right">4
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">6
</td>
<td align="right">4
</td>
<td align="right">0
</td>
<td align="right">109.471°
</td>
</tr>
<tr>
	<td align="right">5
	</td>
	<td align="right">6.474691495
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">2
</td>
<td align="right">3
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">9
</td>
<td align="right">6
</td>
<td align="right">0
</td>
<td align="right">90.000°
</td>
</tr>
<tr>
	<td align="right">6
	</td>
	<td align="right">9.985281374
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle O_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>O</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle O_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/59a50c5a9ebe5f52234d08987a9f327fdb813590" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.952ex; height:2.509ex;" alt="{\displaystyle O_{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">6
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">90.000°
</td>
</tr>
<tr>
	<td align="right">7
	</td>
	<td align="right">14.452977414
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/27bfb9d6c00cf305f47ca25cfdf4b420628d623e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{5h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">5
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">15
</td>
<td align="right">10
</td>
<td align="right">0
</td>
<td align="right">72.000°
</td>
</tr>
<tr>
	<td align="right">8
	</td>
	<td align="right">19.675287861
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{4d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>4</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{4d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/51905bd99f7b0b0e1c8586208022654960b2e688" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{4d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">16
</td>
<td align="right">8
</td>
<td align="right">2
</td>
<td align="right">71.694°
</td>
</tr>
<tr>
	<td align="right">9
	</td>
	<td align="right">25.759986531
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">3
</td>
<td align="right">6
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">21
</td>
<td align="right">14
</td>
<td align="right">0
</td>
<td align="right">69.190°
</td>
</tr>
<tr>
	<td align="right">10
	</td>
	<td align="right">32.716949460
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{4d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>4</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{4d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/51905bd99f7b0b0e1c8586208022654960b2e688" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{4d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">2
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">16
</td>
<td align="right">0
</td>
<td align="right">64.996°
</td>
</tr>
<tr>
	<td align="right">11
	</td>
	<td align="right">40.596450510
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.013219635
</td>
<td align="right">0
</td>
<td align="right">2
</td>
<td align="right">8
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">27
</td>
<td align="right">18
</td>
<td align="right">0
</td>
<td align="right">58.540°
</td>
</tr>
<tr>
	<td align="right">12
	</td>
	<td align="right">49.165253058
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>I</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d4c84ca7860f66cd4ed8ecb07b4c5691f73c7365" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.202ex; height:2.509ex;" alt="I_h"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">30
</td>
<td align="right">20
</td>
<td align="right">0
</td>
<td align="right">63.435°
</td>
</tr>
<tr>
	<td align="right">13
	</td>
	<td align="right">58.853230612
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.008820367
</td>
<td align="right">0
</td>
<td align="right">1
</td>
<td align="right">10
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">33
</td>
<td align="right">22
</td>
<td align="right">0
</td>
<td align="right">52.317°
</td></tr>
<tr>
	<td align="right">14
	</td>
	<td align="right">69.306363297
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{6d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>6</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{6d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/38f7668dfc9fab198ff202cb0dfe365086a72c1e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{6d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">36
</td>
<td align="right">24
</td>
<td align="right">0
</td>
<td align="right">52.866°
</td>
</tr>
<tr>
	<td align="right">15
	</td>
	<td align="right">80.670244114
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">3
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">39
</td>
<td align="right">26
</td>
<td align="right">0
</td>
<td align="right">49.225°
</td></tr>
<tr>
	<td align="right">16
	</td>
	<td align="right">92.911655302
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">4
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">42
</td>
<td align="right">28
</td>
<td align="right">0
</td>
<td align="right">48.936°
</td></tr>
<tr>
	<td align="right">17
	</td>
	<td align="right">106.050404829
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/27bfb9d6c00cf305f47ca25cfdf4b420628d623e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{5h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">5
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">45
</td>
<td align="right">30
</td>
<td align="right">0
</td>
<td align="right">50.108°
</td>
</tr>
<tr>
	<td align="right">18
	</td>
	<td align="right">120.084467447
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{4d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>4</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{4d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/51905bd99f7b0b0e1c8586208022654960b2e688" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{4d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">2
</td>
<td align="right">8
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">48
</td>
<td align="right">32
</td>
<td align="right">0
</td>
<td align="right">47.534°
</td></tr>
<tr>
	<td align="right">19
	</td>
	<td align="right">135.089467557
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.000135163
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">5
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">50
</td>
<td align="right">32
</td>
<td align="right">1
</td>
<td align="right">44.910°
</td></tr>
<tr>
	<td align="right">20
	</td>
	<td align="right">150.881568334
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">54
</td>
<td align="right">36
</td>
<td align="right">0
</td>
<td align="right">46.093°
</td></tr>
<tr>
	<td align="right">21
	</td>
	<td align="right">167.641622399
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.001406124
</td>
<td align="right">0
</td>
<td align="right">1
</td>
<td align="right">10
</td>
<td align="right">10
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">57
</td>
<td align="right">38
</td>
<td align="right">0
</td>
<td align="right">44.321°
</td></tr>
<tr>
	<td align="right">22
	</td>
	<td align="right">185.287536149
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/70cadcc969636b990957852f205868f9f7178840" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.45ex; height:2.509ex;" alt="T_{d}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">10
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">60
</td>
<td align="right">40
</td>
<td align="right">0
</td>
<td align="right">43.302°
</td></tr>
<tr>
	<td align="right">23
	</td>
	<td align="right">203.930190663
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">11
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">63
</td>
<td align="right">42
</td>
<td align="right">0
</td>
<td align="right">41.481°
</td></tr>
<tr>
	<td align="right">24
	</td>
	<td align="right">223.347074052
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle O}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>O</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle O}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/9d70e1d0d87e2ef1092ea1ffe2923d9933ff18fc" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.773ex; height:2.176ex;" alt="O"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">60
</td>
<td align="right">32
</td>
<td align="right">6
</td>
<td align="right">42.065°
</td>
</tr>
<tr>
	<td align="right">25
	</td>
	<td align="right">243.812760299
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{s}"></span>
</td>
<td align="center">0.001021305
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">11
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">68
</td>
<td align="right">44
</td>
<td align="right">1
</td>
<td align="right">39.610°
</td></tr>
<tr>
	<td align="right">26
	</td>
	<td align="right">265.133326317
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{2}"></span>
</td>
<td align="center">0.001919065
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">14
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">72
</td>
<td align="right">48
</td>
<td align="right">0
</td>
<td align="right">38.842°
</td></tr>
<tr>
	<td align="right">27
	</td>
	<td align="right">287.302615033
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/27bfb9d6c00cf305f47ca25cfdf4b420628d623e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{5h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">15
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">75
</td>
<td align="right">50
</td>
<td align="right">0
</td>
<td align="right">39.940°
</td></tr>
<tr>
	<td align="right">28
	</td>
	<td align="right">310.491542358
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">16
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">78
</td>
<td align="right">52
</td>
<td align="right">0
</td>
<td align="right">37.824°
</td></tr>
<tr>
	<td align="right">29
	</td>
	<td align="right">334.634439920
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">17
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">81
</td>
<td align="right">54
</td>
<td align="right">0
</td>
<td align="right">36.391°
</td></tr>
<tr>
	<td align="right">30
	</td>
	<td align="right">359.603945904
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{2}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">18
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">84
</td>
<td align="right">56
</td>
<td align="right">0
</td>
<td align="right">36.942°
</td></tr>
<tr>
	<td align="right">31
	</td>
	<td align="right">385.530838063
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ba273a2d71fc53580ce7d217d47212ae37424d77" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{3v}}"></span>
</td>
<td align="center">0.003204712
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">19
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">87
</td>
<td align="right">58
</td>
<td align="right">0
</td>
<td align="right">36.373°
</td></tr>
<tr>
	<td align="right">32
	</td>
	<td align="right">412.261274651
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>I</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d4c84ca7860f66cd4ed8ecb07b4c5691f73c7365" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.202ex; height:2.509ex;" alt="I_h"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">20
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">90
</td>
<td align="right">60
</td>
<td align="right">0
</td>
<td align="right">37.377°
</td>
</tr>
<tr>
	<td align="right">33
	</td>
	<td align="right">440.204057448
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{s}"></span>
</td>
<td align="center">0.004356481
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">15
</td>
<td align="right">17
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">92
</td>
<td align="right">60
</td>
<td align="right">1
</td>
<td align="right">33.700°
</td></tr>
<tr>
	<td align="right">34
	</td>
	<td align="right">468.904853281
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{2}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">22
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">96
</td>
<td align="right">64
</td>
<td align="right">0
</td>
<td align="right">33.273°
</td></tr>
<tr>
	<td align="right">35
	</td>
	<td align="right">498.569872491
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{2}"></span>
</td>
<td align="center">0.000419208
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">23
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">99
</td>
<td align="right">66
</td>
<td align="right">0
</td>
<td align="right">33.100°
</td></tr>
<tr>
	<td align="right">36
	</td>
	<td align="right">529.122408375
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{2}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">24
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">102
</td>
<td align="right">68
</td>
<td align="right">0
</td>
<td align="right">33.229°
</td></tr>
<tr>
	<td align="right">37
	</td>
	<td align="right">560.618887731
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/27bfb9d6c00cf305f47ca25cfdf4b420628d623e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{5h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">25
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">105
</td>
<td align="right">70
</td>
<td align="right">0
</td>
<td align="right">32.332°
</td></tr>
<tr>
	<td align="right">38
	</td>
	<td align="right">593.038503566
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{6d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>6</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{6d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/38f7668dfc9fab198ff202cb0dfe365086a72c1e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{6d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">26
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">108
</td>
<td align="right">72
</td>
<td align="right">0
</td>
<td align="right">33.236°
</td></tr>
<tr>
	<td align="right">39
	</td>
	<td align="right">626.389009017
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">27
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">111
</td>
<td align="right">74
</td>
<td align="right">0
</td>
<td align="right">32.053°
</td></tr>
<tr>
	<td align="right">40
	</td>
	<td align="right">660.675278835
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/70cadcc969636b990957852f205868f9f7178840" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.45ex; height:2.509ex;" alt="T_{d}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">28
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">114
</td>
<td align="right">76
</td>
<td align="right">0
</td>
<td align="right">31.916°
</td></tr>
<tr>
	<td align="right">41
	</td>
	<td align="right">695.916744342
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5e54555660974eda7774b3f19659b9afd72a5a04" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{3h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">29
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">117
</td>
<td align="right">78
</td>
<td align="right">0
</td>
<td align="right">31.528°
</td></tr>
<tr>
	<td align="right">42
	</td>
	<td align="right">732.078107544
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/27bfb9d6c00cf305f47ca25cfdf4b420628d623e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.925ex; height:2.509ex;" alt="D_{{5h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">30
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">120
</td>
<td align="right">80
</td>
<td align="right">0
</td>
<td align="right">31.245°
</td></tr>
<tr>
	<td align="right">43
	</td>
	<td align="right">769.190846459
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.000399668
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">31
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">123
</td>
<td align="right">82
</td>
<td align="right">0
</td>
<td align="right">30.867°
</td></tr>
<tr>
	<td align="right">44
	</td>
	<td align="right">807.174263085
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle O_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>O</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle O_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/59a50c5a9ebe5f52234d08987a9f327fdb813590" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.952ex; height:2.509ex;" alt="{\displaystyle O_{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">20
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">120
</td>
<td align="right">72
</td>
<td align="right">6
</td>
<td align="right">31.258°
</td></tr>
<tr>
	<td align="right">45
	</td>
	<td align="right">846.188401061
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">33
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">129
</td>
<td align="right">86
</td>
<td align="right">0
</td>
<td align="right">30.207°
</td></tr>
<tr>
	<td align="right">46
	</td>
	<td align="right">886.167113639
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">34
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">132
</td>
<td align="right">88
</td>
<td align="right">0
</td>
<td align="right">29.790°
</td></tr>
<tr>
	<td align="right">47
	</td>
	<td align="right">927.059270680
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{s}"></span>
</td>
<td align="center">0.002482914
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">33
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">134
</td>
<td align="right">88
</td>
<td align="right">1
</td>
<td align="right">28.787°
</td></tr>
<tr>
	<td align="right">48
	</td>
	<td align="right">968.713455344
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle O}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>O</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle O}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/9d70e1d0d87e2ef1092ea1ffe2923d9933ff18fc" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.773ex; height:2.176ex;" alt="O"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">24
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">132
</td>
<td align="right">80
</td>
<td align="right">6
</td>
<td align="right">29.690°
</td></tr>
<tr>
	<td align="right">49
	</td>
	<td align="right">1011.557182654
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{3}"></span>
</td>
<td align="center">0.001529341
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">37
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">141
</td>
<td align="right">94
</td>
<td align="right">0
</td>
<td align="right">28.387°
</td></tr>
<tr>
	<td align="right">50
	</td>
	<td align="right">1055.182314726
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{6d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>6</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{6d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/38f7668dfc9fab198ff202cb0dfe365086a72c1e" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{6d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">38
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">144
</td>
<td align="right">96
</td>
<td align="right">0
</td>
<td align="right">29.231°
</td></tr>
<tr>
	<td align="right">51
	</td>
	<td align="right">1099.819290319
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">39
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">147
</td>
<td align="right">98
</td>
<td align="right">0
</td>
<td align="right">28.165°
</td></tr>
<tr>
	<td align="right">52
	</td>
	<td align="right">1145.418964319
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{3}"></span>
</td>
<td align="center">0.000457327
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">40
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">150
</td>
<td align="right">100
</td>
<td align="right">0
</td>
<td align="right">27.670°
</td></tr>
<tr>
	<td align="right">53
	</td>
	<td align="right">1191.922290416
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.000278469
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">18
</td>
<td align="right">35
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">150
</td>
<td align="right">96
</td>
<td align="right">3
</td>
<td align="right">27.137°
</td></tr>
<tr>
	<td align="right">54
	</td>
	<td align="right">1239.361474729
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{2}"></span>
</td>
<td align="center">0.000137870
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">42
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">156
</td>
<td align="right">104
</td>
<td align="right">0
</td>
<td align="right">27.030°
</td></tr>
<tr>
	<td align="right">55
	</td>
	<td align="right">1287.772720783
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{2}"></span>
</td>
<td align="center">0.000391696
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">43
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">159
</td>
<td align="right">106
</td>
<td align="right">0
</td>
<td align="right">26.615°
</td></tr>
<tr>
	<td align="right">56
	</td>
	<td align="right">1337.094945276
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{2}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">44
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">162
</td>
<td align="right">108
</td>
<td align="right">0
</td>
<td align="right">26.683°
</td></tr>
<tr>
	<td align="right">57
	</td>
	<td align="right">1387.383229253
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">45
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">165
</td>
<td align="right">110
</td>
<td align="right">0
</td>
<td align="right">26.702°
</td></tr>
<tr>
	<td align="right">58
	</td>
	<td align="right">1438.618250640
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{2}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">46
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">168
</td>
<td align="right">112
</td>
<td align="right">0
</td>
<td align="right">26.155°
</td></tr>
<tr>
	<td align="right">59
	</td>
	<td align="right">1490.773335279
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{2}"></span>
</td>
<td align="center">0.000154286
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">43
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">171
</td>
<td align="right">114
</td>
<td align="right">0
</td>
<td align="right">26.170°
</td></tr>
<tr>
	<td align="right">60
	</td>
	<td align="right">1543.830400976
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{3}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">48
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">174
</td>
<td align="right">116
</td>
<td align="right">0
</td>
<td align="right">25.958°
</td></tr>
<tr>
	<td align="right">61
	</td>
	<td align="right">1597.941830199
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{1}"></span>
</td>
<td align="center">0.001091717
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">49
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">177
</td>
<td align="right">118
</td>
<td align="right">0
</td>
<td align="right">25.392°
</td></tr>
<tr>
	<td align="right">62
	</td>
	<td align="right">1652.909409898
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">50
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">180
</td>
<td align="right">120
</td>
<td align="right">0
</td>
<td align="right">25.880°
</td></tr>
<tr>
	<td align="right">63
	</td>
	<td align="right">1708.879681503
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">51
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">183
</td>
<td align="right">122
</td>
<td align="right">0
</td>
<td align="right">25.257°
</td></tr>
<tr>
	<td align="right">64
	</td>
	<td align="right">1765.802577927
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">52
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">186
</td>
<td align="right">124
</td>
<td align="right">0
</td>
<td align="right">24.920°
</td></tr>
<tr>
	<td align="right">65
	</td>
	<td align="right">1823.667960264
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000399515
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">53
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">189
</td>
<td align="right">126
</td>
<td align="right">0
</td>
<td align="right">24.527°
</td></tr>
<tr>
	<td align="right">66
	</td>
	<td align="right">1882.441525304
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000776245
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">54
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">192
</td>
<td align="right">128
</td>
<td align="right">0
</td>
<td align="right">24.765°
</td></tr>
<tr>
	<td align="right">67
	</td>
	<td align="right">1942.122700406
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">55
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">195
</td>
<td align="right">130
</td>
<td align="right">0
</td>
<td align="right">24.727°
</td></tr>
<tr>
	<td align="right">68
	</td>
	<td align="right">2002.874701749
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">56
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">198
</td>
<td align="right">132
</td>
<td align="right">0
</td>
<td align="right">24.433°
</td></tr>
<tr>
	<td align="right">69
	</td>
	<td align="right">2064.533483235
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">57
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">201
</td>
<td align="right">134
</td>
<td align="right">0
</td>
<td align="right">24.137°
</td></tr>
<tr>
	<td align="right">70
	</td>
	<td align="right">2127.100901551
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6e70d31335c69bc074147f1574847b81ab300673" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{2d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">50
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">200
</td>
<td align="right">128
</td>
<td align="right">4
</td>
<td align="right">24.291°
</td></tr>
<tr>
	<td align="right">71
	</td>
	<td align="right">2190.649906425
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.001256769
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">55
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">207
</td>
<td align="right">138
</td>
<td align="right">0
</td>
<td align="right">23.803°
</td></tr>
<tr>
	<td align="right">72
	</td>
	<td align="right">2255.001190975
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">60
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">210
</td>
<td align="right">140
</td>
<td align="right">0
</td>
<td align="right">24.492°
</td>
</tr>
<tr>
	<td align="right">73
	</td>
	<td align="right">2320.633883745
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.001572959
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">61
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">213
</td>
<td align="right">142
</td>
<td align="right">0
</td>
<td align="right">22.810°
</td></tr>
<tr>
	<td align="right">74
	</td>
	<td align="right">2387.072981838
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000641539
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">62
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">216
</td>
<td align="right">144
</td>
<td align="right">0
</td>
<td align="right">22.966°
</td></tr>
<tr>
	<td align="right">75
	</td>
	<td align="right">2454.369689040
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">63
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">219
</td>
<td align="right">146
</td>
<td align="right">0
</td>
<td align="right">22.736°
</td></tr>
<tr>
	<td align="right">76
	</td>
	<td align="right">2522.674871841
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000943474
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">64
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">222
</td>
<td align="right">148
</td>
<td align="right">0
</td>
<td align="right">22.886°
</td></tr>
<tr>
	<td align="right">77
	</td>
	<td align="right">2591.850152354
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">65
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">225
</td>
<td align="right">150
</td>
<td align="right">0
</td>
<td align="right">23.286°
</td></tr>
<tr>
	<td align="right">78
	</td>
	<td align="right">2662.046474566
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6eaacb63fcdf3a344175b45b3bab7910f8fc3e40" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.537ex; height:2.509ex;" alt="T_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">66
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">228
</td>
<td align="right">152
</td>
<td align="right">0
</td>
<td align="right">23.426°
</td></tr>
<tr>
	<td align="right">79
	</td>
	<td align="right">2733.248357479
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.000702921
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">63
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">230
</td>
<td align="right">152
</td>
<td align="right">1
</td>
<td align="right">22.636°
</td></tr>
<tr>
	<td align="right">80
	</td>
	<td align="right">2805.355875981
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{4d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>4</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{4d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/51905bd99f7b0b0e1c8586208022654960b2e688" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{4d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">16
</td>
<td align="right">64
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">232
</td>
<td align="right">152
</td>
<td align="right">2
</td>
<td align="right">22.778°
</td></tr>
<tr>
	<td align="right">81
	</td>
	<td align="right">2878.522829664
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000194289
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">69
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">237
</td>
<td align="right">158
</td>
<td align="right">0
</td>
<td align="right">21.892°
</td></tr>
<tr>
	<td align="right">82
	</td>
	<td align="right">2952.569675286
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">70
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">240
</td>
<td align="right">160
</td>
<td align="right">0
</td>
<td align="right">22.206°
</td></tr>
<tr>
	<td align="right">83
	</td>
	<td align="right">3027.528488921
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000339815
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">67
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">243
</td>
<td align="right">162
</td>
<td align="right">0
</td>
<td align="right">21.646°
</td></tr>
<tr>
	<td align="right">84
	</td>
	<td align="right">3103.465124431
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000401973
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">72
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">246
</td>
<td align="right">164
</td>
<td align="right">0
</td>
<td align="right">21.513°
</td></tr>
<tr>
	<td align="right">85
	</td>
	<td align="right">3180.361442939
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000416581
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">73
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">249
</td>
<td align="right">166
</td>
<td align="right">0
</td>
<td align="right">21.498°
</td></tr>
<tr>
	<td align="right">86
	</td>
	<td align="right">3258.211605713
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.001378932
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">74
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">252
</td>
<td align="right">168
</td>
<td align="right">0
</td>
<td align="right">21.522°
</td></tr>
<tr>
	<td align="right">87
	</td>
	<td align="right">3337.000750014
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000754863
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">75
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">255
</td>
<td align="right">170
</td>
<td align="right">0
</td>
<td align="right">21.456°
</td></tr>
<tr>
	<td align="right">88
	</td>
	<td align="right">3416.720196758
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">76
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">258
</td>
<td align="right">172
</td>
<td align="right">0
</td>
<td align="right">21.486°
</td></tr>
<tr>
	<td align="right">89
	</td>
	<td align="right">3497.439018625
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000070891
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">77
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">261
</td>
<td align="right">174
</td>
<td align="right">0
</td>
<td align="right">21.182°
</td></tr>
<tr>
	<td align="right">90
	</td>
	<td align="right">3579.091222723
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">78
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">264
</td>
<td align="right">176
</td>
<td align="right">0
</td>
<td align="right">21.230°
</td></tr>
<tr>
	<td align="right">91
	</td>
	<td align="right">3661.713699320
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000033221
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">79
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">267
</td>
<td align="right">178
</td>
<td align="right">0
</td>
<td align="right">21.105°
</td></tr>
<tr>
	<td align="right">92
	</td>
	<td align="right">3745.291636241
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">80
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">270
</td>
<td align="right">180
</td>
<td align="right">0
</td>
<td align="right">21.026°
</td></tr>
<tr>
	<td align="right">93
	</td>
	<td align="right">3829.844338421
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000213246
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">81
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">273
</td>
<td align="right">182
</td>
<td align="right">0
</td>
<td align="right">20.751°
</td></tr>
<tr>
	<td align="right">94
	</td>
	<td align="right">3915.309269620
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">82
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">276
</td>
<td align="right">184
</td>
<td align="right">0
</td>
<td align="right">20.952°
</td></tr>
<tr>
	<td align="right">95
	</td>
	<td align="right">4001.771675565
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000116638
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">83
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">279
</td>
<td align="right">186
</td>
<td align="right">0
</td>
<td align="right">20.711°
</td></tr>
<tr>
	<td align="right">96
	</td>
	<td align="right">4089.154010060
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000036310
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">84
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">282
</td>
<td align="right">188
</td>
<td align="right">0
</td>
<td align="right">20.687°
</td></tr>
<tr>
	<td align="right">97
	</td>
	<td align="right">4177.533599622
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000096437
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">85
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">285
</td>
<td align="right">190
</td>
<td align="right">0
</td>
<td align="right">20.450°
</td></tr>
<tr>
	<td align="right">98
	</td>
	<td align="right">4266.822464156
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000112916
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">86
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">288
</td>
<td align="right">192
</td>
<td align="right">0
</td>
<td align="right">20.422°
</td></tr>
<tr>
	<td align="right">99
	</td>
	<td align="right">4357.139163132
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000156508
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">87
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">291
</td>
<td align="right">194
</td>
<td align="right">0
</td>
<td align="right">20.284°
</td></tr>
<tr>
	<td align="right">100
	</td>
	<td align="right">4448.350634331
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">88
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">294
</td>
<td align="right">196
</td>
<td align="right">0
</td>
<td align="right">20.297°
</td></tr>
<tr>
	<td align="right">101
	</td>
	<td align="right">4540.590051694
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">89
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">297
</td>
<td align="right">198
</td>
<td align="right">0
</td>
<td align="right">20.011°
</td></tr>
<tr>
	<td align="right">102
	</td>
	<td align="right">4633.736565899
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">90
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">300
</td>
<td align="right">200
</td>
<td align="right">0
</td>
<td align="right">20.040°
</td></tr>
<tr>
	<td align="right">103
	</td>
	<td align="right">4727.836616833
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000201245
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">91
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">303
</td>
<td align="right">202
</td>
<td align="right">0
</td>
<td align="right">19.907°
</td></tr>
<tr>
	<td align="right">104
	</td>
	<td align="right">4822.876522746
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{6}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>6</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{6}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/264f8e1a31b15f108250f719c285cc498810834a" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{6}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">92
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">306
</td>
<td align="right">204
</td>
<td align="right">0
</td>
<td align="right">19.957°
</td></tr>
<tr>
	<td align="right">105
	</td>
	<td align="right">4919.000637616
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">93
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">309
</td>
<td align="right">206
</td>
<td align="right">0
</td>
<td align="right">19.842°
</td></tr>
<tr>
	<td align="right">106
	</td>
	<td align="right">5015.984595705
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">94
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">312
</td>
<td align="right">208
</td>
<td align="right">0
</td>
<td align="right">19.658°
</td></tr>
<tr>
	<td align="right">107
	</td>
	<td align="right">5113.953547724
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000064137
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">95
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">315
</td>
<td align="right">210
</td>
<td align="right">0
</td>
<td align="right">19.327°
</td></tr>
<tr>
	<td align="right">108
	</td>
	<td align="right">5212.813507831
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000432525
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">96
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">318
</td>
<td align="right">212
</td>
<td align="right">0
</td>
<td align="right">19.327°
</td></tr>
<tr>
	<td align="right">109
	</td>
	<td align="right">5312.735079920
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000647299
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">93
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">321
</td>
<td align="right">214
</td>
<td align="right">0
</td>
<td align="right">19.103°
</td></tr>
<tr>
	<td align="right">110
	</td>
	<td align="right">5413.549294192
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{6}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>6</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{6}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/264f8e1a31b15f108250f719c285cc498810834a" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{6}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">98
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">324
</td>
<td align="right">216
</td>
<td align="right">0
</td>
<td align="right">19.476°
</td></tr>
<tr>
	<td align="right">111
	</td>
	<td align="right">5515.293214587
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">99
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">327
</td>
<td align="right">218
</td>
<td align="right">0
</td>
<td align="right">19.255°
</td></tr>
<tr>
	<td align="right">112
	</td>
	<td align="right">5618.044882327
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">100
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">330
</td>
<td align="right">220
</td>
<td align="right">0
</td>
<td align="right">19.351°
</td></tr>
<tr>
	<td align="right">113
	</td>
	<td align="right">5721.824978027
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">101
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">333
</td>
<td align="right">222
</td>
<td align="right">0
</td>
<td align="right">18.978°
</td></tr>
<tr>
	<td align="right">114
	</td>
	<td align="right">5826.521572163
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000149772
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">102
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">336
</td>
<td align="right">224
</td>
<td align="right">0
</td>
<td align="right">18.836°
</td></tr>
<tr>
	<td align="right">115
	</td>
	<td align="right">5932.181285777
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{3}}"></span>
</td>
<td align="center">0.000049972
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">103
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">339
</td>
<td align="right">226
</td>
<td align="right">0
</td>
<td align="right">18.458°
</td></tr>
<tr>
	<td align="right">116
	</td>
	<td align="right">6038.815593579
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000259726
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">104
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">342
</td>
<td align="right">228
</td>
<td align="right">0
</td>
<td align="right">18.386°
</td></tr>
<tr>
	<td align="right">117
	</td>
	<td align="right">6146.342446579
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000127609
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">105
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">345
</td>
<td align="right">230
</td>
<td align="right">0
</td>
<td align="right">18.566°
</td></tr>
<tr>
	<td align="right">118
	</td>
	<td align="right">6254.877027790
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000332475
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">106
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">348
</td>
<td align="right">232
</td>
<td align="right">0
</td>
<td align="right">18.455°
</td></tr>
<tr>
	<td align="right">119
	</td>
	<td align="right">6364.347317479
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000685590
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">107
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">351
</td>
<td align="right">234
</td>
<td align="right">0
</td>
<td align="right">18.336°
</td></tr>
<tr>
	<td align="right">120
	</td>
	<td align="right">6474.756324980
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.001373062
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">108
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">354
</td>
<td align="right">236
</td>
<td align="right">0
</td>
<td align="right">18.418°
</td></tr>
<tr>
	<td align="right">121
	</td>
	<td align="right">6586.121949584
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{3}}"></span>
</td>
<td align="center">0.000838863
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">109
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">357
</td>
<td align="right">238
</td>
<td align="right">0
</td>
<td align="right">18.199°
</td></tr>
<tr>
	<td align="right">122
	</td>
	<td align="right">6698.374499261
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>I</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d4c84ca7860f66cd4ed8ecb07b4c5691f73c7365" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.202ex; height:2.509ex;" alt="I_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">110
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">360
</td>
<td align="right">240
</td>
<td align="right">0
</td>
<td align="right">18.612°
</td>
</tr>
<tr>
	<td align="right">123
	</td>
	<td align="right">6811.827228174
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.001939754
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">107
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">363
</td>
<td align="right">242
</td>
<td align="right">0
</td>
<td align="right">17.840°
</td></tr>
<tr>
	<td align="right">124
	</td>
	<td align="right">6926.169974193
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">112
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">366
</td>
<td align="right">244
</td>
<td align="right">0
</td>
<td align="right">18.111°
</td></tr>
<tr>
	<td align="right">125
	</td>
	<td align="right">7041.473264023
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000088274
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">113
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">369
</td>
<td align="right">246
</td>
<td align="right">0
</td>
<td align="right">17.867°
</td></tr>
<tr>
	<td align="right">126
	</td>
	<td align="right">7157.669224867
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{4}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>4</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{4}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3d99bbbdaf59e06536c67afbce7c3f681acd1688" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{4}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">2
</td>
<td align="right">16
</td>
<td align="right">100
</td>
<td align="right">8
</td>
<td align="right">0
</td>
<td align="right">372
</td>
<td align="right">248
</td>
<td align="right">0
</td>
<td align="right">17.920°
</td></tr>
<tr>
	<td align="right">127
	</td>
	<td align="right">7274.819504675
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">115
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">375
</td>
<td align="right">250
</td>
<td align="right">0
</td>
<td align="right">17.877°
</td></tr>
<tr>
	<td align="right">128
	</td>
	<td align="right">7393.007443068
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000054132
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">116
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">378
</td>
<td align="right">252
</td>
<td align="right">0
</td>
<td align="right">17.814°
</td></tr>
<tr>
	<td align="right">129
	</td>
	<td align="right">7512.107319268
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000030099
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">117
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">381
</td>
<td align="right">254
</td>
<td align="right">0
</td>
<td align="right">17.743°
</td></tr>
<tr>
	<td align="right">130
	</td>
	<td align="right">7632.167378912
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000025622
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">118
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">384
</td>
<td align="right">256
</td>
<td align="right">0
</td>
<td align="right">17.683°
</td></tr>
<tr>
	<td align="right">131
	</td>
	<td align="right">7753.205166941
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000305133
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">119
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">387
</td>
<td align="right">258
</td>
<td align="right">0
</td>
<td align="right">17.511°
</td></tr>
<tr>
	<td align="right">132
	</td>
	<td align="right">7875.045342797
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">120
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">390
</td>
<td align="right">260
</td>
<td align="right">0
</td>
<td align="right">17.958°
</td>
</tr>
<tr>
	<td align="right">133
	</td>
	<td align="right">7998.179212898
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{3}}"></span>
</td>
<td align="center">0.000591438
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">121
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">393
</td>
<td align="right">262
</td>
<td align="right">0
</td>
<td align="right">17.133°
</td></tr>
<tr>
	<td align="right">134
	</td>
	<td align="right">8122.089721194
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000470268
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">122
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">396
</td>
<td align="right">264
</td>
<td align="right">0
</td>
<td align="right">17.214°
</td></tr>
<tr>
	<td align="right">135
	</td>
	<td align="right">8246.909486992
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">123
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">399
</td>
<td align="right">266
</td>
<td align="right">0
</td>
<td align="right">17.431°
</td></tr>
<tr>
	<td align="right">136
	</td>
	<td align="right">8372.743302539
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">124
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">402
</td>
<td align="right">268
</td>
<td align="right">0
</td>
<td align="right">17.485°
</td></tr>
<tr>
	<td align="right">137
	</td>
	<td align="right">8499.534494782
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">125
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">405
</td>
<td align="right">270
</td>
<td align="right">0
</td>
<td align="right">17.560°
</td></tr>
<tr>
	<td align="right">138
	</td>
	<td align="right">8627.406389880
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000473576
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">126
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">408
</td>
<td align="right">272
</td>
<td align="right">0
</td>
<td align="right">16.924°
</td></tr>
<tr>
	<td align="right">139
	</td>
	<td align="right">8756.227056057
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000404228
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">127
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">411
</td>
<td align="right">274
</td>
<td align="right">0
</td>
<td align="right">16.673°
</td></tr>
<tr>
	<td align="right">140
	</td>
	<td align="right">8885.980609041
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000630351
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">13
</td>
<td align="right">126
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">414
</td>
<td align="right">276
</td>
<td align="right">0
</td>
<td align="right">16.773°
</td></tr>
<tr>
	<td align="right">141
	</td>
	<td align="right">9016.615349190
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.000376365
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">126
</td>
<td align="right">0
</td>
<td align="right">1
</td>
<td align="right">417
</td>
<td align="right">278
</td>
<td align="right">0
</td>
<td align="right">16.962°
</td></tr>
<tr>
	<td align="right">142
	</td>
	<td align="right">9148.271579993
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000550138
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">130
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">420
</td>
<td align="right">280
</td>
<td align="right">0
</td>
<td align="right">16.840°
</td></tr>
<tr>
	<td align="right">143
	</td>
	<td align="right">9280.839851192
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000255449
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">131
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">423
</td>
<td align="right">282
</td>
<td align="right">0
</td>
<td align="right">16.782°
</td></tr>
<tr>
	<td align="right">144
	</td>
	<td align="right">9414.371794460
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">132
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">426
</td>
<td align="right">284
</td>
<td align="right">0
</td>
<td align="right">16.953°
</td></tr>
<tr>
	<td align="right">145
	</td>
	<td align="right">9548.928837232
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.000094938
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">133
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">429
</td>
<td align="right">286
</td>
<td align="right">0
</td>
<td align="right">16.841°
</td></tr>
<tr>
	<td align="right">146
	</td>
	<td align="right">9684.381825575
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">134
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">432
</td>
<td align="right">288
</td>
<td align="right">0
</td>
<td align="right">16.905°
</td></tr>
<tr>
	<td align="right">147
	</td>
	<td align="right">9820.932378373
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000636651
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">135
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">435
</td>
<td align="right">290
</td>
<td align="right">0
</td>
<td align="right">16.458°
</td></tr>
<tr>
	<td align="right">148
	</td>
	<td align="right">9958.406004270
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000203701
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">136
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">438
</td>
<td align="right">292
</td>
<td align="right">0
</td>
<td align="right">16.627°
</td></tr>
<tr>
	<td align="right">149
	</td>
	<td align="right">10096.859907397
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000638186
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">133
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">441
</td>
<td align="right">294
</td>
<td align="right">0
</td>
<td align="right">16.344°
</td></tr>
<tr>
	<td align="right">150
	</td>
	<td align="right">10236.196436701
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">138
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">444
</td>
<td align="right">296
</td>
<td align="right">0
</td>
<td align="right">16.405°
</td></tr>
<tr>
	<td align="right">151
	</td>
	<td align="right">10376.571469275
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000153836
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">139
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">447
</td>
<td align="right">298
</td>
<td align="right">0
</td>
<td align="right">16.163°
</td></tr>
<tr>
	<td align="right">152
	</td>
	<td align="right">10517.867592878
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">140
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">450
</td>
<td align="right">300
</td>
<td align="right">0
</td>
<td align="right">16.117°
</td></tr>
<tr>
	<td align="right">153
	</td>
	<td align="right">10660.082748237
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">141
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">453
</td>
<td align="right">302
</td>
<td align="right">0
</td>
<td align="right">16.390°
</td></tr>
<tr>
	<td align="right">154
	</td>
	<td align="right">10803.372421141
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000735800
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">142
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">456
</td>
<td align="right">304
</td>
<td align="right">0
</td>
<td align="right">16.078°
</td></tr>
<tr>
	<td align="right">155
	</td>
	<td align="right">10947.574692279
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000603670
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">143
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">459
</td>
<td align="right">306
</td>
<td align="right">0
</td>
<td align="right">15.990°
</td></tr>
<tr>
	<td align="right">156
	</td>
	<td align="right">11092.798311456
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000508534
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">144
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">462
</td>
<td align="right">308
</td>
<td align="right">0
</td>
<td align="right">15.822°
</td></tr>
<tr>
	<td align="right">157
	</td>
	<td align="right">11238.903041156
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000357679
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">145
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">465
</td>
<td align="right">310
</td>
<td align="right">0
</td>
<td align="right">15.948°
</td></tr>
<tr>
	<td align="right">158
	</td>
	<td align="right">11385.990186197
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000921918
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">146
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">468
</td>
<td align="right">312
</td>
<td align="right">0
</td>
<td align="right">15.987°
</td></tr>
<tr>
	<td align="right">159
	</td>
	<td align="right">11534.023960956
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000381457
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">147
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">471
</td>
<td align="right">314
</td>
<td align="right">0
</td>
<td align="right">15.960°
</td></tr>
<tr>
	<td align="right">160
	</td>
	<td align="right">11683.054805549
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">148
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">474
</td>
<td align="right">316
</td>
<td align="right">0
</td>
<td align="right">15.961°
</td></tr>
<tr>
	<td align="right">161
	</td>
	<td align="right">11833.084739465
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000056447
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">149
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">477
</td>
<td align="right">318
</td>
<td align="right">0
</td>
<td align="right">15.810°
</td></tr>
<tr>
	<td align="right">162
	</td>
	<td align="right">11984.050335814
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">150
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">480
</td>
<td align="right">320
</td>
<td align="right">0
</td>
<td align="right">15.813°
</td></tr>
<tr>
	<td align="right">163
	</td>
	<td align="right">12136.013053220
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000120798
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">151
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">483
</td>
<td align="right">322
</td>
<td align="right">0
</td>
<td align="right">15.675°
</td></tr>
<tr>
	<td align="right">164
	</td>
	<td align="right">12288.930105320
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">152
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">486
</td>
<td align="right">324
</td>
<td align="right">0
</td>
<td align="right">15.655°
</td></tr>
<tr>
	<td align="right">165
	</td>
	<td align="right">12442.804451373
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000091119
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">153
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">489
</td>
<td align="right">326
</td>
<td align="right">0
</td>
<td align="right">15.651°
</td></tr>
<tr>
	<td align="right">166
	</td>
	<td align="right">12597.649071323
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6e70d31335c69bc074147f1574847b81ab300673" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{2d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">16
</td>
<td align="right">146
</td>
<td align="right">4
</td>
<td align="right">0
</td>
<td align="right">492
</td>
<td align="right">328
</td>
<td align="right">0
</td>
<td align="right">15.607°
</td></tr>
<tr>
	<td align="right">167
	</td>
	<td align="right">12753.469429750
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000097382
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">155
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">495
</td>
<td align="right">330
</td>
<td align="right">0
</td>
<td align="right">15.600°
</td></tr>
<tr>
	<td align="right">168
	</td>
	<td align="right">12910.212672268
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">156
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">498
</td>
<td align="right">332
</td>
<td align="right">0
</td>
<td align="right">15.655°
</td></tr>
<tr>
	<td align="right">169
	</td>
	<td align="right">13068.006451127
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.000068102
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">13
</td>
<td align="right">155
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">501
</td>
<td align="right">334
</td>
<td align="right">0
</td>
<td align="right">15.537°
</td></tr>
<tr>
	<td align="right">170
	</td>
	<td align="right">13226.681078541
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2d}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
							<mi>d</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2d}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6e70d31335c69bc074147f1574847b81ab300673" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.838ex; height:2.509ex;" alt="D_{{2d}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">158
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">504
</td>
<td align="right">336
</td>
<td align="right">0
</td>
<td align="right">15.569°
</td></tr>
<tr>
	<td align="right">171
	</td>
	<td align="right">13386.355930717
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">159
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">507
</td>
<td align="right">338
</td>
<td align="right">0
</td>
<td align="right">15.497°
</td></tr>
<tr>
	<td align="right">172
	</td>
	<td align="right">13547.018108787
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2v}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
							<mi>v</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2v}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0d5ebdbdd6632acfb47975b9a6d1df3837d20eb1" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:3.513ex; height:2.509ex;" alt="C_{{2v}}"></span>
</td>
<td align="center">0.000547291
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">14
</td>
<td align="right">156
</td>
<td align="right">2
</td>
<td align="right">0
</td>
<td align="right">510
</td>
<td align="right">340
</td>
<td align="right">0
</td>
<td align="right">15.292°
</td></tr>
<tr>
	<td align="right">173
	</td>
	<td align="right">13708.635243034
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.000286544
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">161
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">513
</td>
<td align="right">342
</td>
<td align="right">0
</td>
<td align="right">15.225°
</td></tr>
<tr>
	<td align="right">174
	</td>
	<td align="right">13871.187092292
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">162
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">516
</td>
<td align="right">344
</td>
<td align="right">0
</td>
<td align="right">15.366°
</td></tr>
<tr>
	<td align="right">175
	</td>
	<td align="right">14034.781306929
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000026686
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">163
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">519
</td>
<td align="right">346
</td>
<td align="right">0
</td>
<td align="right">15.252°
</td></tr>
<tr>
	<td align="right">176
	</td>
	<td align="right">14199.354775632
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000283978
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">164
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">522
</td>
<td align="right">348
</td>
<td align="right">0
</td>
<td align="right">15.101°
</td></tr>
<tr>
	<td align="right">177
	</td>
	<td align="right">14364.837545298
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">165
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">525
</td>
<td align="right">350
</td>
<td align="right">0
</td>
<td align="right">15.269°
</td></tr>
<tr>
	<td align="right">178
	</td>
	<td align="right">14531.309552587
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">166
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">528
</td>
<td align="right">352
</td>
<td align="right">0
</td>
<td align="right">15.145°
</td></tr>
<tr>
	<td align="right">179
	</td>
	<td align="right">14698.754594220
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000125113
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">13
</td>
<td align="right">165
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">531
</td>
<td align="right">354
</td>
<td align="right">0
</td>
<td align="right">14.968°
</td></tr>
<tr>
	<td align="right">180
	</td>
	<td align="right">14867.099927525
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">168
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">534
</td>
<td align="right">356
</td>
<td align="right">0
</td>
<td align="right">15.067°
</td></tr>
<tr>
	<td align="right">181
	</td>
	<td align="right">15036.467239769
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000304193
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">169
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">537
</td>
<td align="right">358
</td>
<td align="right">0
</td>
<td align="right">15.002°
</td></tr>
<tr>
	<td align="right">182
	</td>
	<td align="right">15206.730610906
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">170
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">540
</td>
<td align="right">360
</td>
<td align="right">0
</td>
<td align="right">15.155°
</td></tr>
<tr>
	<td align="right">183
	</td>
	<td align="right">15378.166571028
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000467899
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">171
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">543
</td>
<td align="right">362
</td>
<td align="right">0
</td>
<td align="right">14.747°
</td></tr>
<tr>
	<td align="right">184
	</td>
	<td align="right">15550.421450311
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">172
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">546
</td>
<td align="right">364
</td>
<td align="right">0
</td>
<td align="right">14.932°
</td></tr>
<tr>
	<td align="right">185
	</td>
	<td align="right">15723.720074072
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000389762
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">173
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">549
</td>
<td align="right">366
</td>
<td align="right">0
</td>
<td align="right">14.775°
</td></tr>
<tr>
	<td align="right">186
	</td>
	<td align="right">15897.897437048
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000389762
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">174
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">552
</td>
<td align="right">368
</td>
<td align="right">0
</td>
<td align="right">14.739°
</td></tr>
<tr>
	<td align="right">187
	</td>
	<td align="right">16072.975186320
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">175
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">555
</td>
<td align="right">370
</td>
<td align="right">0
</td>
<td align="right">14.848°
</td></tr>
<tr>
	<td align="right">188
	</td>
	<td align="right">16249.222678879
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">176
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">558
</td>
<td align="right">372
</td>
<td align="right">0
</td>
<td align="right">14.740°
</td></tr>
<tr>
	<td align="right">189
	</td>
	<td align="right">16426.371938862
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000020732
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">177
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">561
</td>
<td align="right">374
</td>
<td align="right">0
</td>
<td align="right">14.671°
</td></tr>
<tr>
	<td align="right">190
	</td>
	<td align="right">16604.428338501
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/66e9abeb5057b7afbf88e3169101849354f13c65" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{3}}"></span>
</td>
<td align="center">0.000586804
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">178
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">564
</td>
<td align="right">376
</td>
<td align="right">0
</td>
<td align="right">14.501°
</td></tr>
<tr>
	<td align="right">191
	</td>
	<td align="right">16783.452219362
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.001129202
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">13
</td>
<td align="right">177
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">567
</td>
<td align="right">378
</td>
<td align="right">0
</td>
<td align="right">14.195°
</td></tr>
<tr>
	<td align="right">192
	</td>
	<td align="right">16963.338386460
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">180
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">570
</td>
<td align="right">380
</td>
<td align="right">0
</td>
<td align="right">14.819°
</td>
</tr>
<tr>
	<td align="right">193
	</td>
	<td align="right">17144.564740880
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000985192
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">181
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">573
</td>
<td align="right">382
</td>
<td align="right">0
</td>
<td align="right">14.144°
</td></tr>
<tr>
	<td align="right">194
	</td>
	<td align="right">17326.616136471
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000322358
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">182
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">576
</td>
<td align="right">384
</td>
<td align="right">0
</td>
<td align="right">14.350°
</td></tr>
<tr>
	<td align="right">195
	</td>
	<td align="right">17509.489303930
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">183
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">579
</td>
<td align="right">386
</td>
<td align="right">0
</td>
<td align="right">14.375°
</td></tr>
<tr>
	<td align="right">196
	</td>
	<td align="right">17693.460548082
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000315907
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">184
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">582
</td>
<td align="right">388
</td>
<td align="right">0
</td>
<td align="right">14.251°
</td></tr>
<tr>
	<td align="right">197
	</td>
	<td align="right">17878.340162571
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">185
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">585
</td>
<td align="right">390
</td>
<td align="right">0
</td>
<td align="right">14.147°
</td></tr>
<tr>
	<td align="right">198
	</td>
	<td align="right">18064.262177195
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000011149
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">186
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">588
</td>
<td align="right">392
</td>
<td align="right">0
</td>
<td align="right">14.237°
</td></tr>
<tr>
	<td align="right">199
	</td>
	<td align="right">18251.082495640
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.000534779
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">187
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">591
</td>
<td align="right">394
</td>
<td align="right">0
</td>
<td align="right">14.153°
</td></tr>
<tr>
	<td align="right">200
	</td>
	<td align="right">18438.842717530
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/41b3839c40bd06e3dfea10798dfab41a905af256" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{2}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">188
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">594
</td>
<td align="right">396
</td>
<td align="right">0
</td>
<td align="right">14.222°
</td></tr>
<tr>
	<td align="right">201
	</td>
	<td align="right">18627.591226244
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0.001048859
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">13
</td>
<td align="right">187
</td>
<td align="right">1
</td>
<td align="right">0
</td>
<td align="right">597
</td>
<td align="right">398
</td>
<td align="right">0
</td>
<td align="right">13.830°
</td></tr>
<tr>
	<td align="right">202
	</td>
	<td align="right">18817.204718262
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">190
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">600
</td>
<td align="right">400
</td>
<td align="right">0
</td>
<td align="right">14.189°
</td></tr>
<tr>
	<td align="right">203
	</td>
	<td align="right">19007.981204580
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{s}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mi>s</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{s}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3b6d160c0ac08478db6e852c204a78cd9bc2e14d" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.665ex; height:2.509ex;" alt="C_{{s}}"></span>
</td>
<td align="center">0.000600343
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">191
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">603
</td>
<td align="right">402
</td>
<td align="right">0
</td>
<td align="right">13.977°
</td></tr>
<tr>
	<td align="right">204
	</td>
	<td align="right">19199.540775603
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6eaacb63fcdf3a344175b45b3bab7910f8fc3e40" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.537ex; height:2.509ex;" alt="T_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">192
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">606
</td>
<td align="right">404
</td>
<td align="right">0
</td>
<td align="right">14.291°
</td></tr>
<tr>
	<td align="right">212
	</td>
	<td align="right">20768.053085964
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">200
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">630
</td>
<td align="right">420
</td>
<td align="right">0
</td>
<td align="right">14.118°
</td>
</tr>
<tr>
	<td align="right">214
	</td>
	<td align="right">21169.910410375
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">202
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">636
</td>
<td align="right">424
</td>
<td align="right">0
</td>
<td align="right">13.771°
</td></tr>
<tr>
	<td align="right">216
	</td>
	<td align="right">21575.596377869
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">204
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">642
</td>
<td align="right">428
</td>
<td align="right">0
</td>
<td align="right">13.735°
</td></tr>
<tr>
	<td align="right">217
	</td>
	<td align="right">21779.856080418
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">205
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">645
</td>
<td align="right">430
</td>
<td align="right">0
</td>
<td align="right">13.902°
</td></tr>
<tr>
	<td align="right">232
	</td>
	<td align="right">24961.252318934
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">220
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">690
</td>
<td align="right">460
</td>
<td align="right">0
</td>
<td align="right">13.260°
</td></tr>
<tr>
	<td align="right">255
	</td>
	<td align="right">30264.424251281
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">243
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">759
</td>
<td align="right">506
</td>
<td align="right">0
</td>
<td align="right">12.565°
</td></tr>
<tr>
	<td align="right">256
	</td>
	<td align="right">30506.687515847
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">244
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">762
</td>
<td align="right">508
</td>
<td align="right">0
</td>
<td align="right">12.572°
</td></tr>
<tr>
	<td align="right">257
	</td>
	<td align="right">30749.941417346
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">245
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">765
</td>
<td align="right">510
</td>
<td align="right">0
</td>
<td align="right">12.672°
</td></tr>
<tr>
	<td align="right">272
	</td>
	<td align="right">34515.193292681
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>I</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d4c84ca7860f66cd4ed8ecb07b4c5691f73c7365" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.202ex; height:2.509ex;" alt="I_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">260
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">810
</td>
<td align="right">540
</td>
<td align="right">0
</td>
<td align="right">12.335°
</td>
</tr>
<tr>
	<td align="right">282
	</td>
	<td align="right">37147.294418462
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">270
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">840
</td>
<td align="right">560
</td>
<td align="right">0
</td>
<td align="right">12.166°
</td>
</tr>
<tr>
	<td align="right">292
	</td>
	<td align="right">39877.008012909
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">280
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">870
</td>
<td align="right">580
</td>
<td align="right">0
</td>
<td align="right">11.857°
</td></tr>
<tr>
	<td align="right">306
	</td>
	<td align="right">43862.569780797
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6eaacb63fcdf3a344175b45b3bab7910f8fc3e40" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.537ex; height:2.509ex;" alt="T_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">294
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">912
</td>
<td align="right">608
</td>
<td align="right">0
</td>
<td align="right">11.628°
</td></tr>
<tr>
	<td align="right">312
	</td>
	<td align="right">45629.313804002
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{2}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>2</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{2}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7ec545f7870665e1028b7492746848d149878808" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{2}}"></span>
</td>
<td align="center">0.000306163
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">300
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">930
</td>
<td align="right">620
</td>
<td align="right">0
</td>
<td align="right">11.299°
</td></tr>
<tr>
	<td align="right">315
	</td>
	<td align="right">46525.825643432
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">303
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">939
</td>
<td align="right">626
</td>
<td align="right">0
</td>
<td align="right">11.337°
</td></tr>
<tr>
	<td align="right">317
	</td>
	<td align="right">47128.310344520
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">305
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">945
</td>
<td align="right">630
</td>
<td align="right">0
</td>
<td align="right">11.423°
</td></tr>
<tr>
	<td align="right">318
	</td>
	<td align="right">47431.056020043
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">306
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">948
</td>
<td align="right">632
</td>
<td align="right">0
</td>
<td align="right">11.219°
</td></tr>
<tr>
	<td align="right">334
	</td>
	<td align="right">52407.728127822
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">322
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">996
</td>
<td align="right">664
</td>
<td align="right">0
</td>
<td align="right">11.058°
</td></tr>
<tr>
	<td align="right">348
	</td>
	<td align="right">56967.472454334
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6eaacb63fcdf3a344175b45b3bab7910f8fc3e40" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.537ex; height:2.509ex;" alt="T_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">336
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1038
</td>
<td align="right">692
</td>
<td align="right">0
</td>
<td align="right">10.721°
</td></tr>
<tr>
	<td align="right">357
	</td>
	<td align="right">59999.922939598
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">345
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1065
</td>
<td align="right">710
</td>
<td align="right">0
</td>
<td align="right">10.728°
</td></tr>
<tr>
	<td align="right">358
	</td>
	<td align="right">60341.830924588
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">346
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1068
</td>
<td align="right">712
</td>
<td align="right">0
</td>
<td align="right">10.647°
</td></tr>
<tr>
	<td align="right">372
	</td>
	<td align="right">65230.027122557
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle I}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>I</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle I}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/535ea7fc4134a31cbe2251d9d3511374bc41be9f" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.172ex; height:2.176ex;" alt="I"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">360
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1110
</td>
<td align="right">740
</td>
<td align="right">0
</td>
<td align="right">10.531°
</td>
</tr>
<tr>
	<td align="right">382
	</td>
	<td align="right">68839.426839215
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">370
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1140
</td>
<td align="right">760
</td>
<td align="right">0
</td>
<td align="right">10.379°
</td></tr>
<tr>
	<td align="right">390
	</td>
	<td align="right">71797.035335953
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T_{h}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>T</mi>
						<mrow>
							<mi>h</mi>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T_{h}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6eaacb63fcdf3a344175b45b3bab7910f8fc3e40" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.537ex; height:2.509ex;" alt="T_{{h}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">378
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1164
</td>
<td align="right">776
</td>
<td align="right">0
</td>
<td align="right">10.222°
</td></tr>
<tr>
	<td align="right">392
	</td>
	<td align="right">72546.258370889
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle C_{1}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>C</mi>
						<mrow>
							<mn>1</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle C_{1}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/babf569931f1a7b5182b9bec51873c2f5692fbb8" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.716ex; height:2.509ex;" alt="C_{{1}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">380
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1170
</td>
<td align="right">780
</td>
<td align="right">0
</td>
<td align="right">10.278°
</td></tr>
<tr>
	<td align="right">400
	</td>
	<td align="right">75582.448512213
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">388
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1194
</td>
<td align="right">796
</td>
<td align="right">0
</td>
<td align="right">10.068°
</td></tr>
<tr>
	<td align="right">402
	</td>
	<td align="right">76351.192432673
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{5}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>5</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{5}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/0aae0fc530390b62f9fa9e136ba62961d06f99f4" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{5}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">12
</td>
<td align="right">390
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">1200
</td>
<td align="right">800
</td>
<td align="right">0
</td>
<td align="right">10.099°
</td></tr>
<tr>
	<td align="right">432
	</td>
	<td align="right">88353.709681956
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle D_{3}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>D</mi>
						<mrow>
							<mn>3</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle D_{3}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/c58ecc2f3bfa64c9a31f2a459205efd74082a824" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.979ex; height:2.509ex;" alt="D_{{3}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">396
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">1290
</td>
<td align="right">860
</td>
<td align="right">0
</td>
<td align="right">9.556°
</td></tr>
<tr>
	<td align="right">448
	</td>
	<td align="right">95115.546986209
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">412
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">1338
</td>
<td align="right">892
</td>
<td align="right">0
</td>
<td align="right">9.322°
</td></tr>
<tr>
	<td align="right">460
	</td>
	<td align="right">100351.763108673
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle T}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<mi>T</mi>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle T}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/ec7200acd984a1d3a3d7dc455e262fbe54f7f6e0" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.636ex; height:2.176ex;" alt="T"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">424
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">1374
</td>
<td align="right">916
</td>
<td align="right">0
</td>
<td align="right">9.297°
</td></tr>
<tr>
	<td align="right">468
	</td>
	<td align="right">103920.871715127
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle S_{6}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>S</mi>
						<mrow>
							<mn>6</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle S_{6}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/faf3009f676f356d718fe7b036cfe676575b25fa" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.479ex; height:2.509ex;" alt="S_{{6}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">432
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">1398
</td>
<td align="right">932
</td>
<td align="right">0
</td>
<td align="right">9.120°
</td></tr>
<tr>
	<td align="right">470
	</td>
	<td align="right">104822.886324279
	</td>
	<td align="center"><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML"  alttext="{\displaystyle S_{6}}">
		<semantics>
			<mrow>
				<mstyle displaystyle="true" scriptlevel="0">
					<msub>
						<mi>S</mi>
						<mrow>
							<mn>6</mn>
						</mrow>
					</msub>
				</mstyle>
			</mrow>
			<annotation encoding="application/x-tex">{\displaystyle S_{6}}</annotation>
		</semantics>
	</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/faf3009f676f356d718fe7b036cfe676575b25fa" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.479ex; height:2.509ex;" alt="S_{{6}}"></span>
</td>
<td align="center">0
</td>
<td align="right">0
</td>
<td align="right">0
</td>
<td align="right">24
</td>
<td align="right">434
</td>
<td align="right">12
</td>
<td align="right">0
</td>
<td align="right">1404
</td>
<td align="right">936
</td>
<td align="right">0
</td>
<td align="right">9.059°</td></tr>
</tbody>
</table>