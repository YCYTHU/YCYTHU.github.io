---
title: 科研绘图配色方案在线预览
tags: 
- Code
- JavaScript
- Color
cover: https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Farbkreis_Itten_1961.svg/768px-Farbkreis_Itten_1961.svg.png
modify_date: 2024-02-18
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
    .cnd8Div td {
        border: none;
        border-radius: .75rem;
        width: 3rem;
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
    #cnd8Table tbody tr td {
        border: none;
        border-radius: 14px;
        width: 50px;
        height: 50px;
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
        background-color: #fff0;
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #colorSelector {
        width: 18px;
        opacity: 0;
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

下方列出了一些经典的配色方案。鼠标左键单击色块可复制对应颜色，双击可将配色方案应用于绘图中。

<div style="text-align: center;">
    <div class="cnd8Div">
        <table>
            <td class="cdn8Color-scheme1" style="background-color: #44045a;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme1')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme1" style="background-color: #30688d;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme1')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme1" style="background-color: #35b777;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme1')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme1" style="background-color: #f8e620;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme1')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme2" style="background-color: #12264F;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme2')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme2" style="background-color: #354E6B;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme2')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme2" style="background-color: #108B96;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme2')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme2" style="background-color: #D4DDE1;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme2')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme3" style="background-color: #042940;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme3')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme3" style="background-color: #005c53;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme3')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme3" style="background-color: #9fc131;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme3')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme3" style="background-color: #dbf227;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme3')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme4" style="background-color: #354E6B;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme4')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme4" style="background-color: #4182A4;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme4')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme4" style="background-color: #F0C2A2;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme4')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme4" style="background-color: #A64036;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme4')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme5" style="background-color: #5b5f97;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme5')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme5" style="background-color: #b8b8d1;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme5')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme5" style="background-color: #ffc145;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme5')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme5" style="background-color: #ff6b6c;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme5')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme6" style="background-color: #354E6B;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme6')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme6" style="background-color: #B2B6B6;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme6')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme6" style="background-color: #ECD452;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme6')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme6" style="background-color: #A64036;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme6')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme7" style="background-color: #3C405B;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme7')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme7" style="background-color: #82B29A;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme7')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme7" style="background-color: #F2CC8E;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme7')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme7" style="background-color: #DF7A5E;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme7')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme8" style="background-color: #264653;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme8')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme8" style="background-color: #2A9D8E;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme8')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme8" style="background-color: #F3A261;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme8')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme8" style="background-color: #E66F51;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme8')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme9" style="background-color: #02304A;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme9')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme9" style="background-color: #136783;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme9')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme9" style="background-color: #219EBC;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme9')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme9" style="background-color: #90C9E7;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme9')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme10" style="background-color: #4B74B0;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme10')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme10" style="background-color: #90BEE0;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme10')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme10" style="background-color: #FFDF92;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme10')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme10" style="background-color: #DB3124;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme10')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme11" style="background-color: #44757A;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme11')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme11" style="background-color: #B7B5A0;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme11')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme11" style="background-color: #EED5B7;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme11')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme11" style="background-color: #DD6C4C;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme11')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme12" style="background-color: #024f75;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme12')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme12" style="background-color: #219EBC;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme12')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme12" style="background-color: #FFB703;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme12')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme12" style="background-color: #FB8402;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme12')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme13" style="background-color: #4285f4;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme13')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme13" style="background-color: #34a853;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme13')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme13" style="background-color: #fbbc05;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme13')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme13" style="background-color: #ea4335;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme13')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme14" style="background-color: #76290b;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme14')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme14" style="background-color: #c27e35;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme14')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme14" style="background-color: #ccb363;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme14')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme14" style="background-color: #fbedc3;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme14')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme15" style="background-color: #541a32;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme15')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme15" style="background-color: #924a60;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme15')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme15" style="background-color: #b68a26;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme15')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme15" style="background-color: #dabd78;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme15')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme16" style="background-color: #132a13;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme16')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme16" style="background-color: #31572c;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme16')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme16" style="background-color: #90a955;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme16')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme16" style="background-color: #ecf39e;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme16')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme17" style="background-color: #2f321f;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme17')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme17" style="background-color: #693654;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme17')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme17" style="background-color: #d63f3a;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme17')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme17" style="background-color: #fe7d3c;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme17')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme18" style="background-color: #acbed8;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme18')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme18" style="background-color: #e8ebf7;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme18')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme18" style="background-color: #f2d398;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme18')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme18" style="background-color: #d78521;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme18')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme19" style="background-color: #5b618a;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme19')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme19" style="background-color: #9eadc8;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme19')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme19" style="background-color: #d6d65a;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme19')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme19" style="background-color: #b9e28c;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme19')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme20" style="background-color: #1d322d;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme20')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme20" style="background-color: #4e6d6c;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme20')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme20" style="background-color: #adb59f;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme20')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme20" style="background-color: #843945;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme20')"><div class="mask"></div></td>
        </table><table>
            <td class="cdn8Color-scheme21" style="background-color: #311f19;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme21')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme21" style="background-color: #805241;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme21')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme21" style="background-color: #a97d6a;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme21')"><div class="mask"></div></td>
            <td class="cdn8Color-scheme21" style="background-color: #d7c5b9;" onclick="copyCnd8(this)" ondblclick="applyCnd8('cdn8Color-scheme21')"><div class="mask"></div></td>
        </table>
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
    const matlabPeaks = [[6.67128029671744e-05,0.000124903005758909,0.000225332261306432,0.000391260248875315,0.000652901409212293,0.0010449405706284,0.00159950040964624,0.00233230581590381,0.00322014058128972,0.00416908994735365,0.00497579617177504,0.00528794342406684,0.00457474688066175,0.00212195231339733,-0.00293317312341591,-0.0115150791751759,-0.0244690543901066,-0.0423783618196821,-0.0653680842769219,-0.0929381092814903,-0.123872972094337,-0.156268832519168,-0.187696811466362,-0.215490993983606,-0.237116540075763,-0.250548425738204,-0.254582862797022,-0.249015283793034,-0.23464842035639,-0.213133158692317,-0.186682229666169,-0.157721977702597,-0.128554382678862,-0.101090134416982,-0.0766892624821716,-0.0561170003453932,-0.0395975098508891,-0.0269324468388381,-0.0176469038896763,-0.0111303016971548,-0.00675047677091701,-0.00393127617268421,-0.00219410519421596,-0.00117035506841782,-0.000594278058408064,-0.000285531330754633,-0.000128548630715254,-5.32968637387835e-05,-1.96413457854626e-05,-5.86418787258953e-06],
[0.000102910100082449,0.00019247399083687,0.000346696429391366,0.00060068783535371,0.000999419176593346,0.00159316315715971,0.00242550562022783,0.00351035203803274,0.00479497103178722,0.0061084305795197,0.00709924498934004,0.00717251451046396,0.00544417531671965,0.000735910621260183,-0.00836432351809389,-0.0233574232893868,-0.0456006977082087,-0.0760082931295326,-0.114731833380557,-0.160890797746588,-0.212430444761827,-0.266172556830693,-0.318089574904652,-0.363781989070938,-0.399085141753069,-0.420691061586321,-0.42665744094001,-0.416695660274758,-0.392178671868511,-0.355873944978862,-0.311468006244446,-0.262990323888807,-0.214255451797636,-0.168423429298089,-0.127738299000473,-0.0934570778211309,-0.0659402468417206,-0.0448490864842329,-0.0293879170812072,-0.0185376705106891,-0.011244882184631,-0.00655013660972486,-0.00365675362281647,-0.0019512154956773,-0.000991197527164299,-0.000476487821345963,-0.000214664253156436,-8.90848443941578e-05,-3.28797676159107e-05,-9.84806938359872e-06],
[0.000153633502543601,0.000287246033792763,0.000516969673818437,0.000894413877116953,0.00148487001523804,0.00235954724792231,0.00357611747944506,0.00514206077673957,0.00695631806464667,0.00872842768799583,0.00988134257306669,0.0094542505348334,0.00603316911812908,-0.00225371628709141,-0.0176369609549505,-0.0424739600836032,-0.0788797435589746,-0.1282532598973,-0.190774309336993,-0.264981067968479,-0.347550955600695,-0.433387525454647,-0.516060985599684,-0.588569680201892,-0.644304912688329,-0.678037470447604,-0.686723046910433,-0.669955362061002,-0.629973536237975,-0.571232549286916,-0.499643006174099,-0.421651844030688,-0.343353267343862,-0.269789004567794,-0.204533035483128,-0.149580222125376,-0.105492520870924,-0.071715440129139,-0.0469658434469467,-0.0296055688774833,-0.0179435493671646,-0.0104409794254161,-0.00582084346861973,-0.00310024133555703,-0.00157091518489203,-0.000752451202715375,-0.000337153515892838,-0.000138680785332069,-5.03400644658041e-05,-1.44716591865552e-05],
[0.000221748228480744,0.00041486950624772,0.000746781807703244,0.00129151618084297,0.00214188464308492,0.00339715692999992,0.00513304273153698,0.00734572810051068,0.00986327437222438,0.0122232556851262,0.0135261401542756,0.0122892435989321,0.00634341051175896,-0.0071715066761619,-0.0316532313670915,-0.0706817116734674,-0.127455181285986,-0.204067714422291,-0.300742881620126,-0.415191165023872,-0.54227842258624,-0.674162179397009,-0.800968537842801,-0.911959851542854,-0.997013327903793,-1.04813254689028,-1.06068117882167,-1.03407630129369,-0.97179769986652,-0.880726370773836,-0.769975042731539,-0.649474246324322,-0.528604884509105,-0.415122097390964,-0.314517008574836,-0.22984644379955,-0.161959399815,-0.109985748893803,-0.07193473202462,-0.0452713361360375,-0.0273821392155233,-0.0158913710165915,-0.00882927311796609,-0.00468128653488413,-0.00235735531989793,-0.00111918158334056,-0.000494785058016959,-0.000199027190191515,-6.91716038396799e-05,-1.76549160336767e-05],
[0.000308899418653654,0.000579088465095434,0.00104399995621847,0.00180746868605427,0.00299915779754338,0.00475633655972238,0.00717994303599027,0.0102529136984033,0.0137109859416132,0.0168642382868841,0.0183830964260228,0.0160849158195521,0.00678267134648324,-0.0137221401348715,-0.0504154554349895,-0.108550334899085,-0.192819724032222,-0.306294824562327,-0.449296693137675,-0.618447392722024,-0.806176936077885,-1.00091843345875,-1.18810091799594,-1.35186867923084,-1.47726356720311,-1.5524604946486,-1.57059640990702,-1.53080263813073,-1.43822556863478,-1.30305270882412,-1.13878338946034,-0.960133860298104,-0.78100847663161,-0.612901196164045,-0.46394631903888,-0.338664356225975,-0.238297978779927,-0.161538388472324,-0.105415333077269,-0.0661542924202287,-0.0398690241098581,-0.02303092423991,-0.0127183323401874,-0.00668838883149931,-0.00333011148586709,-0.00155516179188962,-0.00067006933561414,-0.000257682374721511,-8.12793697123235e-05,-1.44804300519664e-05],
[0.000414057332940209,0.00077926168587482,0.0014097088257759,0.00244798826512979,0.00407267404620603,0.00647334246806807,0.00978978629454141,0.0139984038243469,0.0187316494455788,0.0230275183142487,0.0250276101808016,0.0216738380194424,0.00848999775849847,-0.0204358292143742,-0.0721441592874561,-0.154077952268502,-0.27291910446815,-0.433086743918514,-0.635131995427807,-0.874377521019455,-1.14019554921653,-1.41625899970058,-1.68192790827092,-1.91467704872156,-2.09319532991891,-2.20057587092133,-2.22694012295887,-2.17093472434184,-2.03978719234343,-1.84793765577467,-1.61458322880974,-1.36068983134895,-1.10608957716046,-0.867187758229766,-0.655596548951636,-0.477764436698499,-0.335452954712957,-0.226775247317643,-0.147470961894148,-0.0921348291263359,-0.0552090178117587,-0.0316547940113362,-0.0173079352789707,-0.00897932223914033,-0.00438529473209595,-0.00198914584655642,-0.000816730035135435,-0.000286018323853949,-6.97314997753273e-05,4.65180209878041e-06],
[0.000531393703537948,0.00100667814938115,0.00183209520478373,0.00319937325196667,0.00535129017809995,0.00855027464897792,0.0129993919558177,0.0186922731306291,0.0251719443529915,0.0311929262811595,0.0343097537949571,0.0304578096876082,0.0136421892174527,-0.0241075629671462,-0.0923457016449241,-0.201247720732456,-0.360044408989259,-0.574979429180956,-0.847104087531413,-1.17038273619538,-1.53065088155176,-1.90589407145807,-2.2680845660836,-2.5864627630258,-2.83176930841938,-2.98063585324417,-3.01922931345041,-2.94536706781173,-2.76865583925991,-2.50866245991194,-2.19156873681265,-1.84607009751695,-1.49937198630287,-1.17401328256328,-0.885962553611215,-0.644089573436553,-0.450811553796929,-0.3035210440223,-0.196344672448684,-0.121839968223294,-0.07236572714956,-0.0410079704767656,-0.0220674799186219,-0.0111943969511795,-0.00528768878810996,-0.00227272071672528,-0.000844390945689014,-0.000230905231709421,-4.36650171706422e-06,5.62813810510263e-05],
[0.00064741269860826,0.00123947133995557,0.00227777651778075,0.0040143187230544,0.00677455313678392,0.010922082279658,0.0167631084547419,0.0243592799441836,0.0332208824509197,0.0418698771739627,0.0472988714890039,0.0444078298684418,0.0255668627563222,-0.0194881570390052,-0.10319796826277,-0.238974310360234,-0.439188440124498,-0.712503776910028,-1.06095151814841,-1.47736699787341,-1.94390759923678,-2.43228883651587,-2.90608016862318,-3.32494241015935,-3.65017855983529,-3.85056156399238,-3.90723495900281,-3.81662861901802,-3.59076688141114,-3.25495016125869,-2.84338860554728,-2.3937877094093,-1.94202441585778,-1.51789595382165,-1.14255030582514,-0.827748387128964,-0.576699335885898,-0.385947867862805,-0.247711000797982,-0.15213662981479,-0.0891274686745619,-0.0495708291042468,-0.0259818157676998,-0.01267489592634,-0.00562242781654603,-0.00215243835122592,-0.000602933989802073,-6.1684845067035e-06,0.000162745740876731,0.000166232942540344],
[0.000737410804921483,0.00143618620350548,0.00268050109471459,0.00479275068639684,0.00820134719385527,0.0134071674209976,0.0208779957808028,0.0308301759845343,0.0428588396454039,0.0553977844582575,0.0650341397732383,0.0657726459620075,0.0484304236151842,0.000422462775058261,-0.0937646866582849,-0.251157639786196,-0.487839005373527,-0.815607703631536,-1.23823669432715,-1.74810065019947,-2.32409920883553,-2.93171836308668,-3.52571523602179,-4.05533148878303,-4.47127999076826,-4.73320409749187,-4.81606362799784,-4.71405998945363,-4.44125209002578,-4.02878625802966,-3.51944214928346,-2.96075913808836,-2.39820864720239,-1.86969418837097,-1.40218828437615,-1.01072318881978,-0.699418096485571,-0.463877646436037,-0.294183397583442,-0.177792769549027,-0.101880133173745,-0.0549107946985233,-0.0274568683417303,-0.01240459109197,-0.00475970607211749,-0.00124908671056821,0.00012934872792336,0.000513998330600864,0.00050086472500093,0.000371487037294182],
[0.000761621048557899,0.00152855816561943,0.00292802610873871,0.00535869351894364,0.00937034148182507,0.0156418034993215,0.02487838816595,0.0375773539866912,0.0536091811967653,0.0715821554375119,0.0880076347109689,0.0963667461150949,0.0862870248123022,0.0431431204608137,-0.0515441569165625,-0.218572088125403,-0.478216272171166,-0.846229648556703,-1.32922234206441,-1.92034622566818,-2.59643226993333,-3.31766703069842,-4.03048705991451,-4.67366771415294,-5.18675421827049,-5.51927200969904,-5.63879965120015,-5.53613534841016,-5.22642467592979,-4.74606762950561,-4.14620793840111,-3.48434044206357,-2.81585942809028,-2.18717105576216,-1.63141824213203,-1.16712690111045,-0.799404454956353,-0.522872226059897,-0.325359403738539,-0.191495225974362,-0.105609969116461,-0.0536780147649703,-0.0243129225255751,-0.00900311787734288,-0.00184930577085592,0.000946374297575377,0.00164854983151165,0.00149684002675227,0.00110168644624396,0.000720826868244211],
[0.0006618113087851,0.00141484614290585,0.00284941665868064,0.00543675343585282,0.00985767250741541,0.0170061302770073,0.0279101196725667,0.043507110240017,0.0642048078353154,0.0891743966198215,0.115375620504927,0.136408090037853,0.14141382941469,0.114393735979138,0.0343943864962536,-0.122992094556347,-0.38254793677354,-0.764855119409886,-1.28079286898587,-1.92616100820142,-2.67780506657568,-3.49260959224563,-4.31029317052862,-5.06012339634873,-5.67066220605127,-6.08074580806342,-6.24940190311433,-6.16250803604154,-5.83470800549413,-5.30623309571069,-4.63548562099614,-3.88917630137372,-3.13221050402335,-2.41932257849519,-1.78978585951332,-1.26563105216099,-0.852968265712389,-0.545441003815233,-0.328634474667068,-0.184381676491248,-0.0942407950260293,-0.0418126338823845,-0.0139081407633605,-0.000797323744145636,0.00413946094786575,0.00505114674388275,0.00431376130064871,0.00314524510229194,0.00207648760919945,0.00127347587837193],
[0.000359585743629491,0.000956003446952305,0.00220681289954834,0.00463516334569543,0.00904340109685792,0.016560277341057,0.0286132602340911,0.0467518860890878,0.0722326078957587,0.105283678944652,0.144017674897662,0.183061789764293,0.212129219122919,0.214930576185451,0.168964934292028,0.0467577502956929,-0.181046553085843,-0.540710259554323,-1.04907982489616,-1.7070568852462,-2.49445741949849,-3.36793857344027,-4.2632532430257,-5.10218638177381,-5.80333601049271,-6.29476992365398,-6.5258916788603,-6.47585392484439,-6.15661074858325,-5.6099985628257,-4.89968619848463,-4.10000244729003,-3.2842064098415,-2.51460342027054,-1.83615450679609,-1.27417474743976,-0.835705608668497,-0.513445071200812,-0.290848029031916,-0.147136149856819,-0.0613427836771351,-0.0149906104292027,0.00658881456131215,0.0140166478603833,0.0143240614731744,0.0117379413214765,0.00851830567201318,0.00568246418379195,0.00354823443043826,0.00209513659704352],
[-0.000241982161734685,-2.22391031089999e-05,0.000697310186936825,0.00244547023582595,0.00610425441964307,0.0130202011415149,0.0250619889912204,0.0445402545841746,0.0738768498821324,0.114904235467565,0.167714158114444,0.229078383266592,0.290637897297896,0.337276217059084,0.346295262244903,0.288105160682988,0.129023297186429,-0.163608410239082,-0.614412197660389,-1.23223746667032,-2.00348759068354,-2.88853151290771,-3.82286712412692,-4.72374044739848,-5.50155362624352,-6.07400601175933,-6.37996346992592,-6.38989597404266,-6.11046820617134,-5.58231222889181,-4.87171312665682,-4.05837409008417,-3.22218183489498,-2.43180130691481,-1.73711144175284,-1.16628527542355,-0.727122409609766,-0.411388404678407,-0.20056345916044,-0.071526403015003,-0.00114150749012,0.0307316165160577,0.0397978751657637,0.0371306952744437,0.0297657980363169,0.0216530404780258,0.0146440415615388,0.00932732214663133,0.00563850534071839,0.00325128242083603],
[-0.00125172286815256,-0.00171814551242315,-0.00202892506062551,-0.00172984060146773,5.29401583235353e-05,0.00480871561071301,0.0148220168538266,0.0332447923398439,0.063923104697708,0.110811900845273,0.176830051067434,0.262104042212404,0.361738833086472,0.463521946555626,0.546248148645052,0.579537406709624,0.525978789574032,0.346069169256871,0.00572183676156394,-0.51477330758587,-1.21228613511246,-2.05526496888142,-2.98319611927818,-3.91228603283339,-4.74700511305551,-5.39545567965685,-5.78526398209456,-5.8763097308855,-5.66728366770094,-5.1946268176417,-4.52436624347238,-3.73910283637041,-2.92340739970794,-2.15090288456415,-1.4754556076475,-0.927536978247942,-0.51542370982341,-0.22987894490048,-0.0505060439768891,0.0479223651499671,0.0903622310742305,0.0981870859556308,0.0876639569848885,0.069838056384855,0.0512972122928748,0.0353151906704639,0.0230037493536243,0.0142622951898665,0.00845029833326555,0.00479816053582796],
[-0.00277765252247133,-0.00433134933419813,-0.00632980964848622,-0.00851307377465549,-0.0101595650151958,-0.00978828474806609,-0.0048211575187276,0.00869973804337968,0.0361765932866022,0.084080081176037,0.158899989277524,0.265267509702654,0.403295221889997,0.565500041328458,0.734050041832881,0.879382136115897,0.961308906237188,0.933423436232349,0.750872233436076,0.380512472811285,-0.188609240729277,-0.937224950346638,-1.81299376168795,-2.734620489256,-3.60303091979541,-4.31769445013303,-4.79454512447869,-4.98125919852093,-4.86619567733915,-4.47895991310909,-3.88278116374563,-3.16098105713031,-2.4011088624842,-1.68049893712709,-1.05613659793342,-0.56020490810077,-0.201076334565984,0.0317074154995027,0.16049234910638,0.212542483256429,0.214430719707009,0.188447845992317,0.15102869958851,0.112759055977399,0.079351376413943,0.0530123839390636,0.0337805383653683,0.0205989924964465,0.0120489554071622,0.00677256918153749],
[-0.00490835411837015,-0.00802896585749916,-0.0125115709808546,-0.0184492006851547,-0.0254750824868162,-0.0323513736791717,-0.0364433846103228,-0.0331716754595666,-0.0156295579874912,0.0253504966165177,0.100345833518356,0.219422259577408,0.389060843992791,0.608223687078057,0.864333401004455,1.13039464600719,1.36470341599423,1.51436716477313,1.52309251856853,1.34247480975952,0.944658199554256,0.333202978116659,-0.451223608794426,-1.33285157464888,-2.21117207161329,-2.97798070999647,-3.53734188138374,-3.82364523169663,-3.81328889703487,-3.52724524345865,-3.02427993564699,-2.38706900033604,-1.70510716489518,-1.05867908792792,-0.50730030661395,-0.084362905091658,0.202124460088975,0.364254377764249,0.426654178182011,0.418834961283579,0.369049368218059,0.300419766672249,0.229338845982215,0.165639501472405,0.113827858282367,0.0747160766539554,0.0469749567045464,0.0283467177912945,0.0164441363323554,0.009181882340181],
[-0.00769052575651173,-0.0129041342387242,-0.0207544131212576,-0.0318764635906239,-0.0465095709684026,-0.063968889208525,-0.0819105791993674,-0.0954737425964318,-0.0965072781265414,-0.0732300515236709,-0.0107755431829568,0.106938340897264,0.293773014261451,0.556549853185701,0.889633769926087,1.27032940491537,1.65689365790712,1.99086237393875,2.20461261844126,2.23368614930843,2.03171759773093,1.58440262025874,0.918412489318935,0.10190982664395,-0.76468328962067,-1.56629235004132,-2.19523015478509,-2.5722191188169,-2.6610802180623,-2.4735475977336,-2.06348674996013,-1.51269795166015,-0.912531421540486,-0.3461510317218,0.12456721949058,0.465358600898768,0.669080372824087,0.750066201443273,0.735842474672368,0.658702489792767,0.548963745551219,0.430786769412478,0.320559262595727,0.227264939352663,0.154022067666596,0.100028888961877,0.0623691666376727,0.0373894164332575,0.0215757599295787,0.0119958791927335],
[-0.0111067600419473,-0.0189345173612235,-0.0310371642489251,-0.0487933668034305,-0.073324877024977,-0.104856103037607,-0.141760811876476,-0.179363083435762,-0.208716014195866,-0.215771309513396,-0.181514385366419,-0.0836783994919839,0.099535585461252,0.38377894180057,0.771690170633997,1.24642740128501,1.76777631976893,2.27304632420164,2.68419747219371,2.92107147548909,2.91858153202056,2.64389649816074,2.10877884204899,1.37283943409421,0.535606233928072,-0.281577601293871,-0.959709805903304,-1.40623565287084,-1.57287823202059,-1.46279080894476,-1.12577423300877,-0.643673040974936,-0.110541287218737,0.38696657694165,0.784360480183483,1.04664834588563,1.16805236827698,1.16588824168775,1.07142160754956,0.920531533060884,0.746266535114888,0.574301329754384,0.421297969118292,0.295501134420048,0.198627679960765,0.128173448040629,0.0795136467684497,0.0474746164297098,0.0273061550705053,0.0151416997055897],
[-0.0150590120624493,-0.0259510033908135,-0.043079609231167,-0.0687552720037278,-0.105248280383834,-0.154048704179678,-0.214697487561081,-0.283232727918503,-0.350483622477747,-0.400686452132858,-0.411122731876266,-0.353575345042202,-0.198233256135798,0.0798424440184227,0.49243042183522,1.02978117805697,1.65471982953118,2.30196315740741,2.88464434824864,3.30830142804088,3.4902242348027,3.37980793165952,2.97431717334894,2.32490800887726,1.53002179775587,0.716790764035057,0.0147460082656864,-0.471394378181436,-0.682687774849133,-0.615390705717175,-0.317042703738137,0.128728256276839,0.62368631363706,1.07663496527763,1.4199401070647,1.6178795355496,1.66648621035367,1.58681497070427,1.41477896433004,1.19075434867018,0.951323950110236,0.724308622073019,0.527087504810008,0.367436165291581,0.245803174461295,0.158020476727514,0.0977371887653734,0.058215772130515,0.0334196843293128,0.0185028367544069],
[-0.019363269263169,-0.0336270213460497,-0.0563216484888051,-0.0908348489257548,-0.140799496074137,-0.209271774406138,-0.297360683582408,-0.402324172577032,-0.515366609689668,-0.619666707697618,-0.68945737599478,-0.691136168509621,-0.587247246756388,-0.343620961906204,0.0610140592123982,0.624825798170216,1.31498544242637,2.06534937728882,2.78226168031907,3.35912869919221,3.69772281474368,3.73150250683906,3.4446230637133,2.88058935883219,2.13689541688104,1.34592091825586,0.64655076579372,0.153965477075655,-0.0642948243706948,0.000169392957802904,0.299876386205999,0.747446882907522,1.23889181847918,1.67739920984116,1.99164634781043,2.14512723196327,2.13603024002526,1.98976775230859,1.74766107700204,1.45536968613438,1.15373488026629,0.873332603241055,0.632731823614054,0.439579273865855,0.293282204808135,0.188148097844241,0.116177737374021,0.0691077812963748,0.039630295305424,0.0219226889950626],
[-0.0237592442340229,-0.0414957033715406,-0.0699526177079379,-0.113670326891971,-0.17776701919414,-0.267055632787807,-0.384495161130096,-0.528959173948872,-0.69255215885872,-0.85804870365915,-0.997388095234227,-1.07237663187022,-1.03864421434822,-0.853318469526263,-0.485800743747102,0.0703453880340998,0.787616043744885,1.60064593635889,2.41121297022,3.10320727598278,3.5656021460911,3.71839770995932,3.53454478165081,3.05097083383204,2.36433540029096,1.61143945378035,0.938919591166044,0.470303778385485,0.279405794471208,0.377033109221392,0.71380819927546,1.19707109782046,1.71601531591128,2.16758535261432,2.47650624697813,2.60550085761795,2.55511714586291,2.3554497575509,2.05361910511855,1.70098543135253,1.3430637960726,1.01357755581916,0.732640115191276,0.508076789232095,0.338509228872345,0.216924516543995,0.133831284313609,0.0795550203869466,0.0455971026940249,0.0252129536888753],
[-0.0279356620771431,-0.0489959719817707,-0.0829927595701294,-0.135605148032896,-0.213440190400512,-0.323109615641421,-0.469533856686604,-0.65342257671875,-0.868152926309185,-1.09665579526745,-1.30933777947063,-1.46434590019402,-1.51141062480225,-1.39990053025065,-1.0905525796561,-0.568810941953013,0.143714229746222,0.98383452319752,1.85095406917215,2.62222146875339,3.17679706156085,3.42395514402463,3.32746332407334,2.91864279520108,2.2931064559376,1.59078780849323,0.964024662841137,0.542315777660996,0.403486529066693,0.558944346002069,0.956234102769922,1.49685377739669,2.0630956635288,2.54584511705378,2.86612513648315,2.98606166860885,2.90860090645608,2.66843681333275,2.31834382675221,1.91524736025066,1.50926714957182,1.137299917206,0.821123475004119,0.568933088077987,0.378794844852662,0.24261179457231,0.149618044665704,0.0889117517946961,0.0509480657168314,0.0281669638389505],
[-0.0315677557342073,-0.0555411509596468,-0.094415081741572,-0.154897994524744,-0.24496044101128,-0.37289204491672,-0.545495383066933,-0.765333988413664,-1.02724241338058,-1.31473178906881,-1.59739251329877,-1.83072772608614,-1.95981376566305,-1.92757316811575,-1.68720855546906,-1.21668885556938,-0.531601486178564,0.30812884643574,1.2015775822633,2.02192571858337,2.64157999699795,2.96186191562837,2.93928185785765,2.60023788125575,2.03862406090198,1.39568968462889,0.826990297556544,0.46545348905925,0.390882176847167,0.614131123024372,1.07949486090105,1.68326728839829,2.30193673762066,2.82147873460235,3.16007446648204,3.2796293464107,3.18535396436905,2.91600896700888,2.52927857266315,2.08689323398331,1.64295410956589,1.2371292875827,0.892696184589354,0.61825724602826,0.411500184088185,0.263494424541046,0.162467050721785,0.0965350108484632,0.0553115512359269,0.0305777271077086],
[-0.0343601724031838,-0.0605973238693509,-0.103284239884266,-0.16996163715909,-0.26971981791683,-0.412255344263286,-0.605997256590808,-0.85519215286565,-1.15614016548189,-1.49322520840562,-1.83588915977555,-2.13807387231148,-2.3416489453039,-2.38473527014953,-2.21455660204144,-1.80270859763037,-1.15904237225443,-0.339438721697031,0.556731350347757,1.40142343572075,2.06338804788392,2.43878247071022,2.47868904350787,2.20500689068387,1.70883619952362,1.13047019380379,0.625834787808848,0.32862354616639,0.318814612588977,0.606169853043452,1.13248600390399,1.79058149127859,2.45330671842664,3.00374659757242,3.35864805626448,3.48025059908709,3.37573540290771,3.08698732895627,2.6753118309014,2.20591746615162,1.73576056127274,1.30648971205708,0.942457718187834,0.652570159937479,0.434263977432698,0.278036485994533,0.171419003531641,0.101848653265176,0.0583544408636896,0.0322596520630729],
[-0.0360868173134078,-0.0637556558856426,-0.108883853493496,-0.179580239192327,-0.285720504495196,-0.438022525510261,-0.646151760327502,-0.915724262204483,-1.24438189264437,-1.61757893393483,-2.00524829611629,-2.3609185459453,-2.62487411410019,-2.73235732624638,-2.6265234502409,-2.27407774646693,-1.67976628385194,-0.894897238290643,-0.0155302462387169,0.831806044354878,1.51538208314958,1.92906672548843,2.02036429767189,1.8070047569883,1.37600938884653,0.864173343507575,0.424712421790543,0.189335964079987,0.236536699445662,0.574841721710802,1.1449172994321,1.8385677177842,2.52789306860401,3.09569317829803,3.45905145361024,3.58120246751538,3.47087491078598,3.1718328895896,2.74732066190123,2.26429215522766,1.78107594664698,1.34023794988965,0.966604129829319,0.669186456716519,0.445271523678103,0.285061554414268,0.175741096225495,0.104413505283367,0.059823251351569,0.033071715280355],
[-0.0366198289332562,-0.0647843669677149,-0.110806768664336,-0.183061041251162,-0.29182131641978,-0.448374302684757,-0.663153105055765,-0.94274554041658,-1.28593328524361,-1.67938243950644,-2.09414078414322,-2.48451366615044,-2.79093291825637,-2.94786512839202,-2.89654100110549,-2.60051607454715,-2.06030544658373,-1.32230406789883,-0.4776067592467,0.351502926456288,1.03605683073356,1.47061798084937,1.60106684166468,1.44135813544208,1.07315709402108,0.627181696006847,0.250810709141146,0.071010286963417,0.163196882566611,0.534688247551492,1.12664139844261,1.83260980040416,2.52712649273431,3.09554676203976,3.45719647251906,3.57698667380845,3.46468622876926,3.16453375149351,2.73983286890992,2.25735291116134,1.77514244789004,1.335495762635,0.963031218985473,0.666633684594284,0.443534504362429,0.283932319417636,0.175038006031989,0.103993442326104,0.0595820632481294,0.0329384639618885],
[-0.0359426538199437,-0.0636514480244735,-0.108993027161733,-0.180295258571701,-0.287831101091056,-0.442985416371147,-0.656465424202132,-0.935401325204592,-1.27947495926391,-1.67666463079244,-2.09971746896057,-2.504875396799,-2.8344382171316,-3.02421546563155,-3.01570882234334,-2.77115583613552,-2.28784238597341,-1.60706323401392,-0.813456444616388,-0.0224773885454235,0.642801561857298,1.08057190008108,1.23706528551667,1.12294364083134,0.813381259104097,0.430612660114551,0.113228542364967,-0.0191538583301036,0.104326593108484,0.48986542960579,1.08074487039598,1.77500556379893,2.45274729926846,3.0046627007082,3.35417040381374,3.46849442204078,3.35790529346894,3.06569325549207,2.65333370290187,2.18547944605369,1.71824766543633,1.29247338691548,0.931887093837579,0.645012340880112,0.429118596111234,0.274690128370959,0.169334818764005,0.100603138178542,0.0576391557363947,0.0318644058381946],
[-0.0341460821888792,-0.0605165677058881,-0.103713830142999,-0.171727239848826,-0.274451166736507,-0.422920324625142,-0.627639335907618,-0.895853952001639,-1.22788369020242,-1.61305960852057,-2.02630703325601,-2.42681134475971,-2.76027098825002,-2.96575521072677,-2.98705711987904,-2.78682677518567,-2.36013962528082,-1.74316664560545,-1.01290580558651,-0.275817848890595,0.35360074126161,0.779701838807112,0.950779193470769,0.874617044336126,0.618905953263181,0.295303231604449,0.0310630107170815,-0.0637586877698097,0.0759596098855424,0.455518284219575,1.02193449303951,1.6803185841374,2.31924736600933,2.83731124882476,3.16370998312174,3.26854605170819,3.16207571770196,2.88531318631956,2.49615244709222,2.05533686427202,1.61551736762631,1.2149609673016,0.875867875333144,0.606168580897546,0.403241382708701,0.258108865572193,0.159105807338591,0.094522985300464,0.0541545150557568,0.0299376767507497],
[-0.0314098133407454,-0.0556973996803142,-0.095511830241535,-0.158251707006089,-0.253103638053402,-0.390354935272603,-0.579874024339572,-0.828613567351273,-1.13723903871941,-1.49637333289007,-1.88340421400631,-2.26117131628816,-2.57991840843275,-2.78346160056965,-2.81950213667558,-2.6525469972041,-2.27640469984666,-1.72230298878451,-1.05891827487111,-0.382301008456243,0.203424010289367,0.610443710746912,0.790161976447412,0.747561002357028,0.541892320932413,0.272518954439726,0.0534080616627722,-0.0165004401747227,0.121548952085644,0.472535766639276,0.988919903301107,1.58534846363438,2.16154468422046,2.62629748737471,2.91608855220045,3.00440159483235,2.90103185798813,2.64356056109742,2.28476811200543,1.87991341123831,1.47681985267257,1.11018488155957,0.80007399998792,0.553572875532731,0.368179985337203,0.235629786554111,0.145231209712658,0.0862719155412002,0.0494235436681662,0.0273206995309954],
[-0.0279745721600713,-0.0496198187737156,-0.0851150518604118,-0.141069898018095,-0.225699175926451,-0.348214546818099,-0.51747293808112,-0.739749706211797,-1.01572421894776,-1.33711080143776,-1.68377570690298,-2.02251378853135,-2.30872589614439,-2.49185790799948,-2.52455873835639,-2.37421241596729,-2.0341629374319,-1.53111743173093,-0.925408462070391,-0.302280521530007,0.245076446753376,0.637127798136468,0.828435277813653,0.82067058198854,0.663612555650606,0.443009352212792,0.258322047583245,0.196680141006623,0.310627117793461,0.605940341749953,1.04247341502188,1.54684857436912,2.03240376825562,2.4201809287821,2.6552655092771,2.71498088037018,2.60831705640718,2.36848054988191,2.04187369229773,1.6769526370669,1.31554902421454,0.987901400782509,0.711361777144805,0.491873909861854,0.326975702351099,0.209173172297915,0.128881475349279,0.0765387973589111,0.0438378316041509,0.0242285309548915],
[-0.0241105465409273,-0.0427623552521029,-0.073342564560361,-0.121535234151412,-0.194394138586587,-0.299807239769161,-0.445314393141209,-0.636163152545602,-0.872678110218665,-1.14731917547666,-1.44215926334244,-1.72780343354944,-1.96483391581299,-2.10854020511084,-2.11691282198992,-1.96074908166798,-1.63355292980057,-1.15817344991756,-0.58727511894293,0.00400172582746264,0.532628290049044,0.926448489154452,1.1421316084757,1.17688147261732,1.06987057219648,0.892328619793845,0.728773818123186,0.654754769379249,0.717593584490801,0.925564001125744,1.24811634902156,1.62624354013207,1.98913827236471,2.27187628784697,2.42927268285261,2.44290405709896,2.32072986710971,2.09088422609402,1.79242887616233,1.46598837269605,1.14646115047342,0.8588656612788,0.617293243334048,0.426200990498915,0.282985441357236,0.18085921176655,0.111349233635045,0.0660845785395048,0.037830027871,0.0208988184786487],
[-0.0200871981826255,-0.0356035850873204,-0.0610162064020369,-0.101011019328398,-0.161370860343276,-0.248500208905959,-0.368399333691557,-0.524991972435534,-0.717873152145379,-0.939799182403144,-1.17454441018134,-1.39599862855783,-1.56943450074013,-1.65560087026315,-1.6176363237407,-1.42983502867024,-1.08629721171592,-0.606852898659537,-0.0377494287263696,0.554357166728034,1.09471167820602,1.51653770730827,1.77670027575278,1.86632747332489,1.81288557657632,1.67265107121892,1.51550937929032,1.40646657869998,1.3892746769433,1.47677024421394,1.65023466910825,1.86717891142681,2.07449047524575,2.2226583372393,2.27707638549244,2.22390604241332,2.06996874768539,1.83789817732587,1.55879752896686,1.2647712761788,0.983118463440587,0.733053679825857,0.524935225539099,0.361376949451694,0.23938150799478,0.152699918140655,0.0938654692037974,0.0556360589786298,0.0318144002552091,0.0175595982613176],
[-0.0161479836695248,-0.0285781739637383,-0.0488870259376187,-0.0807522635626663,-0.128655964253736,-0.197453646440429,-0.291482424994046,-0.41313254598769,-0.560943598590616,-0.727501065984994,-0.897662456075671,-1.04785151238832,-1.14720672723679,-1.16114327808623,-1.05733469388725,-0.813312050240756,-0.424031173965158,0.0928011971129539,0.69579571808296,1.32464977337365,1.91039275974626,2.38908920960226,2.71555908770296,2.87322852620107,2.87706430418556,2.7685047894697,2.60374898406997,2.43883530159321,2.31587460735642,2.254267065966,2.24896265405965,2.27551028077021,2.29962792546278,2.28797569592916,2.21695921618939,2.07750411124168,1.87528868760019,1.62731256651029,1.35649943880225,1.08615526651441,0.8356673053524,0.618120537871076,0.439820035244758,0.301238211144194,0.198720190209159,0.126333792577536,0.0774414010380983,0.045794617503172,0.0261358123251259,0.0144016769231141],
[-0.0124919153393998,-0.0220444585711989,-0.0375802881348982,-0.061815810898816,-0.097979140052434,-0.149407871300498,-0.218765220903743,-0.306818485162982,-0.410838848549841,-0.522860006331643,-0.628243366291469,-0.705171040549507,-0.725727870366603,-0.659046401189653,-0.47653036081167,-0.158497535134446,0.299132531462892,0.879969196648893,1.54595198402615,2.24101001733968,2.89952185094307,3.45802491099282,3.86739358046422,4.10224003186548,4.16486739290428,4.08261734578541,3.89942244282921,3.66410837247773,3.41887149001316,3.19108435015746,2.99030198555979,2.81056971599176,2.63652826271571,2.45090504885542,2.24098263141752,2.00239839435057,1.73975979045538,1.46460835113312,1.19190848679318,0.93636411206775,0.709570625756496,0.518501560704366,0.365327921563115,0.248223974793686,0.162677267227616,0.102861073940658,0.0627692123941708,0.0369783555675456,0.0210371086123798,0.0115608477863974],
[-0.00926262843244459,-0.0162644853475052,-0.0275600890013189,-0.0449994437495758,-0.0706714104900837,-0.106518324184479,-0.153636281883986,-0.211223025059789,-0.275232216959721,-0.336941119939313,-0.381812257551266,-0.389172429010816,-0.333265408202262,-0.186080300200499,0.0780217455123181,0.476422292446868,1.01224727217825,1.66983204774034,2.4132563800322,3.18904820573595,3.93315336101846,4.58102712923067,5.07862933699189,5.39161258802024,5.51033127133129,5.44942138789102,5.24225684122299,4.93204305919849,4.56215810119204,4.16832195677489,3.7743315956033,3.39180400442801,3.02311605185555,2.66593927378042,2.3176330266325,1.97820617564887,1.6513165859935,1.3435246807081,1.06250546832658,0.81505713559595,0.605576163735761,0.435340594465615,0.302608641907359,0.20330735682709,0.131994449788795,0.0828054375422717,0.0501964123247483,0.0294058687586117,0.0166493399856373,0.00911226526049057],
[-0.00654478121853373,-0.011396322917291,-0.0191135180673593,-0.0308103725876645,-0.0476045358131809,-0.0702428673765095,-0.0984683506236516,-0.130105678729036,-0.159924858740227,-0.178465495034323,-0.171147621890755,-0.118112218911,0.00473865910250214,0.223159768252561,0.560410655999404,1.03197628362024,1.64011833158953,2.36959952945308,3.18598789752751,4.03757050522656,4.86110570733898,5.5906083982659,6.16741507991967,6.54925723976629,6.71620926534004,6.67217382804028,6.441781112515,6.06380415734403,5.58302132488624,5.04263534789013,4.47888339765837,3.91857641569245,3.37934490488571,2.87167147897263,2.4015375915246,1.97269037843034,1.58798185366222,1.2497260979607,0.959379096757715,0.716986331678342,0.520783228318042,0.367157274046519,0.250987013993657,0.166234903527157,0.106616834045052,0.0661906500817092,0.0397673771507901,0.023118123558335,0.0130029590864693,0.0070760122074045],
[-0.00436704238470448,-0.00749775727702396,-0.0123537236747643,-0.0194638030076386,-0.0291760862897334,-0.0412948617777677,-0.0545045774499859,-0.0655704364214298,-0.068375040660444,-0.0529533786493509,-0.00480673387228534,0.0951276348946346,0.269452598396448,0.541940411030585,0.933783931825707,1.45883346388785,2.11862368967303,2.89833947671743,3.7649597888764,4.66854584573823,5.54700208495866,6.33377379849231,6.96710427189947,7.39894050173465,7.60155782132591,7.57051073103176,7.32345434956148,6.89541787222402,6.33191686415777,5.68162947981264,4.99017681145936,4.29596928968691,3.62835557128466,3.00769245141241,2.44661173895315,1.95172847270477,1.52523408382122,1.16611004551603,0.870953061540687,0.634547353685576,0.450344254860862,0.310952833270882,0.208662898216609,0.135958034761314,0.0859517456371583,0.0526916714976642,0.031309144765761,0.0180258212237375,0.010053235092403,0.00543035049251112],
[-0.0027104337836074,-0.00453971905740824,-0.00724014209344095,-0.0109108750525562,-0.0153432834916039,-0.0196748114799079,-0.0218675789054319,-0.0180103876198283,-0.00150220801251349,0.0377389558963716,0.113800292191592,0.244711034431636,0.451454205859752,0.755803366493898,1.17695192690078,1.72723400001253,2.40761262466913,3.20391842450889,4.08492815211584,5.00317993561596,5.89891577282834,6.70681894041718,7.36446959302387,7.82091057181889,8.04358645092234,8.02225851216993,7.76921637079581,7.3159842416962,6.70748866504844,5.99509757864188,5.22996591519666,4.45778432761236,3.71548716151885,3.02992925085939,2.41814341218975,1.88861078426865,1.44299524134653,1.07793493622871,0.786659801498602,0.560347649537341,0.389215593102749,0.263373414100096,0.173464078958055,0.111107342355551,0.0691594127181635,0.0418078507861851,0.0245316967078878,0.013965795375935,0.00771104816242439,0.00412804047858885],
[-0.00152034307711838,-0.00242686669322472,-0.00361231689865138,-0.00489173729144874,-0.00570210528133274,-0.00478136970286209,0.000296043036649757,0.0137225819944591,0.0421449355164602,0.0953093506675927,0.186458676327287,0.332210517777572,0.551632179863102,0.864300685126614,1.28731609299825,1.83151289769718,2.49743402826414,3.27190239212026,4.12613715779856,5.01622945575483,5.88639201279526,6.67479625749255,7.32115954566017,7.7747374958947,8.00118122297702,7.98691682355817,7.74025062676817,7.28914109643543,6.67629161427598,5.9527112427333,5.17105133505134,4.37985694821849,3.61947398393382,2.91987530623839,2.30025195505431,1.76994696419546,1.3302105232178,0.97629366360173,0.699514369344995,0.489067457298276,0.33346882725921,0.221609509203727,0.143446180422954,0.0903813407981013,0.0553975285449026,0.0330121985138896,0.0191163123040092,0.0107517068676279,0.00587107736839649,0.003111526539812],
[-0.000720194296079193,-0.00102190752325973,-0.00123175504502166,-0.0010051700579009,0.000400875487334839,0.00441533481219619,0.0135568057400389,0.0319455127528157,0.0658737726326074,0.124326805982308,0.219280647850764,0.365551959030905,0.579963771568111,0.87965053682876,1.27947299898675,1.78874122941306,2.40771130278243,3.12455387730803,3.91360218299156,4.73559793838048,5.5403400306922,6.2716473396484,6.87398965201113,7.29967637981551,7.51526931912218,7.50598695671419,7.27727977135126,6.85336720116835,6.27316597085142,5.58453366979831,4.83798394171423,4.08097188939124,3.35355837540738,2.68585293528603,2.09723032474515,1.59700945935683,1.18611996905671,0.859256000973257,0.607091588166032,0.418257619393437,0.280913859950672,0.183862254485911,0.11722753378734,0.0727775265038898,0.0439745946070395,0.0258493544413496,0.0147758678173794,0.00820982362442545,0.00443228000618562,0.00232424964702976],
[-0.000224715858461441,-0.000169875751045153,0.00017492225375647,0.00121692240465713,0.00374358202852285,0.00917022380353127,0.0198802519447105,0.0396486924211499,0.0741057627449314,0.131150242803638,0.221170463060356,0.356889498887371,0.552642825772614,0.822944304472025,1.18031450818226,1.63252940474158,2.17966567941203,2.81151369265732,3.50602851038776,4.2294310681118,4.93832884388777,5.583827936018,6.11714398611824,6.49581361515187,6.68938558528272,6.68351153645812,6.48166344356625,6.10420116391241,5.58506399087125,4.96681834525873,4.29504849271517,3.61308503513198,2.95785718225249,2.35731413181531,1.82949310766924,1.38300730902826,1.01853989306541,0.730871090858728,0.511011498807841,0.348124499068422,0.231052086598814,0.149378214834562,0.094053393049844,0.0576581665574001,0.0344050345316564,0.019976744106648,0.0112831723061456,0.00619731112986736,0.00330906675364663,0.00171714889781342],
[4.89388438490511e-05,0.00028103763469471,0.000878005281716824,0.00224212897086013,0.00511204209638418,0.0107675277166891,0.0213063644711734,0.039984175131671,0.0715812287728891,0.122723317305059,0.202043317099089,0.320038049029854,0.488468722132901,0.719190549124849,1.02238970695936,1.40435070669014,1.86505069317043,2.39603474174484,2.9791116012332,3.58637188503554,4.18184634987922,4.7248095886245,5.17435974347057,5.494565849874,5.65927273900195,5.65565941594788,5.48587274601176,5.16645064054694,4.72570421258435,4.19962652223705,3.62713848577033,3.04552316691149,2.48675136738627,1.97512661676103,1.5263621916959,1.1479271865578,0.840316502551668,0.59882889815738,0.415464330144937,0.280643656545711,0.18457208351453,0.118180273830732,0.0736635234343815,0.0446922475326176,0.0263884310527946,0.0151605348575413,0.00847313752741924,0.00460581040550965,0.00243444494996271,0.0012509072990358],
[0.000173332715118901,0.000464432370978246,0.00111661252134409,0.00248649900139272,0.00521006429215694,0.0103650756246956,0.0196881035477666,0.0358381183471087,0.0626779388958454,0.10551672164843,0.171225953183854,0.268117232599192,0.405465435865602,0.592589257252851,0.8374716303386,1.14501328974131,1.51514627617927,1.94115715599286,2.40863924431693,2.89546961381676,3.37306978952634,3.80897069911753,4.17041060188853,4.42842387982157,4.5617084678424,4.55954864463579,4.42323294349626,4.16570783949421,3.80956897329692,3.38381847016416,2.92002809215179,2.44859974711608,1.99571117547643,1.58132061954464,1.21834757586678,0.912914408415033,0.6653734324014,0.471775435056772,0.325450839266228,0.218448105075995,0.142673363353736,0.0906722288157461,0.0560704250634346,0.0337364926125265,0.0197487149661138,0.0112462083491049,0.00622942651869212,0.00335585637878732,0.00175794326724531,0.000895326049150568],
[0.000206486799737943,0.00048729756242797,0.00108255339953639,0.00228437226795062,0.0046043450225938,0.00889711227243986,0.0165240127175506,0.0295502925255672,0.0509539371563589,0.0848034591566525,0.136339384388285,0.211876455281336,0.318440180122623,0.463072307342502,0.651791815025113,0.888279949536752,1.17245719041736,1.49921245296842,1.85759871512232,2.23079480652509,2.59703415642261,2.93152520540182,3.2091691609841,3.40767366803021,3.51052594782016,3.509271786862,3.40466182312796,3.20644974910197,2.9319017331392,2.60333104979345,2.24514279577204,1.88092379946165,1.53104166811804,1.21105631295911,0.931048425108148,0.695785042757093,0.505511812153607,0.357102371031137,0.245303412887917,0.163870117968689,0.10646533160227,0.0672738878739685,0.0413449789725175,0.0247135715679798,0.0143672637055982,0.00812304759508203,0.00446624791428583,0.00238787087148503,0.00124131518975766,0.000627350655123676],
[0.000190853074160471,0.000427735593022375,0.000915499967770344,0.00187854277608375,0.00370518338931114,0.00703785079644696,0.0128917431343681,0.0227969686509595,0.038948114467504,0.0643304016001535,0.102775518284642,0.158887648449505,0.237777836443935,0.344559765568208,0.483597111955648,0.657551193965676,0.86634893039017,1.10625798138043,1.36929579638086,1.64319059476158,1.91204288683117,2.15771043452136,2.36178131428377,2.50784801897077,2.58369398157717,2.58298665887038,2.50615046989415,2.36025267485646,2.15793573333738,1.91561882639356,1.65132144559731,1.38250443932865,1.12427612605806,0.888195060356328,0.681753974689803,0.508490806337838,0.36857277569628,0.259652555854782,0.17779964367394,0.118351165196749,0.0765854363166677,0.0481808298939396,0.0294694972410749,0.0175247085594168,0.0101323704959906,0.0056957306148684,0.00311283072930519,0.001653913519106,0.000854278163926691,0.000428931581624752],
[0.00015467433254227,0.000337303170264106,0.000706857954021379,0.00142638751000046,0.00277573082328609,0.0052146943939389,0.00946577201845767,0.0166127851130356,0.028204175312386,0.0463394992109002,0.0737066401130475,0.11352863057125,0.169377366599844,0.244821773502428,0.342903504763825,0.46547362678403,0.612473053038908,0.781286015232613,0.966324052193797,1.15899286748701,1.34814723513139,1.52105253669787,1.66476150641397,1.7677081742164,1.82124828130827,1.8208609021601,1.7667789409063,1.6639264964261,1.5211815048894,1.35011627625905,1.16346263567873,0.973581187093562,0.791182915353415,0.624470685732089,0.478764173363589,0.356572520016982,0.258006562226103,0.181387648609968,0.123911942734049,0.0822579986634767,0.0530676533496863,0.0332729690469042,0.0202759838056014,0.0120092313207195,0.00691354561714988,0.00386850763227868,0.00210398656010782,0.00111222983257102,0.000571464021377071,0.000285372735241216],
[0.000114713743401078,0.000246059153797408,0.000508845388598388,0.00101574670391712,0.00195901079797571,0.00365296594124108,0.00658947206055643,0.0115038152224973,0.0194434525579331,0.0318252540611341,0.050459574657393,0.0775137849415407,0.115386829928422,0.166473207745274,0.232811700077077,0.315641019095124,0.414917392620391,0.528880252645535,0.653771301820958,0.783809269846392,0.911491672713598,1.02823736717156,1.12531010474592,1.1948914238038,1.23112149485418,1.23091550306893,1.19439749039208,1.12486699283217,1.02830827888447,0.912543159089855,0.786193103407419,0.657640019764221,0.534155087968891,0.42131108954612,0.322723172329203,0.240095138761204,0.173498360083214,0.121785995810292,0.0830459682731219,0.0550156228028778,0.035409874233749,0.022143969863865,0.0134554511357754,0.00794453589465019,0.0045580469684534,0.00254119598135187,0.00137674102080515,0.000724808394287255,0.00037080854252836,0.000184343198428858],
[7.94276357513287e-05,0.000168536764222243,0.000345438229899749,0.000684457080452551,0.00131186423505589,0.00243336337578076,0.00436984703344033,0.00759977349820054,0.0128032489864115,0.0208985721699655,0.033057324270026,0.0506804459213639,0.0753170700888568,0.108512246074243,0.151580529534452,0.205319602105972,0.269699172951318,0.343580474685925,0.424534092300176,0.508822188798133,0.59159151037339,0.667286725182151,0.730246275227779,0.775396374657719,0.798926240970943,0.798819897268885,0.775141458888413,0.730017887080517,0.667324278943431,0.592136140136447,0.510055686290916,0.426535251562224,0.346308519048523,0.273005554185795,0.208981781334376,0.155346635733272,0.112144688974802,0.0786257648833709,0.0535408175453003,0.0354129612310515,0.0227519267785726,0.0141994840301358,0.0086088108058821,0.00507043963034947,0.00290130429274805,0.00161286167584492,0.000871095210268839,0.000457093169084638,0.000233033204325509,0.000115426533302097],
[5.19094479220219e-05,0.000109325338479407,0.000222677697028685,0.000438889694305191,0.00083742344707809,0.00154737349713233,0.00276965435697205,0.00480324198433677,0.00807240959439023,0.0131492284134312,0.0207627237469639,0.0317838344320911,0.0471749120851522,0.0678951894827669,0.094760333801789,0.128264811769908,0.168388832654161,0.214424072338301,0.264860142390804,0.317372841836262,0.368943164794018,0.416113309766201,0.455356576124636,0.483509051550484,0.498190565518166,0.498137270701372,0.483381329746867,0.455242263223499,0.416132501913381,0.369216816458422,0.317992133189701,0.265864579805699,0.215793175873251,0.170048057387935,0.130102496738154,0.0966501075095837,0.0697178501785263,0.0488350957682777,0.0332190464721131,0.0219446690949977,0.0140791447922691,0.00877296248266906,0.00530951776846959,0.00312116899413202,0.00178215676721465,0.00098844448008115,0.000532532349530704,0.000278698607553512,0.000141685224513414,6.99711871894868e-05],
[3.22353596126927e-05,6.7526427150534e-05,0.000136915614243682,0.000268809978442396,0.000511198183497433,0.000941879690692516,0.00168171985103911,0.0029103014396191,0.00488214042760686,0.00794004600735532,0.012520493559258,0.0191445479104783,0.0283876307772234,0.0408230275418193,0.056938004359504,0.0770277203991483,0.101079887559703,0.128670555294826,0.158896057760216,0.190365659965761,0.221272301153764,0.249545314733236,0.273071481175495,0.28995341017427,0.2987619355454,0.298736009249567,0.289891289197232,0.273015926876483,0.249554793007275,0.221405694081987,0.19066735218312,0.159385274867508,0.129337317464746,0.101887893181394,0.0779225986268534,0.0578582241029235,0.0417105504754269,0.0291960263923393,0.0198433904254973,0.0130960091139038,0.00839284004765201,0.00522325117239543,0.00315681436694817,0.0018528767245067,0.00105619824204729,0.000584731784454345,0.000314405386713507,0.000164192618694939,8.32826721029713e-05,4.10297274582676e-05]];
	var contourData = [{
        z: matlabPeaks,
        type: 'contour',
        colorscale: [
            [0, '#042940'],
            [0.33, '#005c53'],
            [0.67, '#9fc131'],
            [1, '#dbf227']
        ],
    }];
    const RGB2HEX = (r, g, b) => ((r << 16) + (g << 8) + b).toString(16).padStart(6, '0');
    init();
    function editColor(newColor) {
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
        index = colorArray.indexOf(colorStr2Hex(td.style.backgroundColor));
        //if (index == currentIndex)
        //    return;
        var tr = document.getElementById('colorRow');
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
            yaxis: Object.assign({}, baseYaxis)
        };
        stackBarLayout.xaxis.title = 'Year';
        stackBarLayout.yaxis.title = 'Yields (million tons)';
        stackBarLayout.barmode = 'relative';

        contourLayout = {
            margin: Object.assign({}, baseMargin),
            xaxis: Object.assign({}, baseXaxis),
            yaxis: Object.assign({}, baseYaxis)
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