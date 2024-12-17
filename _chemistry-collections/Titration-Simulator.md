---
layout: article
title: 滴定模拟器
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/titration.jpg
---
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/titration/titration.min.js"></script>
	<style>
		.SetAcid{
			padding:.5rem 1rem;
			background-color:rgba(24,144,255,0.1);
			border:1px solid #1890ff;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:100px;
		}
		.SetBase{
			padding:.5rem 1rem;
			background-color:rgba(250,140,22,0.1);
			border:1px solid #fa8c16;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:100px;
		}
		.SetInd{
			padding:.5rem 1rem;
			background-color:rgba(82,196,26,0.1);
			border:1px solid #52c41a;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:80px;
		}
		.SetVol{
			padding:.5rem 1rem;
			background-color:rgba(245,34,45,0.1);
			border:1px solid #f5222d;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:80px;
		}
		.SetBur{
			padding:.5rem 1rem;
			background-color:rgba(106,61,154,0.1);
			border:1px solid #6a3d9a;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:80px;
		}
		.SetRate{
			padding:.5rem 1rem;
			background-color:rgba(140,86,75,0.1);
			border:1px solid #8c564b;
			border-radius:.4rem;
			display: inline-block;
			width:45%;
			height:80px;
		}
		#results td{
			border:none;
		}
		#buret img {
			max-width: none;
		}
	</style>
</head>

