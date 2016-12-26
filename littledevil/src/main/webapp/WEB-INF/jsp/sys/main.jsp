<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>网站登录</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="res/css/Nstrap.css" rel="stylesheet">
    <link href="res/css/style.css" rel="stylesheet">
    <link href="res/common/js/gritter/jquery.gritter.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div id="page-wrapper" class="console-container">
    <div class="row">
        <hr class="hr"/>
        <div class="col-lg-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="label label-success pull-right">月</span>
                    <h5>资源</h5>
                </div>
                <div class="panel-body">
                    <h1 class="no-margins">40 886,200</h1>
                    <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i>
                    </div>
                    <small>总数</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="label label-info pull-right">全年</span>
                    <h5>试题</h5>
                </div>
                <div class="panel-body">
                    <h1 class="no-margins">275,800</h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>新试题</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="label label-primary pull-right">今天</span>
                    <h5>访客</h5>
                </div>
                <div class="panel-body">
                    <h1 class="no-margins">106,120</h1>
                    <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                    </div>
                    <small>新访客</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="label label-danger pull-right">最近一个月</span>
                    <h5>活跃用户</h5>
                </div>
                <div class="panel-body">
                    <h1 class="no-margins">80,600</h1>
                    <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                    </div>
                    <small>10月</small>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5>订单</h5>
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-xs btn-white active">天</button>
                            <button type="button" class="btn btn-xs btn-white">月</button>
                            <button type="button" class="btn btn-xs btn-white">年</button>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <ul class="stat-list">
                                <li>
                                    <h2 class="no-margins">2,346</h2>
                                    <small>订单总数</small>
                                    <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">4,422</h2>
                                    <small>最近一个月订单</small>
                                    <div class="stat-percent">60% <i class="fa fa-level-down text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 60%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">9,180</h2>
                                    <small>最近一个月销售额</small>
                                    <div class="stat-percent">22% <i class="fa fa-bolt text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar"></div>
                                    </div>
                                </li>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5>数据报告</h5>  <span class="label label-primary">K+</span>
                                <div class="panel-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user">
                                        <li><a href="index.html#">选项1</a>
                                        </li>
                                        <li><a href="index.html#">选项2</a>
                                        </li>
                                    </ul>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="pull-right text-right">

                                        <span class="bar_dashboard">5,3,9,6,5,9,7,3,5,2,4,7,3,2,7,9,6,4,5,7,3,2,1,0,9,5,6,8,3,2,1</span>
                                        <br/>
                                        <small class="font-bold">&yen; 20 054.43</small>
                                    </div>
                                    <h5>鄂中地区销售数据
                                        <br/>
                                        <small class="m-r"><a href="graph_flot.html"> 查看所有数据</a> </small>
                                    </h5>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right text-right">

                                        <span class="bar_dashboard">5,3,9,6,5,9,7,3,5,2,4,7,3,2,7,9,6,4,5,7,3,2,1,0,9,5,6,8,3,2,1</span>
                                        <br/>
                                        <small class="font-bold">&yen; 20 054.43</small>
                                    </div>
                                    <h5>鄂西北地区销售数据
                                        <br/>
                                        <small class="m-r"><a href="graph_flot.html"> 查看所有数据</a> </small>
                                    </h5>
                                </li>
                            </ul>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5>最新动态</h5>
                                <div class="panel-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user">
                                        <li><a href="index.html#">选项1</a>
                                        </li>
                                        <li><a href="index.html#">选项2</a>
                                        </li>
                                    </ul>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <p><a class="text-info" href="index.html#">#感谢有你#</a> 感谢你们一路的相伴，未来也请让我为你们撑腰，我们会更好</p>
                                    <small class="block text-muted"><i class="fa fa-clock-o"></i> 1分钟前</small>
                                </li>
                                <li class="list-group-item">
                                    <p><a class="text-info" href="index.html#">@颜文字君</a> 女生身高×1.09后，就是最适合你的男生身高；相反，男生是÷1.09就可以了..小伙伴们可以试着算下..【图是我的..(*/ω＼*)</p>
                                    <div class="text-center m">
                                        <span id="sparkline8"></span>
                                    </div>
                                    <small class="block text-muted"><i class="fa fa-clock-o"></i> 2小时前</small>
                                </li>

                                <li class="list-group-item">
                                    <p><a class="text-info" href="index.html#">#发型师#</a> 刚才剪发，顾客在看这个视频，妈蛋，这舞姿太销魂了，笑得手颤抖。。。</p>
                                    <small class="block text-muted"><i class="fa fa-clock-o"></i> 1分钟前</small>
                                </li>
                                <li class="list-group-item">
                                    <p><a class="text-info" href="index.html#">#一年级#</a> ——#陈氏父子# cut：“他是我的陈爸爸”[心]“我叫陈思成，陈老师的陈” [心]“不再见就是，你也好，爸爸也好，妈妈也好，都永远不要说再见</p>
                                    <small class="block text-muted"><i class="fa fa-clock-o"></i> 2分钟前</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5>最新消息</h5>
                                <div class="panel-tools">
                                    <span class="label label-success">10条未读</span>
                                </div>
                            </div>
                            <div class="panel-body">

                                <div>
                                    <div class="feed-activity-list">

                                        <div class="feed-element">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle" src="res/images/a8.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">5分钟前</small>
                                                <strong>谨斯里</strong> 上传了一个文件
                                                <br>
                                                <small class="text-muted">2014.11.8 12:22</small>

                                            </div>
                                        </div>

                                        <div class="feed-element">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle" src="res/images/a2.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2个月前</small>
                                                <strong>田亮</strong> 参加了<strong>《粑粑去哪儿》</strong>
                                                <br>
                                                <small class="text-muted">2014.11.8 12:22</small>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle" src="res/images/a3.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2小时前</small>
                                                <strong>林依晨Ariel</strong> 刚刚起床
                                                <br>
                                                <small class="text-muted">2014.11.8 12:22</small>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle" src="res/images/a5.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">32分钟前</small>
                                                <strong>颜文字君</strong> 评论了
                                                <br>
                                                <small class="text-muted">2014.11.8 12:22</small>
                                                <div class="well">
                                                    【九部令人拍案叫绝的惊悚悬疑剧情佳作】如果你喜欢《迷雾》《致命ID》《电锯惊魂》《孤儿》《恐怖游轮》这些好片，那么接下来推荐的9部同类题材并同样出色的的电影，绝对不可错过哦~
                                                </div>
                                                <div class="pull-right">
                                                    <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 喜欢 </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button class="btn btn-primary btn-block m-t"><i class="fa fa-arrow-down"></i> 加载更多</button>

                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5>项目进度</h5>
                                <div class="panel-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user">
                                        <li><a href="index.html#">选项1</a>
                                        </li>
                                        <li><a href="index.html#">选项2</a>
                                        </li>
                                    </ul>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <h3>还有约79842492229个Bug需要修复</h3>
                                <small><i class="fa fa-map-marker"></i> 地点当然是在办公室</small>
                            </div>
                            <div class="panel-body timeline">

                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-3 date">
                                            <i class="fa fa-briefcase"></i>
                                            6:00
                                            <br/>
                                            <small class="text-navy">2 小时前</small>
                                        </div>
                                        <div class="col-xs-9 content no-top-border">
                                            <p class="m-b-xs"><strong>服务器已彻底崩溃</strong>
                                            </p>

                                            <p>还未检查出错误</p>

                                            <p><span data-diameter="40" class="updating-chart">5,3,9,6,5,9,7,3,5,2,5,3,9,6,5,9,4,7,3,2,9,8,7,4,5,1,2,9,5,4,7,2,7,7,3,5,2</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-9 date">
                                            <i class="fa fa-file-text"></i>
                                            7:00
                                            <br/>
                                            <small class="text-navy">3小时前</small>
                                        </div>
                                        <div class="col-xs-9 content">
                                            <p class="m-b-xs"><strong>修复了0.5个bug</strong>
                                            </p>
                                            <p>重启服务</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-3 date">
                                            <i class="fa fa-coffee"></i>
                                            8:00
                                            <br/>
                                        </div>
                                        <div class="col-xs-9 content">
                                            <p class="m-b-xs"><strong>喝水、上厕所、做测试</strong>
                                            </p>
                                            <p>
                                                喝了4杯水，上了3次厕所，控制台输出出2324个错误，神啊，带我走吧
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-9 date">
                                            <i class="fa fa-phone"></i>
                                            11:00
                                            <br/>
                                            <small class="text-navy">21小时前</small>
                                        </div>
                                        <div class="col-xs-9 content">
                                            <p class="m-b-xs"><strong>项目经理打电话来了</strong>
                                            </p>
                                            <p>
                                                TMD，项目经理居然还没有起床！！！
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-3 date">
                                            <i class="fa fa-user-md"></i>
                                            09:00
                                            <br/>
                                            <small>21小时前</small>
                                        </div>
                                        <div class="col-xs-9 content">
                                            <p class="m-b-xs"><strong>开会</strong>
                                            </p>
                                            <p>
                                                开你妹的会，老子还有897894个bug没有修复
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="row">
                                        <div class="col-xs-3 date">
                                            <i class="fa fa-comments"></i>
                                            12:50
                                            <br/>
                                            <small class="text-navy">讨论</small>
                                        </div>
                                        <div class="col-xs-9 content">
                                            <p class="m-b-xs"><strong>…………</strong>
                                            </p>
                                            <p>
                                                又是操蛋的一天
                                            </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<!-- Flot -->
