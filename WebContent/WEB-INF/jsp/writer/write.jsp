<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>作者专区</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                作品管理
            </div>
            <div class="maincard">
                <a class="button" href="addbookpage">创建作品</a>
            </div>
            <table class="richtable">
                <th>书名</th>
                <th>最新章节</th>
                <th>分类</th>
                <th>状态</th>
                <th>操作</th>
                <c:forEach items="${myBook }" var="b">
                	<tr>
                		<td><a href="bookchapter/${b.id }">${b.bookName }</a></td>
                		<td><a href="chapter/${b.newChapter }">${b.newChapterName }</a></td>
                		<td>${b.category}</td>
                		<td>${b.status }</td>
                		<td><a href="bookInfo/${b.id }">编辑</a></td>
                	</tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
