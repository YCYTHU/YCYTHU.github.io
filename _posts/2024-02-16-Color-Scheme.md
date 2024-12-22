---
title: 科研绘图配色方案在线预览
tags: 
- Plotly
- Color
- Code
- JavaScript
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/Colour Palette.jpg
modify_date: 2024-02-22
---
通过编辑、新增和删除操作修改配色方案，并通过[Plotly.js](https://plotly.com/javascript/)实时预览。
<!--more-->
更简便省时地展示、对比配色方案在折线图、柱状图[^STAT]与填充等高线图[^MATLAB]中的显示效果。

[^STAT]:[数据来源：国家统计局](https://data.stats.gov.cn/easyquery.htm)
[^MATLAB]:[数据来源：MATLAB函数 `peaks(50)` ](https://www.mathworks.com/help/matlab/ref/peaks.html)

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.css"/>
<script src="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.js"></script>
<script src="https://cdn.plot.ly/plotly-2.29.1.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.1/math.min.js" type="text/javascript"></script>
<style type="text/css">
    .plotDiv {
        max-width: 950px;
        height: 600px;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(2, 1fr);
        grid-column-gap: 10px;
        grid-row-gap: 10px;
    }
    .lineDiv { grid-area: 1 / 1 / 2 / 2; }
    .barDiv { grid-area: 1 / 2 / 2 / 3; }
    .stackBarDiv { grid-area: 2 / 1 / 3 / 2; }
    .contourDiv { grid-area: 2 / 2 / 3 / 3; }
    #colorTable {
    	display: table;
        border-collapse: separate;
        border-spacing: 8px;
    	width: unset;
        height: 100px;
    }
    .cnd8Div {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .cnd8Div table {
        display: inline-table;
        width: unset;
        margin: 1.2rem 0;
        border-collapse: separate;
        border-spacing: 6px;
    }
    .cnd8Div table tbody tr td {
        border: none;
        border-radius: .6rem;
        width: 2.5rem;
        height: 3rem;
        text-align: center;
        padding: 0px;
    }
    #colorTable tbody tr td {
    	border: none;
        border-radius: 12px;
        width: 50px;
        text-align: center;
        padding: 0px;
    }
    #optionTable {
    	display: table;
    	width: unset;
    	border-collapse: separate;
        border-spacing: 24px 8px;
        background-color: #efefef;
        border-radius: 10px;
    }
    #optionTable td {
    	border: none;
    	padding: 0;
    }
    .clr-field {
        z-index: 9;
    }
    .clr-field button {
        width: 0;
    }
    .mask {
        pointer-events: none;
        background-color: #fff0;
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .mask > i {
        pointer-events: none;
    }
    #colorSelector {
        width: 18px;
        height: 16px;
        opacity: 0;
        border: none;
        padding: 0;
    }
    .cnd8Div table tbody tr .cdn8GradientScheme {
        height: 1rem;
    }
</style>

<div style="text-align: center;">
	<div class="colorDiv" style="display: inline-block;">
	    <table id="colorTable"><tbody><tr id="colorRow">
	        <td style="background-color: #44045a; border: 2px solid #000;" onclick="selectTd(this)"></td>
	        <td style="background-color: #30688d;" onclick="selectTd(this)"></td>
	        <td style="background-color: #35b777;" onclick="selectTd(this)"></td>
	        <td style="background-color: #f8e620;" onclick="selectTd(this)"></td>
	    </tr></tbody></table>
	</div><br>
	<div class="optionDiv" style="display: inline-block;">
	    <table id="optionTable"><tbody><tr>
	        <td><span onclick="copyColor(this)"><i class="fas fa-copy"></i></span></td>
	        <td style="position: relative;"><input id="colorSelector" oninput="editColor(this.value)" readonly/><span style="position: absolute; left: 2px; /*top: 3px;*/"><i class="fas fa-edit"></i></span></td>
	        <td><span onclick="insertColor()"><i class="fas fa-plus"></i></span></td>
	        <td><span onclick="deleteColor()"><i class="fas fa-trash-alt"></i></span></td>
	    </tr></tbody></table>
	</div>
