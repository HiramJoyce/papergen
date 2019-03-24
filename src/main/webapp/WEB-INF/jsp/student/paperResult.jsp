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
    <style>
        .radio {
            margin: 0 10px;
        }

        .checkbox {
            margin: 0;
        }

        p {
            margin: 0;
        }

        input:focus {
            outline: none;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-default" style="margin-bottom: 0px;">
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

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <%
                            if (session.getAttribute("id") == null) {
                        %>
                        <div class="btn-group" role="group" aria-label="...">
                            <a type="button" class="btn btn-link navbar-btn" data-toggle="modal" data-target="#myModal">登录</a>
                            <a type="button" class="btn btn-link navbar-btn" data-toggle="modal"
                               data-target="#myModal2">注册</a>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="btn-group" role="group" aria-label="...">
                            <a href="/" type="button"
                               class="btn btn-link navbar-btn"><%=session.getAttribute("realName")%>
                            </a>
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
    <div class="container">
        <div>
            <h1>${paper.title} 测验结果</h1>
            <div>
                <span style="color: gray; font-size: 14px;">
                    <span style="color: gray; font-style: italic;">时长：${paper.time}分钟&nbsp;&nbsp;&nbsp;&nbsp;试卷难度：
                        <c:if test="${paper.level==1}">简单</c:if>
                        <c:if test="${paper.level==2}">一般</c:if>
                        <c:if test="${paper.level==3}">中等</c:if>
                        <c:if test="${paper.level==4}">较难</c:if>
                        <c:if test="${paper.level==5}">巨难</c:if>
                        <a href="${ctx}/downPaper?paperId=${paper.id}">导出试卷</a>
                    </span>
                </span>
            </div>
        </div>

        <form action="${ctx}/takePaper" id="paperForm" method="post">
            <input type="hidden" name="paperId" value="${paper.id}">
            <input type="hidden" name="userId" value="<%=session.getAttribute("id")%>">
            <div style="width: 600px; margin: auto;">
                <c:if test="${fn:length(errorRadioQuestions) > 0}">
                    <div style="margin: 10px;">
                        <p class="questionType">【单项选择题 - 错题】</p>
                        <c:forEach items="${errorRadioQuestions}" var="errQuestion" varStatus="statu">
                            <div style="margin: 10px 0;">
                                <p>${statu.count}.${errQuestion.question.body}</p>
                                <c:if test="${errQuestion.question.type==1}">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=1}">
                                                    <div class="radio">A.${errQuestion.question.optionA}</div>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=2}">
                                                    <div class="radio">B.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=3}">
                                                    <div class="radio">C.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=4}">
                                                    <div class="radio">D.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <c:if test="${errQuestion.question.optionNum==5}">
                                                    <div class="radio">E.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </table>
                                </c:if>
                                <p style="margin-left: 10px;">正确答案 : <span
                                        style="color: green;">${errQuestion.question.rightOption}&nbsp;&nbsp;&nbsp;&nbsp;</span>我的答案 : <span
                                        style="color: red;">${errQuestion.myOption}</span></p>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${fn:length(errorMultipleQuestions)>0}">
                    <div style="margin: 10px;">
                        <p class="questionType">【多项选择题 - 错题】</p>
                        <c:forEach items="${errorMultipleQuestions}" var="errQuestion" varStatus="statu">
                            <div style="margin: 10px 0;">
                                <p>${statu.count}.${errQuestion.question.body}</p>
                                <c:if test="${errQuestion.question.type==2}">
                                    <table style="width: 100%; margin-left: 10px;">
                                        <tr>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=1}">
                                                    <div class="checkbox">A.${errQuestion.question.optionA}</div>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=2}">
                                                    <div class="checkbox">B.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=3}">
                                                    <div class="checkbox">C.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${errQuestion.question.optionNum>=4}">
                                                    <div class="checkbox">D.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <c:if test="${errQuestion.question.optionNum==5}">
                                                    <div class="checkbox">E.${errQuestion.question.optionB}</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </table>
                                </c:if>
                                <p style="margin-left: 10px;">正确答案 : <span
                                        style="color: green;">${errQuestion.question.rightOption}&nbsp;&nbsp;&nbsp;&nbsp;</span>我的答案 : <span
                                        style="color: red;">${errQuestion.myOption}</span></p>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${fn:length(errorJudgeQuestions)>0}">
                    <div style="margin: 10px;">
                        <p class="questionType">【判断题 - 错题】</p>
                        <c:forEach items="${errorJudgeQuestions}" var="errQuestion" varStatus="statu">
                            <div style="margin: 10px 0;">
                                <p>${statu.count}.${errQuestion.question.body}</p>
                                <p class="radio">正确答案 : <span
                                        style="color: green;">${errQuestion.question.rightJudge ? "正确" : "错误"}&nbsp;&nbsp;&nbsp;&nbsp;</span>我的答案 : <span
                                        style="color: red;">${errQuestion.myJudge ? "正确" : "错误"}</span></p>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <h3>【填空题】与【问答题】暂不支持在线阅卷</h3>
                <c:if test="${fn:length(errorFillingQuestions)>0}">
                    <div style="margin: 10px;">
                        <p class="questionType">【填空题】</p>
                        <c:forEach items="${errorFillingQuestions}" var="errQuestion" varStatus="statu">
                            <div style="margin: 10px 0;">
                                <p>${statu.count}.${errQuestion.question.body}</p>
                                <div class="radio">
                                    <p>正确答案 : ${errQuestion.question.rightFilling}</p>
                                    <p>我的答案 : ${errQuestion.myFilling}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${fn:length(errorEssayQuestions)>0}">
                    <div style="margin: 10px;">
                        <p class="questionType">【问答题】</p>
                        <c:forEach items="${errorEssayQuestions}" var="errQuestion" varStatus="statu">
                            <div style="margin: 10px 0;">
                                <p>${statu.count}.${errQuestion.question.body}</p>
                                <div class="radio">
                                    <p>正确答案 : ${errQuestion.question.rightEssay}</p>
                                    <p>我的答案 : ${errQuestion.myEssay}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctx}/resource/js/canvas-nest.js"></script>
<script>
    function submitPaper() {
        $("#paperForm").submit();
    }
</script>
</body>
</html>