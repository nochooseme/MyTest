<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍信息</title>
    <link rel="stylesheet" href="../static/css/mycss.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../static/js/bookinfo.js"></script>
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
    <div class="booklist">
        <div class="bookcard">
            <div class="bookinfo">
                <span class="name">${bookinfo.bookName }</span>
                <span class="category">${bookinfo.category }</span>
                <span class="author">${bookinfo.authorName }</span>
                <div class="newchapter">
                    <span>最新章节：<a class="chapter" href="../chapter/${l.newChapter }">${l.newChapterName }</a></span>
                </div>

            </div>
            <div class="bookimg">
                <img src="${bookinfo.bookPic}" alt="测试" class="bookimg">
            </div>
            <div class="bookintroduction">
                ${bookinfo.bookBrief }
            </div>
            <div>
                <button class="button">免费试读</button><button class="button" onclick="updateBookShelf(${bookinfo.id})">加入书架</button>
            </div>
        </div>
        <div class="bookcard">
            <h2>目录</h2>
            <hr/>
            <ul>
            <c:forEach items="${bookcatalog.selectresult}" var="c">
            	<li><a href="../chapter/${c.id}" class="chapter">${c.chapterName }</a></li>
            </c:forEach>
            </ul>
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