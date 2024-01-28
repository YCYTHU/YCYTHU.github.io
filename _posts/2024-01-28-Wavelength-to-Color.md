---
title: 将波长或光谱转换为sRGB颜色
tags: 
- Code
- JavaScript
cover: /assets/images/hückel method/cover.jpg
---

<!--more-->
<style>
	.container {
		display: table;
    	width: 100%;
	}
	.color {
		display: table-cell;
	}
	.ui {
		display: table-cell;
		padding: 5px 20px;
		background-color: #efefef;
		box-sizing: border-box;
		width: 200px;
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
</style>

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
			<i class="far fa-copy" onclick="copyRGB()" ></i><span>&nbsp;RGB(</span><span id="colorRGB">255,182,0</span><span>)</span><br>
			<i class="far fa-copy" onclick="copyHEX()"></i><span>&nbsp;HEX:&nbsp;</span><span id="colorHEX">#ffb600</span>
		</p>
	</div>
	<div class="color" style="background-color: #ffc600;" id="color" onclick="copyHEX()"></div>
	<div class="color" style="background-color: #ffc600;" id="colorLight" onclick="copyColor(this.style.backgroundColor)"></div>
	<div class="color" style="background-color: #0039ff;" id="complementaryColor" onclick="copyColor(this.style.backgroundColor)"></div>
	<!--<div class="color" style="background-color: #34b6d0;" id="complementaryColorLight"></div>-->
</div>


## 高斯峰 ⇨ 颜色


## 计算原理

1931年，根据 Wright 和 Guild 的数据，国际照明委员会（CIE）发布了三刺激函数 $\bar{x},\bar{y},\bar{z}$（图1）用于从给定的光谱计算其对应的颜色。

<div align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8f/CIE_1931_XYZ_Color_Matching_Functions.svg" width="75%"/></div>
<div align=center><font color="#999999">图1：三刺激函数</font></div>

三刺激函数的使用方法如下。对于一个给定的光谱 $\Lambda(\lambda)$，首先计算积分

$$\begin{align}&X=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{x}(\lambda)\mathrm{d}\lambda\\&Y=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{y}(\lambda)\mathrm{d}\lambda\\&Z=K_m\int_0^{+\infty}\Lambda(\lambda)\bar{z}(\lambda)\mathrm{d}\lambda\end{align}$$

其中 $K_m=683\ \mathrm{lm\cdot W^{-1}}$ 为发光效率。随后将三刺激值归一化并进行线性变换即可得到sRGB空间下的坐标。其他色域颜色间的变换关系可参考[此网站](http://brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html)。

$$\begin{bmatrix}R\\G\\B\end{bmatrix}=\begin{bmatrix}3.2404542&-1.5371385&-0.4985314\\-0.9692660&1.8760108&0.0415560\\0.0556434&-0.2040259&1.0572252\end{bmatrix}\begin{bmatrix}X\\Y\\Z\end{bmatrix}$$

转换后若RGB的一个或多个分量小于0或大于1，也即超过了sRGB的色域范围，需要做近似处理得到sRGB色域能表达的颜色。即将负值近似为0，超过1的值近似为1。

若光谱具有 $\Lambda(\lambda)=\delta(\lambda-\lambda_0)$ 的形式，其中 $\delta$ 为 [Dirac delta function](https://en.wikipedia.org/wiki/Dirac_delta_function)，也即 $\Lambda(\lambda)$ 仅在 $\lambda=\lambda_0$ 处具有一条谱线，则：

$$\begin{align}&X=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{x}(\lambda)\mathrm{d}\lambda=\bar{x}(\lambda_0)K_m\\&Y=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{y}(\lambda)\mathrm{d}\lambda=\bar{y}(\lambda_0)K_m\\&Z=K_m\int_0^{+\infty}\delta(\lambda-\lambda_0)\bar{z}(\lambda)\mathrm{d}\lambda=\bar{z}(\lambda_0)K_m\end{align}$$

<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
<script src="/assets/js/tristimulus.js" type="text/javascript"></script>
<script>
	var wavelength = 580, coarseWavelength = 580;
	const RGB2HEX = (r, g, b) => ((r << 16) + (g << 8) + b).toString(16).padStart(6, '0');
	function setWavelengthInput(wl) {
		wavelength = Number(wl);
		coarseWavelength = wavelength;
		var wavelengthCoarseSlide = document.getElementById("wavelengthCoarseSlide");
		var wavelengthFineSlide = document.getElementById("wavelengthFineSlide");
		wavelengthCoarseSlide.value = wavelength;
		wavelengthFineSlide.value = 0;
		wl2c(wavelength);
	}
	function setWavelengthCoarse(wl) {
		wavelength = Number(wl);
		coarseWavelength = wavelength;
		var wavelengthInput = document.getElementById("wavelengthInput");
		var wavelengthFineSlide = document.getElementById("wavelengthFineSlide");
		wavelengthInput.value = wavelength;
		wavelengthFineSlide.value = 0;
		wl2c(wavelength);
	}
	function setWavelengthFine(offset) {
		wavelength = coarseWavelength
		wavelength += Number(offset);
		var wavelengthInput = document.getElementById("wavelengthInput");
		var wavelengthCoarseSlide = document.getElementById("wavelengthCoarseSlide");
		wavelengthInput.value = wavelength;
		wavelengthCoarseSlide.value = wavelength;
		wl2c(wavelength);
	}
	function wl2c(wl) {
		var index = Math.round((wl - 390) / 0.1);
		var XYZ = normalize(xyz[index].slice(-3));
		var RGB = math.multiply(XYZ2RGB, XYZ);

		RGB = math.round(scale(RGB));
		var colorDiv = document.getElementById("color");
		colorDiv.style.backgroundColor = 'rgb(' + RGB + ')';
		colorRGB = document.getElementById("colorRGB");
		colorRGB.innerHTML = RGB;
		colorHEX = document.getElementById("colorHEX");
		colorHEX.innerHTML = '#' + RGB2HEX(RGB[0], RGB[1], RGB[2]);

		var RGBLight = math.multiply(255, normalize(RGB));
		var colorLightDiv = document.getElementById("colorLight");
		colorLightDiv.style.backgroundColor = 'rgb(' + RGBLight + ')';

		var cplyRGB = math.subtract([255,255,255], RGB);
		var complementaryColorDiv = document.getElementById("complementaryColor");
		complementaryColorDiv.style.backgroundColor = 'rgb(' + cplyRGB + ')';

		//var cplyRGBLight = math.multiply(255, normalize(cplyRGB));
		//var complementaryColorLightDiv = document.getElementById("complementaryColorLight");
		//complementaryColorLightDiv.style.backgroundColor = 'rgb(' + cplyRGBLight + ')';
	}
	function scale(array) {
		var ans = [];
		array.forEach(function (element, index, arr) {
			if (element < 0)
				ans[index] = 0;
			else if (element > 1)
				ans[index] = 255;
			else
				ans[index] = 255 * element;
		})
		return ans;
	}
	function normalize(array) {
		var ans = [];
		var max = Math.max(...array);
		array.forEach(function (element, index) {
			ans[index] = element / max;
		});
		return ans;
	}
	function copy(text) {
		var copyipt = document.createElement("input");
		copyipt.setAttribute("value", text);
		document.body.appendChild(copyipt);
		copyipt.select();
		document.execCommand("copy");
		document.body.removeChild(copyipt);
	}
	function copyRGB() {
		var text = document.getElementById("colorRGB").innerHTML;
		copy(text);
	}
	function copyHEX() {
		var text = document.getElementById("colorHEX").innerHTML;
		copy(text);
	}
	function copyColor(rgb) {
		rgb = rgb.substring(4, rgb.length - 1);
		RGB = rgb.split(',');
		RGB = RGB.map(Number);
		var text = '#' + RGB2HEX(RGB[0], RGB[1], RGB[2]);
		copy(text);
	}
</script>