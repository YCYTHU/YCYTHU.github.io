---
title: 张小乙下南京路线图
tags: 
- Plotly
cover: /assets/images/moles on seasaw.jpg
---
郑亲王府大奶奶云芳遭丈夫端华害死，雇用张小乙助其报仇。张小乙率领四名轿夫和儿子张小枕，经过千里艰险之旅，斩妖除魔，最终成功追击至南京，消灭了端华和海棠花，为云芳复仇。
<!--more-->

> 说书唱戏劝人方，三条大道走中央，善恶到头终有报，人间正道是沧桑。

<style type="text/css">
    #container {
        display: flex;
        justify-content: center;
    }
</style>
<div id="container">
    <div id="myDiv"></div>
</div>
<script src="https://cdn.plot.ly/plotly-2.29.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
    var myPlot = document.getElementById('myDiv');
    const path = [
            {
                lat: 39.91061,
                lon: 116.37039,
                text: '<b><span style="font-size:16">北京</span></b>',
                summary: '&#5867;&nbsp;凶宅诡话<br>&#5867;&nbsp;冤鬼求援<br>&#5867;&nbsp;义士出京<br>&#5867;&nbsp;结缘四老<br>&#5867;&nbsp;怪蛇纠缠'
            },
            //{
            //    lat: 39.80457,
            //    lon: 116.39455,
            //    text: '<b>南苑</b>',
            //    summary: '&#5867;&nbsp;怪蛇纠缠'
            //},
            {
                lat: 39.2876399,
                lon: 116.33915,
                text: '<b>固安</b>',
                summary: '&#5867;&nbsp;小乙收子'
            },
            {
                lat: 39.1476272,
                lon: 117.1727404,
                text: '<b>天津</b>',
                summary: '&#5867;&nbsp;水鬼闹宴<br>&#5867;&nbsp;戏班沉冤'
            },
            {
                lat: 38.3044099,
                lon: 116.83869,
                text: '<b>沧州</b>',
                summary: '&#5867;&nbsp;四爷逢难<br>&#5867;&nbsp;恶贼自缚'
            },
            {
                lat: 37.4354999,
                lon: 116.35927,
                text: '<b>德州</b>',
                summary: '&#5867;&nbsp;龙子显圣'
            },
            {
                lat: 36.4570199,
                lon: 115.9854899,
                text: '<b>聊城</b>',
                summary: '&#5867;&nbsp;聊城捉妖'
            },
            {
                lat: 36.6518399,
                lon: 117.12009,
                text: '<b>济南</b>',
                summary: '&#5867;&nbsp;枯木护主'
            },
            {
                lat: 36.199399,
                lon: 117.0884,
                text: '<b>泰安</b>',
                summary: '&#5867;&nbsp;荒村鬼妪'
            },
            {
                lat: 35.4746899,
                lon: 117.24542,
                text: '<b>曲阜</b>',
                summary: '&#5867;&nbsp;三爷中邪'
            },
            {
                lat: 34.2666652,
                lon: 117.2179084,
                text: '<b>徐州</b>',
                summary: '&#5867;&nbsp;纸人复仇'
            },
            {
                lat: 32.9154799,
                lon: 117.38932,
                text: '<b>蚌埠</b>',
                summary: '&#5867;&nbsp;高僧犯戒<br>&#5867;&nbsp;狐道认亲'
            },
            {
                lat: 32.5367299,
                lon: 117.39458,
                text: '<b>定远</b>',
                summary: '&#5867;&nbsp;夜闹荒冢'
            },
            {
                lat: 32.0393299,
                lon: 118.7938994,
                text: '<b><span style="font-size:16">南京</span></b>',
                summary: '&#5867;&nbsp;终了夙愿'
            },
        ];
    var data = [{
        type: 'scattergeo',
        lat: [],
        lon: [],
        text: [],
        summary: [],
        textposition: 'right',
        textfont: {
          family: 'sans serif',
          size: 12,
          color: '#000'
        },
        hovertemplate: '<b>%{text}</b><extra></extra>',
        mode: 'lines+markers+text',
        line:{
            width: 3,
            color: '#ea4335'
        },
        marker:{
            color: '#ea4335cc',
            size: 12
        },
        xaxis: {
            range: [0, 1],
            showgrid: false,
            zeroline: false,
            autotick: false,
            ticks: '',
            showticklabels: false,
            showline: false,
        },
        yaxis: {
            range: [0, 1],
            showgrid: false,
            zeroline: false,
            autotick: false,
            ticks: '',
            showticklabels: false,
            showline: false,
        }
    }];

    for (let i = 0; i < path.length; i++) {
        data[0].lat.push(path[i].lat);
        data[0].lon.push(path[i].lon);
        data[0].text.push(path[i].text);
        data[0].summary.push(path[i].summary);
    }

    var layout = {
        showlegend: false,
        width: 400,
        height: 400,
        margin: {
            l: 0,
            r: 0,
            b: 0,
            t: 0,
            pad: 0
        },
        geo: {
            resolution: 50,
            showland: true,
            showlakes: true,
            showrivers: true,
            showsubunits: true,
            landcolor: '#ccc',
            countrycolor: '#ccc',
            lakecolor: '#fff',
            rivercolor: '#fff',
            projection: {
              type: 'equirectangular'
            },
            coastlinewidth: 2,
            lataxis: {
              range: [ 31, 42 ],
              showgrid: true,
              tickmode: 'linear',
              dtick: 4
            },
            lonaxis:{
              range: [112, 123],
              showgrid: true,
              tickmode: 'linear',
              dtick: 4
            }
        }
    };

    var config = {
        //staticPlot: true,
        displaylogo: false,
        responsive: true,
        modeBarButtonsToRemove: ['toImage','zoom2d', 'pan2d', 'select2d', 'lasso2d', 'zoomIn2d', 'zoomOut2d', 'autoScale2d']
    };

    Plotly.newPlot("myDiv", data, layout, config);

    myPlot.on('plotly_click',
        function(data){
            var point = data.points[0];
            var coord = geo2coord(point.lat, point.lon);
            var newAnnotation = {
                x: coord[1],
                y: coord[0],
                arrowhead: 6,
                ax: -80,
                ay: 0,
                bgcolor: '#fffe',
                arrowcolor: '#ea4335a0',
                font: {size:12},
                bordercolor: '#ea4335a0',
                borderwidth: 3,
                borderpad: 4,
                text: (point.text) + '<br>' + (point.data.summary[point.pointNumber])
            },
            divid = document.getElementById('myDiv'),
            newIndex = (divid.layout.annotations || []).length;
            if(newIndex) {
                var foundCopy = false;
                divid.layout.annotations.forEach(function(ann, sameIndex) {
                    if(ann.text === newAnnotation.text ) {
                        Plotly.relayout('myDiv', 'annotations[' + sameIndex + ']', 'remove');
                        foundCopy = true;
                    }
                });
                if(foundCopy) return;
            }
            Plotly.relayout('myDiv', 'annotations[' + newIndex + ']', newAnnotation);
        }
    )
    .on('plotly_clickannotation', function(event, data) {
            Plotly.relayout('myDiv', 'annotations[' + data.index + ']', 'remove');
        }
    );
    function geo2coord(lat,lon) {
        var latRange = layout.geo.lataxis.range;
        var lonRange = layout.geo.lonaxis.range;
        var coord = [(lat-latRange[0])/(latRange[1]-latRange[0]), (lon-lonRange[0])/(lonRange[1]-lonRange[0])];
        return coord
    }
</script>