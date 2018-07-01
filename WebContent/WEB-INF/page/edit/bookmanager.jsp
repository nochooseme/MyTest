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
                    <li class="active"><a href="edit">编辑中心</a></li>
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
                        <li class="active" ><a href="edit">作品管理
                        </a></li>
                        <li><a href="searchAuthor">作者管理</a>
                        </li>
                        <li ><a href="searchbook">作品审核</a></li>
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">
				<form id="form" action="edit" method="post">
				<input  id="page" type="hidden" value="${result.page}" name="page">
				
                    <div class="module message">
                        <div class="module-head">
                            <h3>作品管理</h3>
                        </div>
                        <div class="module-option clearfix">
                            <div class="pull-left">
                                
                                <div>
                                    <div class="navbar-search pull-left input-append">
                                    <input type="text" class="span3" name="param" value="${param.param}">
                                        <button class="btn" type="button" onclick="search()">
                                            <i class="icon-search"></i>
                                        </button>
                                    </div>
                                        
                                   
                                </div>

                            </div>

                        </div>

                        <div class="module-body table">

                            <table class="table table-message">
                                <tbody>
                                <tr class="heading">
                                    <td class="cell-icon"></td>
                                    <td class="cell-title">作品</td>
                                    <td class="cell-title">作者</td>
                                    <td class="cell-status hidden-phone hidden-tablet">状态</td>
                                    <td class="cell-time align-right">操作</td>
                                </tr>
                                <c:forEach items="${result.selectresult}" var="b">
	                                <tr class="task">
	                                    <td class="cell-icon"><i class="icon-checker high"></i></td>
	                                    <td class="cell-title"><div><a href="bookinfo/${b.id}">${b.bookName}</a></div></td>
	                                    <td class="cell-title"><div><a>${b.authorName }</a></div></td>
	                                    <c:if test="${b.status==2}">
	                                    	<td class="cell-status hidden-phone hidden-tablet" ><b class="due">推荐</b></td>
	                                    	<td class="cell-time align-right"><a href="javascript:void(0)" onclick="starbook(1,${b.id})">取消推荐</a></td>
	                                    </c:if>
	                                    <c:if test="${b.status==1}">
	                                    	<td class="cell-status hidden-phone hidden-tablet" ><b class="due">无</b></td>
	                                    	<td class="cell-time align-right"><a href="javascript:void(0)" onclick="starbook(2,${b.id})">推荐</a></td>
	                                    </c:if>
	                                </tr>
								</c:forEach>
                                </tbody>
                            </table>


                        </div>
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
                    </div>
                    </form>
                    </div>
            </div>
            <!--/.span9-->
        </div>
    </div>
    <!--/.container-->
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
<script src="static/layer/layer.js" type="text/javascript"></script>
<script src="static/js/logout.js" type="text/javascript"></script>
<script type="text/javascript">
	function page(type){
		var type=type;
		if(type==0){
			$("#page").val(parseInt($("#page").val())-1);
		}
		if(type==1){
			$("#page").val(parseInt($("#page").val())+1);
		}
		$("#form").submit();
	}
	function search(){
		$("#page").val(1);
		$("#form").submit();
	}
	function starbook(type,id){
		var json={check:type,id:id};
		$.ajax({
			async:false,
			type:"post",
			url:"starbook",
			data:JSON.stringify(json),
			contentType:"application/json",
			success:function(data){
				layer.open({
					  title: '结果'
					  ,content: data.result,
					  yes: function(index, layero){
						  location.reload();
						  layer.close(index);
					  }
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
