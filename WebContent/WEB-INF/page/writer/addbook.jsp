<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>书阅</title>
        <link type="text/css" href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="static/css/theme.css" rel="stylesheet">
        <link type="text/css" href="static/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
              rel='stylesheet'>
    </head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i></a><a class="brand" href="index">书阅 </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li ><a href="index">首页</i></a></li>
                    <li><a href="search">搜索</a></li>
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
                    <ul class="widget widget-menu unstyled" style="background-color:white;">
                        <li class="active" style="background-color:white;"><a href="writeInfo"  >作者信息
                        </a></li>
                        <li><a href="bookmanager" style="background-color:white;">作品管理</a>
                        </li>


                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">

                    <div class="module">
                        <div class="module-head">
                            <h3>新建作品</h3>
                        </div>
                        <div class="module-body">
                            <br />

                            <form class="form-horizontal row-fluid"  id="form" >
                                <div class="control-group">
                                    <label class="control-label" for="basicinput1">作品名</label>
                                    <div class="controls">
                                        <input type="text" id="bookName" placeholder="输入作品名" name="bookName" class="span8">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="basicinput1">分类</label>
                                    <div class="controls">
                                        <select tabindex="1" name="category" id="category" data-placeholder="Select here.." class="span8">
                                            <option value="小说">小说</option>
                                            <option value="文学">文学</option>
                                            <option value="教育">教育</option>
                                            <option value="其他">其他</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">作品简介</label>
                                    <div class="controls">
                                        <textarea class="span8" rows="5" id="bookBrief" name="bookBrief"></textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="button" onclick="doaddbook()" class="btn" value="保存">
                                    </div>
                                </div>
                            </form>
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
<script src="static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="static/scripts/common.js" type="text/javascript"></script>
<script src="static/layer/layer.js" type="text/javascript"></script>
<script src="static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">
function doaddbook(){
	var json=$("#form").serializeArray();
	var json2={bookName:$("#bookName").val(),category:$("#category").val(),bookBrief:$("#bookBrief").val()};
	$.ajax({
		async:false,
		type:"post",
		url:"ajaxaddbook",
		data:JSON.stringify(json2),
		contentType:"application/json",
		success:function(data){
			layer.open({
				  title: '结果'
				  ,content: data.result
				}); 
			
		},
		error:function(data){
			layer.open({
				  title: '结果'
				  ,content: '发生错误'
				});
		}
	})
}
</script>
</body>
