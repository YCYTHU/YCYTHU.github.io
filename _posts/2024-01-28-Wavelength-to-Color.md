---
title: 使用三刺激值函数将光谱转换为RGB颜色
tags: 
- Code
- JavaScript
- Color
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/CIE1931xy_blank.svg/723px-CIE1931xy_blank.svg.png
---
使用三刺激值函数依据光的波长或光谱的高斯峰在线生成不同色彩空间中的颜色。
<!--more-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavelength_to_color/tristimulus.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavelength_to_color/wavelength2color.js" type="text/javascript"></script>
<style>
	.container {
    	width: 100%;
    	display: grid;
		grid-template-columns: 200px repeat(2, 1fr);
		grid-template-rows: repeat(2, 1fr);
		grid-column-gap: 5px;
		grid-row-gap: 5px;
	}
	.ui {
		grid-area: 1 / 1 / 3 / 2;
		padding: 5px 20px;
		background-color: #efefef;
		box-sizing: border-box;
		width: 200px;
	}
	.color1 { grid-area: 1 / 2 / 2 / 3; }
	.color2 { grid-area: 1 / 3 / 2 / 4; }
	.color3 { grid-area: 2 / 2 / 3 / 3; }
	.color4 { grid-area: 2 / 3 / 3 / 4; }
	.colorSpace {
		display: table;
		padding: 4px;
		background-color: #efefef;
		border-radius: 10px;
		width: 100%;
	}
	.colorSpaceInput {
		display: table-cell;
		text-align: center;
	}
	.wavelengthInput {
		display: table-cell;
		width: 100%;
		height: 35px;
		text-align: right;
		color: #555555;
		border: 1px solid #cccccc;
		padding: 6px 12px;
		vertical-align: middle;
	}
	.unit {
		display: table-cell;
		padding: 2px 12px;
		line-height: 1;
		color: #555555;
		text-align: center;
		background-color: #eeeeee;
		border: 1px solid #cccccc;
		border-left: 0;
	}
	.slide {
		margin: 0;
		width: 160px;
	}
	.text {
		position: absolute;
		font-size: 10px;
		font-family: Times New Roman;
		color: #fff;
		z-index: 99;
		font-weight: bold;
		user-select: none;
		background-color: #52c41a;
		border-radius: 5px;
		padding: 2px 4px;
	}
	@keyframes remove {
        100% {
            opacity: 0;
        }
    }
</style>

通过输入框或滑块输入波长与半峰宽（FWHM），底部会同步显示光谱所对应的颜色。左上方、右上方、左下方与右下方的四个色块依次展示了光谱所对应的颜色、HSB亮度100%的颜色、光谱颜色对应的补色以及HSB亮度100%的补色。点击 <i class="far fa-copy"></i> 或右侧色块可拷贝对应颜色至剪贴板。

转换过程默认使用sRGB色彩空间，如需其他色彩空间（如Adobe RGB，ProPhoto RGB或CIE RGB）可在下方进行选择。

<div class="colorSpace">
	<div class="colorSpaceInput"><input type="radio" name="colorSpace" checked="true" onchange="setColorSpace(1)"><span style="white-space: nowrap;">sRGB</span></div>
	<div class="colorSpaceInput"><input type="radio" name="colorSpace" onchange="setColorSpace(2)"><span style="white-space: nowrap;">Adobe RGB</span></div>
	<div class="colorSpaceInput"><input type="radio" name="colorSpace" onchange="setColorSpace(3)"><span style="white-space: nowrap;">ProPhoto RGB</span></div>
	<div class="colorSpaceInput"><input type="radio" name="colorSpace" onchange="setColorSpace(4)"><span style="white-space: nowrap;">CIE RGB</span></div>
</div>

## 波长 ⇨ 颜色
<div class="container">
	<div class="ui">
		<p><b>Wavelength:</b></p>
		<div style="display: table; border-collapse: separate; position: relative;">
			<input class="wavelengthInput" id="wavelengthInput" value="580" onchange="setWavelengthInput(this.value)" /><span class="unit">nm</span>
		</div>
		<span>Coarse Adjustment:</span>
		<input type='range' class='slide' id="wavelengthCoarseSlide" value="580" min="390" max="830" step="1" oninput="setWavelengthCoarse(this.value)"/>
		<span>Fine Adjustment:</span>
		<input type='range' class='slide' id="wavelengthFineSlide" value="0" min="-2" max="2" step="0.1" oninput="setWavelengthFine(this.value)"/>
		<p style="line-height: 1.8;">
			<b>Color:</b><br>
			<i class="far fa-copy" onclick="copyRGB(event)"></i><span>&nbsp;RGB(</span><span id="colorRGB">255,182,0</span><span>)</span><br>
			<i class="far fa-copy" onclick="copyHEX(event)"></i><span>&nbsp;HEX:&nbsp;</span><span id="colorHEX">#ffb600</span>
		</p>
	</div>
	<div class="color1" style="background-color: #ffc600;" id="color" onclick="copyHEX(event)"></div>
	<div class="color2" style="background-color: #ffc600;" id="colorLight" onclick="copyColor(event, this.style.backgroundColor)"></div>
	<div class="color3" style="background-color: #0039ff;" id="complementaryColor" onclick="copyColor(event, this.style.backgroundColor)"></div>
	<div class="color4" style="background-color: #0039ff;" id="complementaryColorLight" onclick="copyColor(event, this.style.backgroundColor)"></div>
