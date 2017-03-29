<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商户</title>
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
                <div class="pull-right"><a href="member_main.html" class="btn btn-link">返回用户管理</a> </div>
            </div>
            <hr/>
            <form class="form-horizontal" method="post" id="addCompanyForm">
                <div class="panel panel-default">
                    <div class="panel-heading">增加商户</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">用户名：</label>
                            <div class="col-sm-4">
                                <input type="text" id="userName" name="userName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">（只能用'0-9'、'a-z'、'A-Z'、'.'、'@'、'_'、'-'、'!'以内范围的字符）</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">密　码 ：</label>
                            <div class="col-sm-4">
                                <input type="password" id="password" name="password" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">（5-15以内范围的字符）</p>
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label for="" class="col-sm-2 control-label">性别 ：</label>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 保密
                                </label>
                            </div>
                        </div> -->
                        <!-- <div class="form-group">
                            <label for="" class="col-sm-2 control-label">用户类型 ：</label>
                            <div class="col-sm-3">
                                <select class="form-control">
                                    <option>个人</option>
                                    <option>学校</option>
                                    <option>教育厅</option>
                                    <option>教育局</option>
                                    <option>教育部</option>
                                </select>
                            </div>
                        </div> -->
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商户名：</label>
                            <div class="col-sm-4">
                                <input type="text" id="companyName" name="companyName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">请填写机构全称</p>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">联系人：</label>
                            <div class="col-sm-4">
                                <input type="text" id="linkPerson" name="linkPerson" class="form-control" placeholder="">
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
                            <label for="" class="col-sm-2 control-label">图片logo ：</label>
                            <div class="col-sm-4">
                                <input size="1" name="file" type="file" class="filePrew" id="defaultIconUpload" 
                                onchange="return ajaxUpload('defaultIconUpload','defaultIconImg','defaultIcon');"/>
                            </div>
                            <img width="150" height="150" src="" id="defaultIconImg">
                            <input type="hidden" maxlength="20" class="" id="defaultIcon" name="cover">
                        </div>
                        <!-- <div class="form-group">
                            <label for="" class="col-sm-2 control-label">合同编号：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static">线下合同编号</p>
                            </div>
                        </div> -->
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">所属区域：</label>
                            <div class="col-sm-6">
                                <select>
                                    <option value="-10">湖北省</option>
                                </select>
                                <select>
                                    <option value="-10">天门市</option>
                                </select>
                                <select>
                                    <option value="-10">多宝镇</option>
                                </select>
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label for="" class="col-sm-2 control-label">所属机构：</label>
                            <div class="col-sm-6">
                                <select>
                                    <option value="-10">部</option>
                                    <option value="-10">厅</option>
                                    <option value="-10">局</option>
                                </select>
                                </select>
                            </div>
                        </div> -->
                        <!-- <div class="form-group">
                            <label for="" class="col-sm-2 control-label">电子邮箱 ：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" placeholder="">
                            </div>
                        </div> -->
                        
                      <!--   <div class="form-group">
                            <label for="" class="col-sm-2 control-label">资料状态 ：</label>
                            <div class="col-sm-4">
                                <select name="spacesta" class="form-control">
                                    <option value="-10">等待验证邮件</option>
                                    <option value="-2">限制用户(禁言)</option>
                                    <option value="-1">未通过审核</option>
                                    <option placeholder="" selected="">审核通过，提示填写完整信息</option>
                                    <option value="1">没填写详细资料</option>
                                    <option value="2">正常使用状态</option>
                                </select>
                            </div>
                        </div> -->
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
<script src="${webRoot}/res/common/js/ajaxfileupload.js"></script>

  <script>
  $(document).ready(function() {
  	//getRoleList();
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
    $("#addCompanyForm").validate({
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
        	 },
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
        	phone: {        		
        		phone: "请输入正确的手机号",
        		remote: "手机号已经存在，请换一个"
        	},
            password: {
                required: "请输入您的密码",
                minlength: "密码必须5个字符以上",
                maxlength: "密码必须小于15个字符"
            }
        },
        onkeyup: function(phone) {$("#phone").valid();},
        submitHandler:function(form){
        	addCompany();
        }
    });

  });
  
  
  /**
   * 提交注册信息
   */
  function addCompany(){
  	$("#addCompanyForm").validate();
  	var password=$("#password").val();
  	var url="${webRoot}/companyInfo/insert";
  	var data={
  			companyName:$("#companyName").val(),
  			linkPerson:$("#linkPerson").val(),
  			linkPhone:$("#phone").val(),
  			user:{
  				userName:$("#userName").val(),
	    			phone:$("#phone").val(),
	    			password:password,
	    			state:$("#state").val(),
	    			userType:'company'
  			}
  	};
  	ajaxAction('post',url,$.toJSON(data),'json','addCompany');
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
  			if (requestName == "addCompany"){
  				var code=data.code;
  				if(code=='0'){
  					alert('添加成功！');
  					window.open("${webRoot}/companyInfo/toCompanyList", "mainFrame");
  				}else if(code=='1'){
  					alert('服务器异常，请稍后重试！');
  				}	
  			}
  		}
  	});
  }
  
  function ajaxUpload(id, imgId, hiddId)
  {
  	var content = document.getElementById(id).value;
  	if (content.length == '') {
  		alert("请选择图片!");
  		return false;
  	}
  	var url = "${webRoot}/upload";
  	jQuery.ajaxFileUpload({
  		url : url, // 你处理上传文件的服务端
  		secureuri : false,
  		fileElementId : id,
  		dataType : 'json',
  		folder:'photo',  //存放子文件夹名称
  		success : function(data,status) {
  						$("#" + imgId).attr("src", "${webRoot}/"+data.tempShowDir);
  						$("#" + hiddId).val("${webRoot}/"+data.tempShowDir);
  					},
  					error : function(data, status, e) {
  						alert("上传图片失败!");
  					}
  				});

  		return false;
  	}
  </script>
</html>
