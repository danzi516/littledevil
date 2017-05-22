<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户设置</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="${webRoot}/res/sys/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/sys/css/animated.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
    <script type="text/javascript" src="https://www.wegene.com/static/js/respond.js"></script>
    <![endif]-->
</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default panel-row">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-2">商店名称</div>
                        <div class="col-lg-1">创建会员时间</div>
                        <div class="col-lg-1">剩余金额</div>
                        <div class="col-lg-3">剩余项目</div>
                        <div class="col-lg-3">最后一次消费</div>
                        <div class="col-lg-1">总消费</div>
                        <div class="col-lg-1">操作</div>
                    </div>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-lg-2">美甲皇后</div>
                            <div class="col-lg-1">2017-10-08</div>
                            <div class="col-lg-1">0</div>
                            <div class="col-lg-3">美甲（10）、纹眉（1）</div>
                            <div class="col-lg-3">美甲2017-10-08</div>
                            <div class="col-lg-1">2000.00</div>
                            <div class="col-lg-1"><a href="#">查看</a> </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</html>