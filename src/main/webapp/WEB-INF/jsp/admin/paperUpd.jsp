<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <c:if test="${error != null}">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>Error!</strong> ${error}
        </div>
    </c:if>
    <a href="#" onclick="history.back()">返回</a>
    <div>
        <div role="tabpanel" class="tab-pane" id="profile">
            <form class="form-horizontal" id="updatePaperForm" action="/addPaperHandle" method="post">
                <input type="hidden" name="paperId" value="${paper.id}">
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">试卷标题</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title" value="${paper.title}"
                               placeholder="${paper.title}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="chapter" class="col-sm-2 control-label">年段</label>
                    <div class="col-sm-10">
                        <div class="radio">
                            <label><input type="radio" id="chapter" name="chapter" value="1" ${paper.chapter == 1 ? "checked" : ""}>小学</label>
                            <label><input type="radio" name="chapter" value="2" ${paper.chapter == 2 ? "checked" : ""}> 初中</label>
                            <label><input type="radio" name="chapter" value="3" ${paper.chapter == 3 ? "checked" : ""}> 高中</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="section" class="col-sm-2 control-label">年级</label>
                    <div class="col-sm-10">
                        <div class="radio">
                            <label><input type="radio" id="section" name="section" value="1" ${paper.section == 1 ? "checked" : ""}> 1</label>
                            <label><input type="radio" name="section" value="2" ${paper.section == 2 ? "checked" : ""}> 2</label>
                            <label><input type="radio" name="section" value="3" ${paper.section == 3 ? "checked" : ""}> 3</label>
                            <label><input type="radio" name="section" value="4" ${paper.section == 4 ? "checked" : ""}> 4</label>
                            <label><input type="radio" name="section" value="5" ${paper.section == 5 ? "checked" : ""}> 5</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="subject" class="col-sm-2 control-label">科目</label>
                    <div class="col-sm-10">
                        <div class="radio">
                            <label><input type="radio" id="subject" name="subject" value="1" ${paper.subject == 1 ? "checked" : ""}> 语文</label>
                            <label><input type="radio" name="subject" value="2" ${paper.subject == 2 ? "checked" : ""}> 数学</label>
                            <label><input type="radio" name="subject" value="3" ${paper.subject == 3 ? "checked" : ""}> 外语</label>
                            <label><input type="radio" name="subject" value="4" ${paper.subject == 4 ? "checked" : ""}> 政治</label>
                            <label><input type="radio" name="subject" value="5" ${paper.subject == 5 ? "checked" : ""}> 历史</label>
                            <label><input type="radio" name="subject" value="6" ${paper.subject == 6 ? "checked" : ""}> 地理</label>
                            <label><input type="radio" name="subject" value="7" ${paper.subject == 7 ? "checked" : ""}> 物理</label>
                            <label><input type="radio" name="subject" value="8" ${paper.subject == 8 ? "checked" : ""}> 化学</label>
                            <label><input type="radio" name="subject" value="9" ${paper.subject == 9 ? "checked" : ""}> 生物</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="paperLevel2" class="col-sm-2 control-label">试卷难度</label>
                    <div class="col-sm-10">
                        <div class="radio">
                            <label><input type="radio" id="paperLevel2" name="paperLevel" value="1" ${paper.level == 1 ? "checked" : ""}>1</label>
                            <label><input type="radio" name="paperLevel" value="2" ${paper.level == 2 ? "checked" : ""}> 2</label>
                            <label><input type="radio" name="paperLevel" value="3" ${paper.level == 3 ? "checked" : ""}> 3</label>
                            <label><input type="radio" name="paperLevel" value="4" ${paper.level == 4 ? "checked" : ""}> 4</label>
                            <label><input type="radio" name="paperLevel" value="5" ${paper.level == 5 ? "checked" : ""}> 5</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="time" class="col-sm-2 control-label">试卷时长</label>
                    <div class="col-sm-10">
                        <div class="input-group" style="width: 150px;">
                            <input type="text" class="form-control" name="time" id="time" value="${paper.time}"
                                   placeholder="${paper.time}">
                            <span class="input-group-addon" id="basic-addon2">分钟</span>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th class="num"></th>
                        <th class="name">ID</th>
                        <th class="name">年段</th>
                        <th class="operate">年级</th>
                        <th class="operate">科目</th>
                        <th class="node">难度</th>
                        <th class="process">题干</th>
                        <th class="process">类型</th>
                    </tr>
                    </thead>
                    <tbody align="center">
                    <c:forEach items="${questions}" var="question">
                        <tr align="center">
                            <td><input type="checkbox" name="questionId"
                                       value="${question.id}" ${fn:contains(paper.radioIds, question.id) || fn:contains(paper.multipleIds, question.id) || fn:contains(paper.judgeIds, question.id) || fn:contains(paper.fillingIds, question.id) || fn:contains(paper.essayIds, question.id) ? "checked" : ""}/>
                            </td>
                            <td>${question.id}</td>
                            <td>
                                <c:if test="${question.chapter==1}">小学</c:if>
                                <c:if test="${question.chapter==2}">初中</c:if>
                                <c:if test="${question.chapter==3}">高中</c:if>
                            </td>
                            <td>
                                <c:if test="${question.section==1}">一</c:if>
                                <c:if test="${question.section==2}">二</c:if>
                                <c:if test="${question.section==3}">三</c:if>
                                <c:if test="${question.section==4}">四</c:if>
                                <c:if test="${question.section==5}">五</c:if>
                                <c:if test="${question.section==6}">六</c:if>
                                年级
                            </td>
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
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="form-group" style="text-align: center; margin-top: 50px;">
                    <button class="btn btn-info"
                            style="width: 150px;"
                            type="button"
                            onclick="updatePaper()">保存修改
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
    function updatePaper() {
        var ids = "";
        $("input:checkbox[name='questionId']:checked").each(function () {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length - 1, ids.length);
        if (id === ",") {
            ids = ids.substring(0, ids.length - 1);
        }
        if (ids === "") {
            alert("请选择要添加的试题！");
            return
        }
        $("#updatePaperForm").submit()
    }
</script>
</body>
</html>