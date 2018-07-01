<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="static/css/mycss.css">
</head>
<body class="backgroundimg">
<nav>
    <a href="#"><img src="" alt="书阅"></a>
    <a href="#" class="active">首页</a>
</nav>
<div class="container">
    <div class="register">
        <form   action="register" method="post">
            <div class="logintable">
                <input type="text" name="name" class="hiddleinput" placeholder="账号">
                <hr>
                <input type="password" name="password" class="hiddleinput" placeholder="密码">
                <hr>
                <input type="password" name="password2" class="hiddleinput" placeholder="再次输入密码">
                <hr>
                <input type="text" name="email" class="hiddleinput" placeholder="邮箱">
                <hr>
                <input type="text" name="username" class="hiddleinput" placeholder="昵称">
                <hr>
                <button type="submit" class="button bigbutton">注册</button>
            </div>

        </form>
    </div>
</div>
</body>
</html>
