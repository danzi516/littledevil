//获取权限列表信息
var grantList = getGrantOperationList();
 
 /**
  * 获取已经授权的操作
  */
 function getGrantOperationList(){
	 if(userId!=""){
		 var url = basePath+"/operation/selectCodeByUserId/"+userId;
		 var operationList = [];
		 $.ajax({
	         type : "get",
	         url : url,
	         data :  "",
	         async : false,
	         dataType : 'json',
	         success : function(data) {
	             code=data.code;
	             operationList=data.list;
	             if(code=='1'){
	                 layer.msg("获取权限异常");
	                 return false;
	             }
	             
	         },
	         error:function(error){
	        	 console.log(error);
	         }
	     });
		 
		 return operationList;
	 }else{
		 return [];
	 }
 }
 
 /**
  * 只显示授权的应用操作
  */
 function GrantFilter(){
	 if(grantList){
		 for(var item in grantList){
			 $('a[title=' + grantList[item] + ']').show();
		 }
	 }else{
		 throw new Error("未找到可用权限信息。");
	 }
	 
 }