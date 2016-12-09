<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>小鬼头</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="${webRoot}/res/sys/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/sys/css/animated.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="loginbg">
<!--[if (gte IE 6)&(lte IE 9)]>

<![endif]-->


<nav class="navbar navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <!--   <span class="sr-only">亿佳管理系统</span> -->
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;">欢迎小鬼头服务</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">网站主页</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="account-container animated fadeInDown">

    <div class="content clearfix loginBox">
        <h4><span class="text-primary">用户登录</span> <small>使用您的魔王账号登录</small></h4>

        <hr/>
        <form action="" method="post" />
        <div class="form-group">
            <label for="">用户名</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" name="userName" class="form-control" placeholder="用户名" aria-describedby="basic-addon1" onkeydown = "clickToLogin(event)">
            </div>
        </div>
        <div class="form-group">
            <label for="">密码</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1" onkeydown = "clickToLogin(event)">
            </div>
        </div>
        <button type="button" class="btn btn-primary btn-block" onclick="login()">登录</button>
        </form>
    </div> 

</div>
<!--  /account-container -->

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
					if(userType=='sys'){
						window.location.href='${webRoot}/admin/userList';
					}
					else{
						window.location.href='${webRoot}/person/userList';
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