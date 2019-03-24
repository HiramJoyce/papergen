<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AdminLogin</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
<div>
    <nav class="navbar navbar-inverse" style="border-radius: 0;">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">C语言课程自动组卷系统</a>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
    <div class="container">
        <div class="panel panel-primary" style="width: 300px; margin: auto; border: 1px solid black;">
            <div class="panel-heading" style="background-color: #222222;">管理系统</div>
            <div class="panel-body" style="padding-bottom: 0;">
                <form action="${ctx}/admin/login" method="post">
                    <div class="form-group">
                        <label for="userName">用户名</label>
                        <input type="text" name="userName" class="form-control" id="userName" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="">
                    </div>
                    <div style="text-align: center;"><button class="btn btn-success" style="margin: auto; width: 150px;">登录</button></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctx}/resource/js/canvas-nest.js"></script>
</body>
</html>