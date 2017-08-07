<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/22/17
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>شهرها</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <form method="get" action="filter">
        <div class="row">
            <div class="ccol-md-8 col-md-offset-1">
                <ul>
                    <c:forEach items="${cityFilter}" var="city">
                        <li>
                            <label for="towns">${city.state}</label>
                            <input id="towns" type="checkbox" value="${city.state}" name="selected-towns">
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="submit" value="فیلتر">
            </div>
        </div>
    </form>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
