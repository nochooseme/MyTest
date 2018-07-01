<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
    <meta charset="UTF-8">
    <title>分类</title>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="static/css/mycss.css">
</head>
<body>
<nav>
    <a href="#"><img src="" alt="书阅"></a>
    <a href="index" >首页</a>
    <a href="#" class="active">分类</a>
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

        <div class="bookcategory">
            <ul>
                <li class="active"><span>全部</span></li>
                <li><span>教育</span></li>
                <li><span>儿童</span></li>
                <li><span>小说</span></li>
                <li><span>其它</span></li>
            </ul>
        </div>
        <c:forEach items="${ result.selectresult}" var="rs" >
    		 <div class="bookcard">
            <div class="bookinfo">
                <span class="name">${rs.bookName }</span>
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
            <div>
                <button class="button">免费试读</button><button class="button">查看目录</button><button class="button">加入书架</button>
            </div>
        </div>
    	</c:forEach>
       
        <div class="paging">
            <ul>
            <c:if test="${result.page==1}">
            	<li><a href="javascript:return false;" style="cursor: default;">&lt;</a></li>
            </c:if>
            <c:if test="${result.page!=1}">
            	<li><a href="${result.param}?page=${result.page-1}">&lt;</a></li>
            </c:if>
            
            <c:if test="${result.all>50 }">  	
                <li ><a href="${result.param}?page=${result.page-2}">${result.page-2}</a></li>
                <li><a href="${result.param}?page=${result.page-1}">${result.page-1}</a></li>
                <li class="active"><a href="${result.param}?page=${result.page}">${result.page}</a></li>
                <li><a href="${result.param}?page=${result.page+1}">${result.page+1}</a></li>
                <li><a href="${result.param}?page=${result.page+2}">${result.page+2}</a></li>               
            </c:if>
            <c:forEach var="x" begin="1" end="${Math.ceil(result.all/10)}"> 
            	<c:if test="${result.page==x}">
            		<li ><a class="active" href="${result.param}?page=${x}">${x}</a></li>
            	</c:if>
            	<c:if test="${result.page!=x }">          	
            		<li><a href="${result.param}?page=${x}">${x}</a></li>
            	</c:if>
            </c:forEach>  
            <c:if test="${result.page==Math.ceil(result.all/10)}">
            	<li><a href="javascript:return false;" style="cursor: default;">&gt;</a></li>
            </c:if>
            <c:if test="${result.page!=Math.ceil(result.all/10)}">
            	<li><a href="${result.param}?page=${result.page+1}">&gt;</a></li>
            </c:if>          			            
            </ul>
            <input type="text"><button>GO</button>
            <span class="spanvalue">共${Math.ceil(result.all/10)}页</span>
        </div>
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