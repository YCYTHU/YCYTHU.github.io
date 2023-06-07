---
layout: article
title: Excerpts
permalink: /excerpts.html
---
<!--more-->

<a id="BackToTop" class="button button--secondary button--rounded" style="position:fixed;right:10px;bottom:10px;"><i class="fas fa-angle-double-up"></i> Back to Top</a>

<a class="button button--secondary button--rounded" style="position:fixed;right:10px;bottom:60px;">Go to <input id="TargetId" type="number" placeholder="No." style="width:75px"> <i id="Goto" class="fas fa-angle-double-right"></i></a>

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
	console.log(TargetId);
	Target = document.getElementById(TargetId.toString());
	Target.scrollIntoView();
}
</script>

<div id="001" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/galaxy.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;"><font face="Courier New">The convenience of visually pleasing explanations for intricate chemical phenomena must not outweigh proper physical descriptions.</font></p>
		<p align="right" style="font-weight:bold;"><font face="Courier New">― Peter R. Schreiner Prof. Dr.</font></p>
	</div>
</div>

---

<div id="002" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/old-forest.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;"><font face="Courier New">Real names tell you the story of the things they belong to</font></p>
		<p align="right" style="font-weight:bold;"><font face="Courier New">― The Lord of the Rings: The two towers</font></p>
	</div>
</div>

---

<div id="003" class="hero hero--dark" style='background-image: url(/assets/images/excerpts/mountain8.jpg);'>
	<div class="hero__content">
		<p align="center" style="font-weight:bold;"><font face="Courier New">For a successful technology, reality must take precedence over public relations, for Nature cannot be fooled.</font></p>
		<p align="right" style="font-weight:bold;"><font face="Courier New">― Richard P. Feynman</font></p>
	</div>
</div>