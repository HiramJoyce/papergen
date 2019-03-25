<%--
  Created by IntelliJ IDEA.
  User: hiram
  Date: 2019/3/17
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body style="height: 100%;">
<div>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">题库生成系统</a>
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
                            <a href="${ctx}/studentInfo" type="button"
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
        <c:if test="${error != null}">
            <div class="alert alert-danger alert-dismissible" style="width: 300px; margin: auto;" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Error!</strong> ${error}
            </div>
        </c:if>
        <h2>近期测试</h2>
        <c:if test="${papers == null}">
            <h3>登录后查看</h3>
        </c:if>
        <c:if test="${papers != null}">
            <table class="table table-hover" style="width: 800px;">
                <tr>
                    <td>标题</td>
                    <td>年段</td>
                    <td>年级</td>
                    <td>科目</td>
                    <td>发布日期</td>
                    <td>难度等级</td>
                    <td></td>
                </tr>
                <c:forEach items="${papers}" var="paper">
                    <tr>
                        <td>${paper.title}</td>
                        <td>
                            <c:if test="${paper.chapter==1}">小学</c:if>
                            <c:if test="${paper.chapter==2}">初中</c:if>
                            <c:if test="${paper.chapter==3}">高中</c:if>
                        </td>
                        <td>
                            <c:if test="${paper.section==1}">一</c:if>
                            <c:if test="${paper.section==2}">二</c:if>
                            <c:if test="${paper.section==3}">三</c:if>
                            <c:if test="${paper.section==4}">四</c:if>
                            <c:if test="${paper.section==5}">五</c:if>
                            <c:if test="${paper.section==6}">六</c:if>
                            年级
                        </td>
                        <td>
                            <c:if test="${paper.subject==1}">语文</c:if>
                            <c:if test="${paper.subject==2}">数学</c:if>
                            <c:if test="${paper.subject==3}">外语</c:if>
                            <c:if test="${paper.subject==4}">政治</c:if>
                            <c:if test="${paper.subject==5}">历史</c:if>
                            <c:if test="${paper.subject==6}">地理</c:if>
                            <c:if test="${paper.subject==7}">物理</c:if>
                            <c:if test="${paper.subject==8}">化学</c:if>
                            <c:if test="${paper.subject==9}">生物</c:if>
                        </td>
                        <td>${paper.createTime}</td>
                        <td>
                            <c:if test="${paper.level==1}">简单</c:if>
                            <c:if test="${paper.level==2}">一般</c:if>
                            <c:if test="${paper.level==3}">中等</c:if>
                            <c:if test="${paper.level==4}">较难</c:if>
                            <c:if test="${paper.level==5}">巨难</c:if>
                        </td>
                        <td>
                            <a href="${ctx}/takePaper?id=${paper.id}">参加考试</a>
                        </td>
                    </tr>
                </c:forEach>
                </tr>
            </table>
        </c:if>
    </div>
    <div style="position: absolute; bottom: 0; text-align: center; width: 100%;"><a
            href="${ctx}/admin/loginPage">管理员登录</a>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form" action="${ctx}/studentLogin" onsubmit="return loginCheck()" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userName">用户名</label>
                        <input type="text" name="userName" class="form-control" id="userName" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form" action="${ctx}/studentRegister" onsubmit="return check()" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">注册</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="studentNum">学号</label>
                        <input type="text" name="studentNum" class="form-control" id="studentNum" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="userName2">用户名</label>
                        <input type="text" name="userName" class="form-control" id="userName2" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="realName">姓名</label>
                        <input type="text" name="realName" class="form-control" id="realName" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password2">密码</label>
                        <input type="password" name="password" class="form-control" id="password2" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="password22">确认密码</label>
                        <input type="password" name="password2" class="form-control" id="password22" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="chapter">年段</label>
                        <div class="checkbox">
                            <select id="chapter" class="form-control" name="chapter">
                                <option value="1" selected>小学</option>
                                <option value="2">初中</option>
                                <option value="3">高中</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="section">年级</label>
                        <div class="checkbox">
                            <select id="section" class="form-control" name="section">
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary">注册</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctx}/resource/js/canvas-nest.js"></script>
<script>
    function check() {
        var userName = $("#userName2").val();
        var realName = $("#realName").val();
        var password2 = $("#password2").val();
        var password22 = $("#password22").val();
        if (userName === null || userName === '') {
            alert("用户名不能为空");
            return false
        }
        if (realName === null || realName === '') {
            alert("姓名不能为空");
            return false
        }
        if (password2 === null || password2 === '') {
            alert("密码不能为空");
            return false
        }
        if (password2 !== password22) {
            alert("密码不一致");
            return false
        }
        return true;
    }

    function loginCheck() {
        if ($("#userName").val() === null || $("#userName").val() === '' || $("#password").val() === null || $("#password").val() === '') {
            return false
        }
    }
</script>
</body>
</html>
