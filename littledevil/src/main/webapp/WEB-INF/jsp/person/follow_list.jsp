<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>我关注的商店</title>
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
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">个人中心 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">我的商店</a></li>
                <li><a href="#">我的业绩（业务员）</a></li>
                <li><a href="#">我的工作（店员）</a></li>
                <li><a href="#">我的关注</a></li>
                <li><a href="#">我的收藏</a></li>
                <li><a href="#">我的记录</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">帐号设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">基本信息</a></li>
                        <li><a href="#">帐户安全设置</a></li>
                        <li><a href="#">修改密码</a></li>
                        <li><a href="#">申请成为业务员</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">关注的商店</a></li>
                <li role="presentation"><a href="#">关注的商品</a></li>
            </ul>
            <p></p>
            <div class="panel panel-default panel-row">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-4">商店名称</div>
                        <div class="col-lg-4">关注时间</div>
                        <div class="col-lg-4">商品总数</div>
                    </div>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-lg-4">美甲皇后</div>
                            <div class="col-lg-4">2017-10-08</div>
                            <div class="col-lg-4">80</div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="panel panel-default panel-row">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-6">商品名称</div>
                        <div class="col-lg-6">关注时间</div>
                    </div>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-lg-6">美甲皇后</div>
                            <div class="col-lg-6">2017-10-08</div>
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
<script src="${webRoot}/res/common/js/jquery.json-2.4.js"></script>
<script>
$(document).ready(function() {
	getCompanyNumberbyUserid('${userId}');
});

function getCompanyNumberbyUserid(id){
	var url="${webRoot}/person/getCompanyNumberbyUserid/"+id;
	var data={
	};
	ajaxAction('get',url,$.toJSON(data),'json','getCompanyNumberbyUserid');
}
//ajax请求
function ajaxAction(type, url, reqData, returnType, requestName) {
	$.ajax({
		type : type,
		url : url,
		data : reqData,
		async : false,
		dataType : returnType,
		contentType : 'application/json',
		success : function(data) {
			if (requestName == "getCompanyNumberbyUserid"){
				var code=data.code;
				if(code=='0'){
					for(var i=0;i<data.userFollowlist.length;i++){
						alert("我关注的店有"+data.userFollowlist[i].companyInfo.companyName);
					}
					
					//alert('成功！');
				}else if(code=='1'){
					alert('服务器异常，请稍后重试！');
				}	
			}
		}
	});
}
</script>
</html>