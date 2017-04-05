<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/11/17
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="authbar">
    <span>Hi, <strong>${loggedinuser}</strong></span>
    <span class="floatRight">
    <a href="<c:url value="logout" />">Logout</a>
    </span>
</div>
</body>
</html>
