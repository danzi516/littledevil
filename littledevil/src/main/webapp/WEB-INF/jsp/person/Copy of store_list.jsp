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


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default panel-row">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-2">商店名称</div>
                        <div class="col-lg-1">创建会员时间</div>
                        <div class="col-lg-1">剩余金额</div>
                        <div class="col-lg-3">剩余项目</div>
                        <div class="col-lg-3">最后一次消费</div>
                        <div class="col-lg-1">总消费</div>
                        <div class="col-lg-1">操作</div>
                    </div>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row" id="infoList">
                            <div class="col-lg-2" id="companyName">111</div>
                            <div class="col-lg-1" id="creatTime">2017-07-01</div>
                            <div class="col-lg-1" id="cash">0</div>
                            <div class="col-lg-3" id="item">900套餐：全套（99）、300全套（661）</div>
                            <div class="col-lg-3" id="lastConsume">900套餐：全套(2017-07-20 21:25:57)</div>
                            <div class="col-lg-1" id="sumNumber">1200</div>
                            <div class="col-lg-1" id="operate"><a href="#">查看</a> </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<script src="${webRoot}/res/common/js/jquery.json-2.4.js"></script>
<script>
$(document).ready(function() {
	getCompanybyUserid('${userId}');
});

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
</script>
</html>