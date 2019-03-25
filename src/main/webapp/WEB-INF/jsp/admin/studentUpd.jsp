<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QuestionPage</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style type="text/css">
        .form-group {
            height: 27px;
        }
    </style>
</head>
<body>
<div class="container" style="padding: 20px;">
    <a href="#" onclick="history.back()">返回</a>
    <div style="width: 500px; margin: auto;">
        <form  class="form-horizontal" action="${ctx}/updateStudent" method="post">
            <input type="hidden" name="id" value="${student.id}">
            <div class="form-group">
                <label for="chapter" class="col-sm-2 control-label">年段</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="chapter" name="chapter" value="1" ${student.chapter == 1 ? "checked" : ""}> 小学</label>
                        <label><input type="radio" name="chapter" value="2" ${student.chapter == 2 ? "checked" : ""}> 初中</label>
                        <label><input type="radio" name="chapter" value="3" ${student.chapter == 3 ? "checked" : ""}> 高中</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="section" class="col-sm-2 control-label">年级</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="section" name="section" value="1" ${student.section == 1 ? "checked" : ""}> 1</label>
                        <label><input type="radio" name="section" value="2" ${student.section == 2 ? "checked" : ""}> 2</label>
                        <label><input type="radio" name="section" value="3" ${student.section == 3 ? "checked" : ""}> 3</label>
                        <label><input type="radio" name="section" value="4" ${student.section == 4 ? "checked" : ""}> 4</label>
                        <label><input type="radio" name="section" value="5" ${student.section == 5 ? "checked" : ""}> 5</label>
                        <label><input type="radio" name="section" value="6" ${student.section == 6 ? "checked" : ""}> 6</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="studentNum" class="col-sm-2 control-label">学号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="studentNum" id="studentNum" value="${student.studentNum}" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="userName" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="userName" id="userName" value="${student.userName}" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="realName" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="realName" id="realName" value="${student.realName}" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" id="password" value="${student.password}" placeholder="">
                </div>
            </div>
            <div class="form-group" style="text-align: center; margin-top: 50px;"><input class="btn btn-info" style="width: 150px;" type="submit" value="提交"></div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>
</body>
</html>