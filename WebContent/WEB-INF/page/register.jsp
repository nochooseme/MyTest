<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>书阅</title>
	<link type="text/css" href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="static/css/theme.css" rel="stylesheet">
	<link type="text/css" href="static/images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index">
			  		书阅
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

						<li><a href="loginpage">
							登录
						</a></li>
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper" style="min-height:500px;">
		<div class="container">
			<div class="row">
				<div class="module  span6 offset3">
				<div class="module">
                                    <div class="module-head">
                                        <h3>用户注册</h3>
                                    </div>
                                    <div class="module-body">
                                        <br />
                                        
				<form:form class="form-horizontal row-fluid" modelAttribute="user" action="register" method="post" >
											<div class="control-group">
                                                <label class="control-label" for="basicinput">账号</label>
                                                <div class="controls">
                                                    <input type="text" id="basicinput" placeholder="账号" class="span8" name="name">
                                                    <span class="help-inline">账号长度必须在5-20之间</span>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">密码</label>
                                                <div class="controls">
                                                    <input type="password" id="basicinput" placeholder="输入密码" class="span8" name="password">
                                                    <span class="help-inline">密码长度必须在5-20之间</span>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">用户名</label>
                                                <div class="controls">
                                                    <input type="text" id="basicinput1"  placeholder="输入新用户名" class="span8" name="username">
                                                    <span class="help-inline">用户名不能为空</span>
                                                </div>
                                            </div>

                                            

                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">邮箱</label>
                                                <div class="controls">
                                                    <input  type="email" placeholder="输入新邮箱" class="span8 tip" name="email">
                                                </div>
                                            </div>


                                            <div class="control-group">
						                        <label class="control-label" for="basicinput">性别</label>
						                        <div class="controls">
						                            <select tabindex="1" data-placeholder="选择性别" class="span8" name="sex">
						                                <option value="1">男</option>
						                                <option value="0">女</option>
						                            </select>
						                        </div>
						                    </div>



                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">个人简介</label>
                                                <div class="controls">
                                                    <textarea class="span8" rows="5" name="brief"></textarea>
                                                </div>
                                            </div>
											<div class="control-group">
                                                <div class="controls" >
                                                    <form:errors path="*" style="color:red;"></form:errors>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <button type="submit" class="btn">注册</button>
                                                </div>
                                            </div>
                                            
                                        </form:form>
                                        </div>
                                        </div>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2018 书阅</b>
		</div>
	</div>
	<script src="static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>