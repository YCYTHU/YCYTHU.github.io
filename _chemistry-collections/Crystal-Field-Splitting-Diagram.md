---
layout: none
title: 晶体场分裂能计算器
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/crystal tree.jpg
---
<!--more-->

<html>
<head>
	{%- include analytics.html -%}
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="在线计算不同对称性下d轨道的的分裂形式，计算本征态的成分并展示轨道等值面图">
	<title>晶体场分裂能计算器</title>
	<link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.4.2/css/all.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r124/three.min.js" type="text/javascript"></script>
	<script src="/assets/js/Detector.js" type="text/javascript"></script>
	<script src="/assets/js/MarchingCubes.js" type="text/javascript"></script>
	<script src="/assets/js/OrbitControls@2.110.3.js" type="text/javascript"></script>
	<style>
		@font-face {
			font-family: LMMath;
			src: url("/assets/fonts/latinmodern-math/latinmodern-math.otf")
		}
		body {
			margin: 0;
		}
		li {
    		display:inline;
        	user-select: none;
		}
		option {
			font-weight: bold;
		}
		table {
			text-align: center;
			width: 100%;
			font-family: LMMath, Cambria Math, Times New Roman;
		}
		dialog {
			max-width: 900px;
		}
		.greyDiv {
			background-color: #f2f2f2;
		}
		.nav {
			display: flex;
			width: 100%;
			max-width: 950px;
			justify-content: space-between;
			margin: 0 auto;
		}
		.nav_left {
			padding-left: 40px;
			line-height: 50px;
			margin: 0;
		}
		.nav_right {
			padding-left: 0;
			padding-right: 40px;
			line-height: 50px;
			margin: 0;
		}
		.selectDiv {
			display: inline-flex;
		}
		.selectDiv select {
			font-weight: bold;
			font-size: medium;
			text-align: center;
			text-align-last: justify;
	  		border: 2px solid #f2f2f2;
	    	outline: 1px solid #000;
	  		vertical-align: middle;
	  		background: transparent;
	  		-webkit-appearance: none;
	  		appearance: none;
	  		border-radius: 10px;
		}
		.mol-container {
			width: 100%;
			height: 100%;
			position: relative;
		}
		.dataTable {
			border: 1px solid #000;
		}
		.dataTable td {
			border: 1px solid #999;
		}
		#resultsTable {
			height: 100%;
			line-height: 1.5rem;
		}
		#resultsTable thead {
			user-select: none;
			font-weight: bold;
			line-height: 1.8rem;
			font-size: 1.1rem;
		}
		.mathFont {
			font-family: LMMath, Cambria Math, Times New Roman;
		}
		.container {
			display: flex;
			flex-wrap: wrap;
			flex-direction: row;
			justify-content: space-evenly;
			/*height: 480px;*/
			max-width: 950px;
			margin: .5rem auto 0;
			padding: 1rem;
		}
		.infoDiv {
			display: flex;
			flex-wrap: wrap;
			flex-direction: column;
			justify-content: space-evenly;
			margin-bottom: 15px;
		}
		@media (min-width: 0) {
			.infoDiv {
				width: 100%;
			}
			.axesDiv {
				width: 100%;
			}
		}
		@media (min-width: 800px) {
			.infoDiv {
				width: 45%;
			}
			.axesDiv {
				width: 45%;
			}
		}
		.axesDiv {
			/*margin: 10px 10px 10px 5px;
			height: 100%;
			flex: 1 auto 0;*/
			margin-bottom: 20px;
			border: 2px solid #e6e6e6;
			box-shadow: 5px 10px #e6e6e6;
			border-radius: 5px;
		}
		.resultsTableDiv{
			/*flex-grow: 0.5;*/
		}
		.resultsEnergyDiv {
			display: flex;
			flex-wrap: wrap;
			flex-direction: row;
			justify-content: space-between;
			flex-grow: 1;
			margin-top: .5rem;
			align-items: center;
		}
		#highlightInfo {
			font-weight: bold;
			border: 2px solid #e6e6e6;
			border-radius: 5px;
    		box-shadow: 3px 5px #e6e6e6;
    		/*height: 250px;*/
    		width: calc(100% - 1rem);
    		padding: 0.5rem;
    		margin-bottom: 5px;
		}
		#svg {
			border: 2px solid #e6e6e6;
			border-radius: 5px;
    		box-shadow: 3px 5px #e6e6e6;
			padding: 0.5rem;
			width: calc(100% - 1rem);
		}
	</style>