<script src="res/common/js/flot/jquery.flot.js"></script>
<script src="res/common/js/flot/jquery.flot.tooltip.min.js"></script>
<script src="res/common/js/flot/jquery.flot.spline.js"></script>
<script src="res/common/js/flot/jquery.flot.resize.js"></script>
<script src="res/common/js/flot/jquery.flot.pie.js"></script>
<script src="res/common/js/flot/jquery.flot.symbol.js"></script>
<!-- Peity -->
<script src="res/common/js/peity/jquery.peity.min.js"></script>
<script src="res/common/js/peity/peity-demo.js"></script>
<!-- 提示框 -->
<script src="res/common/js/gritter/jquery.gritter.min.js"></script>
<!-- EayPIE圆形统计 -->
<script src="res/common/js/easypiechart/jquery.easypiechart.js"></script>
<!-- Sparkline -->
<script src="res/common/js/sparkline/jquery.sparkline.min.js"></script>
<script src="res/common/js/sparkline/sparkline-demo.js"></script>
<!-- Custom and plugin javascript -->

<script>
    $(document).ready(function () {
        $('.chart').easyPieChart({
            barColor: '#f8ac59',
            //                scaleColor: false,
            scaleLength: 5,
            lineWidth: 4,
            size: 80
        });

        $('.chart2').easyPieChart({
            barColor: '#1c84c6',
            //                scaleColor: false,
            scaleLength: 5,
            lineWidth: 4,
            size: 80
        });

        var data2 = [
            [gd(2012, 1, 1), 7], [gd(2012, 1, 2), 6], [gd(2012, 1, 3), 4], [gd(2012, 1, 4), 8],
            [gd(2012, 1, 5), 9], [gd(2012, 1, 6), 7], [gd(2012, 1, 7), 5], [gd(2012, 1, 8), 4],
            [gd(2012, 1, 9), 7], [gd(2012, 1, 10), 8], [gd(2012, 1, 11), 9], [gd(2012, 1, 12), 6],
            [gd(2012, 1, 13), 4], [gd(2012, 1, 14), 5], [gd(2012, 1, 15), 11], [gd(2012, 1, 16), 8],
            [gd(2012, 1, 17), 8], [gd(2012, 1, 18), 11], [gd(2012, 1, 19), 11], [gd(2012, 1, 20), 6],
            [gd(2012, 1, 21), 6], [gd(2012, 1, 22), 8], [gd(2012, 1, 23), 11], [gd(2012, 1, 24), 13],
            [gd(2012, 1, 25), 7], [gd(2012, 1, 26), 9], [gd(2012, 1, 27), 9], [gd(2012, 1, 28), 8],
            [gd(2012, 1, 29), 5], [gd(2012, 1, 30), 8], [gd(2012, 1, 31), 25]
        ];

        var data3 = [
            [gd(2012, 1, 1), 800], [gd(2012, 1, 2), 500], [gd(2012, 1, 3), 600], [gd(2012, 1, 4), 700],
            [gd(2012, 1, 5), 500], [gd(2012, 1, 6), 456], [gd(2012, 1, 7), 800], [gd(2012, 1, 8), 589],
            [gd(2012, 1, 9), 467], [gd(2012, 1, 10), 876], [gd(2012, 1, 11), 689], [gd(2012, 1, 12), 700],
            [gd(2012, 1, 13), 500], [gd(2012, 1, 14), 600], [gd(2012, 1, 15), 700], [gd(2012, 1, 16), 786],
            [gd(2012, 1, 17), 345], [gd(2012, 1, 18), 888], [gd(2012, 1, 19), 888], [gd(2012, 1, 20), 888],
            [gd(2012, 1, 21), 987], [gd(2012, 1, 22), 444], [gd(2012, 1, 23), 999], [gd(2012, 1, 24), 567],
            [gd(2012, 1, 25), 786], [gd(2012, 1, 26), 666], [gd(2012, 1, 27), 888], [gd(2012, 1, 28), 900],
            [gd(2012, 1, 29), 178], [gd(2012, 1, 30), 555], [gd(2012, 1, 31), 993]
        ];


        var dataset = [
            {
                label: "订单数",
                data: data3,
                color: "#1ab394",
                bars: {
                    show: true,
                    align: "center",
                    barWidth: 24 * 60 * 60 * 600,
                    lineWidth: 0
                }

            }, {
                label: "付款数",
                data: data2,
                yaxis: 2,
                color: "#464f88",
                lines: {
                    lineWidth: 1,
                    show: true,
                    fill: true,
                    fillColor: {
                        colors: [{
                            opacity: 0.2
                        }, {
                            opacity: 0.2
                        }]
                    }
                },
                splines: {
                    show: false,
                    tension: 0.6,
                    lineWidth: 1,
                    fill: 0.1
                },
            }
        ];


        var options = {
            xaxis: {
                mode: "time",
                tickSize: [3, "day"],
                tickLength: 0,
                axisLabel: "Date",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Arial',
                axisLabelPadding: 10,
                color: "#838383"
            },
            yaxes: [{
                position: "left",
                max: 1070,
                color: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Arial',
                axisLabelPadding: 3
            }, {
                position: "right",
                clolor: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: ' Arial',
                axisLabelPadding: 67
            }
            ],
            legend: {
                noColumns: 1,
                labelBoxBorderColor: "#000000",
                position: "nw"
            },
            grid: {
                hoverable: false,
                borderWidth: 0,
                color: '#838383'
            }
        };

        function gd(year, month, day) {
            return new Date(year, month - 1, day).getTime();
        }

        var previousPoint = null,
                previousLabel = null;

        $.plot($("#flot-dashboard-chart"), dataset, options);

        var mapData = {
            "US": 298,
            "SA": 200,
            "DE": 220,
            "FR": 540,
            "CN": 120,
            "AU": 760,
            "BR": 550,
            "IN": 200,
            "GB": 120,
        };
    });
</script>
</html>