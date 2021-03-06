<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head lang="en">
	<%@ include file="../common/meta.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>网站登录</title>
    <!--<link href="less/Nstrap.less" type="text/css" rel="stylesheet/less"/>
    <script src="js/less.js"></script>-->
    <link href="res/css/Nstrap.css" rel="stylesheet">
    <link href="res/css/style.css" rel="stylesheet">
    <link href="res/common/js/gritter/jquery.gritter.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
    <script type="text/javascript" src="https://www.wegene.com/static/js/respond.js"></script>
    <![endif]-->
</head>
<body class="frame_class">
<nav class="navbar navbar-primary navbar-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="res/images/iconfont-mogui.png" width="20" height="20" /></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#"><span class="fa fa-home fa-lg"></span></a></li>
                <li></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="fa fa-user"></i> 欢迎管理员 阿玛尼 <span class="caret"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-envelope"></i> 系统消息 <span class="badge">5</span> <span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="res/images/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46小时前</small>
                                    <strong>小四</strong> 项目已处理完结
                                    <br>
                                    <small class="text-muted">3天前 2014.11.8</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="res/images/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">25小时前</small>
                                    <strong>国民岳父</strong> 这是一条测试信息
                                    <br>
                                    <small class="text-muted">昨天</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i>  <strong> 查看所有消息</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell"></i> 通知 <span class="badge">5</span> <span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                    <span class="pull-right text-muted small">4分钟前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-qq fa-fw"></i> 3条新回复
                                    <span class="pull-right text-muted small">12分钟钱</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>查看所有 </strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa fa-cog"></i> 系统设置</a></li>
                <li><a href="#"><i class="fa fa-share-alt"></i> 退出</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入您需要查找的内容 …">
                </div>
            </form>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>



    <div class="sidebar">
        <div class="sideber-tab">
            <ul class="nav nav-pills nav-stacked" role="tablist">
               <!--  <li data-toggle="tooltip" data-placement="right" title="常用菜单" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-tasks"></i></a></li>
                <li data-toggle="tooltip" data-placement="right" title="插件管理"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-th"></i></a></li>
                <li data-toggle="tooltip" data-placement="right" title="会员管理"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-user"></i></a></li> -->
                <li data-toggle="tooltip" data-placement="right" title="系统设置" class="active"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab" ><i class="fa fa-globe"></i></a></li>
            </ul>
        </div>
        <div class="sideber-content">
            <div class="tab-content">
                <!-- <div role="tabpanel" class="tab-pane active" id="home">
                    <h6>常用菜单</h6>
                    <ul>
                        <li><a href="#01" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>常用菜单</a>
                            <ul id="01" class="collapse in">
                                <li><a data-trigger="ajax" href="cltalog_main.html" target="mainFrame">栏目管理</a></li>
                                <li><a data-trigger="ajax" href="content_list.html" target="mainFrame">所有文档管理</a></li>
                                <li><a data-trigger="ajax" href="content_list.html" target="mainFrame">等待审核文档</a></li>
                                <li><a data-trigger="ajax" href="content_list.html" target="mainFrame">我发布的文档</a></li>
                                <li><a data-trigger="ajax" href="feedback.html" target="mainFrame">评论管理</a></li>
                                <li><a data-trigger="ajax" href="recycling.html" target="mainFrame">回收站</a></li>
                            </ul>
                        </li>
                        <li><a href="#02" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>内容中心</a>
                            <ul id="02" class="collapse">
                                <li  class="active"><a href="#" target="mainFrame">普通文章</a></li>
                                <li><a href="#" target="mainFrame">商品</a></li>
                                <li><a href="#" target="mainFrame">专题</a></li>
                            </ul>
                        </li>
                        <li><a href="#03" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>教材管理</a>
                            <ul id="03" class="collapse">
                                <li><a href="resources_list.html" target="mainFrame">全部资源</a></li>
                                <li><a href="#" target="mainFrame">全部试题</a></li>
                                <li><a href="#" target="mainFrame">全部试卷</a></li>
                            </ul>
                        </li>
                        <li><a href="#04" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>附件管理</a>
                            <ul id="04" class="collapse">
                                <li><a href="#" target="mainFrame">上传新文件</a></li>
                                <li><a href="#" target="mainFrame">附件数据管理</a></li>
                                <li><a href="#" target="mainFrame">文件夹式管理</a></li>
                            </ul>
                        </li>
                        <li><a href="#05" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>频道模型</a>
                            <ul id="05" class="collapse">
                                <li><a href="#" target="mainFrame">内容模型管理</a></li>
                                <li><a href="#" target="mainFrame">单页文档管理</a></li>
                                <li><a href="sys_stepselect_main.html" target="mainFrame">联动类别管理</a></li>
                                <li><a href="knowledge_list.html" target="mainFrame">知识点管理</a></li>
                                <li><a href="textbook_list.html" target="mainFrame">教材管理</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> -->
                <!-- <div role="tabpanel" class="tab-pane" id="profile">
                    <h6>模块/应用管理</h6>
                    <ul>
                        <li><a href="#06" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>模块管理</a>
                            <ul id="06" class="collapse">
                                <li><a href="#" target="mainFrame">模块管理</a></li>
                                <li><a href="#" target="mainFrame">上传新模块</a></li>
                                <li><a href="#" target="mainFrame">模块生成向导</a></li>
                            </ul>
                        </li>

                        <li><a href="#07" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>辅助插件</a>
                            <ul id="07" class="collapse">
                                <li><a href="erraddsave.html" target="mainFrame">挑错管理</a></li>
                                <li><a href="#" target="mainFrame">文件管理器</a></li>
                                <li><a href="#" target="mainFrame">广告管理</a></li>
                                <li><a href="friendlink_list.html" target="mainFrame">友情链接</a></li>
                                <li><a href="#" target="mainFrame">投票模块</a></li>
                                <li><a href="#" target="mainFrame">留言簿模块</a></li>
                                <li><a href="#" target="mainFrame">站内新闻发布</a></li>
                            </ul>
                        </li>
                        <li><a href="#08" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>UCenter模块</a>
                            <ul id="08" class="collapse">
                                <li><a href="#" target="mainFrame">UCenter配置</a></li>
                            </ul>
                        </li>
                        <li><a href="#09" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>邮件订阅</a>
                            <ul id="09" class="collapse">
                                <li><a href="#" target="mainFrame">会员邮件管理</a></li>
                                <li><a href="#" target="mainFrame">订阅期刊管理</a></li>
                                <li><a href="#" target="mainFrame">订阅分类管理</a></li>
                                <li><a href="#" target="mainFrame">群发期刊管理</a></li>
                                <li><a href="#" target="mainFrame">获取邮件地址</a></li>
                                <li><a href="#" target="mainFrame">邮件列表管理</a></li>
                            </ul>
                        </li>
                        <li><a href="#10" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>小组管理</a>
                            <ul id="10" class="collapse">
                                <li><a href="#" target="mainFrame">分类设置</a></li>
                                <li><a href="#" target="mainFrame">小组列表</a></li>
                                <li><a href="#" target="mainFrame">主题管理</a></li>
                            </ul>
                        </li>
                        <li><a href="#11" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>问答</a>
                            <ul id="11" class="collapse">
                                <li><a href="#" target="mainFrame">栏目管理</a></li>
                                <li><a href="#" target="mainFrame">问题管理</a></li>
                                <li><a href="#" target="mainFrame">回答管理</a></li>
                            </ul>
                        </li>
                        <li><a href="#12" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>组卷管理</a>
                            <ul id="12" class="collapse">
                                <li><a href="#" target="mainFrame">组卷分类</a></li>
                                <li><a href="#" target="mainFrame">试卷列表</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> -->
                <!-- <div role="tabpanel" class="tab-pane" id="messages">
                    <h6>会员管理</h6>
                    <ul>
                        <li><a href="#13" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>会员管理</a>
                            <ul id="13" class="collapse">
                                <li><a href="member_main.html" target="mainFrame">用户管理</a></li>
                                <li><a href="member_rank.html" target="mainFrame">会员模型管理</a></li>
                                <li><a href="member_level.html" target="mainFrame">会员级别管理</a></li>
                                <li><a href="member_level.html" target="mainFrame">积分头衔管理</a></li>
                                <li><a href="member_message_list.html" target="mainFrame">会员短信管理</a></li>
                                <li><a href="member_dynamic.html" target="mainFrame">会员留言管理</a></li>
                                <li><a href="member_sms_list.html" target="mainFrame">会员动态管理</a></li>
                                <li><a href="member_sms_list.html" target="mainFrame">会员心情管理</a></li>
                            </ul>
                        </li>
                        <li><a href="#14" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>支付工具</a>
                            <ul id="14" class="collapse">
                                <li><a href="member.html" target="mainFrame">会员产品分类</a></li>
                                <li><a href="member_class.html" target="mainFrame">会员消费记录</a></li>
                                <li><a href="member_level.html" target="mainFrame">商店订单记录</a></li>
                                <li><a href="member_level.html" target="mainFrame">支付接口设置</a></li>
                                <li><a href="member_message_list.html" target="mainFrame">配货方式设置</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> -->
                <div role="tabpanel" class="tab-pane active" id="settings">
                    <h6>系统设置</h6>
                    <ul>
                        <!-- <li><a href="sys_set.html" target="mainFrame"><span></span>全局参数设置</a></li> -->
                        <li><a href="${webRoot}/admin/userList" target="mainFrame"><span></span>系统用户管理</a></li>
                        <li><a href="${webRoot}/person/userList" target="mainFrame"><span></span>个人用户管理</a></li>
                        <li><a href="${webRoot}/companyInfo/toCompanyList" target="mainFrame"><span></span>商户管理</a></li>
                        <li><a href="${webRoot}/appInfo/toAppInfoList" target="mainFrame"><span></span>应用管理</a></li>
                        <li><a href="${webRoot}/companyRole/toCompanyRoleList" target="mainFrame"><span></span>系统角色管理</a></li>
                        <!-- <li><a href="sys_stepselect_main.html" target="mainFrame"><span></span>联动枚举</a></li>
                        <li><a href="sys_dictionary.html" target="mainFrame"><span></span>图片水印设置</a></li>
                        <li><a href="sys_custom.html" target="mainFrame"><span></span>自定义文档属性</a></li>
                        <li><a href="sys_dictionary.html" target="mainFrame"><span></span>数据库备份/还原</a></li>
                        <li><a href="sys_log.html" target="mainFrame"><span></span>系统日志</a></li>
                        <li><a href="#15" data-toggle="collapse"><span><i class="fa fa-caret-right"></i></span>批量维护</a>
                            <ul id="15" class="collapse">
                                <li><a href="#" target="mainFrame">文档批量维护</a></li>
                                <li><a href="#" target="mainFrame">搜索关键词维护</a></li>
                                <li><a href="#" target="mainFrame">文档关键词维护</a></li>
                                <li><a href="#" target="mainFrame">重复文档检测</a></li>
                                <li><a href="#" target="mainFrame">自动摘要|分页</a></li>
                                <li><a href="#" target="mainFrame">TAG标签管理</a></li>
                            </ul>
                        </li> -->
                    </ul>
                </div>
            </div>
        </div>

        <div class="sidebar-navbar-collapse">
            <div class="product-navbar-collapse-bg"></div>
            <div class="product-navbar-collapse">
                <span class="fa fa-caret-left "></span>
                <span class="fa fa-caret-right hidden"></span>
            </div>
        </div>
    </div>


    <div class="main-content">
        <iframe src="${webRoot}/admin/main" class="frame_class" name="mainFrame" frameborder="0"></iframe>
    </div>


