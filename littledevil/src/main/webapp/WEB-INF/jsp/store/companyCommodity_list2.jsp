<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>**商店管理中心</title>
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
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
        </div>

       

<div class="container">
    <!--<div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">商铺管理</div>
            &lt;!&ndash; List group &ndash;&gt;
            <ul class="list-group">
                <li class="list-group-item active">我的商品</li>
                <li class="list-group-item">促销活动管理</li>
                <li class="list-group-item">店铺设置</li>
            </ul>
        </div>
    </div>-->
    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-12">
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">全选</button>
                    <button type="button" class="btn btn-default">取消</button>
                </div>
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">添加商品</button>
                    <button type="button" class="btn btn-default">删除商品</button>
                </div>
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">商品分类管理</button>
                </div>
                <p></p>
            </div>
            <div class="col-lg-9">
                <div class="panel panel-default panel-row">
                    <div class="panel-heading">全部商品</div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-lg-2">商品名称</div>
                                <div class="col-lg-2">普通价</div>
                                <div class="col-lg-2">会员价</div>
                                <div class="col-lg-2">上架时间</div>
                                <div class="col-lg-2">下架时间</div>
                                <div class="col-lg-2">删除／修改</div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-lg-2">商品名称</div>
                                <div class="col-lg-2">12.00</div>
                                <div class="col-lg-2">8.00</div>
                                <div class="col-lg-2">2017-10-10</div>
                                <div class="col-lg-2">2020-10-10</div>
                                <div class="col-lg-2">删除／修改</div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-lg-2">商品名称</div>
                                <div class="col-lg-2">普通价</div>
                                <div class="col-lg-2">会员价</div>
                                <div class="col-lg-2">上架时间</div>
                                <div class="col-lg-2">下架时间</div>
                                <div class="col-lg-2">删除／修改</div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-heading">商品分类</div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">美容类 <span>删除／修改</span></li>
                        <li class="list-group-item">美甲类 <span>删除／修改</span></li>
                        <li class="list-group-item">工作类 <span>删除／修改</span></li>
                    </ul>
                </div>
                <a href="javascrpt:;" class="btn btn-primary btn-block">
                    创建新分类
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</html>