<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/20/17
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>پنل مدیریت</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body dir="rtl" class="admin-header">
<!-- Header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header pull-right">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-toggle"></span>
            </button>
            <a class="navbar-brand" href="#"><spring:message code="admin.page.title"/> </a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">

                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i>${loggedinuserName}</a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="<%=request.getContextPath() %>/user-panel/${loggedinuser}">محیط کاربری</a></li>
                    </ul>
                </li>PRODUCT
                <li><a href="${pageContext.request.contextPath}/logout"><i class="glyphicon glyphicon-lock"></i> خروج</a></li>
            </ul>
        </div>
    </div><!-- /container -->
</div>
<!-- /Header -->
</body>
</html>
