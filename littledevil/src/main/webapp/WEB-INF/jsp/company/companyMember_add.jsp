<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会员</title>
    <%@ include file="../common/meta.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<link href="${webRoot}/res/sys/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/sys/css/style.css" rel="stylesheet">
  </head>
<body>
    <div class="console-container">
    <div class="row">
        <div class="col-sm-12">
            <div class="console-title clearfix">
                <div class="pull-left"> <h5>首页</h5></div>
               <div class="pull-right"><a href="javascript:history.back(-1)" class="btn btn-link">返回</a> </div>
            </div>
            <hr/>
            <form class="form-horizontal" method="post" id="addCompanyMemberForm">
                <div class="panel panel-default">
                    <div class="panel-heading">增加会员</div>
                    <div class="panel-body">
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-4">
                                <input type="text" id="ucName" name="ucName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">手机 ：</label>
                            <div class="col-sm-4">
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary" id="addBtn">确认添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
  </body>
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
	//改变复选框与单选框的样式
      $("input[type='radio'],input[type='checkbox']").uniform();
      //initRoleData();
      jQuery.validator.addMethod("phone", function(value, element) {
		  var length = value.length;
		  var mobile = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|17[0-9]|170)\d{8}$/;		  
		  $("#codeButton").attr("disabled","disabled");
		  return this.optional(element) || (length == 11 && mobile.test(value));
		 }, "请正确填写您的手机号码");
      $("#addCompanyMemberForm").validate({
          rules: {
          	phone : {
          	   phone : true,
          	   remote: {
                 	type: "get",
                 	dataType: "json",
                 	url: "${webRoot}/user/isExitsByCondition",
                 	data: {
                 		phone: function() {return $("#phone").val();}
                 	}
                 }
          	 }
          },
          success: function(element) {
          	element.closest('.form-group').removeClass('has-error').addClass('has-success');
  			$("#codeButton").removeAttr("disabled","");
  		},
          messages: {
          	phone: {        		
          		phone: "请输入正确的手机号"
          	}
          },
          onkeyup: function(phone) {$("#phone").valid();},
          submitHandler:function(form){
        	  addCompanyMember();
          }
      });
  });
  
  /**
   * 提交注册信息
   */
  function addCompanyMember(){
  	$("#addCompanyMemberForm").validate();
  	var url="${webRoot}/companyMember/insert";
  	var data={
  			companyId:'${companyId}',
  			isDelete:'1',
  			user:{phone:$("#phone").val(),
  				userType:'person'},
  			userInfo:{ucName:$("#ucName").val()}
  	};
  	ajaxAction('post',url,$.toJSON(data),'json','addCompanyMember');
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
  			if (requestName == "addCompanyMember"){
  				var code=data.code;
  				if(code=='0'){
  					alert('添加成功！');
  					/* window.open("${webRoot}/companyMember/toCompanyMemberList", "mainFrame"); */
  					history.back();
  				}else if(code=='1'){
  					alert('服务器异常，请稍后重试！');
  				}
  				else{
  					alert('已经存在！');
  				}
  			}
  		}
  	});
  }
  </script>
</html>