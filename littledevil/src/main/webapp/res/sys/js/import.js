/**
 * 区域联动
 * basePath:系统运行根地址
 */
var provinceTag="";
var cityTag="";
var countyTag="";
var schoolTag="";
var gradeTag="";
var classTag="";
var orgTag="";

function provinceChange(){
	var provinceCode=$("#"+provinceTag).val();
	getCityList(provinceCode);
	cityChange();
}

function cityChange(){
	var cityCode=$("#"+cityTag).val();
	getCountyList(cityCode);
	countyChange();
	
}

function countyChange(){
	var countyCode=$("#"+countyTag).val();
	if(schoolTag!=null&&schoolTag!=""){
		getSchoolList();
		schoolChange();
	}
	if(orgTag!=null&&orgTag!=""){
		getOrgList();
	}
}

function schoolChange(){
	var schoolId=$("#"+schoolTag).val();
	if(gradeTag!=null&&gradeTag!=""){
		getGradeList(schoolId);
		gradeChange();
	}
}

function gradeChange(){
	if(classTag!=null&&classTag!=""){
		getSchoolClassList();
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

function getOrgList(){
	var url=basePath+"/org/selectOrgList";
	var data={
			province:$("#"+provinceTag).val(),
			city:$("#"+cityTag).val(),
			county:$("#"+countyTag).val()
	};
	ajaxActions("post", url, $.toJSON(data), "json", "getOrgList");
}

function getGradeList(schoolId){
	if(schoolId==null||schoolId==''){
		$("#"+gradeTag).empty();
		$("#"+gradeTag).append("<option>年级</option>");
	}
	var url=basePath+"/school/selectGradeBySchoolId/"+schoolId;
	ajaxActions("post", url,"", "json", "getGradeList");
}

function getSchoolClassList(){
	var url=basePath+"/schoolClass/selectSchoolClassByRecord";
	var data={
			schoolId:$("#"+schoolTag).val(),
			gradeCode:$("#"+gradeTag).val(),
			state:"1"
	};
	ajaxActions("post", url, $.toJSON(data), "json", "getSchoolClassList");
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
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+provinceTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
				provinceChange();
			}else if (requestName == "getCityList"){
				$("#"+cityTag).empty();
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+cityTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
			}else if (requestName == "getCountyList"){
				$("#"+countyTag).empty();
				var list=data.list;
				for(var i=0;i<list.length;i++){
					$("#"+countyTag).append("<option value='"+list[i].districtCode+"'>"+list[i].districtName+"</option>");
				}
			}else if (requestName == "getSchoolList"){
				$("#"+schoolTag).empty();
				var list=data.list;
				if(list==null||list.length==0){
					$("#"+schoolTag).append("<option value=''>学校</option>");
					return;
				}
				for(var i=0;i<list.length;i++){
					$("#"+schoolTag).append("<option value='"+list[i].id+"'>"+list[i].schoolName+"</option>");
				}
			}else if (requestName == "getOrgList"){
				$("#"+orgTag).empty();
				var list=data.list;
				if(list==null||list.length==0){
					$("#"+orgTag).append("<option value=''>机构</option>");
					return;
				}
				for(var i=0;i<list.length;i++){
					$("#"+orgTag).append("<option value='"+list[i].id+"'>"+list[i].orgName+"</option>");
				}
			}else if (requestName == "getGradeList"){
				$("#"+gradeTag).empty();
				var list=data.list;
				if(list==null||list.length==0){
					$("#"+gradeTag).append("<option value=''>年级</option>");
					return;
				}
				for(var i=0;i<list.length;i++){
					$("#"+gradeTag).append("<option value='"+list[i].gradeCode+"'>"+list[i].gradeName+"</option>");
				}
			}else if(requestName == "getSchoolClassList"){
				$("#"+classTag).empty();
				var list=data.list;
				if(list==null||list.length==0){
					$("#"+classTag).append("<option value=''>班级</option>");
					return;
				}
				for(var i=0;i<list.length;i++){
					$("#"+classTag).append("<option value='"+list[i].id+"'>"+list[i].expandName+"</option>");
				}
			}
		}
	});
}