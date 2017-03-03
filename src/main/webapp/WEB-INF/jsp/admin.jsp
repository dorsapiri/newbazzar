<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/3/17
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>admin</title>

    <%--<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
<%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
</head>
<body style="background-color: white">
<jsp:include page="admin-header.jsp"/>
<div class="container">
    <%--<jsp:include page="panel-admin.jsp"/>--%>
    <jsp:include page="admin-menu.jsp"/>
</div>
<%--<jsp:include page="footer.jsp"/>--%>
</body>
</html>
