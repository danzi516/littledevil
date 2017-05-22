<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>小鬼头首页</title>
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
<body >
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">小鬼头</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav nav-tabs">
                <%-- <li class="active"><a href="${webRoot}/admin/main">首页<span class="sr-only">(current)</span></a></li>
                <li><a href="#">美甲商店</a></li>
                <li><a href="#">美甲商品</a></li>
                <li><a href="#">促销活动</a></li>
                <li><a href="#">美甲文章</a></li> --%>
                <li class="active">
				<a href="#home" data-toggle="tab">首页</a>
				</li>
				<li><a href="#storeList" data-toggle="tab">美甲商店</a></li>
				<li><a href="#goodsList" data-toggle="tab">美甲商品</a></li>
				<li><a href="#salesList" data-toggle="tab">促销活动</a></li>
				<li><a href="#articleList" data-toggle="tab">美甲文章</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        商店 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">商品</a></li>
                        <li><a href="#">促销活动</a></li>
                    </ul>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="商店/商品/促销活动">
                </div>
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i> </button>
                <button type="button" class="btn btn-info" onclick="javascript:window.location.href='login'">登录</button>
                <button type="button" class="btn btn-link">注册</button>
            </form>
        </div><!-- /.navbar-collapse -->
        <%--  <div class="main-content">
        <iframe src="${webRoot}/admin/main" class="frame_class" name="mainFrame" frameborder="0"></iframe>
    </div> --%>
    <div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
	 首页
	</div>
	<div style="height:500px" class="tab-pane fade" id="storeList">
		<iframe  src="${webRoot}/module/storeList" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="goodsList">
		<iframe  src="${webRoot}/module/goodsList" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="salesList">
		<iframe  src="${webRoot}/module/salesList" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="articleList">
		<iframe  src="${webRoot}/module/articleList" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
</div>
    
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="container">
        <div>
            <a href="javascript:;">平台介绍</a> <a href="javascript:;">联系我们</a>
            <a href="javascript:;">帮助中心</a> <a href="javascript:;">帮助中心</a>
            <a href="javascript:;">不良信息举报</a><a href="javascript:;">申请成为业务员</a>
        </div>
    </div>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</html>