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
                作者管理
            </div>
            <div class="maincard">
            <form action="searchAuthor" method="post">
            	
            	<input type="text" placeholder="按作者名查找" name="param">
            	<input type="text" placeholder="按账号查找" name="param1">
            	分类：
            	<select name="type">
            		<option value="2">已审核</option>
            		<option value="1">未审核</option>
            	</select>
            	<input type="submit" value="查找">
            </form>
            	
            </div>
                <table class="richtable">
                	<tr>
                		<th>作者名</th>
                		<th>账号</th>
                		<th>状态</th>
                		<th>操作</th>
                	</tr>
                	<c:forEach items="${authorList.selectresult}" var="a">
                		<tr>
                			<td>${a.username}</td>
                			<td>${a.name}</td>
                			<td>${b.status }</td>
                			<td>
                				<a href="#">编辑</a>
                				<a href="#">删除</a>
                			</td>
                		</tr>
                	</c:forEach>
                </table>
            
    </div>
</div>
</body>
</html>
