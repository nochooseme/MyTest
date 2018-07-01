<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>书阅</title>
        <link type="text/css" href="http://localhost:8080/shuyue/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="http://localhost:8080/shuyue/static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="http://localhost:8080/shuyue/static/css/theme.css" rel="stylesheet">
        <link type="text/css" href="http://localhost:8080/shuyue/static/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
              rel='stylesheet'>
    </head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i></a><a class="brand" href="../index">书阅 </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li ><a href="../index">首页</i></a></li>
                    <li><a href="../search">搜索</a></li>
                </ul>             
                <ul class="nav pull-right">
                    <li class="active"><a href="writeInfo">作者专区 </a></li>
                    <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="userInfo">个人中心</a></li>
                            <li><a href="bookShelf">我的书架</a></li>
                            <li><a href="readed">阅读记录</a></li>                          
                            <li class="divider"></li>
                            <li><a href="javascript:void(0)" onclick="logout()">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
    </div>
    <!-- /navbar-inner -->
</div>
<!-- /navbar -->
<div class="wrapper" style="min-height: 500px;">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li class="active"><a href="writeInfo">作者信息
                        </a></li>
                        <li><a href="bookmanager">作品管理</a>
                        </li>

                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">

                    <div class="module message">
                        <div class="module-head">
                            <h3>编辑章节</h3>
                        </div>
                        <form class="form-horizontal row-fluid" action="http://localhost:8080/shuyue/updatechapter" method="post">
                        <input type="hidden" name="id" value="${result.id }">
                        <input type="hidden" name="upresult" id="upresult" value="${upresult}">
                        <input type="hidden" name="bookId" value="${bid }">
                            <div class="control-group">
                                <label class="control-label" >章节名</label>
                                <div class="controls">
                                    <input type="text" id="basicinput1" name="chapterName" value="${result.chapterName }" placeholder="输入章节名" class="span11">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" >正文</label>
                                <div class="controls">
                                    <textarea class="span11" rows="15" placeholder="输入正文" name="content">${result.content }</textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn">修改</button>
                                </div>
                            </div>
                        </form>
                        <div class="module-foot">
                        </div>
                    </div>

                </div><!--/.content-->
            </div>
            <!--/.content-->
        </div>
        <!--/.span9-->
    </div>
</div>
<!--/.container-->
</div>
<!--/.wrapper-->
<div class="footer">
    <div class="container">
        <b class="copyright">&copy; 2018 书阅</b>
    </div>
</div>
<script src="http://localhost:8080/shuyue/static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/scripts/common.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/js/logout.js" type="text/javascript"></script>
<script src="http://localhost:8080/shuyue/static/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
if($("#upresult").val()!=''){
	layer.open({
		  title: '结果'
		  ,content: $("#upresult").val()
		}); 
}

</script>
</body>
