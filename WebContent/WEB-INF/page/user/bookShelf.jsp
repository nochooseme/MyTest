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
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
    </div>
    <!-- /navbar-inner -->
</div>
<!-- /navbar -->
<div class="wrapper" style="min-height: 500px;">
    <div class="container" >
        <div class="row">
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li>
								<a class="active" class="collapsed" data-toggle="collapse" href="#togglePages">
									<i class="menu-icon icon-cog"></i>
									<i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
									个人信息
								</a>
								<ul id="togglePages" class="collapse unstyled">
									<li>
										<a href="userInfo">
											<i class="icon-inbox"></i>
											信息修改
										</a>
									</li>
									<li>
										<a href="updatepswpage">
											<i class="icon-inbox"></i>
											修改密码
										</a>
									</li>							
								</ul>
							</li>
                        </a></li>
                        <li class="active"><a href="bookShelf"><i class="menu-icon icon-bullhorn"></i>我的书架 </a>
                        </li>
                        <li><a href="readed"><i class="menu-icon icon-inbox"></i>阅读记录 </a></li>

                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                    <div class="content">

                        <div class="module">
                            <div class="module-head">
                                <h3>我的书架</h3>
                            </div>
                            <div class="module-body">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>书名</th>
                                        <th>作者名</th>
                                        <th>阅读进度</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${bookShelf}" var="r">
                                    <tr>
                                        <td><a href="bookinfo/${r.id }">${r.bookName }</a></td>
                                        <td><a href="author/${r.bookAuthorId }">${r.authorName }</a></td>
                                        <td><a href="chapter/${r.newChapter }">${r.newChapterName }</a></td>
                                        <td><a href="javascript:void(0)" onclick="delshelf(${r.bsId})">删除</a></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                </div>
                <!--/.content-->
            </div>
            <!--/.span9-->
        </div>
    </div>
    <!--/.container-->
</div>
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
        <script src="static/layer/layer.js" type="text/javascript"></script>
        <script type="text/javascript">
        function delshelf(bsid){
        	var json={id:bsid};
        	$.ajax({
        		async:false,
        		type:"post",
        		url:"delshelf",
        		data:JSON.stringify(json),
        		contentType:"application/json",
        		success:function(data){
        			layer.open({
        				  title: '结果'
        				  ,content: data.result
        				}); 
        			
        		},
        		error:function(data){
        			layer.open({
        				  title: '结果'
        				  ,content: '发生错误'
        				});
        		}
        	})
        }
        </script>

</body>
