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
</head>
<body>
<div>
    <div class="container" style="padding: 20px;">
        <c:if test="${message != null}">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Success!</strong> ${message}
            </div>
        </c:if>
        <c:if test="${error != null}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Error!</strong> ${error}
            </div>
        </c:if>
        <div style="margin-bottom: 10px;">
            <button class="btn btn-success" onclick="window.location.href='${ctx}/addQuestion'">添加</button>
            <button class="btn btn-danger" type="button" onclick="deleteQuestion()">删除</button>
            <button class="btn btn-info" data-toggle="modal" data-target="#myModal">导入</button>
        </div>
        <form id="allQuestions" action="${ctx}/deleteQuestion" method="post">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="num"></th>
                    <th class="name">ID</th>
                    <th class="name">章</th>
                    <th class="operate">节</th>
                    <th class="node">难度</th>
                    <th class="process">题干</th>
                    <th class="process">类型</th>
                    <th class="operate">操作</th>
                </tr>
                </thead>
                <tbody align="center">
                <c:forEach items="${questions}" var="question">
                    <tr align="center">
                        <td><input type="checkbox" name="id" value="${question.id}"/></td>
                        <td>${question.id}</td>
                        <td>${question.chapter}</td>
                        <td>${question.section}</td>
                        <td>
                            <c:if test="${question.level==1}">简单</c:if>
                            <c:if test="${question.level==2}">一般</c:if>
                            <c:if test="${question.level==3}">中等</c:if>
                            <c:if test="${question.level==4}">较难</c:if>
                            <c:if test="${question.level==5}">巨难</c:if>
                        </td>
                        <td>${question.body}</td>
                        <td>
                            <c:if test="${question.type==1}">单选</c:if>
                            <c:if test="${question.type==2}">多选</c:if>
                            <c:if test="${question.type==3}">判断</c:if>
                            <c:if test="${question.type==4}">填空</c:if>
                            <c:if test="${question.type==5}">问答</c:if>
                        </td>
                        <td class="operate">
                            <a href="${ctx}/deleteQuestion?id=${question.id}" class="del">删除</a>
                            <a href="${ctx}/updateQuestion?id=${question.id}" class="del">编辑</a>
                            <a href="${ctx}/queryQuestion?id=${question.id}" class="del">查看</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="/uploadQuestions" method="post" enctype="multipart/form-data" onsubmit="return checkFile();">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">上传Excel导入题库</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="excelFile">Excel 文件</label>
                        <input type="file" name="excelFile" id="excelFile">
                        <p class="help-block">请确保上传的Excel文件数据格式正确</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" style="width: 100px;" class="btn btn-primary">上传</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    function deleteQuestion() {
        var ids = "";
        $("input:checkbox[name='id']:checked").each(function () {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length - 1, ids.length);
        if (id === ",") {
            ids = ids.substring(0, ids.length - 1);
        }
        if (ids === "") {
            alert("请选择要删除的记录！");
            return;
        }
        $("#allQuestions").submit();
    }
    function checkFile() {
        var excelFile = $("#excelFile").val();
        if (excelFile === "" || excelFile.length === 0) {
            alert("请选择文件路径！");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>