</div>
<div class="plotDiv">
    <div class="lineDiv" id="lineDiv"></div>
    <div class="barDiv" id="barDiv"></div>
    <div class="stackBarDiv" id="stackBarDiv"></div>
    <div class="contourDiv" id="contourDiv"></div>
</div>

## 经典配色方案

下方列出了一些经典的配色方案。点击渐变色可将配色方案应用于绘图中，点击色块复制对应颜色。

<div style="text-align: center;">
    <div class="cnd8Div">
    </div>
</div>

<script type="text/javascript">
    var colorNum = 4, colorArray = ['#44045a', '#30688d', '#35b777', '#f8e620'], lineData = [], barData = [], stackBarData = [], lineLayout, barLayout, stackBarLayout, contourLayout, currentIndex = 0, currentScheme = 'cdn8Color-scheme1', timer = false;
    var baseMargin = {
        l: 36,
        r: 24,
        b: 36,
        t: 36
    };
    var baseXaxis =  {
        zeroline: false,
        mirror: true,
        linecolor: '#000',
        linewidth: 2
    }; 
    var baseYaxis = {
        zeroline: false,
        mirror: true,
        linecolor: '#000',
        linewidth: 2
    };
    var config = {
        staticPlot: true,
        displaylogo: false,
        responsive: true
    };
    const year = [2022,2021,2020,2019,2018,2017,2016,2015,2014];
    const statData = [[
        [5.85597, 5.81084, 5.74225, 5.63040, 5.41661, 5.48413 ,5.39972, 5.39568, 5.24636],
        [6.43608, 6.29095, 6.31697, 6.31670, 6.10429, 6.11030 ,5.96712, 5.89285, 5.80891],
        [4.58678, 4.73555, 4.67924, 4.89849, 4.70215, 4.86682 ,4.72602, 5.18314, 5.09131],
        [1.98008, 1.94826, 1.98348, 1.93874, 1.89796, 1.85359 ,1.78923, 1.81144, 1.78733],
        [1.42290, 1.34844, 1.32286, 1.31782, 1.40408, 1.29666 ,1.29332, 1.22356, 1.13934],
        [1.99319, 1.89254, 1.86515, 1.76356, 1.81933, 1.76933 ,1.67051, 1.56488, 1.50832],
        [3.91337, 3.80993, 3.80328, 3.78109, 3.75180, 3.70946 ,3.67787, 3.63955, 3.63887],
        [1.61956, 1.59558, 1.56435, 1.65114, 1.64526, 1.60967 ,1.52927, 1.49503, 1.44293]
        ],[
        [11.7768, 11.7242, 11.5133, 11.6557, 11.2217, 11.1698, 10.9403, 10.6270, 10.6215],
        [47.5718, 45.9734, 44.0661, 42.4254, 39.2334, 41.3900, 40.3933, 38.8990, 37.3539],
        [60.0389, 55.9561, 51.2187, 45.8454, 41.3814, 38.1678, 35.9152, 36.1753, 33.6218],
        [19.2653, 18.8759, 17.8153, 17.3135, 16.0780, 16.4097, 15.9630, 16.5274, 15.8191],
        [15.3779, 14.9980, 14.3141, 14.1954, 13.6668, 13.0829, 12.6294, 13.1641, 11.7310],
        [13.8679, 13.7708, 13.8081, 13.5575, 13.1593, 12.3265, 11.8764, 11.1796, 11.0586],
        [ 7.4724,  7.4017,  7.7314,  7.4636,  7.3576,  7.2126,  6.8508,  7.1345,  6.4369],
        [63.0231, 61.6340, 62.3436, 63.2406, 61.5369, 63.1472, 62.2065, 65.9942, 64.7304]
    ]];
    const statName = [
        ['wheat', 'corn', 'sorghum', 'soybeans', 'greenBeans', 'cotton', 'peanut', 'sesame'],
        ['banana', 'apple', 'citrus', 'pear', 'grape', 'muskmelon', 'redDates', 'watermelon']
    ];
    var matlabPeaks_x = [], matlabPeaks_z = [];
    for (let i = 0; i < 50; i++) {
        let x = -3 + (6/49) * i;
        matlabPeaks_x.push(x);
        for (let j = 0; j < 50; j++) {
            let y = -3 + (6/49) * j;
            matlabPeaks_z.push(3*(1-x)**2*Math.exp(-(x**2)-((y+1)**2))-10*(x/5-x**3-y**5)*Math.exp(-(x**2)-(y**2))-(1/3)*Math.exp(-((x+1)**2)-(y**2)));
        }
    }
    matlabPeaks_z = math.transpose(math.reshape(matlabPeaks_z,[50, 50]));
	var contourData = [{
        z: matlabPeaks_z,
        x: matlabPeaks_x,
        y: matlabPeaks_x,
        type: 'contour',
        colorscale: [
            [0, '#042940'],
            [0.33, '#005c53'],
            [0.67, '#9fc131'],
            [1, '#dbf227']
        ],
        colorbar: {
            outlinecolor: '#000',
            dtick: 2,
            thickness: 24
        },
        contours: {coloring: 'heatmap'},
        ncontours: 8
    }];
    const cnd8Color = [
        ['#44045a', '#30688d', '#35b777', '#f8e620'],
        ['#12264F', '#354E6B', '#108B96', '#D4DDE1'],
        ['#042940', '#005c53', '#9fc131', '#dbf227'],
        ['#354E6B', '#4182A4', '#F0C2A2', '#A64036'],
        ['#5b5f97', '#b8b8d1', '#ffc145', '#ff6b6c'],
        ['#354E6B', '#B2B6B6', '#ECD452', '#A64036'],
        ['#3C405B', '#82B29A', '#F2CC8E', '#DF7A5E'],
        ['#1D5D9B', '#75C2F6', '#fff5c6', '#F4D160'],
        ['#02304A', '#136783', '#219EBC', '#90C9E7'],
        ['#4B74B0', '#90BEE0', '#FFDF92', '#DB3124'],
        ['#44757A', '#B7B5A0', '#EED5B7', '#DD6C4C'],
        ['#024f75', '#219EBC', '#FFB703', '#FB8402'],
        ['#3468C0', '#adc5ff', '#FFDD95', '#FF9843'],
        ['#4285f4', '#34a853', '#fbbc05', '#ea4335'],
        ['#76290b', '#c27e35', '#ccb363', '#fbedc3'],
        ['#0C359E', '#EE99C2', '#FFE3CA', '#F6F5F5'],
        ['#132a13', '#31572c', '#90a955', '#ecf39e'],
        ['#2f321f', '#693654', '#d63f3a', '#fe7d3c'],
        ['#acbed8', '#e8ebf7', '#f2d398', '#d78521'],
        ['#5b618a', '#9eadc8', '#d6d65a', '#b9e28c'],
        ['#453C67', '#6D67E4', '#46C2CB', '#F2F7A1'],
        ['#311f19', '#805241', '#a97d6a', '#d7c5b9'],
        ['#2a6666', '#709078', '#e9bd7d', '#ffe499'],
        ['#3d4d55', '#a79e9c', '#d3c3b9', '#b58863']
    ];
    const RGB2HEX = (r, g, b) => ((r << 16) + (g << 8) + b).toString(16).padStart(6, '0');
    init();
    function editColor(newColor) {
        currentScheme = 'custom';
        colorArray[currentIndex] = newColor;
        document.getElementById('colorRow').cells[currentIndex].style.backgroundColor = newColor;
        lineData[currentIndex].line.color = newColor;
        barData[currentIndex].marker.color = newColor;
        stackBarData[currentIndex].marker.color = newColor;
        contourData[0].colorscale = [];
        for (let i = 0; i < colorNum; i++) {
            contourData[0].colorscale.push([i / (colorNum - 1), colorArray[i]]);
        }
        updatePlot();
    }
    function insertColor() {
        if (colorNum >= 8)
            return;
        currentScheme = 'custom';
        colorNum++;
        currentIndex++;
        var tr = document.getElementById('colorRow');
        var newColor = getRandomColor();
        tr.insertCell(currentIndex);
        tr.cells[currentIndex].outerHTML = '<td style="background-color: ' + newColor + ';" onclick="selectTd(this)"></td>'
        tr.cells[currentIndex - 1].style.border = '';
        colorArray.splice(currentIndex, 0, newColor);
        selectTd(tr.cells[currentIndex]);
        constructData();
        updatePlot();
    }
    function deleteColor() {
        if (colorNum <= 2)
            return;
        currentScheme = 'custom';
        colorNum--;
        colorArray.splice(currentIndex, 1);
        constructData();
        var tr = document.getElementById('colorRow');
        tr.deleteCell(currentIndex);        
        updatePlot();
        currentIndex = 0;
        selectTd(tr.cells[currentIndex]);
    }
    function constructData() {
        lineData = [];
        barData = [];
        stackBarData = [];
        contourData[0].colorscale = [];
        for (let i = 0; i < colorNum; i++) {
            lineData.push(new Line(year, statData[0][i], statName[0][i], colorArray[i]));
            stackBarData.push(new Bar(year, statData[1][i], statName[1][i], colorArray[i]));
            barData.push(new Bar(statName[1].slice(3,6), math.reshape(math.column(statData[1],7 - i).slice(3,6),[3]), year[7 - i], colorArray[i]));
            contourData[0].colorscale.push([i / (colorNum - 1), colorArray[i]]);
        }
    }
    function updatePlot() {
        Plotly.react("lineDiv", lineData, lineLayout, config);
        Plotly.react("stackBarDiv", stackBarData, stackBarLayout, config);
        Plotly.react("barDiv", barData, barLayout, config);
        Plotly.react("contourDiv", contourData, contourLayout, config);
    }
    function applyCnd8(scheme) {
        if (scheme == currentScheme)
            return;
        currentScheme = scheme;
        var cnd8Scheme = document.querySelectorAll('.' + scheme);
        var cnd8ColorNum = cnd8Scheme.length;
        var cnd8Color = [];
        var tr = document.getElementById('colorRow');
        colorArray = [];
        if (cnd8ColorNum > colorNum)
            for (let i = colorNum; i < cnd8ColorNum; i++) {
                tr.insertCell(0);
                tr.cells[0].outerHTML = '<td onclick="selectTd(this)"></td>'
            }
        if (cnd8ColorNum < colorNum)
            for (let i = cnd8ColorNum; i < colorNum; i++)
                tr.deleteCell(0);
        for (let i = 0; i < cnd8ColorNum; i++) {
            colorArray.push(colorStr2Hex(cnd8Scheme[i].style.backgroundColor));
            tr.cells[i].style.border = '';
            tr.cells[i].style.backgroundColor = cnd8Scheme[i].style.backgroundColor;
        }
        currentIndex = 0;
        selectTd(tr.cells[0]);
        colorNum = cnd8ColorNum;
        constructData();
        updatePlot();
    }
    function copyColor(span) {
        span.innerHTML = '<i class="fas fa-clipboard-check"></i>';
        setTimeout(() => {
            span.innerHTML = '<i class="fas fa-copy"></i>'; 
        }, 1000);
        var copyTxt = colorStr2Hex(document.getElementById('colorRow').cells[currentIndex].style.backgroundColor);
        copy(copyTxt);
    }
    function copyCnd8(td) {
        if (timer)
            return;
        timer = true;
        var copyTxt = colorStr2Hex(td.style.backgroundColor);
        copy(copyTxt);
        var div = td.children[0];
        div.innerHTML = '<i class="fas fa-clipboard-check"></i>';
        div.style.backgroundColor = '#fff9';
        setTimeout(() => {
            timer = false;           
        }, 1100);
        setTimeout(() => {
            div.innerHTML = '';
            div.style.backgroundColor = '#fff0';
        }, 1000);
    }
    function copy(text) {
        var copyIpt = document.createElement("input");
        copyIpt.setAttribute("value", text);
        document.body.appendChild(copyIpt);
        copyIpt.select();
        document.execCommand("copy");
        document.body.removeChild(copyIpt);
    }
    function colorStr2Hex(colorStr) {
        var rgb = colorStr.substring(4, colorStr.length-1).split(',').map(Number);
        return '#'+RGB2HEX(rgb[0], rgb[1], rgb[2]);
    }
    function selectTd(td) {
        //if (index == currentIndex)
        //    return;
        var tr = document.getElementById('colorRow');
        var index = [].indexOf.call(tr.children, td);
        tr.cells[currentIndex].style.border = '';
        tr.cells[index].style.border = '2px solid #000';
        currentIndex = index;
    }
    function getRandomColor() {
        let red = Math.floor(Math.random() * 256).toString(16);
        let green = Math.floor(Math.random() * 256).toString(16);
        let blue = Math.floor(Math.random() * 256).toString(16);
        return "#" + (red.length == 1 ? "0" + red : red) + (green.length == 1 ? "0" + green : green) + (blue.length == 1 ? "0" + blue : blue);
    }
    function Line(x, y, name, color) {
        this.x = x;
        this.y = y;
        this.name = name;
        this.line = {color: color};
        this.mode = 'lines+markers';
        this.type = 'scatter';
    }
    function Bar(x, y, name, color) {
        this.x = x;
        this.y = y;
        this.name = name;
        this.marker = {
            color: color,
            line: {
                color: '#000',
                width: 1.5
            }
        };
        this.type = 'bar';
    }
    function init() {
        Coloris({
            el: '#colorSelector',
            themeMode: 'dark',
            alpha: false,
            swatches: colorArray
        });

        var cnd8Div = document.querySelector('.cnd8Div');
        var cnd8TableTd, gradient;
        for (let i = 1; i <= cnd8Color.length; i++) {
            cnd8TableTd = '';
            gradient = '';
            for (let j = 0; j < cnd8Color[i-1].length; j++) {
                cnd8TableTd += '<td class="cdn8Color-scheme' + i.toString() + '" style="background-color: ' + cnd8Color[i-1][j] + ';" onclick="copyCnd8(this)"><div class="mask"></div></td>';
                gradient = gradient + cnd8Color[i-1][j] + ', ';
            }
            cnd8Div.innerHTML += '<table><tbody><tr><td class="cdn8GradientScheme" id="cdn8Color-scheme' + i.toString() + '" colspan="4" onclick="applyCnd8(this.id)" style="background-image: linear-gradient(to right,' + gradient.slice(0, -2) + ')"></td></tr><tr>' + cnd8TableTd + '</tr></tbody></table>';
        }

        lineLayout = {
            margin: Object.assign({}, baseMargin),
            xaxis: Object.assign({}, baseXaxis),
            yaxis: Object.assign({}, baseYaxis)
        };
        lineLayout.xaxis.title = 'Year';
        lineLayout.yaxis.title = 'Crop Yields (ton / hectare)';
        barLayout = {
            margin: Object.assign({}, baseMargin),
            xaxis: Object.assign({}, baseXaxis),
            yaxis: Object.assign({}, baseYaxis)
        };
        barLayout.xaxis.title = 'Category';
        barLayout.yaxis.title = 'Fruit Yields (million tons)';
        stackBarLayout = {
            margin: Object.assign({}, baseMargin),
            xaxis: Object.assign({}, baseXaxis),
            yaxis: Object.assign({tick0: 0, dtick: 30}, baseYaxis),
            barmode: 'relative'
        };
        stackBarLayout.xaxis.title = 'Year';
        stackBarLayout.yaxis.title = 'Yields (million tons)';

        contourLayout = {
            margin: Object.assign({}, baseMargin),
            xaxis: Object.assign({}, baseXaxis),
            yaxis: Object.assign({}, baseYaxis),
        };
        contourLayout.xaxis.title = 'X';
        contourLayout.yaxis.title = 'Y';

        constructData();
        Plotly.newPlot("lineDiv", lineData, lineLayout, config);  
        Plotly.newPlot("stackBarDiv", stackBarData, stackBarLayout, config);
        Plotly.newPlot("barDiv", barData, barLayout, config);
        Plotly.newPlot("contourDiv", contourData, contourLayout, config);
    }
</script>