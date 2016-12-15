<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>应用管理</title>
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
                <div class="pull-left"><a href="javascript:" class="btn btn-default">应用管理</a> </div>
            </div>
            <hr/>
	 <div id="toolbar">
        <div class="pull-left"><a href="${webRoot}/appInfo/toAddAppInfo" role="button" class="btn btn-primary add" target="mainFrame" title="GRYHGL_insert" style="display: block">添加应用</a></div>&nbsp;&nbsp;&nbsp;&nbsp; 
        <div style="display: inline-table;">
        	<label style="width: 30px;">状态:</label>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="state" onchange="refalshData()">
        		<option value="">全部</option>
        		<option value="0">禁用</option>
                <option value="1" selected>正常使用</option>
        	</select>
        </div>
    </div>
        <table id="table"
		       data-toolbar="#toolbar"
		       data-search="true"
		       data-minimum-count-columns="2"
		       data-pagination="true"
		       data-id-field="id"
		       data-page-list="[10, 25, 50, 100, ALL]"
		       data-side-pagination="server"
		       data-ajax="getList"
		       data-query-params-type=""
		       >
		</table>
        </div>
    </div>
</div>
</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<script src="${webRoot}/res/common/js/jquery.json-2.4.js"></script>
<!-- Flot -->
<script src="${webRoot}/res/common/js/bootstrap_table/bootstrap-table.js"></script>
<script src="${webRoot}/res/common/js/bootstrap_table/bootstrap-table-export.js"></script>
<script src="${webRoot}/res/common/js/tableExport.js"></script>
<script src="${webRoot}/res/common/js/bootstrap_table/bootstrap-table-editable.js"></script>
<script src="${webRoot}/res/common/js/bootstrap-editable.js"></script>
<script type="text/javascript" src="${webRoot}/res/common/js/bootstrap_table/locale/bootstrap-table-zh-CN.js"></script>
<script src="${webRoot}/res/common/js/layer1/layer.js"></script>
<script>
    var userId='${userId}';
    var basePath='${webRoot}';
	var $table = $('#table');
    $(document).ready(function() {   
    	//initRoleData();	
        $table.bootstrapTable({
            columns: [
                [
                 {field: 'id',title: '应用id',sortable: false, align: 'center'},
                 {field: 'appName',title: '应用名称',sortable: false, align: 'center'},
                 {field: 'appCode',title: '应用编号',sortable: false, align: 'center'},
                 {field: 'requestUrl',title: '应用地址',sortable: false, align: 'center'},
                 {field: 'appLogo',title: '应用logo',sortable: false, align: 'center'},
                 {field: 'appSort',title: '序号',sortable: false, align: 'center'},
                 {field: 'isPay',title: '是否付费',sortable: false, align: 'center'},
                 {field: 'state',title: '状态',sortable: false, align: 'center'},
                 {title: '操作',align: 'center',events: operateEvents,formatter: operateFormatter}
                ]
            ]
        });
    });
    

    function operateFormatter(value, row, index) {
    	var html=[
           '<a class="delete btn" style="margin-left: 5px;font-size:1em;display: inline" href="javascript:void(0)" target="mainFrame" title="GRYHGL_edit">',
            '删除',
            '</a>'];
        html.push('<a class=" btn" style="margin-left: 5px;font-size:1em;display: inline"  target="mainFrame" title="GRYHGL_detail">详情(没做)</a>')
        html.push('<a class="edit btn" style="margin-left: 5px;font-size:1em;display: inline" href="${webRoot}/appInfo/toEditAppInfo/'+row.id+'" target="mainFrame" title="GRYHGL_update">编辑</a>')
        var state=row.state;
        if(state=='0'){
        	html.push('<a class="enable btn" style="margin-left: 5px;font-size:1em" href="javascript:void(0)" target="mainFrame">上架</a>');
        }else{
        	html.push('<a class="disable btn" style="margin-left: 5px;font-size:1em" href="javascript:void(0)" target="mainFrame">下架</a>');
        }
        
        return html.join('');
    }

    window.operateEvents = {
    	'click .delete': function (e, value, row, index) {
    	         if(deleteAppinfo(row)){
    	           	$table.bootstrapTable('refresh', {
    	           		silent: true
    	               });
    	   }
    	},
        'click .enable': function (e, value, row, index) {
           if(enableAppinfo(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
       'click .disable': function (e, value, row, index) {
           if(disableAppinfo(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       }
    };
    function getList(params){
    	var url="${webRoot}/appInfo/selectAppInfoByPage";
    	var searchText=params.data.searchText;
    	if(searchText==null){
    		searchText="";
    	}
    	var data={
    			'page':params.data.pageNumber,
    			'rows':params.data.pageSize,
    			'rows':params.data.pageSize == 0 ? 10 : params.data.pageSize,
    			'params':{
    				"state":$("#state").val(),
    				"searchText":searchText
    			}
    	}
    	var code="";
    	var list;
    	var total=0;
    	$.ajax({
			type : "post",
			url : url,
			data :  data,
			async : false,
			dataType : 'json',
			success : function(data) {
				code=data.code;
				list=data.rows;
				total=data.total;
			}
		});
    	if(code=='1'){
			layer.msg("数据库异常，请稍后重试！");	
			params.complete();
			return false;
		}
             params.success({
                 total: total,
                 rows: list
             }); 
             // hide loading
             params.complete();
            // GrantFilter();
    }
    
    function refalshData(){
    	$table.bootstrapTable('refresh',{
    		query: {pageNumber: 1}
    	});
    }
    
  function deleteAppinfo(row){
    	if(confirm("您确定删除应用:"+row.appName+"吗?"))
		{
	    	var url="${webRoot}/appInfo/delete/"+row.id;
	    	var code="";
	    	$.ajax({
				type : "post",
				url : url,
				data :  "",
				async : false,
				dataType : 'json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='1'){
				layer.msg("服务器异常，请稍后重试！");	
				return false;
			}else{
				layer.msg("删除成功！");
				return true;
			}
		}
    	else{
    		}
    	}
    
    function enableAppinfo(row){
    	if(confirm("您确定要上架:"+row.appName+" 吗?"))
		{
	    	var url="${webRoot}/appInfo/update";
	    	var code="";
	    	var data={
	    		"id":row.id,
	    		"state":'1'
	    	}
	    	$.ajax({
				type : 'post',
				url : url,
				data : $.toJSON(data),
				async : false,
				dataType : 'json',
				contentType : 'application/json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='1'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，该应用已上架！");
				return true;
			}
		}else{
			return false;
		}
    }
    
    function disableAppinfo(row){
    	if(confirm("您确定要下架:"+row.appName+" 吗?"))
		{
	    	var url="${webRoot}/appInfo/update";
	    	var data={
	    		"id":row.id,
	    		"state":'0'
	    	}
	    	var code="";
	    	$.ajax({
				type : 'post',
				url : url,
				data :  $.toJSON(data),
				async : false,
				dataType : 'json',
				contentType : 'application/json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='2'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，该应用已下架！");
				return true;
			}
		}
    	else{
    		return false;
    	}
    }
    
    
    
    /**
     * 初始化系统后台角色
     */
    function initRoleData(){
    	var url="${webRoot}/dictionary/queryChildrenByDicCode/person";
    	ajaxAction('get',url,'','json','initRoleData');
    }
    
     function ajaxAction(type, url, reqData, returnType, requestName) {
    	$.ajax({
    		type : type,
    		url : url,
    		data : reqData,
    		async : false,
    		dataType : returnType,
    		contentType : 'application/json',
    		success : function(data) {
    			if(requestName == "initRoleData"){
    				var code=data.code;
    				if(code=='1'){
    					alert('服务器异常，请稍后重试！');
    				}else{
    					var roleList=data.list;
    					$("#userRole").empty();
    					$("#userRole").append('<option value="">全部</option>');
    					for(var i=0;i<roleList.length;i++){
    						var html="<option value='"+roleList[i].dicCode+"'>"+roleList[i].dicName+"</option>";
    						$("#userRole").append(html);
    					}
    				}
    			}
    		}
    	});
    }
</script>
</html>