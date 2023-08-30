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
			text-align: center;
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
				<td>$\infty C'_2$</td>
				<td>$\mathrm{Linear,Rotations}$</td>
				<td>$\mathrm{Quadratic}$</td>
				<td>$\mathrm{Cubic}$</td>
			</tr></thead>
			<tbody>
				<tr>
					<td>$A_\mathrm{1g}\equiv\Sigma_\mathrm{g}^+$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$1$</td>
					<td></td>
					<td>$x^2+y^2,z^2$</td>
					<td></td>
				</tr>
				<tr>
					<td>$A_\mathrm{2g}\equiv\Sigma_\mathrm{g}^-$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$-1$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$-1$</td>
					<td>$R_z$</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>$E_\mathrm{1g}\equiv\Pi_\mathrm{g}$</td>
					<td>$2$</td>
					<td>$2\cos\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$2$</td>
					<td>$-2\cos\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$(R_x,R_y)$</td>
					<td>$(xz,yz)$</td>
					<td></td>
				</tr>
				<tr>
					<td>$E_\mathrm{2g}\equiv\Delta_\mathrm{g}$</td>
					<td>$2$</td>
					<td>$2\cos2\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$2$</td>
					<td>$2\cos2\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td></td>
					<td>$(x^2-y^2,xy)$</td>
					<td></td>
				</tr>
				<tr>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td>$\cdots$</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>$A_\mathrm{1u}\equiv\Sigma_\mathrm{u}^+$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$1$</td>
					<td>$-1$</td>
					<td>$-1$</td>
					<td>$\cdots$</td>
					<td>$-1$</td>
					<td>$z$</td>
					<td></td>
					<td>$z^3$</td>
				</tr>
				<tr>
					<td>$A_\mathrm{2u}\equiv\Sigma_\mathrm{u}^-$</td>
					<td>$1$</td>
					<td>$1$</td>
					<td>$\cdots$</td>
					<td>$-1$</td>
					<td>$-1$</td>
					<td>$-1$</td>
					<td>$\cdots$</td>
					<td>$1$</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>$E_\mathrm{1u}\equiv\Pi_\mathrm{u}$</td>
					<td>$2$</td>
					<td>$2\cos\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$-2$</td>
					<td>$2\cos\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$(x,y)$</td>
					<td></td>
					<td>$(xz^2,yz^2)$</td>
				</tr>
				<tr>
					<td>$E_\mathrm{2u}\equiv\Delta_\mathrm{u}$</td>
					<td>$2$</td>
					<td>$2\cos2\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$-2$</td>
					<td>$-2\cos2\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td></td>
					<td></td>
					<td>$[xyz,z(x^2-y^2)]$</td>
				</tr>
				<tr>
					<td>$E_\mathrm{3u}\equiv\Phi_\mathrm{u}$</td>
					<td>$2$</td>
					<td>$2\cos3\phi$</td>
					<td>$\cdots$</td>
					<td>$0$</td>
					<td>$-2$</td>
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
		$^*D_\mathrm{\infty h}=D_\infty\timesC_\mathrm{i}$
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