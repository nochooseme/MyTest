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
        <link type="text/css" href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/theme.css" rel="stylesheet">
        <link type="text/css" href="../static/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
              rel='stylesheet'>
    </head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i></a><a class="brand" href="../index">书阅 </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li ><a href="../index">首页</i></a></li>
                    <li ><a href="../search">搜索</a></li>
                </ul>             
                <ul class="nav pull-right">
                    <li><a href="../writeInfo">作者专区 </a></li>
                    <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../userInfo">个人中心</a></li>
                            <li><a href="../bookShelf">我的书架</a></li>
                            <li><a href="../readed">阅读记录</a></li>                          
                            <li class="divider"></li>
                            <li><a href="javascript:void(0)" onclick="logout2()">退出</a></li>
                        </ul>
                    </li>
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
                    <div class="module">
                        <div class="module-body">
                            <div class="profile-head media">
                                <a href="#" class=" pull-left">
                                    <img src="${authorInfo.userpic}" style="width:100px;height:150px;">
                                </a>
                                <div class="media-body">
                                    <h4>
                                        ${authorInfo.username }
                                    </h4>
                                    <p class="profile-brief">
                                 		 ${authorInfo.brief }
                                    </p>
                                </div>
                            </div>
                            <ul class="profile-tab nav nav-tabs">
                                <li class="active"><a href="#activity" data-toggle="tab">他的作品</a></li>

                            </ul>
                            <div class="profile-tab-content tab-content">
                            <div class="content">

                        <div class="module">

                            <div class="module-body">
                                <table class="table table-message">
                                <tr class="heading">
                                    <td class="cell-title">作品</td>
                                    <td class="cell-title">分类</td>
                                    <td class="cell-time align-right">操作</td>
                                </tr>
                                <c:forEach items="${authorBook}" var="b">
					            	<tr><td class="cell-title"><a href="../bookinfo/${b.id}" >${b.bookName }</a></td>
										<td class="cell-title">${b.category }</td>
										<td class="cell-time align-right"><a href="../bookinfo/${b.id}" >查看详情</a></td>
										</tr>
					            </c:forEach>                                  
                                </table>
                            </div>
                        </div>
                            </div>
                            </div>


                    </div><!--/.content-->
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
<script src="../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="../static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="../static/scripts/common.js" type="text/javascript"></script>
<script src="../static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">
	function bookshelf(bid){
		var json={id:bid,check:1};
		$.ajax({
			async:false,
			type:"post",
			url:"../updateBookShelf",
			data:JSON.stringify(json),
			contentType:"application/json",
			success:function(data){
				alert(data.result);
				location.reload();
			},
			error:function(data){
				alert("error!");
			}
		})
	}
</script>
</body>
