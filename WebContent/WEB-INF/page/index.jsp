<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>书阅</title>
        <link type="text/css" href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="static/css/theme.css" rel="stylesheet">
        <link type="text/css" href="static/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
              rel='stylesheet'>
    </head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i></a><a class="brand" href="index">书阅 </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li class="active"><a href="index">首页</i></a></li>
                    <li><a href="search">搜索</a></li>
                </ul>             
                <ul class="nav pull-right">
                    <li><a href="writeInfo">作者专区 </a></li>
                    <c:if test="<%=session.getAttribute(\"userId\") ==null %>">
                    	<li><a href="loginpage">登录 </a></li>
                    	<li><a href="registerpage">注册 </a></li>
                    </c:if>
                    <c:if test="<%=session.getAttribute(\"userId\") !=null %>">
                    	<li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        
                            <li><a href="userInfo">个人中心</a></li>
                            <li><a href="bookShelf">我的书架</a></li>
                            <li><a href="readed">阅读记录</a></li>                          
                            <li class="divider"></li>
                            <li><a href="javascript:void(0)" onclick="logout()">退出</a></li>
                        </ul>
                    </li>
                    </c:if>
                    
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
    </div>
    <!-- /navbar-inner -->
</div>
<!-- /navbar -->
<div class="wrapper" style="min-height: 500px;">
    <div class="container">
        <div class="row">

            <div class="span9">
                <div class="content">
                 <c:forEach items="${recommendbook}" var="l">
                    <div class="module">
                        <div class="module-body">
                            <div class="profile-head media">
                                <a href="#" class="pull-left">
                                    <img src="${l.bookPic }" style="width:100px;height:150px;">
                                </a>
                                <div class="media-body">
                                    <h4>
                                        <a href="bookinfo/${l.id }">${l.bookName }</a><small><a href="author/${l.bookAuthorId }">${l.authorName }</a></small>
                                    </h4>
                                    <p class="profile-brief">
                                    	 ${l.bookBrief}
                                    </p>
                                    <div class="profile-details muted">
                                        <a href="bookinfo/${l.id }" class="btn">查看详情 </a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
		</c:forEach>
                   
                        </div>
                    </div>
                    <!--/.content-->
                </div>
                <!--/.span9-->
            </div>
        </div>
        <!--/.container-->
    </div>
</div>

<!--/.wrapper-->
<div class="footer">
    <div class="container">
        <b class="copyright">&copy; 2018 书阅</b>
    </div>
</div>
<script src="static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="static/scripts/common.js" type="text/javascript"></script>
<script src="static/js/logout.js" type="text/javascript"></script>

</body>
