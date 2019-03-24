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
<div class="container" style="padding: 20px;">
    <a href="#" onclick="history.back()">返回</a>
    <div style="width: 500px; margin: auto;">
        <form  class="form-horizontal" action="/updateQuestion" method="post">
            <input type="hidden" name="id" value="${question.id}">
            <div class="form-group">
                <label for="chapter" class="col-sm-2 control-label">章</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="chapter" id="chapter" value="${question.chapter}" placeholder="请输入阿拉伯数字">
                </div>
            </div>
            <div class="form-group">
                <label for="section" class="col-sm-2 control-label">节</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="section" id="section" value="${question.section}" placeholder="请输入阿拉伯数字">
                </div>
            </div>
            <div class="form-group">
                <label for="level" class="col-sm-2 control-label">难度</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="level" name="level" value="1" ${question.level == 1 ? "checked" : ""}> 1</label>
                        <label><input type="radio" name="level" value="2" ${question.level == 2 ? "checked" : ""}> 2</label>
                        <label><input type="radio" name="level" value="3" ${question.level == 3 ? "checked" : ""}> 3</label>
                        <label><input type="radio" name="level" value="4" ${question.level == 4 ? "checked" : ""}> 4</label>
                        <label><input type="radio" name="level" value="5" ${question.level == 5 ? "checked" : ""}> 5</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="body" class="col-sm-2 control-label">题干</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="body" id="body" value="${question.body}" placeholder="${question.body}">
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-sm-2 control-label">类型</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="type" name="type" value="1" ${question.type == 1 ? "checked" : ""}> 单选</label>
                        <label><input type="radio" name="type" value="2" ${question.type == 2 ? "checked" : ""}> 多选</label>
                        <label><input type="radio" name="type" value="3" ${question.type == 3 ? "checked" : ""}> 判断</label>
                        <label><input type="radio" name="type" value="4" ${question.type == 4 ? "checked" : ""}> 填空</label>
                        <label><input type="radio" name="type" value="5" ${question.type == 5 ? "checked" : ""}> 问答</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="optionNum" class="col-sm-2 control-label" data-toggle="tooltip" data-placement="top" title="试卷中将根据选项数显示待选项">选项数<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span></label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="optionNum" name="optionNum" value="1" ${question.optionNum == 1 ? "checked" : ""}> 1</label>
                        <label><input type="radio" name="optionNum" value="2" ${question.optionNum == 2 ? "checked" : ""}> 2</label>
                        <label><input type="radio" name="optionNum" value="3" ${question.optionNum == 3 ? "checked" : ""}> 3</label>
                        <label><input type="radio" name="optionNum" value="4" ${question.optionNum == 4 ? "checked" : ""}> 4</label>
                        <label><input type="radio" name="optionNum" value="5" ${question.optionNum == 5 ? "checked" : ""}> 5</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="optionA" class="col-sm-2 control-label">选项A</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="optionA" id="optionA" value="${question.optionA}" placeholder="${question.optionA}">
                </div>
            </div>
            <div class="form-group">
                <label for="optionB" class="col-sm-2 control-label">选项B</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="optionB" id="optionB" value="${question.optionB}" placeholder="${question.optionB}">
                </div>
            </div>
            <div class="form-group">
                <label for="optionC" class="col-sm-2 control-label">选项C</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="optionC" id="optionC" value="${question.optionC}" placeholder="${question.optionC}">
                </div>
            </div>
            <div class="form-group">
                <label for="optionD" class="col-sm-2 control-label">选项D</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="optionD" id="optionD" value="${question.optionD}" placeholder="${question.optionD}">
                </div>
            </div>
            <div class="form-group">
                <label for="optionE" class="col-sm-2 control-label">选项E</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="optionE" id="optionE" value="${question.optionE}" placeholder="${question.optionE}">
                </div>
            </div>
            <div class="form-group">
                <label for="rightOption" class="col-sm-2 control-label">正确选项</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="checkbox" id="rightOption" name="rightOption" value="A" ${question.rightOption.contains("A") ? "checked" : ""}>A</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox" name="rightOption" value="B" ${question.rightOption.contains("B") ? "checked" : ""}>B</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox" name="rightOption" value="C" ${question.rightOption.contains("C") ? "checked" : ""}>C</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox" name="rightOption" value="D" ${question.rightOption.contains("D") ? "checked" : ""}>D</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox" name="rightOption" value="E" ${question.rightOption.contains("E") ? "checked" : ""}>E</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="rightJudge" class="col-sm-2 control-label">判断</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><input type="radio" id="rightJudge" name="rightJudge" value="true" ${question.rightJudge ? "checked" : ""}> 正确</label>
                        <label><input type="radio" name="rightJudge" value="false" ${!question.rightJudge ? "checked" : ""}> 错误</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="rightFilling" class="col-sm-2 control-label" data-toggle="tooltip" data-placement="top" title="填空题目前仅支持一个空">填空<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="rightFilling" id="rightFilling" value="${question.rightFilling}" placeholder="${question.rightFilling}">
                </div>
            </div>
            <div class="form-group">
                <label for="rightEssay" class="col-sm-2 control-label">问答</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="rightEssay" name="rightEssay" rows="3">${question.rightEssay}</textarea>
                </div>
            </div>
            <div class="form-group" style="text-align: center;"><input class="btn btn-info" style="width: 150px;" type="submit" value="提交"></div>
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