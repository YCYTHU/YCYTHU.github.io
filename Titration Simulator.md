---
layout: page
permalink: /Titration%20Simulator.html
---

<html>
<head>
	<meta charset="UTF-8">
<script language="JavaScript" type="text/javascript">
	var graph, graphCTX, liquids, liquidsCTX, stirBar, stirBarCTX; 
	var acid="Choose", base="Choose", indicator="Choose"; // (Unselected at startup)
	var strongAcid, strongBase;
	var titrant, dropRate = 100;
	var startLevel, level = 0, titre = 0, titreAtEqPt, buretReading;
	var reading, titre, prevTitre;
	var colour, darkerColour;
	var pH, pHInd, pHReading, pHAtEqPt, buretReading;
	var prevpH, concAcid, concBase;
	var pHDiff, prevpHDiff, eqPtFound = false;
	var Ka, Kb, Kw = 1.0e-14;
  var paleGrey = "#f0f0f0"; // pale grey
  var indRed1=255, indGreen1=255, indBlue1=255, indRed2=255, indGreen2=255, indBlue2=255; // No indicator at startup
  var titreInterval;
  var tapOpen = false, liquidsAdded = false, stirCount;
  var s = "", errFlag = "<font color='red'><b>*</b></font>", noErrFlag = "";
	// functions changing parameters	
  function getAcid() {
  	clearInterval(titreInterval);
		acid = document.getElementById("acid").value; setAcidity();	// Set acid and its Ka
		document.getElementById("acidErr").innerHTML = "酸"; ready();
	}
	function getBase() { 
		clearInterval(titreInterval);
		base = document.getElementById("base").value; setBasicity(); // Set base and its Kb
		document.getElementById("baseErr").innerHTML = "碱"; ready();
	}
	function getIndicator() {
		clearInterval(titreInterval);
		indicator = document.getElementById("indicator").value; setIndicator(indicator); // Set indicator and its parameters
		document.getElementById("indErr").innerHTML = "指示剂"; ready();
	}
	function getConcAcid() {  // Get acid concenration
		clearInterval(titreInterval);
		concAcid = document.getElementById("concAcid").value;
		document.getElementById("concAcidErr").innerHTML = noErrFlag; ready();
	}
	function getConcBase() {  // Get base concentration
		clearInterval(titreInterval);
		concBase = document.getElementById("concBase").value;
		document.getElementById("concBaseErr").innerHTML = noErrFlag; ready();
	}
	function getTitrantA() {  // Toggle the titrant if "acid" is clicked
		clearInterval(titreInterval);
		titrant = "acid";
		document.getElementById("titrantA").checked = true;
		document.getElementById("titrantB").checked = false;
		document.getElementById("titrantErr").innerHTML = noErrFlag; ready();
	}
	function getTitrantB() {  // Toggle the titrant if "base" is clicked
		clearInterval(titreInterval);
		titrant = "base";
		document.getElementById("titrantB").checked = true;
		document.getElementById("titrantA").checked = false;
		document.getElementById("titrantErr").innerHTML = noErrFlag; ready();
	}
	function getDropRate() {  // Read the rate scrollbar
		dropRate = document.getElementById("dropRate").value;
		dropRate = Math.pow(10,(4 - dropRate));
		clearInterval(titreInterval); titreInterval = setInterval(titrationPlot,dropRate); 
	}
	function clearGraph(){ // Clears the graph area if it is clicked
		graphFrame();
		graphCTX.fillStyle = "#ffffff"; graphCTX.fillRect(51,42,299,7);	// (Remove weird black line at previous stopping point)
	}
	function reFill() { // Initializes a titration - replaces the solutions
		tapOpen = false; eqPtFound = false;
		document.getElementById("startButton").disabled = true;
		level = 0; titre = 0;
		graphFrame();
		graphCTX.fillStyle = "#ffffff"; graphCTX.fillRect(51,42,299,7); // (Remove weird black line at previous stopping point)
		startLevel = 84 + Math.random()*20 // Does not quite fill the buret to zero (randomly)
		reading = (startLevel+level-84)/15;	 //buret in mL	
		if (titrant == "acid") { // Calculate equivalence point titre and pH
			titre = 25.0*concBase/concAcid;
		} else {
			titre = 25.0*concAcid/concBase;
		}
		titreAtEqPt = titre; // + reading; 
		getpH();	
		pHAtEqPt = pH;
		titre = 0;			
		buretReading = reading.toFixed(2).toString();
		document.getElementById("buretReading").innerHTML = "<b>Buret Reading</b><br>"+buretReading+" mL";
		getpH();	
		pHReading = pH.toFixed(2).toString();
		document.getElementById("pHReading").innerHTML = "<b>pH Reading</b><br>"+pHReading;
		showLiquids(level);
		clearInterval(stirInterval); // Start stirring first time
		stirInterval = setInterval(stirrer,50);
		clearInterval(titreInterval); titreInterval = setInterval(titrationPlot,dropRate); // Allow titration	
	}
	function getpH() { // Calculate the pH in the flask
		if (strongAcid & strongBase) strongAcidStrongBase();   
		if (!strongAcid & strongBase) weakAcidStrongBase();
		if (strongAcid & !strongBase) strongAcidWeakBase();
		if (!strongAcid & !strongBase) {
			weakAcidWeakBase(); tapOpen = false; showLiquids(level); clearInterval(titreInterval); // Not handled! Will give an error message! 
		}
	}
	function ready() { // Check that everything has been set first time through
		liquidsAdded = false;
		if (acid=="Choose") document.getElementById("acidErr").innerHTML = "酸"+errFlag;
		if (base=="Choose") document.getElementById("baseErr").innerHTML = "碱"+errFlag;
		if (indicator=="Choose") document.getElementById("indErr").innerHTML = "指示剂"+errFlag;
		if (concAcid==undefined) document.getElementById("concAcidErr").innerHTML = errFlag;
		if (concBase==undefined) document.getElementById("concBaseErr").innerHTML = errFlag;
		if (titrant==undefined) document.getElementById("titrantErr").innerHTML = errFlag;
		if (acid=="Choose" || base=="Choose" || indicator=="Choose" || concAcid==undefined || concBase==undefined || titrant==undefined)
			return false; 
		document.getElementById("warnings").innerHTML = '';
		document.getElementById("startButton").disabled = false;
		return true;
	} 
	function titrationPlot() {	// Main loop to display the titration progress.
		if (!tapOpen) return;
		showLiquids(level);		
  	reading = (startLevel+level-84)/15;	 // Buret reading in mL					
  	buretReading = reading.toFixed(2).toString();
  	document.getElementById("buretReading").innerHTML = "<b>Buret Reading</b><br>"+buretReading+" mL";
  	level++; 
  	if (reading >= 25) { // Stop titration when buret is empty!
  		clearInterval(titreInterval); tapOpen = false; showLiquids(level); 
  		document.getElementById("startButton").disabled = false; 
  		return;
  	} 
  	prevpH = pH; prevTitre = titre;
  	titre = level/15; 
  	getpH();
  	pHReading = pH.toFixed(2).toString();
  	document.getElementById("pHReading").innerHTML = "<b>pH Reading</b><br>"+pHReading;
  	graphCTX.lineWidth = 2;
		if (level > 1) {// plot graph points
			graphCTX.beginPath(); graphCTX.strokeStyle = "#ff0000";
			graphCTX.moveTo(50+(prevTitre*12),351-(prevpH*300/14)); 
			graphCTX.lineTo(50+(titre*12),351-(pH*300/14)); graphCTX.stroke(); graphCTX.closePath();
			if (titre > titreAtEqPt+0.2) drawEqPt(document.getElementById("eqpt").checked); // Shows the equivalence point if checkbox checked just after it is passed
		}
		if(level > 1)	{ // plot indicator colour
			graphCTX.beginPath(); graphCTX.strokeStyle = getColour(1.0);
			graphCTX.moveTo(50+(titre*12),42); 
			graphCTX.lineTo(50+(titre*12),49); graphCTX.stroke(); graphCTX.closePath();
		}
	}
	function drawEqPt(draw) { // Marks equivalence point if checkbox is set
		if (!draw) return; // Not set!
		if (!eqPtFound) {	// Shows the equivalence point just once just after it is passed (see function titrationPlot above)
			graphCTX.beginPath(); 
			graphCTX.lineWidth = 1; graphCTX.strokeStyle = "#0000ff";  
			graphCTX.moveTo(50+(titreAtEqPt*12),51); graphCTX.lineTo(50+(titreAtEqPt)*12,351-(pHAtEqPt*300/14)); graphCTX.stroke(); 
			graphCTX.closePath();
			graphCTX.fillStyle = "#ffffff"; graphCTX.fillRect(28+(titreAtEqPt*12),69,40,16);
			graphCTX.fillStyle = "#0000ff"; graphCTX.font="12px Times";
			graphCTX.fillText("Eq. Pt.",33+(titreAtEqPt*12),81);
			graphCTX.lineWidth = 2;  graphCTX.strokeStyle = "#ff0000";
			eqPtFound = true;
		}
	}
	function titrate(event) { // Start/stop the titration by clicking the tap
		var x, y,
		x = (event.clientX-document.getElementById("buret").getBoundingClientRect().left);
		y = (event.clientY-document.getElementById("buret").getBoundingClientRect().top);
  	if((x > 75) && (x < 90) && (y > 465) && (y < 485)) { // tap clicked
  		if (!liquidsAdded) return;
			if(!tapOpen) { // Tap not open. Open it and start titrating
				tapOpen = true;
				showLiquids(level);
				clearInterval(titreInterval); titreInterval = setInterval(titrationPlot,dropRate);
				document.getElementById("startButton").disabled = true;   	
			}      
    	else { // tap open. Close it and stop the titration.
    		tapOpen = false; clearInterval(titreInterval); showLiquids(level);
    		document.getElementById("startButton").disabled = false;
    	} 
    }
  }
	function graphAxes() {			//draw the graph frame 
		graphFrame();
		graphLabels();
	}
	function graphFrame() {
		graphCTX.beginPath(); graphCTX.fillStyle = "#ffffff"; graphCTX.fillRect(45,40,307,316); 
		graphCTX.strokeStyle = "#000000"; graphCTX.lineWidth = 1; 
		graphCTX.strokeRect(50,41,301,9); // Indicator colour strip
		graphCTX.strokeRect(50,50,301,301); // Graph area
		graphCTX.moveTo(45,50);   graphCTX.lineTo(50,50);  // x axis ticks
		graphCTX.moveTo(45,201);  graphCTX.lineTo(50,201);
		graphCTX.moveTo(45,351);  graphCTX.lineTo(50,351);	
		graphCTX.moveTo(50,351);  graphCTX.lineTo(50,356); // y-axis ticks
		graphCTX.moveTo(111,351); graphCTX.lineTo(111,356);
		graphCTX.moveTo(171,351); graphCTX.lineTo(171,356);
		graphCTX.moveTo(231,351); graphCTX.lineTo(231,356);
		graphCTX.moveTo(291,351); graphCTX.lineTo(291,356);
		graphCTX.moveTo(351,351); graphCTX.lineTo(351,356);
		graphCTX.stroke();	
	}
	function graphLabels() {
		graphCTX.font="16px Times New Roman"; graphCTX.fillStyle = "#006000"; 
		graphCTX.fillText("Titre (volume added, mL)",100,385); //x-axis labels
		graphCTX.fillText("0",47,370);
		graphCTX.fillText("25",345,370);
		graphCTX.fillText("14",27,55);  // y-axis labels
		graphCTX.fillText("7",35,206);
		graphCTX.fillText("0",35,356);
		graphCTX.fillText("pH",26,150);
		graphCTX.beginPath(); graphCTX.strokeStyle = "#006000"; graphCTX.moveTo(275,380); graphCTX.lineTo(295,380);   // x-axis arrow
		graphCTX.moveTo(290,377); graphCTX.lineTo(295,380);
		graphCTX.moveTo(290,383); graphCTX.lineTo(295,380);
		graphCTX.moveTo(35,90); graphCTX.lineTo(35,110);   // y-axis arrow
		graphCTX.moveTo(35,90); graphCTX.lineTo(32,95);
		graphCTX.moveTo(35,90); graphCTX.lineTo(38,95);		
		graphCTX.stroke();
	}
	function stirrer()  { // Draws the stirrer
		//if (!stirring) return; // No stirring before there is a liquid in the flask!
		stirBarCTX.clearRect(47,54,16,9);
		stirBarCTX.lineWidth = 3; stirBarCTX.lineCap = "round"; stirBarCTX.strokeStyle = "#808080";
		switch (stirCount) {
		case 0: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(49,58); stirBarCTX.lineTo(61,58); stirBarCTX.stroke();  // -
				break;
			}
		case 1: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(50,59); stirBarCTX.lineTo(60,57); stirBarCTX.stroke();  // \
				break;
			}
		case 2: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(53,60); stirBarCTX.lineTo(59,56); stirBarCTX.stroke();  // \
				break;
			}
		case 3: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(55,60); stirBarCTX.lineTo(55,55); stirBarCTX.stroke();  // |
				break;
			}
		case 4: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(53,56); stirBarCTX.lineTo(59,60); stirBarCTX.stroke();  // /
				break;
			}
		case 5: {
				stirBarCTX.beginPath(); stirBarCTX.moveTo(50,57); stirBarCTX.lineTo(60,59); stirBarCTX.stroke();  // /
				break;
			}
		}
		stirCount++; if (stirCount == 6) {stirCount = 0; }  
	}
	function showLiquids(level) {
  	var x = level/900.0 + 0.3;	//height in the flask fudge factor!
  	liquidsAdded = true;
		liquidsCTX.fillStyle = "#ffffff"; liquidsCTX.fillRect(0,0,120,690); // Clear the liquids canvas
  	liquidsCTX.fillStyle = "#f0f0f0";  // liquid in buret will be pale grey
  	liquidsCTX.fillRect(10,startLevel+level-1,100,540-startLevel-level-1);	// Show buret contents
  	liquidsCTX.strokeStyle = "#000000"; liquidsCTX.beginPath(); //meniscus in buret
  	liquidsCTX.arc(57,startLevel+level-9,10,0.27*Math.PI,0.73*Math.PI); liquidsCTX.stroke(); 
		liquidsCTX.fillStyle = getColour(1.0); // bulk colour 
		liquidsCTX.fillRect(20,630-(45.0*x),80,(45.0*x)+10); // show flask contents
    liquidsCTX.fillStyle = getColour(0.9); // surface (darker) colour	
    liquidsCTX.beginPath(); liquidsCTX.moveTo(24+15*x,630-45*x); 
    liquidsCTX.bezierCurveTo(24+15*x,625-45*x,90-15*x,625-45*x,90-15*x,630-45*x);
    liquidsCTX.bezierCurveTo(90-15*x,635-45*x,24+15*x,635-45*x,24+15*x,630-45*x); 
    liquidsCTX.stroke();liquidsCTX.fill();
    liquidsCTX.strokeStyle = "#000000"; liquidsCTX.lineWidth = 1;
    if (tapOpen) { // Shows the drips
    	drip = Math.round(35.0*Math.random());
    	if(level%2 == 0) {
    		liquidsCTX.beginPath(); liquidsCTX.moveTo(56,550+drip); liquidsCTX.lineTo(56,555+drip); liquidsCTX.stroke();
    	}
    	else  {
    		liquidsCTX.beginPath(); liquidsCTX.moveTo(56,560+drip); liquidsCTX.lineTo(56,565+drip); liquidsCTX.stroke();
    	}
    }
  }
	function strongAcidStrongBase() { // Strong acid - strong base case
		var volAcid, volBase, totVol;				  
		var concAcidNow;
		var b, c, x, y;
		if (titrant == "acid") {
			volAcid = titre/1000;
			volBase = 0.025;
		} else {
			volAcid = 0.025;
			volBase = titre/1000;
		}
    totVol = volBase + volAcid;     // Stoichiometric calc.
    concAcidNow = (volAcid*concAcid - volBase*concBase)/totVol;               
    if (concAcidNow > 0.0) {        // Equilibrium calc (handles Kw for
      b = concAcidNow;            // very dilute cases.
      c = -Kw;
      x = quadPlus(b,c);
      pH = - Math.log(x + concAcidNow)/Math.LN10;
    } else {
    	b = -concAcidNow;
    	c = -Kw;
    	x = quadPlus(b,c);
    	pH = 14.0 + Math.log(x - concAcidNow)/Math.LN10;
    }
  }
  function weakAcidStrongBase()  { // Weak acid - strong base case
  	var volAcid, volBase, totVol;
  	var roots = [];
  	var concAcidNow, concConjBase;
  	var b = Ka, c = 0, x = 0, y = 0;;
  	var cubic;
  	if (titrant == "acid") {
  		volAcid = titre/1000;
  		volBase = 0.025;
  	} else {
  		volAcid = 0.025;
  		volBase = titre/1000;
  	}
  	totVol = volAcid + volBase;
  	concAcidNow = (volAcid*concAcid - volBase*concBase)/totVol;
  	concConjBase = (volBase*concBase)/totVol;
  	if(concAcidNow > 2.0e-3) {
  		cubic = false;
  		b = concConjBase + Ka;
  		c = -(concAcidNow*Ka);
  		x = quadPlus(b,c);
  		pH = -Math.log(x)/Math.LN10;
  	} 
		if (concAcidNow <= 2.0e-3 & concAcidNow >= -2.0e-3) {    // Solve cubic equation
      cubic = true;                                     // near equivalence point
      roots = cubicPlus(-Ka,-(Kw+Ka*concAcidNow),(concConjBase*Kw+Ka*Kw),(Kw*Kw));
      y = pickRoot(roots);  // Hydronium from weak acid
      if (y != 0.0) pH = -Math.log(Kw/y)/Math.LN10; else pH = 14.0+Math.log(Math.sqrt(concConjBase*Kw/Ka))/Math.LN10;                       
    }
    if (concAcidNow < -2.0e-3) {
    	cubic = false;
      concConjBase = (volAcid*concAcid)/totVol; // This will be the stoichiometric final base conc.
      b = -concAcidNow;   // This will be the OH- concentration when negative
      c = -Kw;
      x = quadPlus(b,c);
      pH = 14.0 + Math.log(x - concAcidNow)/Math.LN10;
    }
  }

  function strongAcidWeakBase() {  // Strong acid - weak base case
  	var volAcid, volBase, totVol;				   
  	var concBaseNow, concConjAcid;
  	var roots = [];
  	var b = Kb, c = 0, x = 0, y;
  	var cubic;
  	if (titrant == "acid") {
  		volAcid = titre/1000;
  		volBase = 0.025;
  	}  else {
  		volAcid = 0.025;
  		volBase = titre/1000;
  	}
  	totVol = volAcid + volBase;
  	concBaseNow = (volBase*concBase - volAcid*concAcid)/totVol;
  	concConjAcid = (volAcid*concAcid)/totVol;                
  	if(concBaseNow > 2.0e-3){
  		cubic = false;
  		b = concConjAcid + Kb;
  		c = -(concBaseNow*Kb);
  		x = quadPlus(b,c);
  		pH = 14.0 + Math.log(x)/Math.LN10; 
  	} 
		if (concBaseNow <= 2.0e-3 & concBaseNow >= -2.0e-3){      // Solve cubic equation
        cubic = true;                                           // near equivalence point
        roots = cubicPlus(-Kb,-(Kw+Kb*concBaseNow),(concConjAcid*Kw+Kb*Kw),(Kw*Kw));
        y = pickRoot(roots);  // Hydroxide from weak base
        if (y != 0.0) pH = 14.0 + Math.log(Kw/y)/Math.LN10; else pH = -Math.log(Math.sqrt(concConjAcid*Kw/Kb))/Math.LN10;                      
      }
      if (concBaseNow < -2.0e-3){
      	cubic = false;
        concConjAcid = (volAcid*concAcid)/totVol; // This will be the stoichiometric final acid conc.
        b = -concBaseNow;   // This will be the H+ concentration when negative
        c = -Kw;
        x = quadPlus(b,c);
        pH = - Math.log(x - concBaseNow)/Math.LN10;
      }
    }

  function weakAcidWeakBase(){  // Weak acid - weak base case not handled
  	document.getElementById("startButton").disabled = true;
  	document.getElementById("warnings").innerHTML = "警告：弱酸弱碱";
  }

  function setAcidity() { // Picks the appropriate pKa and base type.
  	switch (acid)
  	{
  	case "Hydrochloric acid":
  		{				
  			Ka = 0.0;
  			strongAcid = true;
  			break;
  		}
  	case "Acetic acid":
  		{
  			Ka = 1.8e-5;
  			strongAcid = false;
  			break;
  		}
  	case "Chlorous acid":
  		{
  			Ka = 1.2e-2;
  			strongAcid = false;
  			break;
  		}
  	case "Hypochlorous acid":
  		{
  			Ka = 3.5e-8;
  			strongAcid = false;
  			break;
  		}
  	case "Hydrocyanic acid":
  		{
  			Ka = 6.2e-10;
  			strongAcid = false;
  			break;
  		}
  	}
  }
  function setBasicity() {  // Picks the appropriate pKa and acid type.
  	switch (base)
  	{
  	case "Sodium hydroxide":
  		{
  			Kb = 0.0;
  			strongBase = true;
  			break;
  		}
  	case "Ammonia":
  		{
  			Kb = 1.8e-5;
  			strongBase = false;
  			break;
  		}
  	case "Methylamine":
  		{
  			Kb = 4.38e-4;
  			strongBase = false;
  			break;
  		}
  	case "Ethylamine":
  		{
  			Kb = 5.68e-4;
  			strongBase = false;
  			break;
  		}
  	case "Aniline":
  		{
  			Kb = 3.8e-10;
  			strongBase = false;
  			break;
  		}
  	case "Pyridine":
  		{
  			Kb = 1.7e-9;
  			strongBase = false;
  			break;
  		}
  	}
  }
  function setIndicator(){ // Sets pH and colours
  	switch (indicator)
  	{
  	case "Phenolphthalein":
  		{
  			pHInd =	9.0;
          indRed1 = 255;   //1.0;			//in base (pink)
          indGreen1 = 200;   //0.027;
          indBlue1 = 255;  //0.447;
          indRed2 = 255;   //1.0;			//in acid (colorless)
          indGreen2 = 255; //1.0;
          indBlue2 = 255;  //1.0;
          break;
        }
      case "Methyl orange":
      	{
      		pHInd = 3.8;
          indRed1 = 255;   			//in base (yellow)
          indGreen1 = 255; 
          indBlue1 = 0;    
          indRed2 = 255;   			//in acid (orange)
          indGreen2 = 51;  
          indBlue2 = 0;    
          break;
        }
      case "Bromothymol blue":
      	{
      		pHInd = 7.0;
          indRed1 = 0;     			//in base (blue)
          indGreen1 = 0;   
          indBlue1 = 255;  
          indRed2 = 255;	 			//in acid (yellow)
          indGreen2 = 255; 
          indBlue2 = 0;    
          break;
        }
      case "Crystal violet":
      	{
      		pHInd = 1.0;			
          indRed1 = 99;    			//in base (blue)
          indGreen1 = 0;   
          indBlue1 = 217; 
          indRed2 = 84;    			//in acid (green)
          indGreen2 = 255; 
          indBlue2 = 0;    
          break;
        }
      case "Alizarin yellow":
      	{
      		pHInd = 11.0;				
          indRed1 = 255;   			//in base (orange-red)
          indGreen1 = 77;  
          indBlue1 = 0;    
          indRed2 = 255;   			//in acid (yellow)
          indGreen2 = 255; 
          indBlue2 = 0;    
          break;
        }
      case "Erichrome black T":
      	{
      		pHInd = 5.8;				
          indRed1 = 99;    			// base (blue)
          indGreen1 = 0;   
          indBlue1 = 199;  
          indRed2 = 255;   			//in acid (red)
          indGreen2 = 0;   
          indBlue2 = 0;    
          break;
        }
      }
    }	
  function getColour(darker)  { // make the colours of the flask contents
  	var pHDiff;
    if (pH==undefined) pHDiff = 0; //*********

    else pHDiff = pHInd - pH;		
	//		document.getElementById("warnings").innerHTML = "pHInd = "+pHInd+" pH = "+pH+" pHDiff = "+pHDiff;
	//		document.getElementById("warnings2").innerHTML = indRed1+", "+indGreen1+", "+indBlue1+", "+indRed2+", "+indGreen2+", "+indBlue2;
    if (pHDiff >= 1.0) return colourCoder(indRed2, indGreen2, indBlue2, darker);
    if (pHDiff < 1.0 & pHDiff >= -1.0) return colourCoder(
    	(indRed1-(indRed1-indRed2)*(pHDiff+1.0)/2.0), 
    	(indGreen1-(indGreen1-indGreen2)*(pHDiff+1.0)/2.0),
    	(indBlue1-(indBlue1-indBlue2)*(pHDiff+1.0)/2.0),darker);
    	if (pHDiff < -1.0) return colourCoder(indRed1, indGreen1, indBlue1, darker);
  }
  function colourCoder(red, green, blue, darker) { // forms a color code from rgb's in range 0 - 255 and a darkener (1 - 0, 0 = darkest)
  	return "#"+(0x1000000 + Math.round(blue*darker) + 0x100 * Math.round(green*darker) + 0x10000 * Math.round(red*darker)).toString(16).substr(1); return;
  } 
  function quadPlus(b, c)  {  // Returns the positive root of the quadratic (with one negative root)
  	var quad1 = (-b + Math.sqrt(b*b - 4.0*c))/2.0;
  	var quad2 = (-b - Math.sqrt(b*b - 4.0*c))/2.0;
  	if (quad1 >= 0.0) return  quad1;
  	if (quad2 >= 0.0) return  quad2;
  	return 0.0;
  }      
  function cubicPlus(a, b, c, d) { // Solves a cubic equation (http://www.1728.org/cubic.htm)
  	var f, g, h, i, j, k, l, m, n, p, r, s, t, u;
  	var root = [];            
  	f = (3.0*c/a - b*b/(a*a))/3.0; 
  	g = (2.0*b*b*b/(a*a*a) - 9.0*b*c/(a*a) + 27.0*d/a)/27.0; 
  	h = g*g/4.0 + f*f*f/27.0; 
    if (h > 0.0) { // One real root and two complex
    	r = -(g/2.0) + Math.sqrt(h); 
    	s = signum(r)*Math.pow(Math.abs(r),1.0/3.0); 
    	t = -(g/2.0) - Math.sqrt(h); 
    	u = signum(t)*Math.pow(Math.abs(t),1.0/3.0); 
    	root[0] = (s+u)-(b/(3.0*a)); root[3] = 0.0;
    	root[1] = -(s+u)/2.0-(b/(3.0*a)); root[4] = +((s-u)*Math.sqrt(3.0))/2.0;
    	root[2] = -(s+u)/2.0-(b/(3.0*a)); root[5] = -((s-u)*Math.sqrt(3.0))/2.0;
    }  
    if (h <= 0.0) { // Three real roots
    	i = Math.sqrt(g*g/4.0- h); 
    	j = signum(i)*Math.pow(Math.abs(i), 1.0/3.0); 
    	k = Math.acos(-g/(2.0*i)); 
    	l = -j; 
    	m = Math.cos(k/3.0); 
    	n = Math.sqrt(3.0)*Math.sin(k/3.0);
    	p = -b/(3.0*a);
    	root[0] = 2.0*j*Math.cos(k/3)-(b/(3*a)); root[3] = 0.0;
    	root[1] = l*(m+n)+p; root[4] = 0.0;
    	root[2] = l*(m-n)+p; root[5] = 0.0;
    	return root;
    }
    if (f == 0.0 && g == 0.0 && h == 0.0){ // Three identical real roots (Not applicable here)
    	root[0] = root[1] = root[2] = -signum(d/a)*Math.pow(Math.abs(d/a),1.0/3.0) ;
    	root[3] = root[4] = root[5] = 0.0;
    	return root;
    }
    return root;
  }   
  function pickRoot(roots) 
  {
  	var root = 0.0;
  	if (roots[4] != 0.0) { // Only one of the three is real (Should not happen)
  		root = roots[0];
  		return 0.0;
		}	else { // All three are real (Return then most positive)
			if (level > 0) {               
				for(var i=0; i < 3; i++) {
					if(roots[i] > root) root = roots[i];
				}
			} 
			return root;
		}
  	return root; // Should not happen 
  }
  function signum(a) {
  	var sign;
  	if (a>0) sign = 1; if(a==0) sign = 0; if(a<0) sign = -1;
  	return sign; 
  }
	window.onload = function() { // Initializations
		stirBar = document.getElementById("stirBar"); stirBarCTX = stirBar.getContext("2d");
		stirBarCTX.fillStyle = "#ffffff"; stirBarCTX.lineWidth = 2; stirBarCTX.strokeStyle = "#000000";
		liquids = document.getElementById("liquids"); liquidsCTX = liquids.getContext("2d"); 
		graph = document.getElementById("graph"); graphCTX = graph.getContext("2d");
		graphAxes();
		stirCount = 0; counter2 = 100;
		stirBarCTX.beginPath(); stirBarCTX.moveTo(50,57); stirBarCTX.lineTo(60,59); stirBarCTX.stroke();  // / Initial stopped stirrer
		stirInterval = setInterval(stirrer,50); //Prepare stirrer loop
		clearInterval(stirInterval);
		ready();
		document.getElementById("warnings").innerHTML = "警告：缺参数";
	}
