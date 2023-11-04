---
layout: none
title: 晶体场分裂能计算器
cover: /assets/images/symmetry.jpg
---
<!--more-->

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>CFSD</title>
	<link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.4.2/css/all.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
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
		canvas {
			height: 200px;
		}
		.nav {
			width: 100%;
	    	/*height: 50px;*/
		}
		.nav_left {
			background-color: #f2f2f2;
			line-height: 50px;
			margin: 0;
		}
		.selectDiv {
			display: inline-flex;
			/*display: inline-block;
			align-items: center;
			line-height: 50px;*/
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
	  		/*width: 75px;*/
	  		-webkit-appearance: none;
	  		appearance: none;
	  		/*padding-left: 5px;*/
	  		border-radius: 10px;
		}
		.dataTable {
			border: 1px solid #000;
		}
		.dataTable td {
			border: 1px solid #999;
		}
		#resultsTable thead {
			user-select: none;
			font-weight: bold;
		}
		#resultsTable td {
			line-height: 25px;
		}
		.container {
			margin: 10px;
			display: flex;
			flex-wrap: wrap;
			flex-direction: row;
			justify-content: space-evenly;
			height: 480px;
		}
		.infoDiv {
			display: flex;
			flex-wrap: wrap;
			flex-direction: column;
			width: 600px;
			justify-content: space-evenly;
		}
		.axesDiv {
			/*margin: 10px 10px 10px 5px;*/
			width: 500px;
			background-color: #00ff0022;
		}
		.resultsTableDiv{
			/*margin: 10px 5px 5px 10px;*/
		}
		.resultsEnergyDiv {
			margin-top: 20px;
			display: flex;
			flex-wrap: wrap;
			flex-direction: row;
			justify-content: space-evenly;
		}
		#highlightInfo {
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="nav">
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
	</div>
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
  			<div class="resultsEnergyDiv">
  				<canvas id="canvas"></canvas>
  				<p id="highlightInfo"></p>
  			</div>
  		</div>
  		<div class="axesDiv"></div>
    </div>
    <!--<dialog id="geometryDialog"><form method="dialog"><center>
		<p>
			<input type="radio" id="Custom" name="selectGeometry" value="Custom"/><label for="Custom">Custom</label>
			<input type="radio" id="Linear" name="selectGeometry" value="Linear"/><label for="tLinearet">Linear</label>
			<input type="radio" id="Triangle" name="selectGeometry" value="Triangle"/><label for="Triangle">Triangle</label>
		</p>
		<div>
      		<button value="0">Cancel</button>
      		<button value="1">Confirm</button>
    	</div>
    </center></form></dialog>-->
