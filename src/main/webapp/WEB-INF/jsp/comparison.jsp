<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 6/1/17
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>مقایسه</title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">


</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container" id="body">
    <c:if test="${not empty compWork}">
        <table class="table table-condensed table-hover">
            <thead>
            <tr>
                <th></th>
                <c:forEach items="${compWork}" var="comw">
                    <th>${comw.name}</th>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Owner</td>
                <c:forEach items="${compWork}" var="comw">
                    <td>${comw.owner.firstName}</td>
                </c:forEach>
            </tr>
            <tr>
                <td>place</td>
                <c:forEach items="${compWork}" var="comw">
                    <td>${comw.place.state}</td>
                </c:forEach>
            </tr>
            <tr>
                <td>place</td>
                <c:forEach items="${compWork}" var="comw">
                    <c:forEach items="${comw.categories}" var="cat">
                        <td>${cat.categoryName}</td>
                    </c:forEach>
                </c:forEach>
            </tr>
            <tr>
                <td>profession</td>
                <c:forEach items="${compWork}" var="comw">
                    <td>${comw.profession}</td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </c:if>
    <c:if test="${not empty compProduct}">
        <table class="table table-condensed table-hover">
            <thead>
            <tr>
                <th></th>
                <c:forEach items="${compProduct}" var="comp">
                    <th>${comp.name}</th>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Owner</td>
                <c:forEach items="${compProduct}" var="comp">
                    <td>${comp.owner.firstName}</td>
                </c:forEach>
            </tr>
            <tr>
                <td>place</td>
                <c:forEach items="${compProduct}" var="comp">
                    <td>${comp.place.state}</td>
                </c:forEach>
            </tr>
            <tr>
                <td>place</td>
                <c:forEach items="${compProduct}" var="comp">
                    <c:forEach items="${comw.categories}" var="cat">
                        <td>${cat.categoryName}</td>
                    </c:forEach>
                </c:forEach>
            </tr>
            <tr>
                <td>profession</td>
                <c:forEach items="${compProduct}" var="comp">
                    <td>${comp.profession}</td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </c:if>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