</script>
<style>
	.SetAcid{
		padding:.5rem 1rem;
		background-color:rgba(24,144,255,0.1);
		border:1px solid #1890ff;
		border-radius:.4rem;
		display: inline-block;
		width:45%;
		height:90px;
	}
	.SetBase{
		padding:.5rem 1rem;
		background-color:rgba(250,140,22,0.1);
		border:1px solid #fa8c16;
		border-radius:.4rem;
		display: inline-block;
		width:45%;
		height:90px;
	}
	.SetInd{
		padding:.5rem 1rem;
		background-color:rgba(82,196,26,0.1);
		border:1px solid #52c41a;
		border-radius:.4rem;
		display: inline-block;
		width:90%;
		height:90px;
	}
	.SetBur{
		padding:.5rem 1rem;
		background-color:rgba(245,34,45,0.1);
		border:1px solid #f5222d;
		border-radius:.4rem;
		display: inline-block;
		width:45%;
	}
	.SetRate{
		padding:.5rem 1rem;
		background-color:rgba(106,61,154,0.1);
		border:1px solid #6a3d9a;
		border-radius:.4rem;
		display: inline-block;
		width:45%;
	}
	#results td{
		border:none;
	}
</style>
<link rel="stylesheet" href="https://ycythu.github.io/assets/css/main.css">
</head>

