<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AdminPage</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
</head>
<body style="height: 100%;">
<% if(request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) response.sendRedirect("/admin/loginPage"); %>
<form name="icform" method="post"></form>
<div class="container-fluid" style="height: 100%; margin: 0; padding: 0;">
<nav class="navbar navbar-inverse" style="border-radius: 0; margin-bottom: 0; position: relative;">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">C语言课程自动组卷后台管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <%
                        if (session.getAttribute("id") == null) {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a type="button" class="btn btn-link navbar-btn" data-toggle="modal" data-target="#myModal">登录</a>
                        <a type="button" class="btn btn-link navbar-btn" data-toggle="modal" data-target="#myModal2">注册</a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="btn-group" role="group" aria-label="...">
                        <a href="#" type="button" class="btn btn-link navbar-btn"><%=session.getAttribute("realName")%></a>
                        <a href="${ctx}/logout" class="btn btn-link navbar-btn">注销</a>
                    </div>
                    <%
                        }
                    %>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
    <div style="width: 150px; background: #718093; float: left; height: 100%; margin-top: -50px; padding-top: 50px;">
        <div style="margin: auto; text-align: center;">
            <button class="btn btn-link" style="color: #FFFFFF; margin-top: 10px;" href="javascript:" onclick="formSubmit('/questionsPage','mframe');this.blur();">题库管理</button>
            <button class="btn btn-link" style="color: #FFFFFF;" href="javascript:" onclick="formSubmit('/papersPage','mframe');this.blur();">试卷管理</button>
        </div>
    </div>
    <div style="margin-left: 150px; height: 100%; margin-top: -50px; padding-top: 50px;">
        <iframe name="mframe" id="mframe" width="100%" src="/questionsPage" style="height: 100%;" frameborder="0"></iframe>
    </div>
    <div style="clear: both;"></div>
</div>
<%--<div style="border: 1px solid red;">--%>
    <%--<div style="background: gainsboro; height: 100%; width: 150px; position: absolute; top: 50px;">--%>
        <%--<a href="javascript:" onclick="formSubmit('/questionsPage','mframe');this.blur();">题库管理</a>--%>
        <%--<br>--%>
        <%--<a href="javascript:" onclick="formSubmit('/papersPage','mframe');this.blur();">试卷管理</a>--%>
    <%--</div>--%>
    <%--<div style="border: 1px solid blue; width: 100%; height: 100%; position: absolute; top: 50px; left: 150px;">--%>
        <%--<iframe name="mframe" id="mframe" width="100%" style="height: 100%;" frameborder="0"></iframe>--%>
    <%--</div>--%>
<%--</div>--%>
<script>
    function formSubmit(url, sTarget) {
        document.forms[0].target = sTarget;
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }
</script>
</body>
</html>