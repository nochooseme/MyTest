<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑中心</title>
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
                <li><a href="edit" >作品管理</a></li>
                <li><a href="#" class="mainleftactive">作者管理</a></li>
                <li><a href="#" >作品审核</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="maintop">
                编辑作者
            </div>
            <div class="maincard">
            	<form action="updateauthorlevel" method="post">
            		<table>
            		
            		<tr>
            			<td>账号：</td>
            			<td><input type="text" name="name" value=""></td>
            		</tr>
            		<tr>
            			<td>作者名：</td>
            			<td><input type="text" name="username" value=""></td>
            		</tr>
            		<tr>
            			<td>等级：</td>
            			<td>
	            			<select name="level">
	            				<option value="1">一级作者</option>
	            				<option value="2">二级作者</option>
	            				<option value="3">三级作者</option>
	            				<option value="4">四级作者</option>
	            				<option value="5">五级作者</option>
	            			</select>
            			</td>
            		</tr>
            		<tr>
            			<td><button class="button" type="submit">修改</button></td>
            		</tr>
            	</table>
            	</form>
            	
    		</div>
</div>
</body>
</html>