<body>
		<!-- Settings area -->
		<div style="width:100%;">
			<center>
				<p class="SetAcid"><b><span id="acidErr">酸</span></b><br>
					<nobr><input type="text" id="concAcid" value="--" oninput="getConcAcid()" style="width:30%; height:25px; text-align:center;"><span id="concAcidErr"></span> mol·L<sup>-1</sup></nobr>
					<select id="acid" onchange="getAcid()">
						<option disabled="" selected="" value="Choose">请选择酸</option>
						<option value="Hydrochloric acid">盐酸</option>
						<option value="Acetic acid">乙酸</option>
						<option value="Chlorous acid">亚氯酸</option>
						<option value="Hypochlorous acid">次氯酸</option>
						<option value="Hydrocyanic acid">氢氰酸</option>
					</select>
				</p>
				<p class="SetBase"><b><span id="baseErr">碱</span></b><br>
					<nobr><input type="text" id="concBase" value="--" oninput="getConcBase()" style="width:30%; height:25px; text-align:center;"><span id="concBaseErr"></span> mol·L<sup>-1</sup></nobr>
					<select id="base" onchange="getBase()">
						<option disabled="" selected="" value="Choose">请选择碱</option>
						<option value="Sodium hydroxide">氢氧化钠</option>
						<option value="Ammonia">氨</option>
						<option value="Methylamine">甲胺</option>
						<option value="Ethylamine">乙胺</option>
						<option value="Aniline">苯胺</option>
						<option value="Pyridine">吡啶</option>				
					</select>
				</p>
				<p class="SetInd"><b><span id="indErr">指示剂</span></b><br>
					<!--<input style="visibility:hidden; width:50px; height:25px; text-align:center;">-->
					<select id="indicator" onchange="getIndicator()">
						<option disabled="" selected="" value="Choose">请选择指示剂</option>
						<option value="Phenolphthalein">酚酞 (8.0 - 10.0)</option>
						<option value="Methyl orange">甲基橙 (3.3 - 4.5)</option>
						<option value="Bromothymol blue">溴百里酚蓝 (6.0 - 7.5)</option>
						<option value="Crystal violet">结晶紫 (0.0 - 1.8)</option>
						<option value="Alizarin yellow">茜素黄 (10.0 - 12.0)</option>
						<option value="Erichrome black T">铬黑T (5.0 - 6.5)</option>				
					</select>	 
				</p>
				<p class="SetBur"><b>滴定剂</b><span id="titrantErr"></span><br>
					<input type="radio" name="titrant" id="titrantA" value="acid" onchange="getTitrantA()"> 酸
					&nbsp;<input type="radio" name="titrant" id="titrantB" value="base" onchange="getTitrantB()"> 碱</p>		
					<!--<p><b>Show the equivalence point&nbsp;&nbsp;</b><input type="checkbox" name="eqpt" id="eqpt"></p>-->
				<!--<p style="display:inline-block;"></p>-->
				<p class="SetRate"><b>滴定速度</b><br>
					慢&nbsp;&nbsp;<input type="range" id="dropRate" min="1" max="3" value="2" step="0.05" onchange="getDropRate()" style="width:50%;">&nbsp;&nbsp;快<br></p>
				<p><a id="startButton" class="button button--success button--rounded" onclick="reFill()">添加溶液并开始滴定</a></p>
				<p><a id="warnings" class="button button--outline-primary button--rounded"></a></p>
			</center>
		</div>
		<!-- Apparatus area -->
		<div id="apparatus_area" style="position:relative;">
			<div style="position:absolute; top:0px; left:100px; z-index:0;">
				<canvas id="liquids" width="120" height="690"></canvas>
			</div>
			<div style="position:absolute; top:570px; left:100px; z-index:1;">
				<canvas id="stirBar" width="120" height="120"></canvas>
			</div>
			<div onclick="titrate(event)" id="buret" style="position:absolute; top:10px; left:103px; z-index:2;">
				<img src="/assets/images/titration simulator.gif" width="112" height="670" border="0">
			</div>
		</div>
		<!-- Titration graph area -->
		<div id="graph_area">
			<div>
				<center><table style="border:0;width:400px;cellpadding:5px;margin-left:auto;" id="results"><tbody><tr>
						<td width="50%" border="none"><center><p id="buretReading"><b>Buret Reading</b><br>--</p></center></td>
						<td width="50%"><center><p id="pHReading"><b>pH Reading</b><br>--</p></center></td></tr></tbody></table>
				</center>
			</div>
			<div style="width:400px;height:560px;margin-left:auto"><canvas id="graph" onclick="clearGraph()" width="400"	height="400" style="background-color:white;"></canvas>
			</div>
		</div>
			<!-- Messages area -->
			<!--<div style="position:absolute; top:550; left:700; width:400px; border:0px solid #ff0000;">
				<p id="warnings"><font color="green"><blockquote></blockquote></font></p><p id="warnings2"></p>
			</div>-->
		</body>
	</html>