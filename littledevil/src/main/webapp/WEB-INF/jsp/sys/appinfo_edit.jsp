<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改应用</title>
    <link href="${webRoot}/res/sys/less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="${webRoot}/res/common/js/less.js"></script><!-- 
    <link href="css/Nstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet"> -->
    <link href="${webRoot}/res/common/js/bootstrap_table/bootstrap-table.css" rel="stylesheet">
    <link rel="stylesheet" href="${webRoot}/res/common/js/bootstrap_table/bootstrap-editable.css">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="console-container">
    <div class="row">
        <div class="col-sm-12">
            <div class="console-title clearfix">
                <div class="pull-left"><a href="javascript:" class="btn btn-default">修改应用</a> </div>
            </div>
            <hr/>
	 <div id="toolbar">
    </div>
     <form class="form-horizontal" method="post" id="addAppInfoForm">
                <div class="panel panel-default">
                    <div class="panel-heading">修改应用</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">应用名：</label>
                            <div class="col-sm-4">
                                <input type="text" id="appName" name="appName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">（只能用'0-9'、'a-z'、'A-Z'、'.'、'@'、'_'、'-'、'!'以内范围的字符）</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">访问地址：</label>
                            <div class="col-sm-4">
                                <input type="text" id="requestUrl" name="requestUrl" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">（5-15以内范围的字符）</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">应用编码：</label>
                            <div class="col-sm-4">
                                <input type="text" id="appCode" name="appCode" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">图标：</label>
                            <div class="col-sm-4">
                                <input type="text" id="appLogo" name="appLogo" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">排序号：</label>
                            <div class="col-sm-4">
                                <input type="text" id="appSort" name="appSort" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">是否付费：</label>
                            <div class="col-sm-4">
                                <input type="text" id="isPay" name="isPay" class="form-control" placeholder="">
                            </div>
                             <div class="col-sm-6">
                                <p class="form-control-static">0免费；1付费</p>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">状态：</label>
                            <div class="col-sm-4">
                                <input type="text" id="state" name="state" class="form-control" placeholder="">
                            </div>
                             <div class="col-sm-6">
                                <p class="form-control-static">0下架；1上架</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary" id="addAppInfo">确认添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- 放在文件的末端，使页面加载速度更快 -->
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<!-- 只是为了让我们的占位符图像工作。不要实际复制下一行！ -->
<script src="${webRoot}/res/common/js/vendor/holder.js"></script>
<!-- IE10视口黑客的表面/桌面Windows 8的bug --> 
<script src="${webRoot}/res/common/js/ie10-viewport-bug-workaround.js"></script>
<script src="${webRoot}/res/common/js/browser.js" type="text/javascript"></script>
<!-- 复选框，单选框，下拉选框美化 -->
<script src="${webRoot}/res/common/js/uniform-master/jquery.uniform.js"></script>
<script src="${webRoot}/res/common/js/validate/jquery.validate.min.js"></script>
<script src="${webRoot}/res/common/js/validate/messages_zh.min.js"></script>
<script src="${webRoot}/res/common/js/jquery.json-2.4.js"></script>
<script>
$(document).ready(function() {
  	//getRoleList();
      //改变复选框与单选框的样式
      //$("input[type='radio'],input[type='checkbox']").uniform();
      //initRoleData();
	jQuery.validator.addMethod("appName", function(value, element,param) {
		//  var specialstr = /[!,.@#$%^&*?_~]/;
		//  var numberstr= /^(\d+[a-zA-Z]\w*)|([a-zA-Z]+\d\w*)$/;
		//  return this.optional(element) && (numberstr.test(value)) && (specialstr.test(value));
		    var regu1 =/^([a-zA-Z])([a-zA-Z0-9_]){3,19}$/;
	        var b1=regu1.test(value);
		    return b1 == eval(param);
		 }, "请输入用户名，4-20个字符（字母、数字、下划线），注册后不能更改");
	$("#addAppInfoForm").validate({
		submitHandler:function(form){
			addAppInfo();
        }
	});
		$("#appName").val("${appInfo.appName}");
		$("#appCode").val("${appInfo.appCode}");
		$("#requestUrl").val("${appInfo.requestUrl}");
		$("#appLogo").val("${appInfo.appLogo}");
		$("#appSort").val("${appInfo.appSort}");
		$("#isPay").val("${appInfo.isPay}");
		$("#state").val("${appInfo.state}");
  });
  
  
  /**
   * 提交注册信息
   */
  function addAppInfo(){
  	$("#addAppInfoForm").validate();
  	var url="${webRoot}/appInfo/update";
  	var data={
  			id:"${appInfo.id}",
  			appName:$("#appName").val(),
  			appCode:$("#appCode").val(),
  			requestUrl:$("#requestUrl").val(),
  			appLogo:$("#appLogo").val(),
  			appSort:$("#appSort").val(),
  			isPay:$("#isPay").val(),
  			state:$("#state").val()
  	};
  	ajaxAction('post',url,$.toJSON(data),'json','addAppInfo');
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
  			if (requestName == "addAppInfo"){
  				var code=data.code;
  				if(code=='0'){
  					alert('添加成功！');
  					window.open("${webRoot}/appInfo/toAppInfoList", "mainFrame");
  				}else if(code=='1'){
  					alert('服务器异常，请稍后重试！');
  				}	
  			}
  		}
  	});
  }
</script>
</html>