<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="static/css/mycss.css">
</head>
<body class="backgroundimg">
<nav>
    <a href="#"><img src="" alt="书阅"></a>
    <a href="#" class="active">首页</a>
</nav>
<div class="container">
    <div class="login">
        <form  action="login" method="post">
            <div class="logintable">
                <input type="text" name="name" class="hiddleinput" placeholder="账号">
                <hr>
                <input type="password" name="password" class="hiddleinput" placeholder="密码">
                <hr>
                <button type="submit" class="button bigbutton">登录</button>

                <a href="registerpage" class="smalltext">没有账号？快速注册</a>
            </div>

        </form>
    </div>
</div>
</body>
</html>
