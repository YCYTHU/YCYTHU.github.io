---
layout: none
title: 康威生命游戏
---
<!--more-->

<html>
<head>
{%- include analytics.html -%}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description" content="A JavaScript version of Conway's Game of Life, based on the Hashlife-algorithm">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.6.0/css/all.css">
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/life.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/formats.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/draw.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/macrocell.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/main.min.js"></script>
<style type="text/css">
    body {
        background-color: #000;
        margin: 0px;
        color: #ccc;
        font-family: sans-serif;
        height: 100%;
        overflow: hidden;
    }
    html {
        height: 100%;
        margin: 0px;
    }
    #toolbar {
        position: fixed;
        text-align: center;
        padding: 0 10px;
        z-index: 10;
        color: #fff;
        height: 100%;
        overflow: visible;
        background-color: #fff3;
    }
    #toolbar > div {
        /*float: right;*/
    }
    #statusbar > div {
        float: right;
        border-left: 1px solid #ccc;
        text-align: center;
    }
    #controls {
        margin: 0 auto;
        margin-top: 20px;
        padding: 5px;
        color: #fff;
    }
    #controls td div {
        margin: 2px 1px;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        font-size: 80%;
        line-height: 150%;
    }
    #statusbar {
        position: fixed;
        bottom: 25px;
        height: 0;
        right: 0px;
        font-size: 13px;
        z-index: 11;
        width: 99%;
        text-shadow: 0px 0px 1px #ccc;
        -webkit-user-select: none;
        -moz-user-select: none;
    }
    #label_step:before {
        content: "Step: ";
    }
    #label_fps:before {
        content: "FPS: ";
    }
    #label_gen:before {
        content: "Gen: ";
    }
    #label_pop:before {
        content: "Pop: ";
    }
    #label_gen, #label_pop, #label_mou, #label_zoom, #label_step, #label_fps {
        padding: 0px 1vw;
    }
    .button, .menu {
        margin-top: 10px;
    }
    .button, .menu > div {
        /*background-color: #ccc;*/
        cursor: pointer;
        /*padding: 0px 0.5vw;
        margin-right: 1vw;*/
        margin: 8px;
        /*box-shadow: 2px 2px 3px #ccc;*/
        -webkit-user-select: none;
        -moz-user-select: none;
    }
    #overlay {
        background-color: #000;
        position: absolute;
        top: 50px;
        padding: 20px 5px 50px;
        font-size: 13px;
        color: #ddd;
        z-index: 10;
        line-height: 1.4;
        border-style: solid;
        border-color: #444;
        border-width: 2px 0px;
        width: 100%;
    }
    @media (min-width: 850px) {
        #overlay {
            border-width: 2px;
            border-radius: 15px;
            left: 50%;
            margin-left: -400px;
            width: 700px;
            padding: 50px;
        }
    }
    @media (max-width: 800px) {
        #label_mou {
            display: none;
        }
        .button {
            padding: 0px 4px;
        }
        .not_on_small_screen {
            display: none;
        }
    }
    #pattern_name {
        cursor: pointer;
    }
    .button2 {
        border: 1px solid #fff;
        cursor: pointer;
        padding: 5px 20px;
        margin: 0px 20px;
    }
    .button2:hover {
        background-color: #123;
    }
    #import_text {
        background-color: #000;
        border: 1px solid #fff;
        display: block;
        width: 100%;
        height: 200px;
        color: #fff;
    }
    #loading {
        font-family: monospace;
        text-align: center;
        font-size: 36px;
    }
    input[type=number], input[type=text] {
        border: 1px solid #fff;
        color: #fff;
        background-color: #000;
        padding: 2px;
        width: 110px;
        text-align: center;
    }
    a, .link {
        color: #ff0;
        padding: 0px 1px;
        cursor: pointer;
        text-decoration: none;
    }
    a:hover, .link:hover {
        text-decoration: underline;
    }
    #pattern_description {
        white-space: pre-wrap;
    }
    #alert_text {
        max-height: 300px;
        overflow: auto;
    }
    canvas {
        position: absolute;
    }
    #pattern_chooser > div {
        height: 500px;
    }
    #pattern_chooser > div > div {
        padding: 3px;
        float: left;
        width: 215px;
        cursor: pointer;
    }
    #pattern_chooser > div > div:hover {
        color: #000;
        background-color: #ff0;
    }
    #pattern_chooser span.size {
        color: #999;
        font-size: 80%;
        margin-left: 7px;
    }
    #pattern_list {
        overflow-x: hidden;
    }
    br.clear {
        clear: both;
    }
    .left {
        float: left;
    }
    .right {
        float: right;
    }
    #overlay h2 {
        margin-top: 0;
    }
    #pattern_file_container, #pattern_link_container, #pattern_urls {
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
</head>
<body>
    <div id="toolbar" style="display: none;">
        <div class="button" id="run_button">Run</div>
        <div class="button" id="step_button">Step</div>
        <div class="button" id="superstep_button">Superstep</div>
        <div class="button" id="rewind_button">Rewind</div>
        <div class="button" id="clear_button">Clear</div>
        <div id="randomize_button" class="button">Randomize</div>
        <div id="import_button" class="button">Import</div>
        <div id="export_button" class="button">Export</div>    
        <div class="menu" id="examples_menu" style="display: none">
            <div id="pattern_button">Patterns</div>
        </div>    
        <div class="button" id="settings_button" style="display: none">Settings</div>
        <div class="button" id="about_button" style="display: none;">About</div>
        <table id="controls">
            <tr title="Speed"><td colspan="3">Speed</td></tr>
            <tr>
                <td title="Slower"><div id="slower_button"><i class="fa-solid fa-angles-left"></i></div></td>
                <td title="Normal speed"><div id="normalspeed_button">1<i class="fa-solid fa-xmark"></i></div></td>
                <td title="Faster"><div id="faster_button"><i class="fa-solid fa-angles-right"></i></div></td>
            </tr>
            <tr title="Zoom"><td colspan="3">Zoom</td></tr>
            <tr>
                <td title="Zoom out"><div id="zoomout_button"><i class="fa-solid fa-magnifying-glass-minus"></i></div></td>
                <td title="Fit pattern"><div id="initial_pos_button"><i class="fa-solid fa-rotate-right"></i></div></td>
                <td title="Zoom in"><div id="zoomin_button"><i class="fa-solid fa-magnifying-glass-plus"></i></div></td>
            </tr>
            <tr title="Pan" class="not_on_small_screen"><td colspan="3">Pan</td></tr>
            <tr class="not_on_small_screen">
                <td title="Go north-west"><div id="nw_button">&#8598;</div></td>
                <td title="Go north"><div id="n_button">&#8593;</div></td>
                <td title="Go north-east"><div id="ne_button">&#8599;</div></td>
            </tr>
            <tr class="not_on_small_screen">
                <td title="Go east"><div id="e_button">&#8592;</div></td>
                <td title="Go to 0, 0"><div id="middle_button">M</div></td>
                <td title="Go west"><div id="w_button">&#8594;</div></td>
            </tr>
            <tr class="not_on_small_screen">
                <td title="Go south-west"><div id="sw_button">&#8601;</div></td>
                <td title="Go south"><div id="s_button">&#8595;</div></td>
                <td title="Go south-east"><div id="se_button">&#8600;</div></td>
            </tr>
        </table>
    </div>
    <div id="statusbar" style="display: none;">
        <div id="label_zoom" title="Zoom"></div>
        <div id="label_mou" title="Mouse Coordinates">0, 0</div>
        <div id="label_fps" title="Frames per Second">0</div>
        <div id="label_gen" title="Generation">0</div>
        <div id="label_pop" title="Population">0</div>
        <div id="label_step" title="Generation per Step">1</div>
        <span id="pattern_name" class="link" title="Pattern infos"></span>
    </div>
    <div id="overlay" style="display: none">
        <div id="about">
            <h2>Conway's Game of Life in JavaScript</h2>
            <div id="notice">
                <h3 style="color: orange">Sorry, this applications needs JavaScript to work.</h3>
                <div style="text-align: center">
                    <img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/pattern.gif" width="324" height="210" alt="Bi Gun">
                </div>
            </div>
            <div id="about_main" style="display: none">
                <b>Controls:</b>
                <pre>
                    Left mouse          - Move around
                    Right mouse         - Create / Delete cells
                    Mouse wheel         - Zoom
                    Arrow keys, HJKL    - Move around
                    +, -                - Zoom
                    Space               - One generation forward
                    Tab                 - Many generations forward
                    Enter               - Run/Pause
                    Backspace           - Rewind
                    ]                   - Faster
                    [                   - Slower
                    Escape              - Close Popups
                </pre>
            </div>
            <br>
            <span class="button2" id="about_close" style="display: none">Ok</span>
        </div>
        <div id="randomize_dialog" style="display: none;">
            <h2>Random Pattern</h2>
            <div class="left">
                Width
            </div>
            <div class="right">
                <input type="number" min="1" id="randomize_width" style="width: 60px">
            </div>
            <br class="clear">
            <br>
            <div class="left">
                Height
            </div>
            <div class="right">
                <input type="number" min="1" id="randomize_height" style="width: 60px">
            </div>
            <br class="clear">
            <br>
            <div class="left">
                Density
            </div>
            <div class="right">
                <input type="number" id="randomize_density" min="0" max="1" step="0.1" style="width: 60px">
            </div>
            <br class="clear">
            <br>
            <br>
            <br>
            <span id="randomize_submit" class="button2">Randomize</span>
            <span id="randomize_abort" class="button2">Abort</span>
        </div>
        <div id="import_dialog" style="display: none;">
            <h2>Import Pattern</h2>
            Supports RLE, Life 1.06, Plaintext
            <br>
            <br>
            <textarea placeholder="Paste pattern file here" id="import_text"></textarea>
            <br>
            Or: <input type="file" id="import_file">
            <br>
            <br>
            <div id="import_info"></div>
            <br>
            <br>
            <br>
            <span id="import_submit" class="button2">Import</span>
            <span id="import_abort" class="button2">Abort</span>
        </div>
        <div id="alert" style="display: none;">
            <div id="alert_text">
                <h2 id="pattern_title"></h2>
                <div id="pattern_description"></div>
                <br>
                <div id="pattern_urls"></div>
                <br>
                <div id="pattern_file_container">
                    Pattern file: <a target="_blank" id="pattern_file_link" href=""></a>
                </div>
                <div id="pattern_link_container">
                    Link to view online:
                    <a id="pattern_link" target="_blank" href=""></a>
                </div>
            </div>
            <br>
            <br>
            <span class="button2" id="alert_close">Ok</span>
        </div>
        <div id="pattern_chooser" style="display: none;">
            Source: <a href="http://www.conwaylife.com/wiki/Main_Page" target="_blank">www.conwaylife.com</a>. Thanks!
            &mdash; <a href="examples/" target="_blank">List of all patterns</a>
            <div id="pattern_list"></div>
            <span class="button2" id="pattern_close">Close</span>
        </div>
        <div id="settings_dialog" style="display: none;">
            <h2>Settings</h2>
            <div class="left" id="select_rules">
                Rule<br>
                <small>
                    Or pick one:
                    <span class="link" data-rule="23/3">Conway</span>
                    <span class="link" data-rule="23/36">HighLife</span>
                    <span class="link" data-rule="125/36">2x2</span>
                    <span class="link" data-rule="1357/1357">Replicator</span>
                </small>
            </div>
            <div class="right">
                <input type="text" id="rule">
            </div>
            <br class="clear">
            <br>
            <div class="left">
                Maximum Frames per Second
            </div>
            <div class="right">
                <input type="number" min="1" id="max_fps" style="width: 60px">
            </div>
            <br class="clear">
            <br>
            <div class="left">
                Generation step<br>
                <small>Only powers of 2 (automatically rounded)</small>
            </div>
            <div class="right">
                <input type="number" step="any" id="gen_step" style="width: 60px">
            </div>
            <br class="clear">
            <br>
            <div class="left">
                Border width<br>
                <small>0 .. 0.5</small>
            </div>
            <div class="right">
                <input type="number" min="0" max="0.5" step="0.05" id="border_width" style="width: 60px">
            </div>
            <br>
            <br>
            <br>
            <hr>
            <br>
            <br>
            <span id="settings_submit" class="button2">Save</span>
            <span id="settings_reset" class="button2">Reset</span>
            <span id="settings_abort" class="button2">Abort</span>
        </div>
    <div id="loading_popup" style="display: none; font-size: 16px">
        <div style="text-align: center">
            <h2>Downloading pattern file</h2>
            Please wait a second.<br><br>
            <img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/js/game_of_life/pattern.gif" width="324" height="210" alt="Bi Gun">
        </div>
    </div>
</div>
<script>document.getElementById("overlay").style.display = "none"</script>
</body>
</html>