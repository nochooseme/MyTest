<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>作者</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="../static/css/mycss.css">
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
        	<div>
        		
        	</div>
            <div class="circle">
                <img src="" alt="用户" class="userimg">
            </div>
        </div>
        <div class="card">
            <div class="nav">
                <ul>
                    <li ><a href="#" class="active">全部作品</a> </li>
                </ul>
            </div>
            <hr/>
            <div class="card">
				<c:forEach items="${ authorBook}" var="rs" >
			        <div class="bookcard searchbook">
			            <div class="bookinfo">
			                <a href="bookinfo/${rs.id}"><span class="name">${rs.bookName }</span></a>
			                <span class="category">${rs.category }</span>
			                <div class="newchapter">
			                    <span>最新章节：<a class="chapter" href="chapter/${rs.newChapter }">${rs.newChapterName }</a></span>
			                </div>
			            </div>
			            <div class="bookimg">
			                <img src="../${rs.bookPic }" alt="测试" class="bookimg">
			            </div>
			            <div class="bookintroduction">
			                ${rs.bookBrief}
			            </div>
			        </div>
        </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
