<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>系统用户管理</title>
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
                <div class="pull-left"><a href="javascript:" class="btn btn-default">个人用户管理</a> </div>
            </div>
            <hr/>
	 <div id="toolbar">
        <div class="pull-left"><a href="${webRoot}/person/personUserAdd" role="button" class="btn btn-primary add" target="mainFrame" title="GRYHGL_insert" style="display: none">添加个人用户</a></div>&nbsp;&nbsp;&nbsp;&nbsp; 
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
        <div style="display: inline-table;">
        	<label style="width: 30px;">角色:</label>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="userRole" onchange="refalshData()">
        		<option value="">全部</option>
        		<option value="student">学生</option>
        		<option value="teacher">教师</option>
                <option value="parent" >家长</option>
        	</select>
        </div>
         <div style="display: inline-table;">
        	<label style="width: 60px;">空间状态:</label>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="spaceState" onchange="refalshData()">
        		<option value="">全部</option>
        		<option value="0">禁用</option>
        		<option value="1">正常使用</option>
        	</select>
        </div>
         <div style="display: inline-table;">
        	<label style="width: 60px;">空间等级:</label>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="spaceLevel" onchange="refalshData()">
        		<option value="">全部</option>
        		<option value="0">普通</option>
        		<option value="1">优秀</option>
        	</select>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" id="provinceCode" onchange="onProvinceChange()">
        	</select>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" style="display:none" id="cityCode" onchange="onCityChange()">
        	</select>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" style="display:none" id="countyCode" onchange="onCountyChange()">
        	</select>
        </div>
        <div style="display: inline-table; width: 100px;">
        	<select class="form-control" style="display:none" id="schoolId" onchange="refalshData()">
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
		       data-ajax="getUserList"
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
<script src="${webRoot}/res/common/js/layer/layer/layer.js"></script>
<script src="${webRoot}/res/common/js/area.js"></script>
<script>
    var userId='${userId}';
    var basePath='${webRoot}';
	var $table = $('#table');
	
	provinceTag="provinceCode";
	cityTag="cityCode";
	countyTag="countyCode";
	schoolTag="schoolId";
	
	
   
    $(document).ready(function() {   
    	initRoleData();	
    	getProvinceList();
        $table.bootstrapTable({
            columns: [
                [
                 {field: 'user.userName',title: '用户名',sortable: false, align: 'center'},
                 {field: 'ucName',title: '真实姓名',sortable: false, align: 'center'},
                 {field: 'user.idcard',title: '身份证',sortable: false, align: 'center'},
                 {field: 'sexValue',title: '性别',sortable: false, align: 'center'},
                 {field: 'user.email',title: '邮箱',sortable: false, align: 'center'},
                 {field: 'user.phone',title: '手机',sortable: false, align: 'center'},
                 {field: 'user.stateCode',title: '状态',sortable: false, align: 'center'},
                 {field: 'spaceStateCode',title: '空间状态',sortable: false, align: 'center'},
                 {field: 'spaceLevelCode',title: '空间等级',sortable: false, align: 'center'},
                 {field: 'userRoleValue',title: '用户角色',sortable: false, align: 'center'},
                 {field: 'registerDateString',title: '注册时间',sortable: false, align: 'center'},
                 {title: '操作',align: 'center',events: operateEvents,formatter: operateFormatter}
                ]
            ]
        });
    });
    
    function onProvinceChange(){
		provinceChange();
		refalshData();
	}

	function onCityChange(){
		cityChange();
		refalshData();
	}
	
	function onCountyChange(){
		countyChange();
		refalshData();
	}
    
    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }

    function operateFormatter(value, row, index) {
    	var html=[
           '<a class="edit btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_edit">',
            '重置密码',
            '</a>'];
        html.push('<a class=" btn" style="margin-left: 5px;font-size:1em;display: none" href="${webRoot}/userInfo/userInfoDetail/'+row.id+'" target="mainFrame" title="GRYHGL_detail">详情</a>')
        html.push('<a class=" btn" style="margin-left: 5px;font-size:1em;display: none" href="${webRoot}/userInfo/userInfoEdit/'+row.id+'" target="mainFrame" title="GRYHGL_update">编辑</a>')
        var state=row.user.state;
       if(state=='0'){
        	html.push('<a class="enable btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_open">启用</a>');
        }else{
        	html.push('<a class="disable btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_close">禁用</a>');
        }
        var spaceState=row.spaceState;
       if(spaceState=='0'){
        	html.push('<a class="spaceenable btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_space_open">空间启用</a>');
        }else{
        	html.push('<a class="spacedisable btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_space_close">空间禁用</a>');
        }
        var spaceLevel=row.spaceLevel;
       if(spaceLevel=='0'){
        	html.push('<a class="spaceset btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_space_set">设为优秀空间</a>');
        }else{
        	html.push('<a class="spacecancel btn" style="margin-left: 5px;font-size:1em;display: none" href="javascript:void(0)" target="mainFrame" title="GRYHGL_space_cancel">取消优秀空间</a>');
        }
        return html.join('');
    }

    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
         if(resetPassword(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
           
        },
      /*   'click .delete': function (e, value, row, index) {
            if(deleteUser(row)){
            	$table.bootstrapTable('refresh', {
            		silent: true
                });
            }
        }, */
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
        'click .spaceenable': function (e, value, row, index) {
           if(spaceenableUser(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
       'click .spacedisable': function (e, value, row, index) {
           if(spacedisableUser(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
        'click .spaceset': function (e, value, row, index) {
           if(spaceset(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       },
       'click .spacecancel': function (e, value, row, index) {
           if(spacecancel(row)){
           	$table.bootstrapTable('refresh', {
           		silent: true
               });
           }
       }
    };
    function getUserList(params){
    	var url="${webRoot}/userInfo/selectUserInfoByPage";
    	var searchText=params.data.searchText;
    	if(searchText==null){
    		searchText="";
    	}
    	var data={
    			'page':params.data.pageNumber,
    			'rows':params.data.pageSize,
    			'rows':params.data.pageSize == 0 ? 10 : params.data.pageSize,
    			'params':{
    				"userType":"person",
    				"userRole":$("#userRole").val(),
    				"state":$("#state").val(),
    				"searchText":searchText,
    				"province":$("#provinceCode").val(),
    				"city":$("#cityCode").val(),
    				"county":$("#countyCode").val(),
    				"schoolId":$("#schoolId").val(),
    				"spaceState":$("#spaceState").val(),
    				"spaceLevel":$("#spaceLevel").val()
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
             GrantFilter();
    }
    
    function refalshData(){
    	$table.bootstrapTable('refresh',{
    		query: {pageNumber: 1}
    	});
    }
    
    /* function deleteUser(row){
    	if(confirm("您确定要启用用户:"+row.user.userName+"吗?"))
		{
	    	var url="${webRoot}/user/deleteUser/"+row.id;
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
    	} */
    
    function resetPassword(row){
    	if(confirm("您确定要重置用户:"+row.user.userName+" 的密码吗?"))
		{
	    	var url="${webRoot}/user/resetPassword/"+row.id;
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
	    	if(code=='2'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，重置后的密码为123456！");
				return true;
			}
		}
    	else{
    		return false;
    	}
    }
    function enableUser(row){
    	if(confirm("您确定要启用用户:"+row.user.userName+" 吗?"))
		{
	    	var url="${webRoot}/user/updateStatus";
	    	var code="";
	    	var data={
	    		"id":row.id,
	    		"state":'1'
	    	}
	    	$.ajax({
				type : "post",
				url : url,
				data :  data,
				async : false,
				dataType : 'json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='1'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，该用户已可以正常访问本系统！");
				return true;
			}
		}else{
			return false;
		}
    }
    function disableUser(row){
    	if(confirm("您确定要禁用用户:"+row.user.userName+" 吗?"))
		{
	    	var url="${webRoot}/user/updateStatus";
	    	var data={
	    		"id":row.id,
	    		"state":'0'
	    	}
	    	var code="";
	    	$.ajax({
				type : "post",
				url : url,
				data :  data,
				async : false,
				dataType : 'json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='2'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，该用户将禁止访问本系统！");
				return true;
			}
		}
    	else{
    		return false;
    	}
    }
    
     function spaceenableUser(row){
    	if(confirm("您确定要启用用户空间:"+row.user.userName+" 吗?"))
		{
	    	var url="${webRoot}/userInfo/editSpaceStateByUserId/"+row.id+"/1";
	    	var code="";
	    	var data={}
	    	$.ajax({
				type : "get",
				url : url,
				data :  $.toJSON(data),
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
				alert("设置成功，该用户空间已开通！");
				return true;
			}
		}
    	else{
    		}
    }
    function spacedisableUser(row){
    	if(confirm("您确定要禁用用户空间:"+row.user.userName+" 吗?"))
		{
	    	var url="${webRoot}/userInfo/editSpaceStateByUserId/"+row.id+"/0";
	    	var data={}
	    	var code="";
	    	$.ajax({
				type : "get",
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
				alert("设置成功，该用户空间将禁止访问！");
				return true;
			}
		}
    	else{
    		}
    }
     function spaceset(row){
    	if(confirm("您确定要将个人:"+row.ucName+" 设置为优秀空间吗?"))
		{
	    	var url="${webRoot}/userInfo/setSpaceLevel";
	    	var code="";
	    	var data={
	    		"id":row.id,
	    		"spaceLevel":1
	    	}
	    	$.ajax({
				type : "post",
				url : url,
				data :  data,
				async : false,
				dataType : 'json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='1'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，该用户空间已设置为优秀空间！");
				return true;
			}
		}
    	else{
    		}
    }
    function spacecancel(row){
    	if(confirm("您确定要取消个人空间:"+row.ucName+" 的优秀空间吗?"))
		{
	    	var url="${webRoot}/userInfo/setSpaceLevel";
	    	var data={
	    		"id":row.id,
	    		"spaceLevel":0
	    	}
	    	var code="";
	    	$.ajax({
				type : "post",
				url : url,
				data : data,
				async : false,
				dataType : 'json',
				success : function(data) {
					code=data.code;
				}
			});
	    	if(code=='1'){
				alert("服务器异常，请稍后重试！");	
				return false;
			}else{
				alert("设置成功，已取消该用户的优秀空间");
				return true;
			}
		}
    	else{
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