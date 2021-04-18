<%--
  Created by IntelliJ IDEA.
  User: 古月哥欠
  Date: 2020/12/1
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" errorPage="/error.jsp" %>
<html>
<head>
    <title>考试登录入口</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/fontawesome/css/font-awesome.css">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/login.js"></script>
</head>
<body style="background-image: url(${pageContext.request.contextPath}/static/img/index.jpg)">
<div class="modal fade" id="MyStudentmodal"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content"><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel">学生注册页面</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group has-error">
                        <label class="control-label">
                            真实姓名:
                        </label>
                        <div>
                            <input type="text" name="name" autocomplete="off" class="form-control">
                        </div>
                        <span id="name"></span>
                    </div>
                    <div id="userClass" class="form-group has-error">
                        <label class="control-label">
                            班级:
                        </label>
                        <div>
                            <input type="text" name="studentClass" autocomplete="off" class="form-control">
                        </div>
                        <span id="studentClass"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            登录名:
                        </label>
                        <div>
                            <input type="text" name="username" autocomplete="off" class="form-control">
                        </div>
                        <span id="username"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            密码:
                        </label>
                        <div class="Eye">
                            <input type="password" name="password" class="form-control">
                            <i class="fa fa-eye-slash" id="passwordEye"></i>
                        </div>
                        <span id="password"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            确认密码:
                        </label>
                        <div class="Eye">
                            <input type="password" name="passwords" class="form-control">
                            <i class="fa fa-eye-slash" id="passwordsEye" style="position: absolute;right: 10px;bottom:10px"></i>
                        </div>
                        <span id="passwords"></span>
                    </div>
                    <div id="div4">
                        <button type="reset" class="btn">清空信息</button>&emsp;&emsp;&emsp;&emsp;
                        <button id="registered" type="button" class="btn">提交注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<div id="div">
    <form id="form" method="post">
        <div id="div1">学生登录</div>
        <div id="div2">教师登录</div>
        <div id="div3">
            登录名:<input type="text" name="usernameID" id="usernameID" autocomplete="off" value=" ">
            <br><span id="usernameErrorID"></span><br>
            &nbsp;&nbsp;&nbsp;&nbsp;密码&nbsp;&nbsp;&nbsp;:<input type="password" name="passwordID" id="passwordID" value="">
            <i class="fa fa-eye-slash" id="passwordEyeID"></i>
            <br><span id="passwordErrorID"></span>
            <br> <br>
            <input id="btn1" type="button" value="学生注册">&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="btn2" type="button" value="学生登录">
        </div>
    </form>
</div>
</body>
</html>
