<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ page import="cn.com.hd.common.SysConstants"%>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>权限设置</title>
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
                <div class="pull-left"> <h5>分配权限</h5></div>
                <div class="pull-right"><a id="back" href="${webRoot}/role/toRoleList/${role.objectId}/${role.objectType}" target="manageMainFrame" class="btn btn-link">返回</a> </div>
            </div>
            <hr/>
            <div class="panel panel-default">
                    <div class="panel-heading">${role.roleName}</div>
                    <div class="panel-body">
                         <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-20" id="grantList">
                                <hr/>
                            </div>
                        </div>
                        <div class="form-group col-sm-offset-3">
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-10" id="hasNoPermission">
                                <button type="submit" class="btn btn-primary" id="updatePermission">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="${webRoot}/res/common/js/layer1/layer.js"></script>

<script>
var targetName=window.name;
$("#back").attr("target",targetName);
    function ajaxAction(type, url, reqData, returnType, requestName) {
        $.ajax({
            type : type,
            url : url,
            data :  $.toJSON(reqData),
            async : false,
            dataType : returnType,
            contentType : 'application/json',
            success : function(data) {
                if(requestName === "queryApplications"){
                    var code = data.code;
                    var appInfo = data.appInfo;

                    if(code === "0"){
                        var appendHtml = "";

                        //获取成功，填充列表
                        for(var i = 0 ; i< appInfo.length ; i++){
                            if(!appInfo[i].appOperationList.length <= 0 ){
                                appendHtml += '<div class="row"><div class="col-sm-2">'+appInfo[i].appName+'</div><div class="col-sm-10">';//头
                            for(var j = 0 ; j < appInfo[i].appOperationList.length ; j ++){
                                appendHtml +='<li style="text-align:left;display:inline-block;margin-left:1em"><input type="checkbox" value="'+appInfo[i].appOperationList[j].id+'">'+appInfo[i].appOperationList[j].operationName+'</li>';//权限操作
                            }
                            appendHtml +='</div></div><hr/>'//尾   
                            }
                        }
                        if(appInfo.length <= 0){
                            console.log("暂无授权应用");
                            $("#updatePermission").hide();
                            $("#hasNoPermission").append("<h5>暂无授权信息</h5>")
                        }

                        $("#grantList").empty();
                        $("#grantList").append(appendHtml);

                        //获取该角色权限
                        ajaxAction("GET","${webRoot}/companyRoleOperation/selectRoleOperationByRoleId/${roleId}",{}, "json", "selectRoleOperationByRoleId");

                    }else{
                        console.log("error");//获取列表失败
                    }
                }
                 else if(requestName === "selectRoleOperationByRoleId"){
                    if(data.code === "0"){
                        var permissions = data.list;
                        var grantsList = [];

                        for(permission in permissions){
                             grantsList.push(String(permissions[permission].operationId));
                         }
                        //设置授权信息初始化状态
                         $("#grantList input").each(function(){
                            if($.inArray($(this).val(), grantsList) > -1){
                                $(this).attr("checked",true);
                            }
                         });
                    }else{
                    	alert("获取角色权限信息失败");
                    }
                } 
                else if(requestName === "editRoleOperation"){
                    if(data.code ==="0"){
                    	alert("分配成功");
                    	//分配权限成功之后需要刷新整个index.html来更新权限信息
                       //window.open("${webRoot}/role/toRoleList/${role.objectId}/${role.objectType}",targetName);
                    }else{
                    	alert("分配失败");
                    }
                }
            }
        });
    }

    //获取所有的权限信息
    function getAllPermission(){
        var url="${webRoot}/appInfo/selectAllAppInfo";
        ajaxAction("GET",url,{}, "json", "queryApplications");
    }

    $(document).ready(function() {
        getAllPermission(); //获取所有授权信息

        $("#updatePermission").click(function(){
             var operations = "";

             $("#grantList input:checked").each(function(){
                //alert($(this).attr('id')+"|"+$(this).val());
                //operations.push({"operationId":$(this).val()});
                operations=operations+$(this).val()+",";
             });
             if(operations==""){
             alert("请设置权限！")
             return;
             }

            var data = {
                "roleId":"${roleId}",
                "operationIdArry":operations
            };

            ajaxAction("POST","${webRoot}/companyRoleOperation/update",data, "json", "editRoleOperation");
        });
    });
</script>
</html>
</html>
