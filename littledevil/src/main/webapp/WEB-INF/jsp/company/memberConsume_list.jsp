<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>消费记录管理</title>
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
                <div class="pull-left"><a href="javascript:" class="btn btn-default">消费记录管理</a> </div>
            </div>
            <hr/>
	 <div id="toolbar">
        <div class="pull-left"><a href="${webRoot}/admin/adminUserAdd" role="button" class="btn btn-primary add" target="mainFrame" style="display: none">添加消费</a></div>&nbsp;&nbsp;&nbsp;&nbsp; 
        <div style="display: inline-table; width: 50px;">
        	<label>状态:</label>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="state" onchange="refalshData()">
        		<option value="" selected>全部</option>
        		<option value="0">禁用</option>
                <option value="1">正常使用</option>
        	</select>
        </div></div>
        <table id="table"
		       data-toolbar="#toolbar"
		       data-search="true"
		       data-minimum-count-columns="2"
		       data-pagination="true"
		       data-id-field="id"
		       data-page-list="[10, 25, 50, 100, ALL]"
		       data-side-pagination="server"
		       data-ajax="getCompanyMemberList"
		       data-query-params-type=""
		       >
		</table>
        </div>
    </div>
</div>


</body>

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
<script src="${webRoot}/res/common/js/layer/layer/layer.js"></script>


<script>
var userId='${userId}';
var basePath='${webRoot}';
var $table = $('#table');

$(document).ready(function() { 
    $table.bootstrapTable({
        columns: [
            [
             {field: 'userInfo.ucName',title: '会员名称',sortable: false, align: 'center'},
             {field: 'user.phone',title: '联系方式',sortable: false, align: 'center'},
             {field: 'isDelete',title: '状态',sortable: false, align: 'center'},
             {field: 'userInfo.registerTime',title: '注册时间',sortable: false, align: 'center'},
             {title: '操作',align: 'center',events: operateEvents,formatter: operateFormatter}
            ]
        ]
    });
});

function detailFormatter(index, row) {
    var html = [];
    $.each(row, function (key, value) {
        html.push('<p><b>' + key + ':</b> ' + value + '</p>');
    });
    return html.join('');
}

function operateFormatter(value, row, index) {
	var html=[];
    var state=row.state;
    var userName=row.userName;
    if(state=='0'){
    	html.push('<a class="enable btn" style="margin-left: 5px;font-size:1em" href="javascript:void(0)" target="mainFrame">启用</a>');
    }else{
    	html.push('<a class="disable btn" style="margin-left: 5px;font-size:1em" href="javascript:void(0)" target="mainFrame">禁用</a>');
    }
    html.push('<a class="delete btn" style="margin-left: 5px;font-size:1em" href="javascript:;" target="mainFrame">删除</a>');
    html.push('<a class="detail btn" style="margin-left: 5px;font-size:1em" href="javascript:;" target="mainFrame">详情</a>');
    return html.join('');
}


window.operateEvents = {
        'click .delete': function (e, value, row, index) {
            if(deleteUser(row)){
            	$table.bootstrapTable('refresh', {
            		silent: true
                });
            }
        },
        'click .enable': function (e, value, row, index) {
           if(enableUser(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
       'click .disable': function (e, value, row, index) {
           if(disableUser(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
       'click .detail': function (e, value, row, index) {
           if(detailUser(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       }
    };

function refalshData(){
	$table.bootstrapTable('refresh',{
		query: {pageNumber: 1}
	});
}

 function getCompanyMemberList(params){
    	var url="${webRoot}/companyMember/selectByPage";
    	var searchText=params.data.searchText;
    	if(searchText==null){
    		searchText="";
    	}
    	var data={
    			'page':params.data.pageNumber,
    			'rows':params.data.pageSize,
    			'params':{
    				"companyId":userId,
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
			alert("数据库异常，请稍后重试！");	
			params.complete();
			return false;
		}
             params.success({
                 total: total,
                 rows: list
             }); 
             // hide loading
             params.complete();
    }
 
 function deleteUser(row){
 	if(confirm("您确定要删除用户:"+row.userInfo.ucName+" 吗?"))
		{
	    	var url="${webRoot}/companyMember/delete/"+row.id;
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
	    	if(code=='0'){
	    		alert("删除成功！");
				return true;
			}else{
				alert("服务器异常，请稍后重试！");	
				return false;
			}
		}
 	else{
 		}
 }
 function detailUser(row){
	 var url="${webRoot}/companyMember/CompanyMemberDetail/"+row.id;
 	var code="";
 	$.ajax({
			type : "get",
			url : url,
			data :  "",
			async : false,
			dataType : 'json',
			success : function(data) {
				code=data.code;
			}
		});
 }
 
    </script>
</html>