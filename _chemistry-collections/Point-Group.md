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
			display: block;
			text-align: center;
			border: 1px solid #e6e6e6;
		}
		#Table td {
			border: none;
		}
	</style>
</head>
<body>
	<div id="flowchart"><center>		
		<object data="/assets/images/point group.svg" type="image/svg+xml" width="100%"></object>
		<button id="point_group_button" onclick="ShowTable(this,event)"></button>
	</center></div>
	<div id="Container">
		<table id="Table">
			<thead><tr>
				<td>$C_\mathrm{\infty v}$</td>
				<td>$E$</td>
				<td>$2C_\infty^\phi$</td>
				<td>$\cdots$</td>
				<td>$\infty \sigma_\mathrm{v}$</td>
				<td>$\mathrm{Linear,Rotations}$</td>
				<td>$\mathrm{Quadratic}$</td>
				<td>$\mathrm{Cubic}$</td>
			</tr></thead>
			<tbody>
				<tr>
					<td>$A_1\equiv\Sigma^+$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$1$</td>
					<td>$z$</td>
					<td>$x^2+y^2,z^2$</td>
					<td>$z^3$</td>
				</tr>
				<tr>
					<td>$A_2\equiv\Sigma^-$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$-1$</td>
					<td>$R_z$</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>$E_1\equiv\Pi$</td>
					<td>$2$</td>
					<td>$2\cos\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$(x,y);(R_x,R_y)$</td>
					<td>$(xz,yz)$</td>
					<td>$(xz^2,yz^2)$</td>
				</tr>
				<tr>
					<td>$E_2\equiv\Delta$</td>
					<td>$2$</td>
					<td>$2\cos2\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td></td>
					<td>$(x^2-y^2,xy)$</td>
					<td>$[xyz,z(x^2-y^2)]$</td>
				</tr>
				<tr>
					<td>$E_3\equiv\Phi$</td>
					<td>$2$</td>
					<td>$2\cos3\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td></td>
					<td></td>
					<td>$[x(x^2-3y^2),y(3x^2-y^2)]$</td>
				</tr>
				<tr>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		$^*C_\mathrm{\infty v}=C_\infty\times C_\mathrm{s}$
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
			document.getElementById('Container').innerHTML = "<table id=\"Table\"><tr><th><b>D<sub>&#8734;h</sub></b></th><th>E</th><th>2C<sub>&#8734;</sub></th><th>...</th><th>&#8734;&sigma;<sub>v</sub></th><th>i</th><th>2S<sub>&#8734;</sub></th><th>...</th><th>&#8734;C'<sub>2</sub></th><th>linear functions,<br>rotations</th><th>quadratic</th></tr><tr><td><b>A<sub>1g</sub>=&Sigma;<sup>+</sup><sub>g</sub></b></td><td>1</td><td>1</td><td>...</td><td>1</td><td>1</td><td>1</td><td>...</td><td>1</td><td></td><td>x<sup>2</sup>+y<sup>2</sup>, z<sup>2</sup></td></tr><tr><td><b>A<sub>2g</sub>=&Sigma;<sup>-</sup><sub>g</sub></b></td><td>1</td><td>1</td><td>...</td><td>-1</td><td>1</td><td>1</td><td>...</td><td>-1</td><td>R<sub>z</sub></td><td></td></tr><tr><td><b>E<sub>1g</sub>=&Pi;<sub>g</sub></b></td><td>2</td><td>2cos(&phi;)</td><td>...</td><td>0</td><td>2</td><td>-2cos(&phi;)</td><td>...</td><td>0</td><td>(R<sub>x</sub>, R<sub>y</sub>)</td><td>(xz, yz)</td></tr><tr><td><b>E<sub>2g</sub>=&Delta;<sub>g</sub></b></td><td>2</td><td>2cos(2&phi;)</td><td>...</td><td>0</td><td>2</td><td>2cos(2&phi;)</td><td>...</td><td>0</td><td></td><td>(x<sup>2</sup>-y<sup>2</sup>, xy)</td></tr><tr><td><b>E<sub>3g</sub>=&Phi;<sub>g</sub></b></td><td>2</td><td>2cos(3&phi;)</td><td>...</td><td>0</td><td>2</td><td>-2cos(3&phi;)</td><td>...</td><td>0</td><td></td><td></td></tr><tr><td><b>...</b></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td></td><td></td></tr><tr><td><b>A<sub>1u</sub>=&Sigma;<sup>+</sup><sub>u</sub></b></td><td>1</td><td>1</td><td>...</td><td>1</td><td>-1</td><td>-1</td><td>...</td><td>-1</td><td>z</td><td></td></tr><tr><td><b>A<sub>2u</sub>=&Sigma;<sup>-</sup><sub>u</sub></b></td><td>1</td><td>1</td><td>...</td><td>-1</td><td>-1</td><td>-1</td><td>...</td><td>1</td><td></td><td></td></tr><tr><td><b>E<sub>1u</sub>=&Pi;<sub>u</sub></b></td><td>2</td><td>2cos(&phi;)</td><td>...</td><td>0</td><td>-2</td><td>2cos(&phi;)</td><td>...</td><td>0</td><td>(x, y)</td><td></td></tr><tr><td><b>E<sub>2u</sub>=&Delta;<sub>u</sub></b></td><td>2</td><td>2cos(2&phi;)</td><td>...</td><td>0</td><td>-2</td><td>-2cos(2&phi;)</td><td>...</td><td>0</td><td></td><td></td></tr><tr><td><b>E<sub>3u</sub>=&Phi;<sub>u</sub></b></td><td>2</td><td>2cos(3&phi;)</td><td>...</td><td>0</td><td>-2</td><td>2cos(3&phi;)</td><td>...</td><td>0</td><td></td><td></td></tr><tr><td><b>...</b></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td></td><td></td></tr></table>";
			console.log('D_infty_h');
			break;
		case 2:
			document.getElementById('Container').innerHTML = "<table id=\"Table\"><tr><th><b>C<sub>&#8734;v</sub></b></th><th>E</th><th>2C<sub>&#8734;</sub></th><th>...</th><th>&#8734; &sigma;<sub>v</sub></th><th>linear,<br>rotations</th><th>quadratic</th></tr><tr><td><b>A<sub>1</sub>=&Sigma;<sup>+</sup></b></td><td>1</td><td>1</td><td>...</td><td>1</td><td>z</td><td>x<sup>2</sup>+y<sup>2</sup>, z<sup>2</sup></td></tr><tr><td><b>A<sub>2</sub>=&Sigma;<sup>-</sup></b></td><td>1</td><td>1</td><td>...</td><td>-1</td><td>R<sub>z</sub></td><td></td></tr><tr><td><b>E<sub>1</sub>=&Pi;</b></td><td>2</td><td>2cos(&phi;)</td><td>...</td><td>0</td><td>(x, y) (R<sub>x</sub>, R<sub>y</sub>)</td><td>(xz, yz)</td></tr><tr><td><b>E<sub>2</sub>=&Delta;</b></td><td>2</td><td>2cos(2&phi;)</td><td>...</td><td>0</td><td></td><td>(x<sup>2</sup>-y<sup>2</sup>, xy)</td></tr><tr><td><b>E<sub>3</sub>=&Phi;</b></td><td>2</td><td>2cos(3&phi;)</td><td>...</td><td>0</td><td></td><td></td></tr><tr><td><b>...</b></td><td>...</td><td>...</td><td>...</td><td>...</td><td></td><td></td></tr></table>";
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