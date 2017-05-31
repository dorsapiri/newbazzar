<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/2/17
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>

    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body">

    <div class="container">

        <div class="row" dir="rtl">
            <div class="col-md-6 col-md-offset-3">
                <div class="well well-sm">
                    <c:url var="loginUrl" value="login" />
                    <form class="form-horizontal" action="${loginUrl}" method="post">
                        <fieldset>
                            <legend class="text-center"><spring:message code="login.page.title"/></legend>

                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>You have been logged out successfully.</p>
                                </div>
                            </c:if>
                            <!-- UserName or Email input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="username"><spring:message code="login.username"/> </label>
                                <div class="col-md-9">
                                    <input id="username" name="ssoId" type="text" placeholder="<spring:message code="login.username"/>" class="form-control" required>
                                </div>
                            </div>

                            <!-- Password input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="password"><spring:message code="login.password"/> </label>
                                <div class="col-md-9">
                                    <input id="password" name="password" type="password" placeholder="<spring:message code="login.password"/>" class="form-control" required>
                                </div>
                            </div>

                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            <!-- Form actions -->
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-lg"><spring:message code="login.enter.button"/> </button>
                                    <input type="button" onclick="location.href='newuser'"  class="btn btn-primary btn-lg" value="<spring:message code="login.register.button"/>"/>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
