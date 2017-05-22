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
    <div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">帐号设置</div>
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item active">基本信息</li>
                <li class="list-group-item">帐户安全设置</li>
                <li class="list-group-item">修改密码</li>
                <li class="list-group-item">申请成为业务员</li>
            </ul>
        </div>
    </div>
    <div class="col-lg-9">
        <h5>基本信息</h5>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">所在地址</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-2">
                    <input type="email" class="form-control" id="" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">微信号</label>
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-describedby="basic-addon2">
                        <span class="input-group-addon" id="basic-addon2">选择</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="" class="col-sm-2 control-label">个人描述</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">确定上传</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</html>