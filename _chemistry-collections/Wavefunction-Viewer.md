---
layout: none
title: 氢原子波函数
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/nebula.jpg
---
<!--more-->

<html>
<head>
	{%- include analytics.html -%}
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="在线观察氢原子本征态波函数等值面图，原理上支持预览的主量子数无上限，可分别观看实部与虚部在空间中的分布">
	<title>Hydrogen Wavefunction Viewer</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r124/three.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/stats-js@1.0.1/build/stats.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.7.9/dat.gui.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/Detector.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/FullScreen.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/wavefunction.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/WindowResize.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/MarchingCubes.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/OrbitControls@2.110.3.min.js" type="text/javascript"></script>
	<style>
		.red_light {
			border: none;
			border-radius: 10px;
			padding: 10px 10px;
			background-color: #fc4d50;
			box-shadow: 0 0 10px #fc4d50,0 0 20px #fc4d50,0 0 60px #fc4d50;
			animation-name: breath;
			animation-duration: 0.5s;
			animation-timing-function: ease-in-out;
			animation-iteration-count: infinite;
		}
		.green_light {
			border: none;
			border-radius: 10px;
			padding: 10px 10px;
			background-color: #52c41a;
			box-shadow: 0 0 10px #52c41a,0 0 20px #52c41a,0 0 40px #52c41a;
			animation-name: breath;
			animation-duration: 3s;
			animation-timing-function: ease-in-out;
			animation-iteration-count: infinite;
		}
		body {
			margin: 0px;
			/*overflow: hidden;*/
		}
		@keyframes breath {
			from {
				opacity: 0.2;
			}
			50% {
				opacity: 1.0;
			}
			to {
				opacity: 0.2;
			}
		}
	</style>
</head>
<body>
	<h1 style="display: none;">氢原子波函数</h1>
	<div id="ThreeJS"></div>
	<div id="Stats" style="position: absolute; top: 0px; left: 0px;"></div>
	<!--<div style="position: absolute; width: 50px; height: 48px; top: 0px; left: 80px; background-color: #0f0f2e;">
		<button style="position: absolute; top: 13px; left: 13px;" id="indicator" class="green_light"></button>
	</div>-->
</body>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/wavefunction/main.js" type="text/javascript"></script>
</html>
