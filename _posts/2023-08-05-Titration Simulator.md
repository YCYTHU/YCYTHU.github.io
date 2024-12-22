---
title: 在线酸碱滴定模拟器及实现
tags: Chemistry
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/titration simulator/cover.jpg
---
借助JavaScript实现在线模拟酸碱滴定过程中指示剂颜色的变化。该模拟器的设计参考了[Peter H. Bird的JavaScript](http://faculty.concordia.ca/bird/javascript/titration/Titration-JS-v4.html)，使用说明如下。
<!--more-->

<div align="center"><a class="button button--outline-info button--pill" href="/chemistry-collections/Titration-Simulator.html" target="_blank">点击此处体验<i class="fas fa-angle-double-right"></i></a></div>

## 使用说明

用户首先在设置界面（图1）完成设置：

- 酸和碱的种类与浓度（若将种类设置为自定义，则可自定义电离常数）
- 指示剂的种类（变色范围已标在名称之后）
- 锥形瓶中试样的体积，有10 ml，20 ml与25 ml三种选项
- 滴定剂（酸滴定碱或碱滴定酸）
- 滴定速度，拖动滚动条设置，越靠近右侧滴定速度越快

ⓘ 在滴定过程中仍可以拖动滚动条调节滴定速度。
{:.info}

<div class="card" style="margin:0 auto;max-width:75%">
	<div class="card__image">
		<img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/titration simulator/settings_area.png" alt="图1：滴定模拟器设置界面">
	</div>
	<div class="card__content" align="center">
		<div class="card__header">
			<font color="#999999">图1：滴定模拟器设置界面</font>
		</div>
	</div>
</div>

当完成全部设置后，下方<a class="button button--outline-primary button--rounded">警告：部分参数未设置</a>的红色提示将会消失，此时点击蓝色<a class="button button--outline-info button--rounded">添加溶液准备滴定</a>按钮，滴定界面中锥形瓶和滴定管内被填充溶液，完成滴定前设置。

在滴定界面中（图2），左侧为实验仪器，右侧为滴定过程中pH值的变化图像，顶部的表格为滴定过程中的读数数据。

⚠ 当设置界面中的模式设置为正常模式时，滴定界面只显示实验仪器；当设置为作弊模式时才会显示数据与图像。
{:.warning}

<div class="card" style="margin:0 auto;max-width:75%">
	<div class="card__image">
		<img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/titration simulator/titration_area.png" alt="图2：滴定界面，左侧为仪器部分，右侧为pH值的变化图像">
	</div>
	<div class="card__content" align="center">
		<div class="card__header">
			<font color="#999999">图2：滴定界面，左侧为仪器部分，右侧为pH值的变化图像</font>
		</div>
	</div>
</div>

用户在完成滴定前设置之后，可点击黄色按钮<a class="button button--outline-warning button--rounded">开始/停止滴定</a>控制滴定，也可以通过点击滴定管活塞控制滴定。当用户认为已经到达滴定终点时，可点击绿色按钮<a class="button button--outline-success button--rounded">终止滴定并显示结果</a>查看滴定结果（包括绝对误差与相对误差）。

ⓘ 用户在任意时刻都可以在设置界面中重新设置并点击蓝色按钮重新开始滴定。
{:.info}
