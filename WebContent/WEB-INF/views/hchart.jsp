<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <!-- <script src="https://img.hcharts.cn/highchart/modules/exporting.js"></script> -->
    <title></title>
</head>

<body>
    <form action="/test/option">
        <input type="submit" value="back">
    </form>
    <div id="container0" style="min-height: 300px;height: 300px"></div>
    <div id="container1" style="min-height: 300px;height: 300px"></div>
    <div id="container2" style="min-height: 300px;height: 300px"></div>
    <script>
    $(function() {
        $('#container0').highcharts({
            title: {
                text: 'Chart3-1',
                x: -20 //center
            },
            subtitle: {
                text: 'throughput in mergeable path',
                x: -20
            },
            xAxis: {
                title: {
                    text: 'date'
                },
                categories: ${date}
            },
            yAxis: {
                title: {
                    text: 'Throughput(Mpps)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: 'Mpps'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'mergeable 64B',
                data: ${mer64}
            },{
                name: 'mergeable 128B',
                data: ${mer128}
            },{
                name: 'mergeable 256B',
                data: ${mer256}
            }]
        });
        $('#container1').highcharts({
            title: {
                text: 'Chart3-2',
                x: -20 //center
            },
            subtitle: {
                text: 'throughput in normal path',
                x: -20
            },
            xAxis: {
                title: {
                    text: 'date'
                },
                categories: ${date}
            },
            yAxis: {
                title: {
                    text: 'Throughput(Mpps)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: 'Mpps'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'norgeable 64B',
                data: ${nor64}
            },{
                name: 'norgeable 128B',
                data: ${nor128}
            },{
                name: 'norgeable 256B',
                data: ${nor256}
            }]
        });
        $('#container2').highcharts({
            title: {
                text: 'Chart3-3',
                x: -20 //center
            },
            subtitle: {
                text: 'throughput in vector path',
                x: -20
            },
            xAxis: {
                title: {
                    text: 'date'
                },
                categories: ${date}
            },
            yAxis: {
                title: {
                    text: 'Throughput(Mpps)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: 'Mpps'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'vecgeable 64B',
                data: ${vec64}
            },{
                name: 'vecgeable 128B',
                data: ${vec128}
            },{
                name: 'vecgeable 256B',
                data: ${vec256}
            }]
        });
    });
    </script>
</body>

</html>