</head>
<body>
	<h1 style="display: none;">晶体场分裂能计算器</h1>
	<div class="greyDiv"><div class="nav">
		<ul class="nav_left">
			<li onclick="openCoordinatesDialog()" title="手动修改配体坐标"><nobr><i class="fas fa-table"></i><b>&nbsp;配体坐标</b>&emsp;</nobr></li>
			<li title="选择预设几何构型"><nobr><i class="fa-solid fa-cubes"></i><b>&nbsp;预设构型：</b><div class="selectDiv"><select id="selectGeometry" onchange="setGeometry(this.value)">
				<option value="custom">&nbsp;自定义&nbsp;</option>
				<option value="linear">&nbsp;直线型&nbsp;</option>
				<option value="triangle">&nbsp;正三角型&nbsp;</option>
				<option value="square planar">&nbsp;平面四方型&nbsp;</option>
				<option value="tetrahedron">&nbsp;正四面体&nbsp;</option>
				<option value="triangular bipyramid">&nbsp;三角双锥&nbsp;</option>
				<option value="octahedron" selected>&nbsp;正八面体&nbsp;</option>
				<option value="pentagonal bipyramidal">&nbsp;五角双锥&nbsp;</option>
				<option value="cubic">&nbsp;立方体&nbsp;</option>
				<option value="square antiprism">&nbsp;四方反棱柱&nbsp;</option>
			</select></div>&emsp;</nobr></li>
			<li onclick="calculate()" title="开始计算晶体场分离能"><nobr><i class="fa-solid fa-calculator"></i><b>&nbsp;开始计算</b></nobr></li>
		</ul>
		<ul class="nav_right">
			<li onclick="openInstructionDialog()" title="点击查看使用说明"><nobr><i class="fa-solid fa-circle-info"></i><b>&nbsp;使用说明</b>&emsp;</nobr></li>
		</ul>
	</div></div>
	<dialog id="coordinatesDialog"><form method="dialog"><center>
		<p><span>配体数量：</span><input id="coordinatesNumber" type="number" min="0" step="1" value="6" onchange="setCoordinatesNumber(this.value)" /></p>
		<p>
			<table class="dataTable" id="coordinatesTable">
				<thead><tr><td>方位角</td><td>极角</td></tr></thead>
				<tbody>
					<tr><td contentEditable="true">0</td><td contentEditable="true">0</td></tr>
					<tr><td contentEditable="true">0</td><td contentEditable="true">pi</td></tr>
					<tr><td contentEditable="true">0</td><td contentEditable="true">pi/2</td></tr>
					<tr><td contentEditable="true">pi/2</td><td contentEditable="true">pi/2</td></tr>
					<tr><td contentEditable="true">pi</td><td contentEditable="true">pi/2</td></tr>
					<tr><td contentEditable="true">3pi/2</td><td contentEditable="true">pi/2</td></tr>
				</tbody>
			</table>
		</p>
		<div>
      		<button value="0">Cancel</button>
      		<button value="1">Confirm</button>
    	</div>
    </center></form></dialog>
    <div class="container">
  		<div class="infoDiv">
  			<div class="resultsTableDiv">
  				<table class="dataTable" id="resultsTable">
    				<thead><tr><td></td><td>Energy (Dq)</td><td>&alpha;<sub>0</sub></td><td>&alpha;<sub>2</sub></td><td>&alpha;<sub>4</sub></td></tr></thead>
    				<tbody>
    					<tr id="orbitalTr1"><td title="点击显示轨道详细信息" style="user-select: none;" onclick="highlightorbital(1)">Orbital 1</td><td>-4</td><td>6</td><td>0</td><td>-2/3</td></tr>
    					<tr id="orbitalTr2"><td title="点击显示轨道详细信息" style="user-select: none;" onclick="highlightorbital(2)">Orbital 2</td><td>-4</td><td>6</td><td>0</td><td>-2/3</td></tr>
    					<tr id="orbitalTr3"><td title="点击显示轨道详细信息" style="user-select: none;" onclick="highlightorbital(3)">Orbital 3</td><td>-4</td><td>6</td><td>0</td><td>-2/3</td></tr>
    					<tr id="orbitalTr4"><td title="点击显示轨道详细信息" style="user-select: none;" onclick="highlightorbital(4)">Orbital 4</td><td>6</td><td>6</td><td>0</td><td>1</td></tr>
    					<tr id="orbitalTr5"><td title="点击显示轨道详细信息" style="user-select: none;" onclick="highlightorbital(5)">Orbital 5</td><td>6</td><td>6</td><td>0</td><td>1</td></tr>
    				</tbody>
    			</table>
  			</div>
  			<div class="resultsEnergyDiv" id="resultsEnergy">
  				<!--<canvas id="canvas"></canvas>-->
  				<svg id="svg" version="1.0" xmlns="http://www.w3.org/2000/svg" width="300px" height="250px" viewBox="0 0 240 200"></svg>
  				<p id="highlightInfo"></p>
  				<!--<path fill="#f70" d="M0 0 h 3.375 V 14.5 h 0.75 V 0 h 3.375 V 18 h -2 V 24 h -3.5 v -6 h -2 L 0 0 M8.25 0 h 7.5 v 9 h -3.375 v -5 h -0.75 V 20 h 0.75 V 9.5 h 3.375 V 24 h -7.5 L 8.25 0 M16.5 0 h 3.375 V 14.5 h 0.75 V 0 h 3.375 V 18 h -2 V 24 h -3.5 v -6 h -2 L 16.5 0"/>-->
  			</div>
  		</div>
  		<div class="axesDiv" id="axesDiv">
  			<div id="molViewDiv"></div>
  		</div>
    </div>
    <dialog id="instructionDialog"><form method="dialog">
		<h3 style="text-align: center;">使用说明</h3>
		<p><h4>功能介绍：</h4>本页面可用于计算不同配位构型下晶体场理论所描述的 <span class="mathFont">d</span> 轨道的分裂情况，计算过程假设配体完全相同且距离中心原子距离相同。</p>
		<p><h4>使用方法：</h4><table style="text-align: left;">
			<tr><td>①点击【配体坐标】可查看并修改所有配体在球坐标系下的坐标，页面右侧（或下方）的可视化区会显示当前配位构型。</td></tr>
			<tr><td>②点击【预设构型】可在下拉菜单中选择页面预先配置完成的常见构型，包括直线型、正四面体、正八面体等。</td></tr>
			<tr><td>③点击【开始计算】即可计算当前构型下晶体场理论所描述的 <span class="mathFont">d</span> 轨道分裂情况。</td></tr>
			<tr><td>④计算结束后页面左上角的表格会显示（更新）每条轨道的详细信息，同时表格下方会显示（更新）能量分裂情况。</td></tr>
			<tr><td>⑤点击表格第一列的轨道编号会在表格下方坐标区中以红色高亮显示对应轨道，并且显示（更新）此轨道的详细信息（包括能量与轨道组成成分等），而且在可视化区域也会显示此轨道的等值面。</td></tr>
		</table></p><!--①②③④⑤⑥⑦⑧⑨⑩-->
		<div style="text-align: center;">
      		<button><i class="fa-regular fa-circle-xmark"></i>&nbsp;关闭窗口</button>
    	</div>
    </form></dialog>
