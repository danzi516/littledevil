<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>消费</title>
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
                <div class="pull-right"><a href="member_main.html" class="btn btn-link">返回</a> </div>
            </div>
            <hr/>
            <form class="form-horizontal" method="post" id="addMemberConsumeForm">
                <div class="panel panel-default">
                    <div class="panel-heading">添加消费</div>
                    <div class="panel-body">
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-4">
                                <input type="text" id="ucName" name="ucName" class="form-control" placeholder="" disabled="disabled">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">手机 ：</label>
                            <div class="col-sm-4">
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="" disabled="disabled">
                            </div>
                        </div>
                          <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商品 ：</label>
                            <div class="col-sm-4 " id="priceDiv">
                            <div style="float:left">
                            <input type="radio" name="price" value="" checked="checked" id=0 />  
                            </div> 
                            <div style="float:left">其他：</div>
                            <div style="float:left">
                            <input type="text" name="priceOther" id="priceOther" value="" />
                            </div>
                            <div style="width:50px;height:10px;"></div>
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
	 // alert('${userId}');
	//改变复选框与单选框的样式
      $("input[type='radio'],input[type='checkbox']").uniform();
      //initRoleData();
      $("#ucName").val("${userInfo.ucName}");
      $("#phone").val("${user.phone}");
      var companyCommodity = ${companyCommodity};
      for (var i=0;i<companyCommodity.length;i++){
    	  $("#priceDiv").append("<br><br><input type='radio' name='price' id='"+companyCommodity[i].id+"' value='"+companyCommodity[i].commodityPrice+"'  />"+companyCommodity[i].commodityName+"价格："+companyCommodity[i].commodityPrice);
      }
      $("#addMemberConsumeForm").validate({
    	  submitHandler:function(form){
    		  addMemberConsume();
          } 
      });
  });
  
  /**
   * 提交注册信息
   */
  function addMemberConsume(){
  	$("#addMemberConsumeForm").validate();
  	var url="${webRoot}/memberConsume/insert";
  	var consumeCash=$("input[name='price']:checked").val();
  	if(!consumeCash){
  		consumeCash = $("#priceOther").val();
  	};
  	 var data={
  			companyId:"${companyMember.companyId}",
  			companyMemberId:"${companyMember.id}",
  			consumeCash:consumeCash,
  			payCash:0,
  			commodityId:$("input[name='price']:checked").attr("id"),
  			isDelete:'0',
  			userId:"${companyMember.userId}"
  				}
  	ajaxAction('post',url,$.toJSON(data),'json','addCompanyMember');
  }
  
  function getCompanyCommodityList(){
	  
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
  					window.open("${webRoot}/companyMember/toCompanyMemberList", "mainFrame");
  				}else if(code=='1'){
  					alert('服务器异常，请稍后重试！');
  				}	
  			}
  			if (requestName == "getCompanyCommodityList"){
  				
  			}
  		}
  	});
  }
  </script>
</html>