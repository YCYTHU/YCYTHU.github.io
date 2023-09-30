---
layout: none
title: 光谱处理工具包
cover: /assets/images/electron cloud.jpg
---
<!--more-->

<title>Spectrum toolkit</title>
<head>
	<script src="/assets/js/interp1.js" type="text/javascript"></script>
	<script src="/assets/js/papaparse.js" type="text/javascript"></script>
	<script src="https://cdn.plot.ly/plotly-2.26.0.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.7.9/dat.gui.min.js" type="text/javascript"></script>
</head>

<body>
	<input type="file" id="inputCSV" style="visibility: hidden;" onchange="newFile()" accept=".csv"/>
	<div id='GraphArea'></div>
</body>
<script>
	//console.log('300,500'.split(','));
	var obj_list = [];
	var obj_gui, obj1_gui, obj2_gui;
	var index = -1;
	var index1 = -1;
	var index2 = -1;
	var gui = new dat.GUI();
	var layout = {
		title: {text:'Spectrum', font: {family: 'Times New Roman', size: 24}},
  		xaxis: {title: {text: 'Wavelength (nm)', font: {family: 'Times New Roman', size: 18, color: '#000000'}}},  
  		yaxis: {title: {text: '', font: {family: 'Times New Roman', size: 18, color: '#000000'}}},
  		xaxis2: {title: {text: 'Wavelength (nm)', font: {family: 'Times New Roman', size: 18, color: '#000000'}}},  
  		yaxis2: {title: {text: '', font: {family: 'Times New Roman', size: 18, color: '#000000'}}},
  		grid: {}
	};
	var config = {
		editable: true,
  		toImageButtonOptions: {
    		format: 'svg', // one of png, svg, jpeg, webp
    		filename: 'Spectrum',
    		height: 500,
    		width: 500,
    		scale: 1
  		},
  		displaylogo: false,
  		responsive: true
	};
	var default_color_list = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'];
	var controls = new function () {
		this.file = '';
		this.counts = 0;
		this.visible = true;
		this.name = '';
		this.object = 'None';
		this.object1 = 'None';
		this.object2 = 'None';
		this.clip_range = '';
		this.color = '#1f77b4';
	};

	var control_functions = {
		loadFile: function() { 
            document.getElementById('inputCSV').click();
    	},
    	exportCSV: function() {
    		var csv = Papa.unparse(math.transpose(obj_list[index].data));
    		downloadCSV(obj_list[index].name + '_modified', csv);
    	},
		normalizePeak: function() {
			if (index != -1) {
				var peak = Math.max(...obj_list[index].data[1]);
				if (peak != 1) {
					obj_list[index].data[1] = math.multiply(obj_list[index].data[1], 1 / peak);
					plotly();
				}
			}
		},
		normalizeArea: function() {
			if (index != -1) {
				var area = trapz(obj_list[index].data[0], obj_list[index].data[1]);
				if (area != 1) {
					obj_list[index].data[1] = math.multiply(obj_list[index].data[1], 1 / area);
					plotly();
				}
			}
		},
		overlap: function() {
			if (index1 != -1 && index2 != -1) {//index1--emission; index2--absorption
				var overlap = calcOverlapIntegral(obj_list[index1].data, obj_list[index2].data);
				if (overlap == 0)
					return;
				console.log('Overlap Integral between ' + obj_list[index1].name + '(emi) and ' + obj_list[index2].name + '(abs) is: ', trapz(overlap[0], overlap[1]));
				layout.grid.rows = 1;
				layout.grid.columns = 2;
				layout.grid.pattern = 'independent';
				var name = 'J-int_' + obj_list[index1].name + '_' + obj_list[index2].name;
				obj_list.push(new Spectrum(name, overlap, true, default_color_list[obj_list.length % 10, undefined, 2));
				controls.counts += 1;
				counts_gui.setValue(controls.counts);
				plotly();
				updateObjGui();
			}
		}
	};

	var file_gui = gui.addFolder('Files');
	file_gui.open();
	file_gui.add(control_functions, 'loadFile').name("Load CSV file");
	var counts_gui = file_gui.add(controls, 'counts').name("Files Loaded:");
	counts_gui.__input.disabled = true;

	var unary_operation_gui = gui.addFolder('Unary Operation');
	unary_operation_gui.open();
	unary_operation_gui.add(control_functions, 'exportCSV').name("Export to .csv file");
	var visible_gui = unary_operation_gui.add(controls, 'visible').name("Visible:");
	var name_gui = unary_operation_gui.add(controls, 'name').name("Name:");
	var color_gui = unary_operation_gui.addColor(controls, 'color').name("Color:")
	unary_operation_gui.add(control_functions, 'normalizePeak').name("Normalize (Peak)");
	unary_operation_gui.add(control_functions, 'normalizeArea').name("Normalize (Area)");
	var clip_gui = unary_operation_gui.add(controls, 'clip_range').name("Clip Range:");
	obj_gui = unary_operation_gui.add(controls, 'object', obj_list.map(item => item.name).concat(['None'])).name("Object:");

	var binary_operation_gui = gui.addFolder('Binary Operation');
	binary_operation_gui.open();
	binary_operation_gui.add(control_functions, 'overlap').name("J-overlap integral");
	obj1_gui = binary_operation_gui.add(controls, 'object1', obj_list.map(item => item.name).concat(['None'])).name("Object1:");
	obj2_gui = binary_operation_gui.add(controls, 'object2', obj_list.map(item => item.name).concat(['None'])).name("Object2:");

	visible_gui.onFinishChange(function(value) {
		if (index != -1) {
			obj_list[index].visible = value;
			plotly();
		}
	});

	name_gui.onFinishChange(function(value) {
		if (index != -1) {
			obj_list[index].name = value;
			updateObjGui();
			obj_gui.setValue(value);
			plotly();
		}
	});

	clip_gui.onFinishChange(function(value) {
		if (index != -1) {
			var split = value.replace(/[0-9]/ig,"");//delete number to get the split character
			var range = value.split(split).map(Number);
			var data_tmp = math.subset(obj_list[index].data, math.index([0, 1], math.smallerEq(obj_list[index].data[0], Math.max(...range))));
			obj_list[index].data = math.subset(data_tmp, math.index([0, 1], math.largerEq(data_tmp[0], Math.min(...range))));
			plotly();
		}
	});

	color_gui.onFinishChange(function(value) {
		if (index != -1) {
			obj_list[index].color = value;
			plotly();
		}
	});

	function calcOverlapIntegral(emission, absorption) {
		var area = trapz(emission[0], emission[1]);
		if (area != 1)
			emission[1] = math.multiply(emission[1], 1 / area);
		var axisMin = Math.max(Math.min(...emission[0]), Math.min(...absorption[0]));
		var axisMax = Math.min(Math.max(...emission[0]), Math.max(...absorption[0]));
		if (axisMax <= axisMin)
			return 0;//no overlap
		else {
			let emission_left = math.subset(emission, math.index([0, 1], math.smallerEq(emission[0], axisMax)));
			var emission_clip = math.subset(emission_left, math.index([0, 1], math.largerEq(emission_left[0], axisMin)));
			let absorption_left = math.subset(absorption, math.index([0, 1], math.smallerEq(absorption[0], axisMax)));
			var absorption_clip = math.subset(absorption_left, math.index([0, 1], math.largerEq(absorption_left[0], axisMin)));
		}
		var emission_range = emission_clip[0][emission_clip[0].length - 1] - emission_clip[0][0];
		var absorption_range = absorption_clip[0][absorption_clip[0].length - 1] - absorption_clip[0][0];
		var long_range = emission_range > absorption_range ? emission_clip : absorption_clip;
		var short_range = emission_range < absorption_range ? emission_clip : absorption_clip;
		long_range[1] = interp1(long_range[0], long_range[1], short_range[0], 'linear');
		long_range[0] = short_range[0];
		var overlap = math.dotMultiply(math.dotMultiply(long_range[1], short_range[1]), math.dotPow(short_range[0], 4));
		return [short_range[0], overlap];
	}

	function hexToRgb(hex) {
  		var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  		return result ? {
    		r: parseInt(result[1], 16),
    		g: parseInt(result[2], 16),
    		b: parseInt(result[3], 16)
  		} : null;
	}

	function Spectrum(name, data, visible, color, width, axes = 1) {
		this.name = name;
		this.data = data;
		this.visible = visible;
		this.axes = axes;
		this.color = color;
		this.width = width;
	}

	function PlotData(x, y, type, name, color, width, xaxis, yaxis) {//color in hex format
		var rgb = hexToRgb(color);
		this.x = x;
		this.y = y;
		this.type = type;
		this.name = name;
		this.line = {
			color: 'rgb(' + [rgb.r, rgb.g, rgb.b].toString() + ')',
			width: width
		};
		this.xaxis = xaxis;
		this.yaxis = yaxis;
	}

	function plotly() {
		var data_list = [];
		for (var i = 0; i < obj_list.length; i++)
			if (obj_list[i].visible)
				data_list.push(new PlotData(obj_list[i].data[0], obj_list[i].data[1], 'lines', obj_list[i].name, obj_list[i].color, obj_list[i].width, 'x' + obj_list[i].axes, 'y' + obj_list[i].axes));
		Plotly.newPlot('GraphArea', data_list ,layout, config);
	}
	
	function newFile() {
		const inputCSV = document.getElementById('inputCSV');
		const file = inputCSV.files[0];
		Papa.parse(file, {
			dynamicTyping: true,
			skipEmptyLines: 'greedy',
			complete: function(results, file) {
				var data = math.transpose(results.data);
				var name = file.name.replace('.csv', '');
				obj_list.push(new Spectrum(name, data, true, default_color_list[obj_list.length % 10]));
				controls.counts += 1;
				counts_gui.setValue(controls.counts);
				plotly();
				updateObjGui();
			}
		});
	}

	function updateObjGui() {
		//Unary Part
		unary_operation_gui.remove(obj_gui);
		obj_gui = unary_operation_gui.add(controls, 'object', obj_list.map(item => item.name).concat(['None'])).name("Object:");
		obj_gui.onFinishChange(function(value) {
			index = obj_list.map(item => item.name).indexOf(value);
			if (index != -1) {
				visible_gui.setValue(obj_list[index].visible);
				name_gui.setValue(obj_list[index].name);
				color_gui.setValue(obj_list[index].color);
			}
		});
		//Binary Part
		binary_operation_gui.remove(obj1_gui);
		binary_operation_gui.remove(obj2_gui);
		obj1_gui = binary_operation_gui.add(controls, 'object1', obj_list.map(item => item.name).concat(['None'])).name("Object:");
		obj2_gui = binary_operation_gui.add(controls, 'object2', obj_list.map(item => item.name).concat(['None'])).name("Object:");

		obj1_gui.onFinishChange(function(value) {
			index1 = obj_list.map(item => item.name).indexOf(value);
		});
		obj2_gui.onFinishChange(function(value) {
			index2 = obj_list.map(item => item.name).indexOf(value);
		});
	}

	function trapz(x, y) {
		var y1 = math.subset(y, math.index(math.range(0,y.length-1)));
		var y2 = math.subset(y, math.index(math.range(1,y.length)));
		var y_av = math.multiply(math.add(y1, y2),0.5);
		return math.multiply(math.diff(x),y_av);
	}

	function downloadCSV(fileName, content) {
    	let a = document.createElement('a');
    	a.href = 'data:text/plain;charset=utf-8,' + content
    	a.download = fileName + '.csv';
    	document.body.appendChild(a);
    	a.click();
    	document.body.removeChild(a);
	}
</script>