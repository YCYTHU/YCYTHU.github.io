---
layout: article
title: Excerpts
permalink: /excerpts.html
---
<!--more-->

<a class="button button--secondary button--rounded" style="position:fixed;right:10px;bottom:10px;opacity:0.75;text-align:center;"><i id="BackToTop" class="fas fa-angle-double-up"></i><font face="Times New Roman"> Back to Top<br>Go to </font><input id="TargetId" type="number" placeholder="No." style="width:75px;height:25px;"> <i id="Goto" class="fas fa-angle-double-right"></i></a>

<!--<a class="button button--secondary button--rounded" style="position:fixed;right:10px;bottom:60px;opacity:0.75;">Go to <input id="TargetId" type="number" placeholder="No." style="width:75px"> <i id="Goto" class="fas fa-angle-double-right"></i></a>-->

<script>
var timer  = null;
BackToTop.onclick = function(){
    cancelAnimationFrame(timer);
    var startTime = +new Date();     
    var b = document.body.scrollTop || document.documentElement.scrollTop;
    var d = 500;
    var c = b;
    timer = requestAnimationFrame(function func(){
        var t = d - Math.max(0,startTime - (+new Date()) + d);
        document.documentElement.scrollTop = document.body.scrollTop = t * (-c) / d + b;
        timer = requestAnimationFrame(func);
        if(t == d){
          cancelAnimationFrame(timer);
        }
    });
}
Goto.onclick = function(){
	TargetId = document.getElementById('TargetId').value;
	TargetId = TargetId.padStart(3,'0');
	Target = document.getElementById(TargetId.toString());
	Target.scrollIntoView();
}
</script>

<div id="001" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/galaxy.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:Courier New;">“The convenience of visually pleasing explanations for intricate chemical phenomena must not outweigh proper physical descriptions.”</p>
		<p align="right" style="font-weight:bold;font-family:Courier New;">― Peter R. Schreiner Prof. Dr.</p>
	</div>
</div>

---

<div id="002" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/old-forest.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:Courier New;">“Real names tell you the story of the things they belong to”</p>
		<p align="right" style="font-weight:bold;font-family:Courier New;">― J.R.R. Tolkien, The Lord of the Rings: The two towers</p>
	</div>
</div>

---

<div id="003" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/kraft1.png);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:Courier New;color:#000000;">“He wondered what the man's name was and where he came from; and if he was really evil of heart, or what lies or threats had led him on the long march from his home; and if he would rather have stayed there in peace.”</p>
		<p align="right" style="font-weight:bold;font-family:Courier New;color:#000000;">― J.R.R. Tolkien, The Lord of the Rings: The two towers</p>
	</div>
</div>

---

<div id="004" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/mountain8.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:Courier New;">“For a successful technology, reality must take precedence over public relations, for Nature cannot be fooled.”</p>
		<p align="right" style="font-weight:bold;font-family:Courier New;">― Richard P. Feynman</p>
	</div>
</div>

---

<div id="005" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/green-planet.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:Courier New;">“Many are the strange chances of the world,' said Mithrandir, 'and help oft shall come from the hands of the weak when the Wise falter.”</p>
		<p align="right" style="font-weight:bold;font-family:Courier New;">― J.R.R. Tolkien, The Silmarillion</p>
	</div>
</div>

---

<div id="006" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/kraft2.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:FangSong,STFangsong;color:#000000;">“这一张文凭，仿佛有亚当、夏娃下身那片树叶的功用，可以遮羞包丑；小小一方纸能把一个人的空疏、寡陋、愚笨都掩盖起来。自己没有文凭，好像精神上赤条条的，没有包裹。”</p>
		<p align="right" style="font-weight:bold;font-family:FangSong,STFangsong;color:#000000;">― 钱钟书，《围城》</p>
	</div>
</div>

---

<div id="007" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/kraft1.png);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;font-family:FangSong,STFangsong;color:#000000;">“事实上，一个人的缺点正像猴子的尾巴，猴子蹲在地面的时候，尾巴是看不见的，直到他向树上爬，就把后部供大众瞻仰，可是这红臀长尾巴本来就有，并非地位爬高了的新标识。”</p>
		<p align="right" style="font-weight:bold;font-family:FangSong,STFangsong;color:#000000;">― 钱钟书，《围城》</p>
	</div>
</div>
