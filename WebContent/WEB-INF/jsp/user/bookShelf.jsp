<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户中心</title>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="static/css/mycss.css">
</head>
<body>
<nav>
    <a href="#"><img src="" alt="书阅"></a>
    <a href="#" >首页</a>
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
    <div class="width1000">
        <div class="user">
            <div class="circle">
                <img src="${userinfo.userpic }" alt="用户" class="userimg">
            </div>
        </div>
        <div class="card">
            <div class="nav">
                <ul>
                    <li ><a href="userInfo" >个人信息</a> </li>
                    <li><a href="bookShelf" class="active">我的书架</a> </li>
                    <li><a href="readed" >最近阅读</a> </li>
                    <li><a href="#">信息中心</a> </li>
                </ul>
            </div>
            <hr/>
              <div class="card">
            <table class="ui-table">
            	<tr>
            		<th>书名</th>
            		<th>阅读记录</th>
            		<th>操作</th>
            	</tr>
            	<c:forEach items="${bookShelf}" var="r">
            	<tr>
            	<td>${r.bookName }</td>
            	<td><a class="chapter normala">${r.newChapterName }</a></td>
            	<td><a class="normala">删除</a></td>
            	</tr>
                </c:forEach>
            </table>
                
            </div>
        </div>
    </div>
</div>
</body>
</html>
