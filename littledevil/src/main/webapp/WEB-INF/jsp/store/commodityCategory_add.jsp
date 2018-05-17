<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加分类</title>
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
            <form class="form-horizontal" method="post" id="addCompanyCommodityForm">
                <div class="panel panel-default">
                    <div class="panel-heading">增加商品</div>
                    <div class="panel-body">
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商品名称</label>
                            <div class="col-sm-4">
                                <input type="text" id="commodityName" name="commodityName" class="form-control" placeholder="">
                            </div>
                            <div class="col-sm-6">
                                <p class="form-control-static"></p>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商品价格</label>
                            <div class="col-sm-4">
                                <input type="text" id="commodityPrice" name="commodityPrice" class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商品简介</label>
                            <div class="col-sm-4">
                                <input type="text" id="commodityNote" name="commodityNote" class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">商品图标</label>
                            <div class="col-sm-4">
                                <input type="text" id="commodityLogo" name="commodityLogo" class="form-control" placeholder="">
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
      $("#addCompanyCommodityForm").validate({
          submitHandler:function(form){
        	  addCompanyCommodity();
          }
      });
  });
  
  /**
   * 提交注册信息
   */
  function addCompanyCommodity(){
  	$("#addCompanyCommodityForm").validate();
  	var url="${webRoot}/companyCommodity/insert";
  	var data={
  			companyId:'${userId}',
  			commodityName:$("#commodityName").val(),
  			commodityPrice:$("#commodityPrice").val(),
  			commodityNote:$("#commodityNote").val(),
  			commodityLogo:$("#commodityLogo").val(),
  			state:"1"
  				};
  	ajaxAction('post',url,$.toJSON(data),'json','addCompanyCommodity');
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
  			if (requestName == "addCompanyCommodity"){
  				var code=data.code;
  				if(code=='0'){
  					alert('添加成功！');
  					window.open("${webRoot}/companyCommodity/toCompanyCommodityList", "mainFrame");
  				}else if(code=='1'){
  					alert('服务器异常，请稍后重试！');
  				}	
  			}
  		}
  	});
  }
  </script>
</html>