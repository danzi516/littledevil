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
                <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <div class="panel">
                <div class="panel-body">
                    <ul class="nav nav-tabs nav-justified">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">微信登录</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">帐号登录</a></li>
                    </ul>
                    <p></p>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="thumbnail">
                                <img src="${webRoot}/res/images/a1.jpg" alt="...">
                            </div>
                            <div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                使用微信扫一扫进行登录
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <form>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" id=""><i class="fa fa-user"></i> </span>
                                        <input type="text" name="userName" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" id=""><i class="fa fa-paste"></i></span>
                                        <input type="text" name="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1">
                                    </div>
                                </div>

                                <div class="form-group">
                                <button type="button" class="btn btn-default btn-block" onclick="login()">登录</button>
                                </div>
                            </form>
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
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="${webRoot}/res/common/js/vendor/holder.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${webRoot}/res/common/js/ie10-viewport-bug-workaround.js"></script>
<script src="${webRoot}/res/common/js/browser.js" type="text/javascript"></script>
<script type="text/javascript">
//回车登录响应
 function clickToLogin(event){
	 if(event.keyCode == 13){
		 login();
	 }
 }
 
function login(){
	var userName=$("input[name='userName']").val();
	var password=$("input[name='password']").val();
	if(userName==null||$.trim(userName)==''){
		alert("请输入用户名！");
		return;
	}
	if(password==null||$.trim(password)==''){
		alert("请输入密码！");
		return;
	}
	var url="${webRoot}/user/login";
	var data={
		"userName":userName,
		"password":password
	}
	ajaxAction("get", url, data, "json", "login");
}
	//ajax请求
function ajaxAction(type, url, reqData, returnType, requestName) {
	$.ajax({
		type : type,
		url : url,
		data : reqData,
		async : false,
		dataType : returnType,
		success : function(data) {
			if (requestName == "login"){
				var msg=data.msg;
				var userType=data.userType;
				if(msg=='ok'){
					if(userType=='company'){
						window.location.href='${webRoot}/companyMember/index';
					}
					else if(userType=='person'){
						window.location.href='${webRoot}/person/index';
					}
					else{
						alert("暂不支持个人登录！！！！")
					} 
				}else{
					alert(msg);
				}
				
			}
		}
	});
}
</script>
</html>