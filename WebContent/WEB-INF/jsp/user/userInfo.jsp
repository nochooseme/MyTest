<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li ><a href="#" class="active">个人信息</a> </li>
                    <li><a href="bookShelf">我的书架</a> </li>
                    <li><a href="readed">最近阅读</a> </li>
                    <li><a href="#">信息中心</a> </li>
                </ul>
            </div>
            <hr/>
            <div class="card">
                <table>
                    <tr>
                        <td class="spantext">昵称：</td>
                        <td>${userinfo.username }</td>
                    </tr>
                    <tr>
                        <td class="spantext">账号：</td>
                        <td>${userinfo.name }</td>
                    </tr>
                    <tr>
                        <td class="spantext">邮箱：</td>
                        <td>${userinfo.email }</td>
                    </tr>
                    <tr>
                        <td class="spantext">性别：</td>
                        <td>
                            <select>
                                <option value="1" selected>男</option>
                                <option value="0">女</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="spantext">生日：</td>
                        <td>
                            <input type="date" value="${userinfo.birthday }">
                        </td>
                    </tr>
                    <tr>
                        <td class="spantext">简介:</td>
                        <td>
                            <textarea placeholder="简单的描述自己">
								${userinfo.brief }
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button class="button" type="submit">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
