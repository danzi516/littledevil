<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户添加页</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="${webRoot}/res/sys/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/sys/css/style.css" rel="stylesheet">
    <link href="${webRoot}/res/common/js/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="${webRoot}/res/common/js/uniform-master/themes/default/css/uniform.default.css" type="text/css" rel="stylesheet">
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
                <div class="pull-left"> <h5>个人用户添加</h5></div>
                <div class="pull-right"><a href="${webRoot}/admin/userList"  target="mainFrame" class="btn btn-link">返回</a> </div>
            </div>
            <hr/>
            <form class="form-horizontal" id="addUserForm">
                <div class="panel panel-default">
                    <div class="panel-heading">增加个人用户</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">用户名<span style="color:red">*</span>：</label>
                            <div class="col-sm-4">
                                <input type="text" id="userName" name="userName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">（只能用4~20位'0-9'、'a-z'、'A-Z'、'_'以内范围的字符）</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">真实姓名 ：</label>
                            <div class="col-sm-4">
                                <input type="text" id="ucName" name="ucName" class="form-control" maxlength="25">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">密　码 <span style="color:red">*</span>：</label>
                            <div class="col-sm-4">
                                <input type="password" id="password" name="password" class="form-control" placeholder="至少5个字符">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">手机 ：</label>
                            <div class="col-sm-4">
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">用户状态：</label>
                            <div class="col-sm-4">
                                <select name="state" id="state"  class="form-control">
                                    <option value="0">禁用</option>
                                    <option value="1" selected>正常使用</option>
                                    <!-- <option value="2">邮箱未激活</option> -->
                                </select>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">是否为业务员 ：</label>
                            <div class="col-sm-4">
                               <input type="checkbox" name="saleState" value=""  id="saleState" />
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
<!-- 弹出层 -->
<script src="${webRoot}/res/common/js/layer1/layer.js"></script>
<script>
    $(document).ready(function() {
    	//getRoleList();  这里先屏蔽掉  
        //改变复选框与单选框的样式
        $("input[type='radio'],input[type='checkbox']").uniform();
        //initRoleData();
        jQuery.validator.addMethod("phone", function(value, element) {
  		  var length = value.length;
  		  var mobile = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|17[0-9]|170)\d{8}$/;		  
  		  $("#codeButton").attr("disabled","disabled");
  		  return this.optional(element) || (length == 11 && mobile.test(value));
  		 }, "请正确填写您的手机号码");
  	jQuery.validator.addMethod("isuserName", function(value, element,param) {
  		//  var specialstr = /[!,.@#$%^&*?_~]/;
  		//  var numberstr= /^(\d+[a-zA-Z]\w*)|([a-zA-Z]+\d\w*)$/;
  		//  return this.optional(element) && (numberstr.test(value)) && (specialstr.test(value));
  		    var regu1 =/^([a-zA-Z])([a-zA-Z0-9_]){3,19}$/;
  	        var b1=regu1.test(value);
  		    return b1 == eval(param);
  		 }, "请输入用户名，4-20个字符（字母、数字、下划线），注册后不能更改");
      $("#addUserForm").validate({
          rules: {
          	userName: {
          		required: true,
                  isuserName:true,
                  remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: "${webRoot}/user/isExitsByCondition",
                  	data: {
                  		userName: function() {
                  			return $("#userName").val();
                  		}
                  	}
                  }
              },
          	/* phone : {
          	    phone : true,
          	    remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: "${webRoot}/user/isExitsByCondition",
                  	data: {
                  		phone: function() {return $("#phone").val();}
                  	}
                  }
          	 }, */
              password: {
                  required: true,
                  minlength: 5,
                  maxlength:15
              }
          },
          success: function(element) {
          	element.closest('.form-group').removeClass('has-error').addClass('has-success');
  			$("#codeButton").removeAttr("disabled","");
  		},
          messages: {
          	userName: {        		
          		required: "用户名不能为空",
          		isuserName: "请输入用户名，4-20个字符（字母、数字、下划线），注册后不能更改",
          		remote: "用户名已经存在，请换一个"
          	},
          /* 	phone: {        		
          		phone: "请输入正确的手机号",
          		remote: "手机号已经存在，请换一个"
          	}, */
              password: {
                  required: "请输入您的密码",
                  minlength: "密码必须5个字符以上",
                  maxlength: "密码必须小于15个字符"
              }
          },
          onkeyup: function(phone) {$("#phone").valid();},
          submitHandler:function(form){
          	addUser();
          }
      });
  
    });
    
    
    /**
     * 提交注册信息
     */
    function addUser(){
    	$("#addUserForm").validate();
    
    	var password=$("#password").val();
    	var url="${webRoot}/userInfo/insert";
    	var data={
    			ucName:$("#ucName").val(),
    			user:{
    				userName:$("#userName").val(),
	    			phone:$("#phone").val(),
	    			password:password,
	    			state:$("#state").val(),
	    			userType:'person'
    			},
    				saleState:$("#saleState").is(':checked')?1:0
    	};
    	ajaxAction('post',url,$.toJSON(data),'json','addUser');
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
    			if (requestName == "addUser"){
    				var code=data.code;
    				if(code=='0'){
    					alert('添加成功！');
    					window.open("${webRoot}/admin/userList", "mainFrame");
    				}else if(code=='1'){
    					alert('服务器异常，请稍后重试！');
    				}	
    			}
    		}
    	});
    }
</script>
</html>