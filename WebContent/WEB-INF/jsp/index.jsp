<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/css/mycss.css">
<title>首页</title>
</head>
<body>
    <nav>
        <a href="#"><img src="" alt="书阅"></a>
        <a href="index" class="active">首页</a>
        <a href="./all?page=1">分类</a>
        <div class="search">
        	<form action="search" method="post">
	        	<input type="text" class="text" placeholder="搜索书籍或作者..." name="param" >
	            <input type="submit" class="searchbutton" value="→">
        	</form>      
        </div>
        <div class="userinfo">
            <a href="write">作者专区</a>
            <a href="#">消息</a>
            <a href="userInfo"><%=session.getAttribute("userName") %></a>
        </div>
    </nav>
    <div class="container">
    <c:forEach items="${recommendbook}" var="l">
    	 <div class="booklist">
            <div class="bookcard">
                <span class="spantext">推荐书籍</span>
                <div class="bookinfo">
                    <span class="name"><a href="bookinfo/${l.id }">${l.bookName }</a></span>
                    <span class="category">${l.category}</span>
                    <a href="author/${l.bookAuthorId }"><span class="author">${l.authorName }</span></a>
                    <div class="newchapter">
                        <span>最新章节：<a class="chapter" href="chapter/${l.newChapter }">${l.newChapterName }</a></span>
                    </div>

                </div>
                <div class="bookimg">
                    <img src="${l.bookPic }" alt="测试" class="bookimg">
                </div>
                <div class="bookintroduction">
                    ${l.bookBrief}
                </div>
                <div>
                    <button class="button">免费试读</button><button class="button">查看目录</button><button class="button">加入书架</button>
                </div>
            </div>
    </c:forEach>
        
        <div class="usermanagement">
            <ul>
                <li><a href="userInfo">个人中心</a></li>
                <li><a href="#">我的书架</a></li>
                <li><a href="#">历史记录</a></li>
                <li><a href="edit">编辑中心</a></li>
                <li><a href="admin">管理中心</a></li>
            </ul>
        </div>
    </div>
</body>
</html>