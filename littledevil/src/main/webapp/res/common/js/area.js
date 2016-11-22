/**
 * 区域联动
 * basePath:系统运行根地址
 */
var provinceTag;
var cityTag;
var countyTag;

var initProvince="";
var initCity="";
var initCounty="";

function provinceChange(){
	var provinceCode=$("#"+provinceTag).val();
	$("#"+cityTag).empty();
	$("#"+cityTag).hide();
	$("#"+countyTag).empty();
	$("#"+countyTag).hide();
	if(provinceCode!=null&&provinceCode!=""){
		getCityList(provinceCode);
	}
}

function cityChange(){
	var cityCode=$("#"+cityTag).val();
	$("#"+countyTag).empty();
	$("#"+countyTag).hide();
	if(cityCode!=null&&cityCode!=""){
		getCountyList(cityCode);
	}
}

function getProvinceList(){
	var url=basePath+"/district/queryChildrenByDistrictCode";
	ajaxActions("get", url, "", "json", "getProvinceList");
}

function getCityList(provinceCode){
	var url=basePath+"/district/queryChildrenByDistrictCode/"+provinceCode;
	ajaxActions("get", url, "", "json", "getCityList");
}

function getCountyList(cityCode){
	var url=basePath+"/district/queryChildrenByDistrictCode/"+cityCode;
	ajaxActions("get", url, "", "json", "getCountyList");
}

function getSchoolList(){
	var url=basePath+"/school/selectSchoolList";
	var data={
			schoolProvince:$("#"+provinceTag).val(),
			schoolCity:$("#"+cityTag).val(),
			schoolCounty:$("#"+countyTag).val()
	};
	ajaxActions("post", url, $.toJSON(data), "json", "getSchoolList");
}

function ajaxActions(type, url, reqData, returnType, requestName) {
	$.ajax({
		type : type,
		url : url,
		data : reqData,
		async : false,
		dataType : returnType,
		contentType : 'application/json',
		success : function(data) {
			if(requestName == "getProvinceList"){
				$("#"+provinceTag).empty();
				$("#"+provinceTag).append("<option value=''>省</option>");
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+provinceTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
				if(initProvince!=null&&initProvince!=""){
					$("#"+provinceTag).find("option[value='"+initProvince+"']").attr("selected",true);
					$("#"+cityTag).show();
					getCityList(initProvince);
					initProvince="";
				}else{
					$("#"+cityTag).empty();
					$("#"+cityTag).hide();
					$("#"+countyTag).empty();
					$("#"+countyTag).hide();
				}
			}else if (requestName == "getCityList"){
				$("#"+cityTag).empty();
				$("#"+cityTag).show();
				$("#"+cityTag).append("<option value=''>市</option>");
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+cityTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
				if(initCity!=null&&initCity!=""){
					$("#"+cityTag).find("option[value='"+initCity+"']").attr("selected",true);
					$("#"+countyTag).show();
					getCountyList(initCity);
					initCity="";
				}else{
					$("#"+countyTag).empty();
					$("#"+countyTag).hide();
				}
			}else if (requestName == "getCountyList"){
				$("#"+countyTag).empty();
				$("#"+countyTag).show();
				$("#"+countyTag).append("<option value=''>区/县</option>");
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+countyTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
				if(initCounty!=null&&initCounty!=""){
					$("#"+countyTag).find("option[value='"+initCounty+"']").attr("selected",true);
					initCounty="";
				}
			}
		}
	});
}