</div>

## 高斯峰 ⇨ 颜色

<div class="container">
	<div class="ui">
		<p><b>Wavelength:</b></p>
		<div style="display: table; border-collapse: separate; position: relative;">
			<input class="wavelengthInput" id="gauWavelengthInput" value="580" onchange="setGauWavelengthInput(this.value)" /><span class="unit">nm</span>
		</div>
		<input type='range' class='slide' id="gauWavelengthSlide" value="580" min="390" max="830" step="0.1" oninput="setGauWavelengthSlide(this.value)"/>
		<p><b>FWHM:</b></p>
		<div style="display: table; border-collapse: separate; position: relative;">
			<input class="wavelengthInput" id="FWHMInput" value="80" onchange="setFWHMInput(this.value)" /><span class="unit">nm</span>
		</div>
		<input type='range' class='slide' id="FWHMSlide" value="80" min="1" max="200" step="1" oninput="setFWHMSlide(this.value)"/>
		<p style="line-height: 1.8;">
			<b>Color:</b><br>
			<i class="far fa-copy" onclick="copyGauRGB(event)" ></i><span>&nbsp;RGB(</span><span id="gauColorRGB">255,234,0</span><span>)</span><br>
			<i class="far fa-copy" onclick="copyGauHEX(event)"></i><span>&nbsp;HEX:&nbsp;</span><span id="gauColorHEX">#ffea00</span>
		</p>
	</div>
	<div class="color1" style="background-color: #ffea00;" id="gauColor" onclick="copyGauHEX(event)"></div>
	<div class="color2" style="background-color: #ffea00;" id="gauColorLight" onclick="copyColor(event, this.style.backgroundColor)"></div>
	<div class="color3" style="background-color: #0015ff;" id="gauComplementaryColor" onclick="copyColor(event, this.style.backgroundColor)"></div>
	<div class="color4" style="background-color: #0015ff;" id="gauComplementaryColorLight" onclick="copyColor(event, this.style.backgroundColor)"></div>
</div>

## 计算原理

1931年，根据 Wright 和 Guild 的数据，国际照明委员会（CIE）发布了三刺激函数 $\bar{x},\bar{y},\bar{z}$（图1）用于从给定的光谱计算其对应的颜色。

<div align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8f/CIE_1931_XYZ_Color_Matching_Functions.svg" width="75%" alt="图1：三刺激函数"/></div>
<div align=center><font color="#999999">图1：三刺激函数</font></div>

三刺激函数的使用方法如下。对于一个给定的光谱 $\Lambda(\lambda)$，首先计算积分

$$\begin{align}&X=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{x}(\lambda)\mathrm{d}\lambda\\&Y=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{y}(\lambda)\mathrm{d}\lambda\\&Z=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{z}(\lambda)\mathrm{d}\lambda\end{align}$$

其中 $K_m=683\ \mathrm{lm\cdot W^{-1}}$ 为发光效率。随后将三刺激值归一化并进行线性变换即可得到sRGB空间下的坐标。其他色域颜色间的变换关系可参考[此网站](http://brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html)。

$$\begin{bmatrix}R\\G\\B\end{bmatrix}=\begin{bmatrix}3.2404542&-1.5371385&-0.4985314\\-0.9692660&1.8760108&0.0415560\\0.0556434&-0.2040259&1.0572252\end{bmatrix}\begin{bmatrix}X\\Y\\Z\end{bmatrix}$$

转换后若RGB的一个或多个分量小于0或大于1，也即超过了sRGB的色域范围，需要做近似处理得到sRGB色域能表达的颜色。即将负值近似为0，超过1的值近似为1。

若光谱具有 $\Lambda(\lambda)=\delta(\lambda-\lambda_0)$ 的形式，其中 $\delta$ 为 [Dirac delta function](https://en.wikipedia.org/wiki/Dirac_delta_function)，也即 $\Lambda(\lambda)$ 仅在 $\lambda=\lambda_0$ 处具有一条谱线，则：

$$\begin{align}&X=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{x}(\lambda)\mathrm{d}\lambda=\bar{x}(\lambda_0)K_m\\&Y=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{y}(\lambda)\mathrm{d}\lambda=\bar{y}(\lambda_0)K_m\\&Z=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{z}(\lambda)\mathrm{d}\lambda=\bar{z}(\lambda_0)K_m\end{align}$$
