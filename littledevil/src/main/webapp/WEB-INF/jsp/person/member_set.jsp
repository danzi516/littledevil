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
    <div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">帐号设置</div>
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item active">基本信息</li>
                <li class="list-group-item">帐户安全设置</li>
                <li class="list-group-item">修改密码</li>
                <li class="list-group-item">申请成为业务员</li>
            </ul>
        </div>
    </div>
    <div class="col-lg-9">
        <h5>基本信息</h5>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="ucName" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="sex" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">头像</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="logo" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">微信号</label>
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" id="weixin" placeholder="Recipient's username" aria-describedby="basic-addon2">
                        <span class="input-group-addon" id="">选择</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="" class="col-sm-2 control-label">个人描述</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3" id="sign"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" onclick="updateUser();">确定上传</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<script src="${webRoot}/res/common/js/jquery.json-2.4.js"></script>
<script>
$(document).ready(function() {
	//alert('${userInfo.ucName}');
	$("#ucName").val("${userInfo.ucName}");
	$("#logo").val("${userInfo.logo}");
	$("#weixin").val("${userInfo.weixin}");
	$("#sex").val("${userInfo.sex}");
	$("#sign").val("${userInfo.sign}");
});
function updateUser(){
	var url="${webRoot}/person/update";
	var data={
			id:'${userId}',
			ucName:$("#ucName").val(),
			logo:$("#logo").val(),
			weixin:$("#weixin").val(),
			sex:$("#sex").val(),
			sign:$("#sign").val()
	};
	ajaxAction('post',url,$.toJSON(data),'json','updateUser');
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
			if (requestName == "updateUser"){
				var code=data.code;
				if(code=='0'){
					alert('成功！');
				}else if(code=='1'){
					alert('服务器异常，请稍后重试！');
				}	
			}
		}
	});
}
</script>
</html>