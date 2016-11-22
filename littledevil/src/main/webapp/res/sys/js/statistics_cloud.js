/**
 * 
 */
var areaCode="";
//获取文件数量及大小总数
function statisticsCloudAll(){
	var url=basePath+"/statisticsCloud/all";
	cloudStatisticsAjaxAction("get",url,"","json","statisticsCloudAll");
}

function statisticsCloudByPageForSchool(params){
	var searchText=params.data.searchText;
	if(searchText==null){
		searchText="";
	}
	var url=basePath+"/statisticsCloud/school/getByPage";
	var data={
			'page':params.data.pageNumber,
			'rows':params.data.pageSize == 0 ? 10 : params.data.pageSize,
			'params':{
				"schoolName":searchText,
				"provinceCode":$("#provinceCode").val(),
				"cityCode":$("#cityCode").val(),
				"countyCode":$("#countyCode").val()
			}
	};
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
			list=data.list;
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

function statisticsCloudByPageForArea(params){
	var searchText=params.data.searchText;
	if(searchText==null){
		searchText="";
	}
	var data={
			'page':params.data.pageNumber,
			'rows':params.data.pageSize == 0 ? 10 : params.data.pageSize,
			'params':{
				"areaName":searchText,
				"areaCode":areaCode
			}
	};
	var url=basePath+"/statisticsCloud/area/getByPage";
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
			list=data.list;
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

function getAllAreaCloudList(){
	areaCode="";
	refalshAreaData();
}

function getAreaList(){
	var url=basePath+"/district/getAll";
	cloudStatisticsAjaxAction("get",url,"","json","getAreaList");
}

var areaSetting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "districtCode",
				pIdKey : "parentCode",
				rootPId : null
			},
			key : {
				name : "districtName"
			}
		},
		callback : {
			onClick : selectArea
		}
};

/**
 * @param event
 * @param treeId
 * @param treeNode
 */
function selectArea(event, treeId, treeNode) {
	// 通过教材关联章节查询对应的资源
	areaCode=treeNode.districtCode;
	refalshAreaData();
}

function refalshAreaData(){
	$areaTable.bootstrapTable('refresh',{
		query: {pageNumber: 1}
	});
}

function refalshData(){
	$schoolTable.bootstrapTable('refresh',{
		query: {pageNumber: 1}
	});
}

function cloudStatisticsAjaxAction(type, url, reqData, returnType, requestName) {
	$.ajax({
		type : type,
		url : url,
		data : reqData,
		async : false,
		dataType : returnType,
		success : function(data) {
		    if(requestName == "statisticsCloudAll"){
		    	var record=data.record;
		    	$("#allNum").text(record.fileNum);
		    	$("#allSize").text(record.fileSizeCode);
		    }else if(requestName == "getAreaList"){
		    	var code=data.code;
				if(code=='0'){
					$.fn.zTree.init($("#areaTree"),areaSetting,data.list);
				}else{
					alert("初始化树失败，服务器异常，请稍后重试！");
				}
		    }
		}
	});
}