</body>
<script type="text/javascript">
	var scene, camera, renderer, controls;
	var energyRational, energyFloat, orbital, coefficient, orbitalPosition;
	var points = [];
	var isovalue = 0.01, pos_color = 0x9370DB, neg_color = 0xEEE9E9;
	var calculateComplete = false;
	var objArray = [],  meshArray = [];
	var dOrbitalData = [], eigenOrbitalData = [];
	var resolution = 32, axisMin = -15, axisRange = 30;
	var coordinatesDialog = document.getElementById("coordinatesDialog");
	var instructionDialog = document.getElementById("instructionDialog");
	var tableMemory = document.getElementById("coordinatesTable").innerHTML;
	initScene();
	showMol();
	animate();
	genGrid();
	var threeCanvas = document.getElementById("axesDiv").querySelector("canvas");
	threeCanvas.style.outline = "none";

	if (typeof coordinatesDialog.showModal !== "function") {
  		coordinatesDialog.hidden = true;
  	}
  	if (typeof instructionDialog.showModal !== "function") {
  		instructionDialog.hidden = true;
  	}

  	coordinatesDialog.addEventListener("close", () => {
  		if (coordinatesDialog.returnValue == 1)
  			updateCoordinatesTable();
  		else {
  			var table = document.getElementById("coordinatesTable");
  			table.innerHTML = tableMemory;
  			document.getElementById("coordinatesNumber").value = table.getElementsByTagName("tr").length - 1;
  		}
	});

	window.onresize = function() {
		//setCanvasSize();
		//ctx.font = "1rem LMMath";
		var canvasWidth = document.getElementById("axesDiv").clientWidth, canvasHeight = document.getElementById("axesDiv").clientHeight;
		renderer.setSize(canvasWidth, canvasHeight);
		camera.aspect = canvasWidth / canvasHeight;
		camera.updateProjectionMatrix();
	}

	function initScene() {
		scene = new THREE.Scene();
		var canvasWidth = document.getElementById("axesDiv").clientWidth, canvasHeight = document.getElementById("axesDiv").clientHeight;
		var viewAngle = 45, aspect = canvasWidth / canvasHeight, near = 0.1, far = 20000;
		camera = new THREE.PerspectiveCamera(viewAngle, aspect, near, far);
		scene.add(camera);
		camera.position.set(30,0,10);
		camera.lookAt(scene.position);
		if (Detector.webgl)
			renderer = new THREE.WebGLRenderer({antialias:true});
		else
			renderer = new THREE.CanvasRenderer();
		renderer.setSize(canvasWidth, canvasHeight);
		renderer.localClippingEnabled = true;
		renderer.setClearColor(0xffffff, 1);
		document.getElementById('molViewDiv').appendChild(renderer.domElement);
		controls = new THREE.OrbitControls(camera, renderer.domElement);
		controls.enablePan = false;
		const ambientLight = new THREE.AmbientLight(0x404040);
		scene.add(ambientLight);
		const directionalLight = new THREE.DirectionalLight(0xffffff, 0.75);
		directionalLight.position.set(1, 1, 1);
		scene.add(directionalLight);
		var centerGeometry = new THREE.SphereGeometry(1.5, 32, 16);
		var centerMaterial = new THREE.MeshPhongMaterial({color: 0xff7a60});
		var centerSphere = new THREE.Mesh(centerGeometry, centerMaterial);
		scene.add(centerSphere);
	}

	function animate() {
		requestAnimationFrame(animate);
		renderer.render(scene, camera);
		controls.update();
	}

	function displayOrbital(orbitalIndex) {
		if (dOrbitalData.length == 0)
			for (let index = 0; index < 5; index++)
				calcOrbitalWFN(index);
		if (eigenOrbitalData.length == 0)
			eigenOrbitalData = math.multiply(math.transpose(orbital), dOrbitalData);
		meshArray.push(Isosurface(points, eigenOrbitalData[orbitalIndex], isovalue, pos_color));
		meshArray.push(Isosurface(points, eigenOrbitalData[orbitalIndex],-isovalue, neg_color));
	}

	function calcOrbitalWFN(index) {
		dOrbitalData[index] = [];
		var angular;
		for (var k = 0; k < resolution; k++)
			for (var j = 0; j < resolution; j++)
				for (var i = 0; i < resolution; i++) {
					var x = axisMin + axisRange * i / (resolution - 1);
					var y = axisMin + axisRange * j / (resolution - 1);
					var z = axisMin + axisRange * k / (resolution - 1);
					var r = math.sqrt(x * x + y * y + z * z);
					var radial = 2 * math.sqrt(2) / (27 * math.sqrt(5) * math.sqrt(27)) * math.exp(-r / 3);
					switch (index) {
						case 0:
							angular = math.sqrt(15 / Math.PI) / 4 * (x * x - y * y);
							break;
						case 1:
							angular = math.sqrt(15 / Math.PI) / 2 * (x * z);
							break;
						case 2:
							angular = math.sqrt(5 / Math.PI) / 4 * (2 * z * z - x * x - y * y);
							break;
						case 3:
							angular = math.sqrt(15 / Math.PI) / 2 * (y * z);
							break;
						case 4:
							angular = math.sqrt(15 / Math.PI) / 2 * (x * y);
							break;
					}
					dOrbitalData[index].push(radial * angular);
				}
	}

	function genGrid() {
		for (var k = 0; k < resolution; k++)
			for (var j = 0; j < resolution; j++)
				for (var i = 0; i < resolution; i++) {
					var x = axisMin + axisRange * i / (resolution - 1);
					var y = axisMin + axisRange * j / (resolution - 1);
					var z = axisMin + axisRange * k / (resolution - 1);
					points.push(new THREE.Vector3(x / 2, y / 2, z / 2));
				}
	}

	function Isosurface(points, values, isovalue, isocolor) {
		var geometry = MarchingCubes(points, values, isovalue);
		var colorMaterial =  new THREE.MeshPhongMaterial({color: isocolor, side: THREE.DoubleSide, transparent: true, opacity: 0.5});
		var mesh = new THREE.Mesh(geometry, colorMaterial);
		scene.add(mesh);
		return mesh
	}

	function showMol() {
		var simpleGeometry = new THREE.SphereGeometry(1, 32, 16);
		var simpleMaterial = new THREE.MeshPhongMaterial({color: 0xcccccc});

		for (let index = 0; index < objArray.length; index++)
			scene.remove(objArray[index]);
		objArray = [];
		scene.remove(meshArray[0]);
		scene.remove(meshArray[1]);
		meshArray = [];

		var coordinatesArray = math.transpose(table2array());
		var phi = coordinatesArray[0];
		var theta = coordinatesArray[1];
		var cartesianArray = math.multiply(7.5, math.transpose([math.dotMultiply(math.map(theta, math.sin), math.map(phi, math.cos)), math.dotMultiply(math.map(theta, math.sin), math.map(phi, math.sin)), math.map(theta, math.cos)]));

		for (let index = 0; index < cartesianArray.length; index++) {
			objArray.push(new THREE.Mesh(simpleGeometry, simpleMaterial));
			objArray[objArray.length - 1].position.set(cartesianArray[index][0], cartesianArray[index][1], cartesianArray[index][2]);
			scene.add(objArray[objArray.length - 1]);
			objArray.push(createCylinder([cartesianArray[index][0], cartesianArray[index][1], cartesianArray[index][2]]));
			scene.add(objArray[objArray.length - 1]);
		}
	}

	function createCylinder(directionArray) {
		var cylinderGeometry = new THREE.CylinderGeometry(0.3, 0.3, 7.5, 32, 1);
		var cylinder = new THREE.Mesh(cylinderGeometry, new THREE.MeshPhongMaterial({color: 0xeee9e9}));
    	var normalizedDirectionArray = math.divide(directionArray, 7.5);
    	var directionVector = new THREE.Vector3(normalizedDirectionArray[0], normalizedDirectionArray[1], normalizedDirectionArray[2]);
    	cylinder.quaternion.setFromUnitVectors(new THREE.Vector3(0, 1, 0), directionVector);
    	cylinder.position.set(directionArray[0] / 2, directionArray[1] / 2, directionArray[2] / 2);
    	return cylinder;
	}

	function openCoordinatesDialog() {
		if (typeof coordinatesDialog.showModal === "function") {
    		coordinatesDialog.showModal();
    		tableMemory = document.getElementById("coordinatesTable").innerHTML;
  		}
  		else {
    		alert("Sorry, the <dialog> API is not supported by this browser.");
  		}
	}

	function openInstructionDialog() {
		if (typeof instructionDialog.showModal === "function") {
    		instructionDialog.showModal();
  		}
  		else {
    		alert("Sorry, the <dialog> API is not supported by this browser.");
  		}
	}

	function draworbital(energy) {
		var allOrbitalEnergy = energy;
		var energy_class = energy.reduce((obj, num) => [obj[num] = obj[num] || [], obj[num].push(num), obj][2], {});
		energy = Object.keys(energy_class);
		var range = Math.max(...energy) - Math.min(...energy);
		var svg = document.getElementById("svg");
		var text = '';
		orbitalPosition = Array(5);

		text += '<path id=\"axis\" stroke=\"black\" stroke-width=\"2\" d=\"M20 12 L20 200\"/>';
		text += '<polygon id=\"arrow\" points=\"16,12 24,12 20,0\" fill=\"black\" stroke=\"none\"/>'
		var yZero = 40 + 140 * Math.max(...energy) / range;
		text += '<path id=\"zero\" stroke=\"black\" stroke-width=\"2\" stroke-dasharray=\"5, 5\" d=\"M5 ' + yZero.toString() + ' l220 0\" />';
		for (let index = 0; index < energy.length; index ++) {
			var orbitalEnergy = Number(energy[index]);
			var energy_num = energy_class[orbitalEnergy].length;
			var y = 40 + 140 * (Math.max(...energy) - orbitalEnergy) / range;
			switch (energy_num) {
			case 1:
				let orbitalIndex11 = allOrbitalEnergy.indexOf(orbitalEnergy);
				text += '<path id=\"Orbital' + (orbitalIndex11 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M100 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex11] = [100, y];
				break;
			case 2:
				let orbitalIndex21 = allOrbitalEnergy.indexOf(orbitalEnergy);
				text += '<path id=\"Orbital' + (orbitalIndex21 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M75 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex21] = [75, y];
				let orbitalIndex22 = allOrbitalEnergy.indexOf(orbitalEnergy, orbitalIndex21 + 1);
				text += '<path id=\"Orbital' + (orbitalIndex22 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M125 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex22] = [125, y];
				break;
			case 3:
				let orbitalIndex31 = allOrbitalEnergy.indexOf(orbitalEnergy);
				text += '<path id=\"Orbital' + (orbitalIndex31 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M50 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex31] = [50, y];
				let orbitalIndex32 = allOrbitalEnergy.indexOf(orbitalEnergy, orbitalIndex31 + 1);
				text += '<path id=\"Orbital' + (orbitalIndex32 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M100 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex32] = [100, y];
				let orbitalIndex33 = allOrbitalEnergy.indexOf(orbitalEnergy, orbitalIndex32 + 1);
				text += '<path id=\"Orbital' + (orbitalIndex33 + 1).toString() + '\" stroke=\"black\" stroke-width=\"2\" stroke-linecap=\"round\" d=\"M150 ' + y.toString() + ' l30 0\" />';
				orbitalPosition[orbitalIndex33] = [150, y];
				break;
			}
		}
		svg.innerHTML = text;
	}

	function draworbitalInfo(index) {
		var info = document.getElementById("highlightInfo");
		if (energyRational[index].includes('/'))
			text1 = "轨道能量：<br><table><tr><td>" + energyRational[index] + " Dq</td></tr><tr><td>≈ " + energyFloat[index] + " Dq</td></tr></table>";
		else
			text1 = "轨道能量：<br><table><tr><td>" + energyRational[index] + " Dq</td></tr></table>";
		var orbital_coefficient = math.transpose(orbital)[index];
		var orbital_basis = ["% d<sub>x<sup>2</sup>−y<sup>2</sup></sub>", "% d<sub>xz</sub>", "% d<sub>z<sup>2</sup>", "% d<sub>yz</sub>", "% d<sub>xy</sub>"];
		var text2 = "<br><table>"
		for (let orbital_index = 0; orbital_index < 5; orbital_index++) {
			if (orbital_coefficient[orbital_index] == 0)
				continue;
			text2 += "<tr><td>" + (100 * orbital_coefficient[orbital_index] ** 2).toFixed(1) + orbital_basis[orbital_index] + "</td></tr>";
		}
		text2 += "</table>"
		info.innerHTML = text1 + "<br>轨道成分：" + text2;
	}

  	function highlightorbital(index) {
  		if (!calculateComplete)
			return;
  		var tr = document.getElementById('orbitalTr' + index);
  		var flg = tr.style.backgroundColor == '';
  		var orbital;
  		var svg = document.getElementById("svg");
  		for (var nIndex = 1; nIndex <= 5; nIndex++) {
  			tr = document.getElementById('orbitalTr' + nIndex);
  			tr.style.backgroundColor = '';
  			tr.style.fontWeight = '';
  			orbital = svg.querySelector('#Orbital' + nIndex);
  			newText = orbital.outerHTML.replace('red', 'black');
  			newText = newText.replace('stroke-width=\"4\"', 'stroke-width=\"2\"');
  			orbital.outerHTML = newText;
  			scene.remove(meshArray[0]);
  			scene.remove(meshArray[1]);
  			meshArray = [];
  		}
  		tr = document.getElementById('orbitalTr' + index);
  		svg = document.getElementById("svg");
  		orbital = svg.querySelector('#Orbital' + index);
  		if (flg) {
  			tr.style.backgroundColor = '#e6e6e6';
  			tr.style.fontWeight = 'bold';
  			draworbitalInfo(index - 1);
  			newText = orbital.outerHTML.replace('black', 'red');
  			newText = newText.replace('stroke-width=\"2\"', 'stroke-width=\"4\"');
  			orbital.outerHTML = newText;
  			displayOrbital(index - 1);
  		}
  	}

	function updateCoordinatesTable() {
		//coordinatesArray = math.transpose(table2array());
		if (document.getElementById("coordinatesTable").innerHTML == tableMemory)
			return;
		document.getElementById("selectGeometry").options[0].selected = true;
		calculateComplete = false;
        showMol();
	}

	function setCoordinatesNumber(newValue) {
		var table = document.getElementById("coordinatesTable");
		var oldValue = table.rows.length - 1;
		if (newValue > oldValue) {
			for (let i = oldValue; i < newValue; i++) {
				var row =  table.insertRow(i + 1);
				row.innerHTML = "<td contentEditable=\"true\">0</td><td contentEditable=\"true\">0</td>";
			}
		}
		else {
			for (let i = oldValue; i > newValue; i--)
				table.deleteRow(i);
		}
		showMol();
	}

	function setGeometry(geometry) {
		switch (geometry) {
			case 'custom':
				break;
			case 'linear':
				fillTable(2, ['0','0','0','pi']);
				break;
			case 'triangle':
				fillTable(3, ['0', 'pi/2', '2*pi/3', 'pi/2', '4*pi/3', 'pi/2']);
				break;
			case 'square planar':
				fillTable(4, ['0', 'pi/2', 'pi/2', 'pi/2', 'pi', 'pi/2', '3*pi/2', 'pi/2']);
				break;
			case 'tetrahedron':
				fillTable(4, ['0', 'acos(sqrt(1/3))', 'pi', 'acos(sqrt(1/3))', '3*pi/2', 'acos(-sqrt(1/3))', 'pi/2', 'acos(-sqrt(1/3))']);
				break;
			case 'triangular bipyramid':
				fillTable(5, ['0', '0', '0', 'pi', '0', 'pi/2', '2*pi/3', 'pi/2', '4*pi/3', 'pi/2']);
				break;
			case 'octahedron':
				fillTable(6, ['0', '0', '0', 'pi', '0', 'pi/2', 'pi/2', 'pi/2', 'pi', 'pi/2', '3*pi/2', 'pi/2']);
				break;
			case 'pentagonal bipyramidal':
				fillTable(7, ['0', '0', '0', 'pi', '0', 'pi/2', '2*pi/5', 'pi/2', '4*pi/5', 'pi/2', '6*pi/5', 'pi/2', '8*pi/5', 'pi/2']);
				break;
			case 'cubic':
				fillTable(8, ['0', 'asin(sqrt(2/3))', 'pi/2', 'asin(sqrt(2/3))', 'pi', 'asin(sqrt(2/3))', '3*pi/2', 'asin(sqrt(2/3))', '0', 'pi-asin(sqrt(2/3))', 'pi/2', 'pi-asin(sqrt(2/3))', 'pi', 'pi-asin(sqrt(2/3))', '3*pi/2', 'pi-asin(sqrt(2/3))']);
				break;
			case 'square antiprism':
				fillTable(8, ['0', 'asin(sqrt(2/3))', 'pi/2', 'asin(sqrt(2/3))', 'pi', 'asin(sqrt(2/3))', '3*pi/2', 'asin(sqrt(2/3))', 'pi/4', 'pi-asin(sqrt(2/3))', '3*pi/4', 'pi-asin(sqrt(2/3))', '5*pi/4', 'pi-asin(sqrt(2/3))', '7*pi/4', 'pi-asin(sqrt(2/3))']);
				break;
		}
		showMol();
		calculateComplete = false;
	}

	function fillTable(number, coordinates) {
		document.getElementById("coordinatesNumber").value = number;
		setCoordinatesNumber(number);
		var table = document.getElementById("coordinatesTable");
		for (let row_index = 1; row_index <= number; row_index++) {
			table.rows[row_index].cells[0].innerHTML = coordinates[2 * row_index - 2];
			table.rows[row_index].cells[1].innerHTML = coordinates[2 * row_index - 1];
		}
	}

	function table2array() {
		var array = Array();
		var table = document.getElementById("coordinatesTable");
		var row_number = table.rows.length - 1;
		for (let row_index = 1; row_index <= row_number; row_index++)
				array[row_index - 1] = [math.evaluate(table.rows[row_index].cells[0].innerHTML), math.evaluate(table.rows[row_index].cells[1].innerHTML)];
  		return array;
	}

	function showResult(energy, coefficient, number) {
		var table = document.getElementById("resultsTable");
		for (let index = 1; index <= 5; index++) {
			table.rows[index].cells[1].innerHTML = energy[index - 1];
			table.rows[index].cells[2].innerHTML = number.toString();
			table.rows[index].cells[3].innerHTML = coefficient[index - 1][0];
			table.rows[index].cells[4].innerHTML = coefficient[index - 1][1];
		}
	}

	function calculate() {
		eigenOrbitalData = [];
		var coordinatesArray = math.transpose(table2array());
		var phi = coordinatesArray[0];
		var theta = coordinatesArray[1];
		var cos_phi = math.map(phi, math.cos);
		var cos_theta = math.map(theta, math.cos);
		var cos_theta_square = math.dotPow(math.map(theta, math.cos), 2);
		var sin_theta = math.map(theta, math.sin);

		var number = phi.length;
		var b = [[12],[1]];
		var c = [[6],[1]];

		{
		let D_00_m = [new Array(number).fill(0), new Array(number).fill(0)];
		let D_20_m = math.multiply(b, Array(math.subtract(math.multiply(3, cos_theta_square), 1)));
        let D_40_m = math.multiply(c, Array(math.add(math.subtract(math.multiply(35/3, math.dotPow(cos_theta,4)), math.multiply(10, cos_theta_square)),1)));
        let D_21_m = math.multiply(b, Array(math.dotMultiply(math.dotMultiply(sin_theta, cos_theta), cos_phi)));
        let D_22_m = math.multiply(b, Array(math.dotMultiply(sin_theta, math.map(math.multiply(2, phi), math.cos))));
        let D_41_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotMultiply(sin_theta, cos_theta), math.subtract(math.multiply(7/3, cos_theta_square), 1)), cos_phi)));
        let D_42_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotPow(sin_theta, 2), math.subtract(math.multiply(7, cos_theta_square), 1)), math.map(math.multiply(2, phi), math.cos))));
        let D_43_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotPow(sin_theta, 3), cos_theta), math.map(math.multiply(3, phi), math.cos))));
        let D_44_m = math.multiply(c, Array(math.dotMultiply(math.dotPow(sin_theta, 4), math.map(math.multiply(4, phi), math.cos))));
        let G_21_m = math.dotMultiply(b, Array(math.dotMultiply(math.dotMultiply(sin_theta, cos_theta), math.map(math.multiply(2, phi), math.sin))));
        let G_22_m = math.dotMultiply(b, Array(math.dotMultiply(math.dotPow(sin_theta, 2), math.map(math.multiply(2, phi), math.sin))));
        let G_41_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotMultiply(sin_theta, cos_theta), math.subtract(math.multiply(7/3, cos_theta_square), 1)), math.map(phi, math.sin))));
        let G_42_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotPow(sin_theta, 2), math.subtract(math.multiply(7, cos_theta_square), 1)), math.map(math.multiply(2, phi), math.sin))));
        let G_43_m = math.multiply(c, Array(math.dotMultiply(math.dotMultiply(math.dotPow(sin_theta, 3), cos_theta), math.map(math.multiply(3, phi), math.sin))));
        let G_44_m = math.multiply(c, Array(math.dotMultiply(math.dotPow(sin_theta, 4), math.map(math.multiply(4, phi), math.sin))));

        var D_00 = math.sum(D_00_m, 1);
        var D_20 = math.sum(D_20_m, 1);
        var D_40 = math.sum(D_40_m, 1);
        var D_21 = math.sum(D_21_m, 1);
        var D_22 = math.sum(D_22_m, 1);
        var D_41 = math.sum(D_41_m, 1);
        var D_42 = math.sum(D_42_m, 1);
        var D_43 = math.sum(D_43_m, 1);
        var D_44 = math.sum(D_44_m, 1);
        var G_21 = math.sum(G_21_m, 1);
        var G_22 = math.sum(G_22_m, 1);
        var G_41 = math.sum(G_41_m, 1);
        var G_42 = math.sum(G_42_m, 1);
        var G_43 = math.sum(G_43_m, 1);
        var G_44 = math.sum(G_44_m, 1);
    	}

    	var H_11 = math.add(math.add(math.subtract(D_00, math.divide(D_20, 7)), math.divide(D_40, 56)), math.multiply(5/24, D_44));
        var H_12 = math.add(math.subtract(math.multiply(3/7, D_21), math.multiply(5/28, D_41)), math.multiply(5/12, D_43));
        var H_13 = math.subtract(math.multiply(5*math.sqrt(3)/84, D_42), math.multiply(math.sqrt(3)/7, D_22));
        var H_14 = math.subtract(math.add(math.multiply(5/28, G_41), math.multiply(5/12, G_43)), math.multiply(3/7, G_21));
        var H_15 = math.multiply(5/24, G_44);
        var H_22 = math.add(math.add(math.subtract(math.add(D_00, math.divide(D_20, 14)), math.divide(D_40, 14)), math.multiply(3/14, D_22)), math.multiply(5/42, D_42));
        var H_23 = math.add(math.multiply(math.sqrt(3)/7, D_21), math.multiply(5*math.sqrt(3)/14, D_41));
        var H_24 = math.add(math.multiply(3/14, G_22), math.multiply(5/42, G_42));
        var H_25 = math.add(math.subtract(math.multiply(3/7, G_21), math.multiply(5/28, G_41)), math.multiply(5/12, G_43));
        var H_33 = math.add(math.add(D_00, math.divide(D_20, 7)), math.multiply(3/28, D_40));
        var H_34 = math.add(math.multiply(math.sqrt(3)/7, G_21), math.multiply(5*math.sqrt(3)/14, G_41));
        var H_35 = math.subtract(math.multiply(5*math.sqrt(3)/84, G_42), math.multiply(math.sqrt(3)/7, G_22));
        var H_44 = math.subtract(math.subtract(math.subtract(math.add(D_00, math.divide(D_20, 14)), math.divide(D_40, 14)), math.multiply(3/14, D_22)), math.multiply(5/42, D_42));
        var H_45 = math.subtract(math.subtract(math.multiply(3/7, D_21), math.multiply(5/28, D_41)), math.multiply(5/12, D_43));
        var H_55 = math.subtract(math.add(math.subtract(D_00, math.divide(D_20, 7)), math.divide(D_40, 56)), math.multiply(5/24, D_44));

        var Hamilton = Array(Array(), Array());
        Hamilton[0] = [[H_11[0], H_12[0], H_13[0], H_14[0], H_15[0]], [H_12[0], H_22[0], H_23[0], H_24[0], H_25[0]], [H_13[0], H_23[0], H_33[0], H_34[0], H_35[0]], [H_14[0], H_24[0], H_34[0], H_44[0], H_45[0]], [H_15[0], H_25[0], H_35[0], H_45[0], H_55[0]]];
        Hamilton[1] = [[H_11[1], H_12[1], H_13[1], H_14[1], H_15[1]], [H_12[1], H_22[1], H_23[1], H_24[1], H_25[1]], [H_13[1], H_23[1], H_33[1], H_34[1], H_35[1]], [H_14[1], H_24[1], H_34[1], H_44[1], H_45[1]], [H_15[1], H_25[1], H_35[1], H_45[1], H_55[1]]];
        console.log(Hamilton[0]);
        var energy = [math.eigs(Hamilton[0]), math.eigs(Hamilton[1]).values];
        orbital = energy[0].vectors;
        energy[0] = energy[0].values;
        energyFloat = math.round(energy[0], 4);
        draworbital(energyFloat);
        coefficient = math.multiply(math.transpose(energy), [[1/6, -1/6], [-1, 2]]);
        coefficient = rats2(math.round(coefficient, 15));
        energyRational = rats1(math.re(energy[0]));
        showResult(energyRational, coefficient, number);
        calculateComplete = true;
        console.log(orbital, energy[0]);
	}

	function rats1(array) {
		array.forEach(function (item, index) {
			var rn = rat(item);
			if (rn[1] == 1) {
				array[index] = rn[0].toString();
			}
			else {
				array[index] = rn[0].toString() + '/' + rn[1].toString();
			}
		})
		return array;
	}

	function rats2(array) {
		array.forEach(function (child, index) {
			child.forEach(function (item, index) {
				var rn = rat(item);
				if (rn[1] == 1) {
					child[index] = rn[0].toString();
				}
				else {
					child[index] = rn[0].toString() + '/' + rn[1].toString();
				}
			})
		})
		return array;
	}

	function rat(x, tol = 1e-6, max_cycle = 20) {
    	tol = Math.abs(tol * x);
    	var num = x;
    	var C = [[1, 0], [0, 1]];
    	var d = Array();
    	for (let index = 0; index < max_cycle; index++) {
    	    d[index] = Math.round(x);
    	    if (isFinite(x)) {
    	        x = x - d[index];
    	        C = math.transpose([math.transpose(math.multiply(C, [[d[index]], [1]]))[0], math.transpose(C)[0]]);
    	    }
    	    else {
    	        C = math.transpose([[x, 0], math.transpose(C)[0]]);
    	    }
    	    if (x == 0 || Math.abs(C[0][0] / C[1][0] - num) <= Math.max(tol, Math.abs(num * Number.EPSILON)))
    	        break;
    	    x = 1 / x;
    	}
    	var N = C[0][0] / Math.sign(C[1][0]);
    	var D = Math.abs(C[1][0]);
    	return [N, D];
	}
</script>
</html>