<body>
	<!-- Settings area -->
	<div id="settings_area" style="width:100%;">
		<center>
			<p class="SetAcid" id="refwidth">
				<b><span id="acidErr">酸</span></b><br>
				<input type="text" id="concAcid" value="--" oninput="getConcAcid()" style="width:20%; height:25px; text-align:center;"><span id="concAcidErr"></span><font face="Times New Roman"> mol·L<sup>-1</sup></font><br>
				<select id="acid" onchange="getAcid()" style="width:30%;">
					<option disabled="" selected="" value="Choose">请选择酸</option>
					<option value="Custom">自定义</option>
					<option value="Hydrochloric acid">盐酸</option>
					<option value="Acetic acid">乙酸</option>
					<option value="Chlorous acid">亚氯酸</option>
					<option value="Hypochlorous acid">次氯酸</option>
					<option value="Hydrocyanic acid">氢氰酸</option>
				</select>
				<font face="Times New Roman">K<sub>a</sub>: </font><input type="text" id="acidKa" value="--" onchange="getAcid()" style="width:20%; height:25px; text-align:center;" disabled=""><span id="acidKaErr"></span>
			</p>
			<p class="SetBase">
				<b><span id="baseErr">碱</span></b><br>
				<input type="text" id="concBase" value="--" oninput="getConcBase()" style="width:20%; height:25px; text-align:center;"><span id="concBaseErr"></span><font face="Times New Roman"> mol·L<sup>-1</sup></font><br>
				<select id="base" onchange="getBase()" style="width:30%;">
					<option disabled="" selected="" value="Choose">请选择碱</option>
					<option value="Custom">自定义</option>
					<option value="Sodium hydroxide">氢氧化钠</option>
					<option value="Ammonia">氨</option>
					<option value="Methylamine">甲胺</option>
					<option value="Ethylamine">乙胺</option>
					<option value="Aniline">苯胺</option>
					<option value="Pyridine">吡啶</option>				
				</select>
				<font face="Times New Roman">K<sub>b</sub>: </font><input type="text" id="baseKb" value="--" onchange="getBase()" style="width:20%; height:25px; text-align:center;" disabled=""><span id="baseKbErr"></span>
			</p>
			<p class="SetInd">
				<b><span id="indErr">指示剂</span></b><br>
				<!--<input style="visibility:hidden; width:50px; height:25px; text-align:center;">-->
				<select id="indicator" onchange="getIndicator()" style="width:80%;">
					<option disabled="" selected="" value="Choose">请选择指示剂</option>
					<option value="Phenolphthalein">酚酞 (8.0 - 10.0)</option>
					<option value="Methyl orange">甲基橙 (3.3 - 4.5)</option>
					<option value="Bromothymol blue">溴百里酚蓝 (6.0 - 7.5)</option>
					<option value="Crystal violet">结晶紫 (0.0 - 1.8)</option>
					<option value="Alizarin yellow">茜素黄 (10.0 - 12.0)</option>
					<option value="Erichrome black T">铬黑T (5.0 - 6.5)</option>				
				</select>	 
			</p>
			<p class="SetVol">
				<b><span id="aliquotErr">试样体积</span></b><br>
				<select id="aliquot" onchange="getAliquot()" style="width:80%;">
					<option disabled="" selected="" value="Choose">请选择试样体积</option>
					<option value="10 mL">10 mL</option>
					<option value="20 mL">20 mL</option>
					<option value="25 mL">25 mL</option>
				</select>
			</p>
			<p class="SetBur">
				<b>滴定剂</b><span id="titrantErr"></span><br>
				<input type="radio" name="titrant" id="titrantA" value="acid" onchange="getTitrantA()"> 酸
				&nbsp;<input type="radio" name="titrant" id="titrantB" value="base" onchange="getTitrantB()"> 碱</p>	
			<p class="SetRate">
				<b>滴定速度</b><br>
				慢&nbsp;&nbsp;<input type="range" id="dropRate" min="1" max="3" value="2" step="0.05" onchange="getDropRate()" style="width:50%;">&nbsp;&nbsp;快<br>
			</p><br>
			<p style="display: inline-block;"><a id="startButton" class="button button--outline-info button--rounded" onclick="reFill()">添加溶液准备滴定</a>
			</p>
			<p style="display: inline-block;"><a id="titrateButton" class="button button--outline-warning button--rounded" onclick="titrate()">开始/停止滴定</a>
			</p>
			<p style="display: inline-block;"><a id="scoreButton" class="button button--outline-success button--rounded" onclick="score()">终止滴定并显示结果</a>
			</p><br>
			<p style="display: inline-block;" id="warnings"></p>
			<p style="display: inline-block;" id="score"></p><br>
			<input type="radio" id="normal" onchange="setNormalMode()">  正常模式&nbsp;<input type="radio" id="cheating" checked="true" onchange="setCheatingMode()"> 作弊模式
		</center>
	</div>
	<div>
		<center>
			<!-- Data area -->
			<p>
				<table style="display: table;border: 0;width: unset;cellpadding: 5px;" id="results"><tbody><tr>
					<td width="50%" border="none"><center><p id="buretReading"><b>滴定管读数</b><br>--</p></center></td>
					<td width="50%"><center><p id="pHReading"><b>pH 值</b><br>--</p></center></td></tr></tbody>
				</table>
			</p>
		</center>
	</div>
	<div id="titrate_area" style="width:100%;position:relative;transform-origin:center top;">		
	<!-- Apparatus area -->
		<div id="apparatus_area" style="position: absolute; left: 15%; transform-origin: center top;">
			<div style="position:absolute; top:0px; left:0px; z-index:0;">
				<canvas id="liquids" width="120" height="690"></canvas>
			</div>
			<div style="position:absolute; top:570px; left:0px; z-index:1;">
				<canvas id="stirBar" width="120" height="120"></canvas>
			</div>
			<div onclick="titrate()" id="buret" style="position:absolute; top:10px; left:3px; z-index:2;">
				<img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/titration simulator/titration simulator.gif" width="112" height="670" border="0">
			</div>
		</div>
		<!-- Titration graph area -->
		<!--<div id="graph_area">-->
		<div id="graph_div" style="width: 400px; transform-origin: right top; transform: scale(1.0); position: absolute; right: 0px;">
			<canvas id="graph" onclick="clearGraph()" width="400"	height="400" style="background-color:white;"></canvas>
		</div>
	</div>
</body>