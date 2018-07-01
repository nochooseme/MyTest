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
                    <li class="active"><a href="search">搜索</a></li>
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
<form id="form" action="search" method="post">
    <input  id="page" type="hidden" value="${result.page}" name="page">
    <input  id="param1" type="hidden" value="${param.param1}" name="param1">


<div class="wrapper" style="min-height: 500px;">
    <div class="container">
        <div class="row">

            <div class="span9">
                <div class="content">
                <div class="pull-left" style="margin: 0 20px;">

                            <div>
                                <div class="navbar-search pull-left input-append">
                                    <input type="text" class="span3" id="param" name="param" value="${param.param}">
                                    <button class="btn" type="button" onclick="search()">
                                        <i class="icon-search"></i>
                                    </button>
                                </div>


                            </div>

                        </div>
                    <div class="module">
                     
                        <div class="module-body">
                            <ul class="profile-tab nav nav-tabs">
                                    <li class="${(param.param1=='' || param.param1==null)?'active':'' }"><a href="javascript:void(0)" onclick="thetype('')" data-toggle="tab">全部</a></li>
                                    <li class="${param.param1=='文学'?'active':'' }"><a href="javascript:void(0)" onclick="thetype('文学')" data-toggle="tab">文学</a></li>
                                    <li class="${param.param1=='小说'?'active':'' }"><a href="javascript:void(0)" onclick="thetype('小说')" data-toggle="tab">小说</a></li>
                                    <li class="${param.param1=='教育'?'active':'' }"><a href="javascript:void(0)" onclick="thetype('jiaoyu')" data-toggle="tab">教育</a></li>
                                    <li class="${param.param1=='其他'?'active':'' }"><a href="javascript:void(0)" onclick="thetype('qita')" data-toggle="tab">其他</a></li>
                                </ul>


                        </div>
                    </div>
					<c:forEach items="${result.selectresult}" var="b">
                      <div class="module">
                                <div class="module-body">
                                    <div class="profile-head media">
                                        <a href="#" class=" pull-left">
                                        <img src="${b.bookPic }" style="width:100px;height:150px;"></a>
									   <div class="media-body">
                                        <h4>
                                            <a href="bookinfo/${b.id }">${b.bookName }</a><small><a href="author/${b.bookAuthorId }">${b.authorName }</a></small>
                                        </h4>
                                        <p class="profile-brief">
                                            ${b.bookBrief}
                                        </p>

                                        <div class="profile-details muted">
                                            <a href="bookinfo/${b.id }" class="btn"><i class="icon-plus shaded"></i>查看详情 </a>
                                        </div>
                                        </div>
                                    </div>

                                    </div>

                                </div>
                   
                    </c:forEach>
					<div class="module-foot">
                        	<div class="pagination pagination-centered">
                                    <ul>
                                    <c:if test="${result.page !=1}">
                                     <li><a href="javascript:void(0)" onclick="page(0)"><i class="icon-angle-left"></i></a></li>
                                    </c:if>
                                       
                                        	当前：第${result.page }页/共${result.allpage}页
                                     <c:if test="${result.page !=result.allpage}">
                                        <li><a href="javascript:void(0)" onclick="page(1)"><i class="icon-angle-right"></i></a></li>
                                     </c:if>
                                    </ul>
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
<script src="static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">
	function search(){
		$("#page").val(1);
		$("#form").submit();
	}
	function thetype(category){
		$("#page").val(1);
		$("#param1").val(category);
		$("#form").submit();
	}
	function page(type){
		if(type==0){
			$("#page").val(parseInt($("#page").val())-1);
		}
		if(type==1){
			$("#page").val(parseInt($("#page").val())+1);
		}
		$("#form").submit();
	}
</script>

</body>
