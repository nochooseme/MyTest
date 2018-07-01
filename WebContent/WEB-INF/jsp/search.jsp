<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="static/css/mycss.css">
    <title>搜索</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="../css/mycss.css">
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

    <div class="booklist margin20">
        <c:forEach items="${ result.selectresult}" var="rs" >
        <div class="bookcard searchbook">
            <div class="bookinfo">
                <a href="bookinfo/${rs.id}"><span class="name">${rs.bookName }</span></a>
                <span class="category">${rs.category }</span>
                <span class="author">${rs.authorName }</span>
                <div class="newchapter">
                    <span>最新章节：<a class="chapter" href="chapter/${rs.newChapter }">${rs.newChapterName }</a></span>
                </div>
            </div>
            <div class="bookimg">
                <img src="${rs.bookPic }" alt="测试" class="bookimg">
            </div>
            <div class="bookintroduction">
                ${rs.bookBrief}
            </div>
        </div>
        </c:forEach>
        
    </div>
</div>

<div class="usermanagement">
    <ul>
        <li><a href="#">个人中心</a></li>
        <li><a href="#">我的书架</a></li>
        <li><a href="#">历史记录</a></li>
    </ul>
</div>
</div>
</body>
</html>