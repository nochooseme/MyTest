<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>作者专区</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <li ><a href="write" class="mainleftactive">作品管理</a></li>
                <li><a href="#">数据统计</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="maintop">
                	作品信息
            </div>
            <div class="maincard">
            	<form action="updatebookpic" method="post">
            	<input type="hidden" name="id" value="${result.id }">
            		<img src="../${result.bookPic }" name="bookPic">
            		<input type="file">
            	</form>
                <form action="../updatebook" method="post">
                	<input type="hidden" name="id" value="${result.id }">
                	<table>
                        <tr>
                            <td>作品名：</td>
                            <td>
                                <input type="text" name="bookName" value="${result.bookName}">
                            </td>
                        </tr>
                        <tr>
                            <td>作品类型：</td>
                            <td>
                                <select name="category">
                                    <option value="xiaoshuo">小说</option>
                                    <option value="qita">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>作品简介：</td>
                            <td>
                                <textarea name="bookBrief" value="${result.bookBrief }"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="button" type="submit">修改</button> </td>
                        </tr>
                    </table>
                </form>
            </div>
            
        </div>
    </div>
</div>
</body>
</html>
