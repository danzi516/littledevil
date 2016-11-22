var departmentSetting = {

	data : {
		simpleData : {
			enable : true,
			idKey : "id",
			pIdKey : "parentId",
			rootPId : null
		},
		key : {
			name : "departmentName"
		}
	},
	callback : {
		onClick : selectDepartment
	}
};

var selectDepartmentName='';
var selectDepartmentId=0;

/**
 * @param event
 * @param treeId
 * @param treeNode
 */
function selectDepartment(event, treeId, treeNode) {
	// 通过教材关联章节查询对应的资源
	selectDepartmentName=treeNode.departmentName;
	selectDepartmentId=treeNode.id;
}

/**
 * 通过教材比编号查询章节
 */
function queryDepartmentList() {
	var url="/department/selectDepartmentByObj";
	var data={
				"objectId":$("#objectId").val(),
				"parentId":0,
				"objectType":$("#objectType").val()
	}
	ajaxSubmit("GET", url, data,"queryDepartmentList");
}

/**
 * ajax 调用的公共方法
 * 
 * @param type
 *            ajax提交的类型
 * @param url
 *            访问地址
 * @param paramObj
 *            提交JSON参数
 * @param action
 *            操作
 */
function ajaxSubmit(type, url, paramObj, action) {
	$.ajax({
				type : type,
				url : basePath + url,
				data : paramObj,
				dataType : 'json',
				contentType : 'application/json',
				async : false,
				success : function(data) {
					// TODO 初始化资源列表，这里可以修改为jsp的el、jstl表达式
					if (action == "queryDepartmentList") {
						var code=data.code;
						if(code=='0'){
							$.fn.zTree.init($("#departmentTree"),departmentSetting,data.list);
						}else{
							alert("初始化树失败，服务器异常，请稍后重试！");
						}
						

					}
				}
			});
}