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
            margin: 0;
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

        .questionType {
            font-size: 16px;
            font-weight: 900;
        }
    </style>
</head>
<body>
<div class="container" style="padding: 20px;">
    <a href="#" onclick="history.back()">返回</a>
    <h3>考题-${question.id}</h3>
    <div style="width: 500px; margin: auto;">
        <p>【
            <c:if test="${question.type==1}">单选</c:if>
            <c:if test="${question.type==2}">多选</c:if>
            <c:if test="${question.type==3}">判断</c:if>
            <c:if test="${question.type==4}">填空</c:if>
            <c:if test="${question.type==5}">问答</c:if>
            】${question.body}</p>
        <br>
        <c:if test="${question.type==1}">
            <table style="width: 100%; margin-left: 10px;">
                <tr>
                    <td>
                        <c:if test="${question.optionNum>=1}">
                            <div class="radio">
                                <label>
                                    <input class="radio" type="radio" name="${question.id}" id="optionA"
                                           value="A">A.${question.optionA}
                                </label>
                            </div>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${question.optionNum>=2}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${question.id}" id="optionB"
                                           value="B">B.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:if test="${question.optionNum>=3}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${question.id}" id="optionC"
                                           value="C">C.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${question.optionNum>=4}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${question.id}" id="optionD"
                                           value="D">D.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${question.optionNum==5}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${question.id}" id="optionE"
                                           value="E">E.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${question.type==2}">
            <table style="width: 100%; margin-left: 10px;">
                <tr>
                    <td>
                        <c:if test="${question.optionNum>=1}">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="${question.id}" id="optionA"
                                           value="A">A.${question.optionA}
                                </label>
                            </div>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${question.optionNum>=2}">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="${question.id}" id="optionB"
                                           value="B">B.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:if test="${question.optionNum>=3}">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="${question.id}" id="optionC"
                                           value="C">C.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${question.optionNum>=4}">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="${question.id}" id="optionD"
                                           value="D">D.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${question.optionNum==5}">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="${question.id}" id="optionE"
                                           value="E">E.${question.optionB}
                                </label>
                            </div>
                        </c:if>
                    </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${question.type==3}">
            <table style="width: 100%; margin-left: -10px;">
                <tr>
                    <td>
                        <div class="checkbox">
                            <label>
                                <input type="radio" name="${question.id}" value="true"> 正确
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="checkbox">
                            <label>
                                <input type="radio" name="${question.id}" value="false"> 错误
                            </label>
                        </div>
                    </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${question.type==4}">
            <div style="margin-left: 15px;">
                答案： <input type="text" id="filling"
                           style="border: none; border-bottom:1px solid #000; width: 300px;"
                           name="${question.id}">
            </div>
        </c:if>
        <c:if test="${question.type==5}">
            <table style="width: 100%; margin-left: 15px;">
                <tr>
                    <td style="vertical-align: top; width: 50px;">
                        答案：
                    </td>
                    <td>
                        <textarea class="form-control" id="essay" name="${question.id}" rows="3"></textarea>
                    </td>
                </tr>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>