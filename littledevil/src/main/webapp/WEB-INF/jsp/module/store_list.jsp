<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>平台商店</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
     <link href="res/css/Nstrap.css" rel="stylesheet">
    <link href="res/css/style.css" rel="stylesheet">
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
    <div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">全部商店</div>
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item">我附近的店</li>
                <li class="list-group-item">美甲</li>
                <li class="list-group-item">纹眉</li>
            </ul>
        </div>
    </div>
    <div class="col-lg-9">
        <div class="panel panel-default">
            <div class="panel-heading">全部商店</div>
            <div class="panel-body">
                <div class="row" id="companyList">
                   <!--  <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../../images/userLogo/a1.jpg" class="" alt="...">
                            <div class="caption">
                                <h5>美甲皇后</h5>
                                <p><span class="badge">美甲</span> <span class="badge">纹眉</span></p>
                            </div>
                        </div>
                    </div> -->
                </div>


            </div>
        </div>
    </div>
</div>
<!-- <div class="container-fluid">
    <div class="container">
        <div>
            <a href="javascript:;">平台介绍</a> <a href="javascript:;">联系我们</a>
            <a href="javascript:;">帮助中心</a> <a href="javascript:;">帮助中心</a>
            <a href="javascript:;">不良信息举报</a><a href="javascript:;">申请成为业务员</a>
        </div>
    </div>
</div> -->
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<script>
getCompanyList();

function getCompanyList(params){
	var url="${webRoot}/companyInfo/selectCompanyAllList";
	var code="";
	var list;
	$.ajax({
		type : "get",
		url : url,
		async : false,
		dataType : 'json',
		success : function(data) {
			code=data.code;
			list=data.List;
			for(var i=0;i<list.length;i++ ){
				var companyLogo;
				(list[i].companyLogo==''||list[i].companyLogo==null)?companyLogo='/littledevil/res/common/images/geren.png':companyLogo=list[i].companyLogo;
				$("#companyList").append('<div class="col-sm-6 col-md-4"><div class="thumbnail"><img src="'+companyLogo+'" class="" style="width:100px;height:100px" alt="..."><div class="caption"><h5>'+list[i].companyName+'</h5><p><span class="badge">美甲</span> <span class="badge">纹眉</span></p></div></div></div>');
			}
		}
	});
	if(code=='1'){
		alert("数据库异常，请稍后重试！");	
		return false;
	}
}
</script>
</html>