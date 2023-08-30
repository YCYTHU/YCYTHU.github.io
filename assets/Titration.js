var graph, graphCTX, liquids, liquidsCTX, stirBar, stirBarCTX; 
var acid="Choose", base="Choose", indicator="Choose"; aliquot = "Choose"; // (Unselected at startup)
var pipet = 0;
var strongAcid, strongBase;
var titrant, dropRate = 70;
var startLevel, level = 0, titre = 0, titreAtEqPt, buretReading;
var colourDpt = false;
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
//var tableTop = '<table width = "300" border="2">' + '<tr><td width="100" align="center">Reading</td><td  width="100" align="center">Buret (mL)</td><td align="center">pH</td></tr>';
//var tableBottom = '</table>';
//var tableRows = "";
//var tableRowNumber = 1;
var infinity = "inf."
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
function getAliquot() {  // Get aliquot volume
	clearInterval(titreInterval);
	aliquot = document.getElementById("aliquot").value; setAliquot(aliquot);
	document.getElementById("aliquotErr").innerHTML = "试样体积"; ready();
}
function getConcAcid() {  // Get acid concentration
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
function setNormalMode() {
	document.getElementById("normal").checked = true;
	document.getElementById("cheating").checked = false;
	document.getElementById("graph_div").style.visibility='hidden';
	document.getElementById("results").style.visibility='hidden';
}
function setCheatingMode() {
	document.getElementById("cheating").checked = true;
	document.getElementById("normal").checked = false;
	document.getElementById("graph_div").style.visibility='visible';
	document.getElementById("results").style.visibility='visible';
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
		titre = pipet*concBase/concAcid;
	} else {
		titre = pipet*concAcid/concBase;
	}
	titreAtEqPt = titre; // + reading; 
	getpH();	
	pHAtEqPt = pH;
	titre = 0;			
  	buretReading = reading.toFixed(2).toString(); // Reading to nearest 0.01 mL //((reading/2).toFixed(2)*2).toFixed(2)
  	document.getElementById("buretReading").innerHTML = "<b>滴定管读数</b><br>"+buretReading+" mL";
  	getpH();	
  	pHReading = pH.toFixed(2).toString();
  	document.getElementById("pHReading").innerHTML = "<b>pH 值</b><br>"+pHReading;
  	document.getElementById("score").innerHTML = "";
  	showLiquids(level);
	clearInterval(stirInterval); // Start stirring first time
	stirInterval = setInterval(stirrer,50);
	clearInterval(titreInterval); titreInterval = setInterval(titrationPlot,dropRate); // Allow titration	
		//tableRows = ""; document.getElementById("data").innerHTML = ""; // Clear data area and reinitialize
		//if(document.getElementById("dpts").checked) {
		//	tableRowNumber = 1 // Write a starting entry in the data table
		//	tableRows = tableRows + '<tr><td align = "center">' + tableRowNumber + 
		//	'</td><td align = "center">' + buretReading + 
		//	'</td><td align = "center">' + pHReading + '</td></tr>';
		//	document.getElementById("data").innerHTML = tableTop + tableRows + tableBottom;
		//}
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
		//if (document.getElementById("acidKa").value == "--") document.getElementById("acidKaErr").innerHTML = errFlag;
		//if (document.getElementById("baseKb").value == "--") document.getElementById("baseKbErr").innerHTML = errFlag;
		
		//if (Ka == undefined) document.getElementById("acidKaErr").innerHTML = errFlag;
		//if (Kb == undefined) document.getElementById("baseKbErr").innerHTML = errFlag; 

		if (indicator=="Choose") document.getElementById("indErr").innerHTML = "指示剂"+errFlag;
		if (concAcid==undefined) document.getElementById("concAcidErr").innerHTML = errFlag;
		if (concBase==undefined) document.getElementById("concBaseErr").innerHTML = errFlag;
		if (titrant==undefined) document.getElementById("titrantErr").innerHTML = errFlag;
		if (aliquot=="Choose") document.getElementById("aliquotErr").innerHTML = "试样体积"+errFlag;
		if (acid=="Choose" || base=="Choose" || indicator=="Choose" || aliquot=="Choose" || concAcid==undefined || concBase==undefined || titrant==undefined || Ka==undefined || Kb==undefined)
			return false; 
		document.getElementById("warnings").innerHTML = '';
		document.getElementById("startButton").disabled = false;
		return true;
} 
function titrationPlot() {	// Main loop to display the titration progress.
	if (!tapOpen) return;
	colourDpt = false;
	showLiquids(level);
  	reading = (startLevel+level-84)/15;	 // Buret reading in mL					
  	buretReading = reading.toFixed(2).toString();//((reading/2).toFixed(2)*2).toFixed(2).toString(); // Reading to nearest 0.01 mL
  	pHReading = pH.toFixed(2).toString();
  	document.getElementById("buretReading").innerHTML = "<b>滴定管读数</b><br>"+buretReading+" mL";
  	level=level + 0.4; 
  	if (reading >= 25) { // Stop titration when buret is empty!
  		clearInterval(titreInterval); tapOpen = false; showLiquids(level); 
  		document.getElementById("startButton").disabled = false;
  		//if (document.getElementById("dpts").checked) {
  		//	if (!colourDpt) {
		//			tableRowNumber = tableRowNumber + 1 // Write an entry in the data table
		//			tableRows = tableRows + "<tr ><td align = 'center'>" + tableRowNumber + 
		//			"</td><td align = 'center'>" + buretReading + 
		//			"</td><td align = 'center'>" + pHReading + "</td></tr>";
		//			document.getElementById("data").innerHTML = tableTop + tableRows + tableBottom;
		//		}
		//			else { // This attempt to highlight the reading nearest to the euivalence point in blue is not working!
		//			tableRowNumber = tableRowNumber + 1 // Write an entry in the data table
		//			tableRows = tableRows + "<tr bgcolor='lightblue'><td align = 'center'>" + tableRowNumber + " *" +
		//			"</td><td align = 'center'>" + buretReading + 
		//			"</td><td align = 'center'>" + pHReading + "</td></tr>";
		//			document.getElementById("data").innerHTML = tableTop + tableRows + tableBottom;
		//			colourDpt = false;
		//		}	 
		//	} 
  		return;
  	} 
  	prevpH = pH; prevTitre = titre;
  	titre = level/15; 
  	getpH();
  		//pHReading = pH.toFixed(2).toString();
  	document.getElementById("pHReading").innerHTML = "<b>pH 值</b><br>"+pHReading;
  	graphCTX.lineWidth = 2;
		if (level > 1) {// plot graph points
			graphCTX.beginPath(); graphCTX.strokeStyle = "#ff0000";
			graphCTX.moveTo(50+(prevTitre*12),351-(prevpH*300/14)); 
			graphCTX.lineTo(50+(titre*12),351-(pH*300/14)); graphCTX.stroke(); graphCTX.closePath();
			//if (titre > titreAtEqPt+0.2) drawEqPt(document.getElementById("eqpt").checked); // Shows the equivalence point if checkbox checked just after it is passed
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
			colourDpt = true; // Flag to make the next data point blue if the table is being written
		}
}	
function titrate(){//event) { // Start/stop the titration by clicking the tap
		//var x, y,
		//x = (event.clientX-document.getElementById("buret").getBoundingClientRect().left);
		//y = (event.clientY-document.getElementById("buret").getBoundingClientRect().top);
  	//if((x > 75) && (x < 90) && (y > 465) && (y < 485)) { // tap clicked
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
function titrateStart(event) { //Start titrating by mouse down on tap
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
		}      
}
function titrateStop(event) { //stop titrating on releasing the mouse
		var x, y,
		x = (event.clientX-document.getElementById("buret").getBoundingClientRect().left);
		y = (event.clientY-document.getElementById("buret").getBoundingClientRect().top);
  	if((x > 75) && (x < 90) && (y > 465) && (y < 485)) { // tap clicked
  		if (!liquidsAdded) return;
			if(tapOpen) { // tap open. Close it and stop the titration.
				tapOpen = false; clearInterval(titreInterval); showLiquids(level);
				document.getElementById("startButton").disabled = false;
				//if (document.getElementById("dpts").checked) {
  				//tableRowNumber = tableRowNumber + 1 // Write an entry in the data table
  				//tableRows = tableRows + '<tr><td align = "center">' + tableRowNumber + 
  				//'</td><td align = "center">' + buretReading + 
  				//'</td><td align = "center">' + pHReading + '</td></tr>';
  				//document.getElementById("data").innerHTML = tableTop + tableRows + tableBottom; 
  				//}
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
		//var x = level/900.0 + 0.3;	//height in the flask fudge factor!
  	liquidsAdded = true;
	liquidsCTX.fillStyle = "#ffffff"; liquidsCTX.fillRect(0,0,120,690); // Clear the liquids canvas
  	liquidsCTX.fillStyle = "#f0f0f0";  // liquid in buret will be pale grey
  	liquidsCTX.fillRect(10,startLevel+level-1,100,540-startLevel-level-1);	// Show buret contents
  	liquidsCTX.strokeStyle = "#000000"; liquidsCTX.beginPath(); //meniscus in buret
  	liquidsCTX.arc(57,startLevel+level-9,10,0.27*Math.PI,0.73*Math.PI); liquidsCTX.stroke(); 
	liquidsCTX.fillStyle = getColour(1.0); // bulk colour 
	switch (aliquot) {
	case "10 mL": {
  	liquidsCTX.fillRect(20,635-(45.0*x),80,(45.0*x)+10); // show flask contents
    liquidsCTX.fillStyle = getColour(0.9); // surface (darker) colour
    liquidsCTX.beginPath(); liquidsCTX.moveTo(22+15*x,635-45*x); 
    liquidsCTX.bezierCurveTo(22+15*x,630-45*x,92-15*x,630-45*x,92-15*x,635-45*x);
    liquidsCTX.bezierCurveTo(92-15*x,640-45*x,22+15*x,640-45*x,22+15*x,635-45*x);
    break;
  }
	case "20 mL": {
  		liquidsCTX.fillRect(20,631-(45.0*x),80,(45.0*x)+10); // show flask contents
      liquidsCTX.fillStyle = getColour(0.9); // surface (darker) colour
      liquidsCTX.beginPath(); liquidsCTX.moveTo(24+15*x,631-45*x); 
      liquidsCTX.bezierCurveTo(24+15*x,626-45*x,90-15*x,626-45*x,90-15*x,631-45*x);
      liquidsCTX.bezierCurveTo(90-15*x,636-45*x,24+15*x,636-45*x,24+15*x,631-45*x);
      break;
  }
	case "25 mL": {
  		liquidsCTX.fillRect(20,630-(45.0*x),80,(45.0*x)+10); // show flask contents
      liquidsCTX.fillStyle = getColour(0.9); // surface (darker) colour
      liquidsCTX.beginPath(); liquidsCTX.moveTo(24+15*x,630-45*x); 
      liquidsCTX.bezierCurveTo(24+15*x,625-45*x,90-15*x,625-45*x,90-15*x,630-45*x);
      liquidsCTX.bezierCurveTo(90-15*x,635-45*x,24+15*x,635-45*x,24+15*x,630-45*x);
      break;
  }
}
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
			volBase = pipet/1000;
		} else {
			volAcid = pipet/1000;
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
  		volBase = pipet/1000;
  	} else {
  		volAcid = pipet/1000;
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
  		volBase = pipet/1000;
  	}  else {
  		volAcid = pipet/1000;
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
  	document.getElementById("warnings").innerHTML = "<a class=\"button button--outline-primary button--rounded\">警告：弱酸弱碱不应互相滴定</a>";
  }

  function setAcidity() { // Picks the appropriate Ka and base type.
  	var KAcid;
  	document.getElementById("acidKa").disabled = true;
  	switch (acid)
  	{
  	case "Hydrochloric acid":
  		{				
        Ka = 0.0; // Not used - should be infinity!
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
case "Custom":
			//default: //User's acid
	{
		document.getElementById("acidKa").disabled = false;
		KAcid = document.getElementById("acidKa").value;
				if (KAcid == "--") { // Ka not entered?
					//document.getElementById("warnings2").innerHTML = "<font color='red'><blockquote>* Please enter a K<sub>a</sub> value for your acid</blockquote></font>";
					break;
				}
				else { // Yes it is
					//document.getElementById("warnings2").innerHTML = "";
				}
				if (KAcid.toLowerCase() == "inf") { // Strong acid case
					Ka = 0.0; // Not used - should be ~infinity!
					strongAcid = true;
				}
				else { // Weak acid case
					Ka = parseFloat(KAcid);
					strongAcid = false;
				}
				//document.getElementById("acidKaErr").innerHTML = noErrFlag;
				break;
			}
		}
		if (Ka !== undefined) {
			document.getElementById("acidKaErr").innerHTML = noErrFlag;
			if (Ka == 0.0) document.getElementById("acidKa").value = "Inf"; else document.getElementById("acidKa").value = Ka.toExponential(1);
		}
	}
  function setBasicity() {  // Picks the appropriate pKa and acid type.
  	var KBase;
  	document.getElementById("baseKb").disabled = true;
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
	case "Custom"://	default: //User's base
		{
			document.getElementById("baseKb").disabled = false;
			KBase = document.getElementById("baseKb").value;
				if (KBase == "--") { // Kb not entered?
					//document.getElementById("warnings2").innerHTML = "<font color='red'><blockquote>Please enter a K<sub>b</sub> value for your base</blockquote></font>";
					break;
				}
				else { // Yes it is
					//document.getElementById("warnings2").innerHTML = "";
				}
				if (KBase.toLowerCase() == "inf") { // Strong base case
					Kb = 0.0; // Not used - should be ~infinity!
					strongBase = true;
				}
				else { // Weak acid case
					Kb = parseFloat(KBase);
					strongBase = false;
				}
				//document.getElementById("baseKbErr").innerHTML = noErrFlag;
				break;
			}
		}	
		if (Kb !== undefined) {
			document.getElementById("baseKbErr").innerHTML = noErrFlag;
			if (Kb == 0.0) document.getElementById("baseKb").value = "Inf"; else document.getElementById("baseKb").value = Kb.toExponential(1);
		}
	}
  function setIndicator(){ // Sets pH and colours
  	switch (indicator)
  	{
  	case "Phenolphthalein":
  		{
  			pHInd =	9.0;
        indRed1 = 255;   //1.0;			//in base (pink)
        indGreen1 = 100;   //0.027;
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
        indRed1 = 99;	//in base (blue)
        indGreen1 = 0;
        indBlue1 = 217;
        indRed2 = 84;		//in acid (green)
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
function setAliquot() {
	switch (aliquot)
	{
	case "10 mL":
		{
			pipet = 10;
			break;
		}
	case "20 mL":
		{
			pipet = 20;
			break;
		}
	case "25 mL":
		{
			pipet = 25;
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
function score() {
	if (isNaN(titre) || isNaN(titreAtEqPt)) {
		return;
	}
	if (tapOpen){
		tapOpen = false; clearInterval(titreInterval); showLiquids(level);
    	document.getElementById("startButton").disabled = false;
	}
	var error = titre-titreAtEqPt;
	var RE = error / titreAtEqPt * 100;
	error = error.toFixed(2).toString();
	RE = RE.toFixed(2).toString();
	if (error > 0) {
		document.getElementById("score").innerHTML = "<a class=\"button button--outline-primary button--rounded\">滴定过量了"+error+" ml,相对偏差"+RE+"%</a>";
	}
	else {
		error = -error;
		document.getElementById("score").innerHTML = "<a class=\"button button--outline-primary button--rounded\">距等当点还差"+error+" ml,相对偏差"+RE+"%</a>";
	}
	
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
	document.getElementById("warnings").innerHTML = "<a class=\"button button--outline-primary button--rounded\">警告：部分参数未设置</a>";
	var scale = document.getElementById("refwidth").clientWidth / document.getElementById("graph_div").clientWidth;
	if (scale > 1) scale = 1;
	document.getElementById("graph_div").style.transform = "scale("+scale+")";
	document.getElementById("apparatus_area").style.transform = "scale("+scale+")";
	document.getElementById("titrate_area").style.height = document.getElementById("liquids").clientHeight * scale + 'px';
}
window.onresize = function() {
	var scale = document.getElementById("refwidth").clientWidth / document.getElementById("graph_div").clientWidth;
	if (scale > 1) scale = 1;
	document.getElementById("graph_div").style.transform = "scale("+scale+")";
	document.getElementById("apparatus_area").style.transform = "scale("+scale+")";
	document.getElementById("titrate_area").style.height = document.getElementById("liquids").clientHeight * scale + 'px';
}