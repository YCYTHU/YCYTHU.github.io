---
title: 色彩辨识度测试
tags: 
- Color
- Code
- JavaScript
cover: /assets/images/color distinguish ability.jpg
---
<!--more-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
<style>
	#box {
		width: 415px;
		height: 415px;
		margin: 0 auto;
	}
	#box span {
		display: block;
		margin: 0.25%;
		border-radius: 5px;
		float: left;
		width: 12%;
		height: 12%;
		background-color: rgb(116, 71, 33);
	}
</style>
<body>
	<div style="margin: 10px auto;text-align: center;font-size: xxx-large;font-family: Georgia;"><span>count:</span><span id="count"></span></div>
	<div id="box">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
	</div>
</body>
<script>
	const divBox = document.getElementById('box');
	const spanAll = document.querySelectorAll('#box span');
	const spanCount = document.getElementById('count');
	const XYZ2RGB = [[3.2404542,-1.5371385,-0.4985314],[-0.9692660,1.8760108,0.0415560],[0.0556434,-0.2040259,1.0572252]];
	const RGB2XYZ = [[0.4124564,0.3575761,0.1804375],[0.2126729,0.7151522,0.0721750],[0.0193339,0.1191920,0.9503041]];
	var counts = 0;
	refresh();
	function refresh() {
		var XYZ = getRdmColor();
		var RGB = math.multiply(XYZ2RGB, XYZ);
		for (let index = 0; index < spanAll.length; index++) {
			spanAll[index].style.backgroundColor = 'rgb(' + RGB[0].toString() + ', ' + RGB[1].toString() + ', ' +RGB[2].toString() + ')';
		}
		var luckIndex = Math.round(63 * Math.random());
		var luckXYZ = getLuckColor(XYZ, 20);
		let luckRGB = math.multiply(XYZ2RGB, luckXYZ);
		//console.log(RGB,luckRGB);
		spanAll[luckIndex].style.backgroundColor = 'rgb(' + luckRGB[0].toString() + ', ' + luckRGB[1].toString() + ', ' + luckRGB[2].toString() + ')';
		spanAll[luckIndex].onclick = success;
		spanCount.innerHTML = counts.toString();
	}
	function success() {
		counts ++;
		refresh();
	}
	function getRdmColor() {
		let r = 255 * Math.random();
		let g = 255 * Math.random();
		let b = 255 * Math.random();
		return math.multiply(RGB2XYZ, [r, g, b]);
	}
	function getLuckColor(XYZ, diff) {
		var dx = randn();
		var dy = randn();
		var dz = randn();
		var norm = Math.sqrt(dx**2 + dy**2 + dz**2) / diff;
		dx /= norm;
		dy /= norm;
		dz /= norm;
		return math.add(XYZ, [dx, dy, dz]);
	}
	function randn() {
    	var u1 = Math.random();
    	var u2 = Math.random();
    	var z0 = Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2.0 * Math.PI * u2);
    	return z0;
    }
</script>
