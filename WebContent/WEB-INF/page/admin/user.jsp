<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>书阅</title>
        <link type="text/css" href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/theme.css" rel="stylesheet">
        <link type="text/css" href="../static/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='../http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
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
                    <li class="active"><a href="../admin">管理中心</i></a></li>
                </ul>
                <ul class="nav pull-right">
                    <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><a href="javascript:void(0)" onclick="logout1()">退出</a></li>
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
<!-- /navbar -->


<div class="wrapper" style="min-height: 500px;">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li class="active"><a href="../admin">编辑管理
                        </a></li>
                        <li  ><a href="../searchuser" style="background-color:white;">用户管理</a>
                        </li>
                      
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">
                        <div class="module-body">

                            <form class="form-horizontal row-fluid" action="../updateuser" method="post">
                            <input type="hidden" name="id" id="id" value="${user.id }">
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">用户名</label>
                                        <div class="controls">
                                            <input type="text" id="basicinput1" name="username" value="${user.username}" placeholder="输入新用户名" class="span8">
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">账号</label>
                                        <div class="controls">
                                            <input type="text" id="basicinput" value="${user.name}" placeholder="账号" class="span8" disabled>
                                            <span class="help-inline">账号不可修改！</span>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">密码</label>
                                        <div class="controls">
                                            <input type="button" class="btn" value="重置密码" onclick="resetpsw()">
                                            <span class="help-inline">重置后密码为："123456"</span>
                                        </div>
                                    </div>															
                                    
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">email</label>
                                        <div class="controls">
                                            <input  type="email" value="${user.email}" placeholder="输入新邮箱"  class="span8 tip" name="email">
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" class="btn">保存</button>
                                        </div>
                                    </div>
                                </form>


                        </div>
                        <div class="module-foot">
                        </div>
                    </div>
                </div>
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
<script src="../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="../static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="../static/scripts/common.js" type="text/javascript"></script>
<script src="../static/layer/layer.js" type="text/javascript"></script>
<script src="../static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">
	function resetpsw(){
		var json={id:$("#id").val()};
		$.ajax({
			async:false,
			type:"post",
			url:"../resetpsw",
			data:JSON.stringify(json),
			contentType:"application/json",
			success:function(data){
				layer.open({
					  title: '结果'
					  ,content: data.result,
					  yes: function(index, layero){
						  location.reload();
						  layer.close(index);
					  }
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