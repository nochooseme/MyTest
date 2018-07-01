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
                    <li ><a href="index">首页</i></a></li>
                    <li class="active"><a href="admin">管理中心</i></a></li>
                </ul>
                <ul class="nav pull-right">
                    <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">

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
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li class="active"><a href="admin">编辑管理
                        </a></li>
                        <li  ><a href="searchuser">用户管理</a>
                        </li>
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">

                    <div class="module message">
                        <div class="module-head">
                            <h3>编辑管理</h3>
                        </div>
                        <div class="module-option clearfix">
                            <div class="pull-right">
                                <a href="searchUser" class="btn btn-primary">新增编辑</a>
                            </div>

                        </div>

                        <div class="module-body table">

                            <table class="table table-message">
                                <tbody>
                                <tr class="heading">
                                    <td class="cell-icon"></td>
                                    <td class="cell-title">用户名</td>
                                    <td class="cell-title">账号</td>
                                    <td class="cell-title">邮箱号</td>
                                    <td class="cell-time align-right">操作</td>
                                </tr>
                                <c:forEach items="${result}" var="u">
	                                <tr class="task">
	                                    <td class="cell-icon"><i class="icon-checker high"></i></td>
	                                    <td class="cell-title"><div><a>${u.username}</a></div></td>
	                                    <td class="cell-title"><div>${u.name}</div></td>
	                                    <td class="cell-title"><div>${u.email}</div></td>
	                                    <td class="cell-time align-right"><a href="delEdit/?id=${u.id}">删除</a></td>
	                                </tr>
								</c:forEach>
                                </tbody>
                            </table>


                        </div>
                        <div class="module-foot">
                       
                        </div>
                    </div>
                </div>
            </div>
            <!--/.span9-->
        </div>
    </div>
    <!--/.container-->
</div>
</form>
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
<script src="static/layer/layer.js" type="text/javascript"></script>
<script src="static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</body>