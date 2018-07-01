<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理中心</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="static/css/mycss.css">
</head>
<body>
<nav>
    <a href="#"><img src="" alt="书阅"></a>
    <a href="#">首页</a>
    <a href="#">分类</a>
    <div class="search">
        <input type="text" class="text" placeholder="搜索书籍或作者...">
        <input type="button" class="searchbutton" value="→">
    </div>
    <div class="userinfo">
        <a href="#">作者专区</a>
        <a href="#">消息</a>
        <a href="#">用户</a>
    </div>
</nav>
<div class="container">
    <div class="management">
        <div class="mainleft">
            <ul>
                <li><a href="#" class="mainleftactive">编辑管理</a></li>
                <li><a href="">用户管理</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="maintop">
                	编辑管理
            </div>
            <div class="maincard">
            <div>
            	<a href="addEditPage" class="button">新增编辑</a>
            </div>
            	 <table class="richtable">
                	<tr>
                		<th>昵称</th>
                		<th>账号</th>
                		<th>邮箱</th>
                		<th>操作</th>
                	</tr>
                	<c:forEach items="${result}" var="u">
                		<tr>
                			<td>${u.username}</td>
                			<td>${u.name}</td>
                			<td>${u.email }</td>
                			<td>
                				<a href="delEdit?id=${u.id }">删除</a>
                			</td>
                		</tr>
                	</c:forEach>
                </table>
    		</div>
</div>
</body>
</html>
