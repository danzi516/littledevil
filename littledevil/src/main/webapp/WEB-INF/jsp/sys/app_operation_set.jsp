<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>应用设置</title>
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
                <div class="pull-left"> <h5>应用设置</h5></div>
                <div class="pull-right"><a href="javascript:void(0)" onclick="window.history.back();" class="btn btn-link">返回</a> </div>
            </div>
            <hr/>
            <form class="form-horizontal" id="editAppForm">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    	<div class="panel-title">
         					应用权限功能设置
         					<button type="button" class="btn btn-default" style="float:right;margin-top:-5px" data-itme="add" onclick="addOperation()">新增功能</button>
      					</div>
                   	</div>
                     <div class="panel-body operationList" id="operationList">
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
       	<h4 class="modal-title">添加操作</h4>
      </div>
      	<div class="modal-body text-left">
 			<form class="form-horizontal" id="operationAdd" name="operationAdd" role="form">			
  				<div class="form-group">
    				<label class="col-sm-2 control-label">操作名称：</label>
    					<div class="col-sm-10"> 
							<input name="operationName" id="operationName" />
					   </div>
  			  </div>
  				<div class="form-group">
    				<label class="col-sm-2 control-label">操作编码：</label>
    					<div class="col-sm-10">
    						<input name="operationCode" id="operationCode"/>
					   </div>
  			  </div>
  			  <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary" id="addBtn">确认添加</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                            </div>
                        </div>
		  </form>
  		</div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->   
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
var appId='${appId}';
    $(document).ready(function() {
        //改变复选框与单选框的样式
      /*   getAppReTypeList();
        getBackstageGroupList();
        getReceptionGroupList();
        getAppGroupList();*/
        getAppOperationList(); 
      // validate signup form on keyup and submit
      $("#operationAdd").validate({
          rules: {
          	operationName: {
          		required: true,
                  remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: "${webRoot}/appOperation/isExitsByCondition",
                  	data: {
                  		operate: function() {
                  			return $("#operationName").val();
                  		},
                  		appId:appId
                  	}
                  }
              },
          	operationCode: {
                  required: true,
                  remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: "${webRoot}/appOperation/isExitsByCondition",
                  	data: {
                  		code: function() {
                  			return $("#operationCode").val();
                  		},
                  		appId:appId
                  	}
                  }
              }
          },
          success: function(element) {
          	element.closest('.form-group').removeClass('has-error').addClass('has-success');
  			$("#codeButton").removeAttr("disabled","");
  		},
          messages: {
          	operationName: {        		
          		required: "操作名称不能为空！",
          		remote: "操作已经存在，请重新输入！"
          	},
          	operationCode: {        		
          		required: "操作编码不能为空！",
          		remote: "操作编码已经存在，请重新输入！"
          	}
          },
          submitHandler:function(form){
          	saveOperation();
          }
      });
    });
    function addOperation(){
    	$("#operationName").val("");
 		$("#operationCode").val("");
 		$("#operationAdd").validate().resetForm();
    	$('#myModal').modal('show');
     }
     
     function saveOperation(){
     	$("#operationAdd").validate();
     	var url="${webRoot}/appOperation/insert";
     	var data={
     		appId:appId,
     		operationName:$("#operationName").val(),
     		operationCode:$("#operationCode").val()
     	};
     	ajaxAction('post',url,$.toJSON(data),'json','saveOperation');
     }
     
      //删除权限操作：
     function removeOperation(id){
    	var url="${webRoot}/appOperation/delete/"+id;
    	if(confirm("您确定删除吗?")){
    		ajaxAction('get',url,"",'json','removeOperation');
    	}
     }
    
    
    function getAppOperationList(){
    	var url="${webRoot}/appOperation/selectByAppId/"+appId;
    	ajaxAction('get',url,"",'json','getAppOperationList');
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
    			if (requestName == "getAppOperationList"){
    				var code=data.code;
    				if(code=='0'){
    					var list=data.list;
    					$("#operationList").empty();
    					if(list==null||list.length==0){
    						$("#operationList").html('<h4>没有操作信息！</h4>');
    						return;
    					}
    					for(var i=0;i<list.length;i++){
    						var html="<div class='form-group'>"
    						+"<label for='' class='col-sm-2 control-label'>操作名称：</label><div class='col-sm-2'><div class='input-group'>"
    						+"<p  name='operationName' class='form-control' data-id=''>"+list[i].operationName+"</p>"
    						+"</div></div><label for='' class='col-sm-2 control-label'>操作编码：</label><div class='col-sm-2'><div class='input-group'>"
    						+"<p  name='operationCode' class='form-control' data-id='' placeholder='操作编码'>"+list[i].operationCode+"</p>"
    						+"</div></div><div class='col-sm-2'><button type='button' class='btn btn-default' data-itme='add' "
    						+"onclick=removeOperation('"+list[i].id+"')>删除</button></div></div>";
    						$("#operationList").append(html);
    					}
    				}else if(code=='1'){
    					alert('服务器异常，请稍后重试！');
    				}	
    			}else if (requestName == "removeOperation"){
    				var code=data.code;
    				if(code=='0'){
    					alert("删除成功！");
    					getAppOperationList();
    				}else if(code=='1'){
    					alert('服务器异常，请稍后重试！');
    				}	
    			}else if (requestName == "saveOperation"){
    				var code=data.code;
    				if(code=='0'){
    					alert("添加成功！");
    					getAppOperationList();
    				}else if(code=='1'){
    					alert('服务器异常，请稍后重试！');
    				}
    				$('#myModal').modal('hide');
    			}
    		}
    	});
    }
</script>
</html>