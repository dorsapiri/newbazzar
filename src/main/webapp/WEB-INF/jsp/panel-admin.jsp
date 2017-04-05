<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/2/17
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="container" id="body" dir="rtl">
    <%--<h3 class="bottom-margin2x"><spring:message code="admin.page.title"/> </h3>--%>
    <div class="col-md-2 text-center dashboard-box pull-right" onclick="openPage('work-list');">
        <i class="glyphicon glyphicon-wrench btn-block gi-4x"></i>
        <span class="text-bottom btn-block"><spring:message code="admin.works"/></span>
    </div>
    <div class="col-md-2 text-center dashboard-box pull-right" onclick="openPage('products');">
        <i class="glyphicon glyphicon glyphicon-briefcase btn-block gi-4x"></i>
        <span class="text-bottom btn-block"><spring:message code="admin.products"/></span>
    </div>
    <div class="col-md-2 text-center dashboard-box pull-right"onclick="openPage('users');">
        <i class="glyphicon glyphicon-user btn-block gi-4x"></i>
        <span class="text-bottom btn-block"><spring:message code="admin.users"/></span>
    </div>
    <div class="col-md-2 text-center dashboard-box pull-right"onclick="openPage('category-list');">
        <i class="glyphicon glyphicon-user btn-block gi-4x"></i>
        <span class="text-bottom btn-block">دسته‌ها</span>
    </div>
</div>
<div id="page-view" class="container"></div>
<script> function openPage(pageURL){ $('#page-view').load(pageURL); } </script>
</body>
</html>
