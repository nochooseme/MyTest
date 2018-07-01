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
                <li><a href="#" >作品管理</a></li>
                <li><a href="#">作者审核</a></li>
                <li><a href="#" class="mainleftactive">作品审核</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="maintop">
                作品管理
            </div>
            <div class="maincard">
            <form action="searchbook" method="post">
            	<input type="text" placeholder="按书名查找" name="param">
            	<input type="text" placeholder="按作者查找" name="param1">
            	分类：
            	<select name="param2">
            		<option value="">全部</option>
            		<option value="qita">其他</option>
            	</select>
            	<input type="submit" value="查找">
            </form>
            	
            </div>
                <table class="richtable">
                	<tr>
                		<th>作品名</th>
                		<th>分类</th>
                		<th>作者</th>
                		<th>状态</th>
                		<th>操作</th>
                	</tr>
                	<c:forEach items="${result.selectresult}" var="b">
                		<tr>
                			<td>${b.bookName}</td>
                			<td>${b.category}</td>
                			<td>${b.authorName }</td>
                			<td>${b.status }</td>
                			<td>
                				<a href="#">删除</a>
                				<a href="#">推荐</a>
                			</td>
                		</tr>
                	</c:forEach>
                </table>
            
    </div>
</div>
</body>
</html>