</body>
<script type="text/javascript">
	//var coordinatesArray;
	var energyRational, energyFloat, orbital, coefficient, orbitalPosition;
	var canvas = document.getElementById('canvas');
	canvas.width = "230";
	canvas.height = "200";
	var ctx = canvas.getContext("2d");
	ctx.font = "16px LMMath";
	var coordinatesDialog = document.getElementById("coordinatesDialog");
	var geometryDialog = document.getElementById("geometryDialog");
	var tableMemory = document.getElementById("coordinatesTable").innerHTML;
	//var selectGeometry = document.getElementsByName("selectGeometry");

	if (typeof coordinatesDialog.showModal !== "function") {
  		coordinatesDialog.hidden = true;
  	}
  	//if (typeof geometryDialog.showModal !== "function") {
  	//	geometryDialog.hidden = true;
  	//}

  	//document.querySelectorAll('input[name="selectGeometry"]').forEach((element) => {
    //	element.addEventListener("change", function(event) {
    //  		var geometry = event.target.value;
    //  		console.log(geometry);
    //	});
  	//});

  	coordinatesDialog.addEventListener("close", () => {
  		if (coordinatesDialog.returnValue == 1)
  			//console.log('Confirm');
  			updateCoordinatesTable();
  		else {
  			var table = document.getElementById("coordinatesTable");
  			table.innerHTML = tableMemory;
  			document.getElementById("coordinatesNumber").value = table.getElementsByTagName("tr").length - 1;
  		}
	});

	function draworbital(energy) {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		orbitalPosition = [];
		ctx.fillStyle = '#000';
		ctx.shadowBlur = 0;
		ctx.beginPath();
		ctx.moveTo(20, 200);
		ctx.lineTo(20, 0);
		ctx.lineTo(15, 10);
		ctx.moveTo(20, 0);
		ctx.lineTo(25, 10);
		ctx.fillText('Energy (Dq)', 30, 20);
		ctx.stroke();
		var energy_class = energy.reduce((obj, num) => [obj[num] = obj[num] || [], obj[num].push(num), obj][2], {});
		energy = Object.keys(energy_class);
		var range = Math.max(...energy) - Math.min(...energy);
		for (let index = 0; index < energy.length; index ++) {
			var orbitalenergy = Number(energy[index]);
			var energy_num = energy_class[orbitalenergy].length;
			var y = 40 + 140 * (Math.max(...energy) - orbitalenergy) / range;
			switch (energy_num) {
			case 1:
				ctx.fillRect(100, y, 30, 2);
				ctx.fillText(orbitalenergy.toFixed(2), 140, y);
				orbitalPosition.push([100, y]);
				break;
			case 2:
				ctx.fillRect(75, y, 30, 2);
				ctx.fillRect(125, y, 30, 2);
				ctx.fillText(orbitalenergy.toFixed(2), 165, y);
				orbitalPosition.push([75, y]);
				orbitalPosition.push([125, y]);
				break;
			case 3:
				ctx.fillRect(50, y, 30, 2);
				ctx.fillRect(100, y, 30, 2);
				ctx.fillRect(150, y, 30, 2);
				ctx.fillText(orbitalenergy.toFixed(2), 190, y);
				orbitalPosition.push([50, y]);
				orbitalPosition.push([100, y]);
				orbitalPosition.push([150, y]);
				break;
			}
		}
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
  		draworbital(energyFloat);
  		var tr = document.getElementById('orbitalTr' + index);
  		if (tr.style.backgroundColor == '') {
  			tr.style.backgroundColor = '#e6e6e6';
  			tr.style.fontWeight = 'bold';
  			draworbitalInfo(index - 1);
  			ctx.fillStyle = '#f00';
  			ctx.shadowColor = '#f00';
  			ctx.shadowBlur = 10;
  			ctx.fillRect(orbitalPosition[index - 1][0], orbitalPosition[index - 1][1], 30, 2);
  		}
  		else {
  			tr.style.backgroundColor = '';
  			tr.style.fontWeight = '';
  			document.getElementById("highlightInfo").innerHTML = '';
  		}
  		for (var nIndex = 1; nIndex <= 5; nIndex ++) {
  			if (nIndex == index)
  				continue;
  			var tr = document.getElementById('orbitalTr' + nIndex);
  			tr.style.backgroundColor = '';
  			tr.style.fontWeight = '';
  		}
  	}

	function updateCoordinatesTable() {
		//coordinatesArray = math.transpose(table2array());
		if (document.getElementById("coordinatesTable").innerHTML != tableMemory)
			document.getElementById("selectGeometry").options[0].selected = true;
        //showmol(CN_Table);
        //orbital_Patch=cell(5,2);
        //set(DisOrb1,'Value',0);
        //set(DisOrb2,'Value',0);
        //set(DisOrb3,'Value',0);
        //set(DisOrb4,'Value',0);
        //set(DisOrb5,'Value',0);
        //cla(Result_Axes);
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
		//showmol(CN_Table);
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

	function openCoordinatesDialog() {
		if (typeof coordinatesDialog.showModal === "function") {
    		coordinatesDialog.showModal();
    		tableMemory = document.getElementById("coordinatesTable").innerHTML;
  		}
  		else {
    		alert("Sorry, the <dialog> API is not supported by this browser.");
  		}
	}

	//function openGeometryDialog() {
	//	if (typeof geometryDialog.showModal === "function") {
    //		geometryDialog.showModal();
  	//	}
  	//	else {
    //		alert("Sorry, the <dialog> API is not supported by this browser.");
  	//	}
	//}

	function table2array() {
		var array = Array();
		var table = document.getElementById("coordinatesTable");
		var row_number = table.rows.length - 1;
		for (let row_index = 1; row_index <= row_number; row_index++)
				array[row_index - 1] = [math.evaluate(table.rows[row_index].cells[0].innerHTML), math.evaluate(table.rows[row_index].cells[1].innerHTML)];
		//console.log(array);
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
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		var coordinatesArray = math.transpose(table2array());
		//console.log(coordinatesArray);
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
        //console.log(Hamilton);

        var energy = [math.eigs(Hamilton[0]), math.eigs(Hamilton[1]).values];
        orbital = energy[0].vectors;
        energy[0] = energy[0].values;
        energyFloat = math.round(energy[0], 4);
        draworbital(energyFloat);
        coefficient = math.multiply(math.transpose(energy), [[1/6, -1/6], [-1, 2]]);
        coefficient = rats2(math.round(coefficient, 15));
        energyRational = rats1(math.re(energy[0]));
        showResult(energyRational, coefficient, number);
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
		//console.log(array);
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
		//console.log(array);
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
    	//console.log([N, D]);
    	return [N, D];
	}
</script>
</html>