<%--
  Created by IntelliJ IDEA.
  User: 古月哥欠
  Date: 2020/12/2
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/error.js"></script>
<body>
<h1>出现异常错误，过 <span id="time">5</span> 秒将跳转到登录界面<a href="${pageContext.request.contextPath}/login.jsp">点击此处立即跳转</a></h1>
</body>
</html>