</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${webRoot}/res/common/js/jquery.min.js"></script>
<script src="${webRoot}/res/common/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="res/common/js/vendor/holder.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="res/common/js/ie10-viewport-bug-workaround.js"></script>
<script src="res/common/js/browser.js" type="text/javascript"></script>
<script src="https://cdn.bootcss.com/jQuery-slimScroll/1.3.6/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- jQuery UI -->
<script src="res/common/js/jquery-ui.min.js"></script>
<!-- GITTER -->
<script src="res/common/js/gritter/jquery.gritter.min.js"></script>
<script>
    $(document).ready(function () {
/*         setTimeout(function () {
            $.gritter.add({
                title: '您有2条未读信息',
                text: '请前往<a href="mailbox.html" class="text-warning">收件箱</a>查看今日任务',
                time: 10000
            });
        }, 2000); */
    });
    $('[placeholder]').focus(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
            input.val('');
            input.removeClass('placeholder');
        }
    }).blur(function() {
        var input = $(this);
        if (input.val() == '' || input.val() == input.attr('placeholder')) {
            input.addClass('placeholder');
            input.val(input.attr('placeholder'));
        }
    }).blur();
    $('[placeholder]').parents('form').submit(function() {
        $(this).find('[placeholder]').each(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
            }
        })
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
    $("#ajax_target").load("main.html");
    $(".sideber-content").slimScroll({
        position: 'right',
        width:"230px",
        height: '100%',
        distance: '2px',
        railColor: '#222',
        railOpacity: 0,
        railVisible: true,
        alwaysVisible: true
    });
</script>
</html>