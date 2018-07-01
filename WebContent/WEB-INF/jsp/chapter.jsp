<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
    <meta charset="UTF-8">
    <title>${chapterContent.chapterName }</title>
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
        <a href="#">作者专区</a>
        <a href="#">消息</a>
        <a href="#">用户</a>
    </div>
</nav>
<div class="container">
    <div class="readpage">
        <h3>${chapterContent.chapterName }</h3>
        <div>
            ${chapterContent.content }
        </div>

    </div>
    <div class="center">
        <ul>
            <li ><a href="${pChapter.id }">${pChapter.chapterName }</a></li>
            <li ><a href="${nChapter.id }">${nChapter.chapterName }</a></li>
        </ul>
    </div>

</div>
</body>
</html>