<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户设置</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="${webRoot}/res/sys/css/Nstrap.css" rel="stylesheet">
    <link href="${webRoot}/res/sys/css/animated.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
    <script type="text/javascript" src="https://www.wegene.com/static/js/respond.js"></script>
    <![endif]-->
</head>
<body>


<div class="console-container">
		<div class="row">
        <div class="col-sm-12">
            <div class="console-title clearfix">
                <div class="pull-left"><a href="javascript:" class="btn btn-default">我的商店</a> </div>
            </div>
            <hr/>
	 <div id="toolbar">
     </div>
        <table id="table"
		       data-toolbar="#toolbar"
		       data-search="true"
		       data-minimum-count-columns="2"
		       data-pagination="true"
		       data-id-field="id"
		       data-page-list="[10, 25, 50, 100, ALL]"
		       data-side-pagination="server"
		       data-ajax="getCompanyList"
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
             {field: 'companyName',title: '商店名称',sortable: false, align: 'center'},
             {field: 'creatTime',title: '创建会员时间',sortable: false, align: 'center'},
             {field: 'cash',title: '剩余金额',sortable: false, align: 'center'},
             {field: 'item',title: '剩余项目',sortable: false, align: 'center'},
             {field: 'lastConsume',title: '最后一次消费',sortable: false, align: 'center'},
             {field: 'sumNumber',title: '总消费',sortable: false, align: 'center'},
             {title: '操作',align: 'center',formatter: operateFormatter}
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
    html.push('<a class="check btn" style="margin-left: 5px;font-size:1em" href="javascript:;" target="mainFrame">查看</a>');
    return html.join('');
}



function refalshData(){
	$table.bootstrapTable('refresh',{
		query: {pageNumber: 1}
	});
}


/* $(document).ready(function() {
	getCompanybyUserid('${userId}');
});
 */
function getCompanybyUserid(id){
	var url="${webRoot}/person/getCompanybyUserid/"+id;
	var data={
	};
	ajaxAction('get',url,$.toJSON(data),'json','getCompanybyUserid');
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
			if (requestName == "getCompanybyUserid"){
				var code=data.code;
				if(code=='0'){
					for(var i=0;i<data.userConsumelist.length;i++){
						//alert(data.userConsumelist[i].companyName);
						console.log("我的商店有"+data.userConsumelist[i].companyName);
					}
					
					//alert('成功！');
				}else if(code=='1'){
					alert('服务器异常，请稍后重试！');
				}	
			}
		}
	});
}
function getCompanyList(params){
	var url="${webRoot}/person/getCompanybyUserid/"+userId;
	var searchText=params.data.searchText;
	if(searchText==null){
		searchText="";
	}
	var data={
			'page':params.data.pageNumber,
			'rows':params.data.pageSize,
			'params':{
			}
	}
	var code="";
	var list;
	var total=0;
	$.ajax({
		type : "get",
		url : url,
		data :  data,
		async : false,
		dataType : 'json',
		success : function(data) {
			code=data.code;
			list=data.userConsumelist;
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
</script>
</html>