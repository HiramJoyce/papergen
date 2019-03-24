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
    <c:if test="${error != null}">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Error!</strong> ${error}
        </div>
    </c:if>
    <a href="#" onclick="history.back()">返回</a>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">自动生成</a>
            </li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">手动选题</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content" style="padding: 20px;">
            <div role="tabpanel" class="tab-pane active" id="home">
                <form class="form-horizontal" action="/addPaperAuto" method="post">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">试卷标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" id="titleAuto" value=""
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="paperLevel" class="col-sm-2 control-label">试卷难度</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="radio" id="paperLevel" name="paperLevel" value="1" checked>
                                    1</label>
                                <label><input type="radio" name="paperLevel" value="2"> 2</label>
                                <label><input type="radio" name="paperLevel" value="3"> 3</label>
                                <label><input type="radio" name="paperLevel" value="4"> 4</label>
                                <label><input type="radio" name="paperLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="chapter" class="col-sm-2 control-label">试卷时长</label>
                        <div class="col-sm-10">
                            <div class="input-group" style="width: 150px;">
                                <input type="text" class="form-control" name="time" id="timeAuto" value="120"
                                       placeholder="">
                                <span class="input-group-addon" id="basic-addonAuto">分钟</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="chapter" class="col-sm-2 control-label">章节</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="chapter" id="chapter" value=""
                                   placeholder="格式：1-1,1-2,2-1,... 不填或者填all将随机所有章节">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="radioNum" class="col-sm-2 control-label">单选数量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="radioNum" id="radioNum" value="1"
                                   placeholder="请输入阿拉伯数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="radioLevel" class="col-sm-2 control-label">难度范围</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" id="radioLevel" name="radioLevel" value="1" checked>
                                    1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="radioLevel" value="2"> 2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="radioLevel" value="3"> 3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="radioLevel" value="4"> 4</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="radioLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="multipleNum" class="col-sm-2 control-label">多选数量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="multipleNum" id="multipleNum" value="1"
                                   placeholder="请输入阿拉伯数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="multipleLevel" class="col-sm-2 control-label">难度范围</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" id="multipleLevel" name="multipleLevel" value="1" checked>
                                    1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="multipleLevel" value="2"> 2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="multipleLevel" value="3"> 3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="multipleLevel" value="4"> 4</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="multipleLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="judgeNum" class="col-sm-2 control-label">判断数量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="judgeNum" id="judgeNum" value="1"
                                   placeholder="请输入阿拉伯数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="judgeLevel" class="col-sm-2 control-label">难度范围</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" id="judgeLevel" name="judgeLevel" value="1" checked>
                                    1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="judgeLevel" value="2"> 2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="judgeLevel" value="3"> 3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="judgeLevel" value="4"> 4</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="judgeLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fillingNum" class="col-sm-2 control-label">填空数量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="fillingNum" id="fillingNum" value="1"
                                   placeholder="请输入阿拉伯数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fillingLevel" class="col-sm-2 control-label">难度范围</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" id="fillingLevel" name="fillingLevel" value="1" checked> 1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="fillingLevel" value="2"> 2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="fillingLevel" value="3"> 3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="fillingLevel" value="4"> 4</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="fillingLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="essayNum" class="col-sm-2 control-label">问答数量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="essayNum" id="essayNum" value="1"
                                   placeholder="请输入阿拉伯数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="essayLevel" class="col-sm-2 control-label">难度范围</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" id="essayLevel" name="essayLevel" value="1" checked>
                                    1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="essayLevel" value="2"> 2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="essayLevel" value="3"> 3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="essayLevel" value="4"> 4</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" name="essayLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center; margin-top: 50px;"><input class="btn btn-info"
                                                                                                 style="width: 150px;"
                                                                                                 type="submit"
                                                                                                 value="生成试卷"></div>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <form class="form-horizontal" id="addPaperHandleForm" action="/addPaperHandle" method="post">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">试卷标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" id="title" value=""
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="paperLevel2" class="col-sm-2 control-label">试卷难度</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label><input type="radio" id="paperLevel2" name="paperLevel" value="1">
                                    1</label>
                                <label><input type="radio" name="paperLevel" value="2"> 2</label>
                                <label><input type="radio" name="paperLevel" value="3" checked> 3</label>
                                <label><input type="radio" name="paperLevel" value="4"> 4</label>
                                <label><input type="radio" name="paperLevel" value="5"> 5</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="time" class="col-sm-2 control-label">试卷时长</label>
                        <div class="col-sm-10">
                            <div class="input-group" style="width: 150px;">
                                <input type="text" class="form-control" name="time" id="time" value="120"
                                       placeholder="">
                                <span class="input-group-addon" id="basic-addon2">分钟</span>
                            </div>
                        </div>
                    </div>
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
                        </tr>
                        </thead>
                        <tbody align="center">
                        <c:forEach items="${questions}" var="question">
                            <tr align="center">
                                <td><input type="checkbox" name="questionId" value="${question.id}"/></td>
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
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="form-group" style="text-align: center; margin-top: 50px;">
                        <button class="btn btn-info"
                                style="width: 150px;"
                                type="button"
                                onclick="genPaperHandle()">生成试卷
                        </button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });

    function genPaperHandle() {
        var ids = "";
        $("input:checkbox[name='questionId']:checked").each(function () {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length - 1, ids.length);
        if (id == ",") {
            ids = ids.substring(0, ids.length - 1);
        }
        if (ids == "") {
            alert("请选择要添加的试题！");
            return
        }
        $("#addPaperHandleForm").submit()
    }
</script>
</body>
</html>