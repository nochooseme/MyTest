<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>作者专区</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="../static/css/mycss.css">
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
        <a href="#" class="active">作者专区</a>
        <a href="#">消息</a>
        <a href="#">用户</a>
    </div>
</nav>
<div class="container">
    <div class="management">
        <div class="mainleft">
            <ul>
                <li ><a href="#" class="mainleftactive">作品管理</a></li>
                <li><a href="#">数据统计</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="maintop">
                作品管理/书名
            </div>
            <div class="maincard">
                <a class="button" href="../addchapterpage?id=${result[0].bookId }">写新章节</a>
            </div>
            <table class="richtable">
               	<tr>
	                <th>章节名</th>
	                <th>状态</th>
	                <th>操作</th>
                </tr>
                <c:forEach items="${result }" var="b">
	                <tr>
	                	<td>${b.chapterName }</td>
	                	<td>${b.status }</td>
	                	<td><a href="../updatechapterpage/${b.id}">编辑</a>
	                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
