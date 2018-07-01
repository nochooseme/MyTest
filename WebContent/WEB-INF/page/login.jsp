<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

						<li><a href="#">
							用户登录
						</a></li>

					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper" style="min-height:500px;">
		<div class="container">
			<div class="row">
				<div class="module module-login span5 offset4">
					<form class="form-vertical" action="login" method="post" id="loginform">
						<div class="module-head">
							<h3>登录</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" placeholder="请输入账号" name="name">
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="inputPassword" placeholder="请输入密码" name="password">
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									验证码：<img src="VerifyCode" alt="验证码" id="imgCode" onclick="reloadCode()" style="height:40px;width:100px;">
								</div>
								<div class="controls row-fluid">
									<input class="span4" type="text" id="verifycode" placeholder="请输入验证码" name="verifycode">
								</div>
								<div class="controls row-fluid">
									${result}
									${coderesult}
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="button" onclick="checkLoginNoNull()" class="btn btn-primary pull-left">登录</button>
									<a href="registerpage" class="btn btn-primary pull-right">注册</a>
								</div>
							</div>
						</div>
					</form>
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
	<script type="text/javascript">
	function reloadCode(){
	    var time = new Date().getTime();
	    document.getElementById("imgCode").src="VerifyCode?d=" + time;
	    }
	function checkLoginNoNull() {
	    if ($.trim($("#verifycode").val()) == "") {
	        alert("验证码不能为空！请重新输入！");
	        return false;
	    }else{
	    	$("#loginform").submit();
	    }
	}
	</script>
</body>