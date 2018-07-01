<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="avtive"><a href="../edit">编辑中心</a></li>
                </ul>
                <ul class="nav pull-right">
                    <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../<%=session.getAttribute("userPic") %>" class="nav-avatar" />
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)" onclick="logout1()">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
    </div>
    <!-- /navbar-inner -->
</div>
<div class="wrapper" style="min-height: 500px;">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li ><a href="../edit">作品管理
                        </a></li>
                        <li class="active" ><a href="../searchAuthor" style="background-color:white;">作者管理</a>
                        </li>
                        <li ><a href="../searchbook">作品审核</a></li>
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">

                    <div class="module">
                        <div class="module-head">
                            <h3>作者信息</h3>
                        </div>
                        <div class="module-body">
                            <br />

                            <form class="form-horizontal row-fluid" action="../updateauhtorlevel" mrthod="post">
                            <input type="hidden" value="${result.id}" name="id">
                                <div class="control-group">
                                    <label class="control-label" for="basicinput">用户名</label>
                                    <div class="controls">
                                        <input type="text" id="basicinput1" placeholder="输入新用户名" class="span8" value="${result.username}" name="username"disabled>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="basicinput">账号</label>
                                    <div class="controls">
                                        <input type="text" id="basicinput" placeholder="账号" class="span8"  value="${result.name}" name="name" disabled>
                                        
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="basicinput">等级</label>
                                    <div class="controls">
                                        <select tabindex="1" data-placeholder="Select here.." class="span8" name="level">
                                            <option value="1" ${result.level==1?'selected':''}>lv 1</option>
                                            <option value="2" ${result.level==2?'selected':''}>lv 2</option>
                                            <option value="3" ${result.level==3?'selected':''}>lv 3</option>
                                            <option value="4" ${result.level==4?'selected':''}>lv 4</option>
                                            <option value="5" ${result.level==5?'selected':''}>lv 5</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="basicinput">手机号</label>
                                    <div class="controls">
                                        <input  type="text" placeholder="输入新手机"  class="span8 tip" value="${result.phone}" name="phone" disabled>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="basicinput">银行卡号</label>
                                    <div class="controls">
                                        <input  type="text" placeholder="输入银行卡号"  class="span8 tip" value="${result.bankCard}" name="bankCard" disabled>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
                </div><!--/.content-->
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
<script src="../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="../static/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="../static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="../static/scripts/common.js" type="text/javascript"></script>
<script src="../static/js/logout.js" type="text/javascript"></script>

</body>
