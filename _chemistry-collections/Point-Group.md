---
layout: article
title: 点群与特征标表
cover: /assets/images/symmetry.jpg
---
<!--more-->

<head>
	<style>
		#flowchart {
			position: relative;
			width: 100%;
		}
		#point_group_button {
			position: absolute;
			width: 100%;
			left: 0;
			bottom: 8px;
			background: transparent;
			border: none;
		}
		#Table {
			display: table;
			width: 100%;
			text-align: center;
			table-layout: fixed;
		}
	</style>
</head>
<body>
	<div id="flowchart"><center>		
		<object data="/assets/images/point group.svg" type="image/svg+xml" width="100%"></object>
		<button id="point_group_button" onclick="ShowTable(this,event)"></button>
	</center></div>
	<div>
		<table id="Table">
			<thead><tr>
				<td>$D_\mathrm{\infty h}$</td>
				<td>$E$</td>
				<td>$2C_\infty^\Phi$</td>
				<td>$\cdots$</td>
				<td>$\infty \sigma_\mathrm{v}$</td>
				<td>$i$</td>
				<td>$2S_\infty^\Phi$</td>
				<td>$\cdots$</td>
				<td>$\infty C_2$</td>
			</tr></thead>
			<tbody>
				<tr>
					<td>$A_\mathrm{1g}\equiv\Sigma_\mathrm{g}^+$</td>
					<td>1</td>
					<td>1</td>
					<td>$\cdots$</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>$\cdots$</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script>
	window.onload = function() {
		var width = document.getElementById('flowchart').clientWidth * (40 / 939);
		var button = document.getElementById('point_group_button');
		button.style.height = width + 'px';
		//button.style.margin = -width + 'px 0';
	}
	window.onresize = function() {
		var width = document.getElementById('flowchart').clientWidth * (40 / 939);
		var button = document.getElementById('point_group_button');
		button.style.height = width + 'px';
		//button.style.margin = -width + 'px 0';
	}
	function ShowTable(obj,event) {
		var index = Math.ceil(15 * event.offsetX / obj.clientWidth);
		switch (index) {
		case 1:
			console.log('D_infty_h');
			break;
		case 2:
			console.log('C_infty_v');
			break;
		case 3:
			console.log('I_h');
			break;
		case 4:
			console.log('O_h');
			break;
		case 5:
			console.log('T_d');
			break;
		case 6:
			console.log('D_n_h');
			break;
		case 7:
			console.log('D_n_d');
			break;
		case 8:
			console.log('D_n');
			break;
		case 9:
			console.log('C_n_h');
			break;
		case 10:
			console.log('C_n_v');
			break;
		case 11:
			console.log('S_2_n');
			break;
		case 12:
			console.log('C_n');
			break;
		case 13:
			console.log('C_s');
			break;
		case 14:
			console.log('C_i');
			break;
		case 15:
			console.log('C_1');
			break;
		}
	}
</script>