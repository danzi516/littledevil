<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>**商店管理中心</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="${webRoot}/res/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
    <script type="text/javascript" src="https://www.wegene.com/static/js/respond.js"></script>
    <![endif]-->
</head>
<body>
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
                
                <li><a href="#">收银／记帐</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">店铺管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#companyCommodityList" data-toggle="tab">我的商品</a></li>
                        <li><a href="#commodityCategoryList" data-toggle="tab">商品分类</a></li>
                        <li><a href="#companyPromotionList" data-toggle="tab">促销活动管理</a></li>
                        <li><a href="#">店铺设置</a></li>
                        <li><a href="#companyContract" data-toggle="tab">合同</a></li>
                    </ul>
                </li>
                <li><a href="#companyMemberList" data-toggle="tab">我的会员 ／ 会员类型管理</a></li>
                <li><a href="#">我的文章</a></li>
                <li><a href="#">统计分析</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">帐号设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#basicInfo" data-toggle="tab">基本信息</a></li>
                        <li><a href="#">帐户安全设置</a></li>
                        <li><a href="#">修改密码</a></li>
                        <li><a href="#">申请成为业务员</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
            <div id="myTabContent" class="tab-content">
	<div style="height:500px" class="tab-pane fade" id="companyCommodityList">
	<iframe  src="${webRoot}/store/companyCommodityList/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="companyMemberList">
	<iframe  src="${webRoot}/store/companyMemberList/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="commodityCategoryList">
	<iframe  src="${webRoot}/store/commodityCategoryList/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:500px" class="tab-pane fade" id="companyContract">
	<iframe  src="${webRoot}/store/companyContract/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:800px" class="tab-pane fade" id="basicInfo">
	<iframe  src="${webRoot}/store/basicInfo/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
	<div style="height:800px" class="tab-pane fade" id="companyPromotionList">
	<iframe  src="${webRoot}/store/companyPromotionList/${userId}" class="frame_class" name="mainFrame" frameborder="0"></iframe>
	</div>
</div>
    </div><!-- /.container-fluid -->
</nav>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</html>