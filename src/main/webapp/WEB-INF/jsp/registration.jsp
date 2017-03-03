<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/2/17
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" dir="rtl">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <%--<div class="well well-sm">--%>
                    <%--<form:form class="form-horizontal" method="post" commandName="user" acceptcharset="UTF-8">--%>
                        <%--<fieldset>--%>
                            <%--<legend class="text-center"><spring:message code="sign.up.page.title"/></legend>--%>
                            <%--<form:input path="id" id="id" type="hidden"/>--%>
                            <%--<div class="form-inline row">
                                <!-- First Name input-->
                                <div class="form-group col-md-6">
                                    <label class="col-md-3 control-label" for="first-name"><spring:message code="sign.up.first.name"/> </label>
                                    <div class="col-md-9">
                                        <form:input path="firstName" id="first-name" name="first-name" type="text" class="form-control"/>
                                        <div class="row">
                                            <div class="has-error">
                                                <form:errors path="firstName" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Last Name input-->
                                <div class="form-group col-md-6 ">
                                    <label class="col-md-3 control-label" for="last-name"><spring:message code="sign.up.last.name"/> </label>
                                    <div class="col-md-9">
                                        <form:input path="lastName" id="last-name" name="last-name" type="text" class="form-control"/>
                                        <div class="has-error">
                                            <form:errors path="lastName" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <!-- mobil number input-->
                            <%--<div class="form-group row">
                                <label class="col-md-3 control-label" for="mobil"><spring:message code="sign.up.mobile"/> </label>
                                <div class="col-md-9">
                                    <form:input path="mobile" id="mobil" name="mobile" type="text" class="form-control"/>
                                    <div class="has-error">
                                        <form:errors path="lastName" class="help-inline"/>
                                    </div>
                                </div>
                            </div>--%>
                            <!-- UserName input-->
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="ssoId"><spring:message code="sign.up.username"/> </label>
                                <div class="col-md-9">
                                    <c:choose>
                                        <c:when test="${edit}">
                                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" disabled="true"/>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" />
                                            <div class="has-error">
                                                <form:errors path="ssoId" class="help-inline"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>--%>

                            <!-- Password input-->
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="password"><spring:message code="sign.up.password"/> </label>
                                <div class="col-md-9">
                                    <form:input type="password" path="password" id="password" class="form-control input-sm" />
                                    <div class="has-error">
                                        <form:errors path="password" class="help-inline"/>
                                    </div>
                                </div>
                            </div>--%>
                            <%--<!-- Retype Password input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="re-password"><spring:message code="sign.up.retype.password"/> </label>
                                <div class="col-md-9">
                                    <input id="re-password" name="re-password" type="password" placeholder="<spring:message code="sign.up.retype.password"/>" class="form-control">
                                    <div class="registrationFormAlert" id="divCheckPasswordMatch"></div>
                                </div>
                            </div>--%>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="email"><spring:message code="sign.up.email"/> </label>
                                <div class="col-md-9">
                                    <form:input type="text" path="email" id="email" class="form-control" />
                                    <div class="has-error">
                                        <form:errors path="email" class="help-inline"/>
                                    </div>
                                </div>
                            </div>--%>

                            <%--<sec:authorize access="hasRole('ADMIN')">
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="userProf"><spring:message code="sign.up.user.role"/> </label>
                                    <div class="col-md-9">
                                        <form:select path="userRole" name="userProf" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control" id="mysel"/>
                                        <div class="has-error">
                                            <form:errors path="userProfiles" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                            </sec:authorize>--%>

                            <!-- Form actions -->
                            <%--<div class="form-group">
                                <div class="col-md-12 text-left">
                                    <button type="submit" class="btn btn-primary btn-lg"><spring:message code="sign.up.register"/> </button>
                                </div>
                            </div>--%>
                        <%--</fieldset>--%>
                    <%--</form:form>--%>
                <%--</div>--%>
                <%--second form--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3><spring:message code="sign.up.page.title"/></h3>
                    </div>
                    <div class="panel-body">
                        <form:form method="post" commandName="user" acceptcharset="UTF-8">
                            <form:input path="id" id="id" type="hidden"/>
                            <div class="col-md-12 col-sm-12">
                                <!-- First Name input-->
                                <div class="form-group col-md-6 pull-right">
                                    <label class="control-label" for="first-name"><spring:message code="sign.up.first.name"/> </label>
                                    <form:input path="firstName" id="first-name" name="first-name" type="text" class="form-control"/>
                                    <div class="row">
                                        <div class="has-error">
                                            <form:errors path="firstName" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- Last Name input-->
                                <div class="form-group col-md-6 ">
                                    <label class="control-label" for="last-name"><spring:message code="sign.up.last.name"/> </label>
                                    <form:input path="lastName" id="last-name" name="last-name" type="text" class="form-control"/>
                                    <div class="row">
                                        <div class="has-error">
                                            <form:errors path="lastName" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- mobil number input-->
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="mobil"><spring:message code="sign.up.mobile"/> </label>
                                    <form:input path="mobile" id="mobil" name="mobile" type="text" class="form-control"/>
                                    <div class="has-error">
                                        <form:errors path="lastName" class="help-inline"/>
                                    </div>
                                </div>
                                <!--email input-->
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="email"><spring:message code="sign.up.email"/> </label>
                                    <form:input type="text" path="email" id="email" class="form-control" />
                                    <div class="has-error">
                                        <form:errors path="email" class="help-inline"/>
                                    </div>
                                </div>
                                <!-- UserName input-->
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="ssoId"><spring:message code="sign.up.username"/> </label>
                                    <c:choose>
                                        <c:when test="${edit}">
                                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" disabled="true"/>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" />
                                            <div class="has-error">
                                                <form:errors path="ssoId" class="help-inline"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- Password input-->
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="password"><spring:message code="sign.up.password"/> </label>
                                    <form:input type="password" path="password" id="password" class="form-control input-sm" />
                                    <div class="has-error">
                                        <form:errors path="password" class="help-inline"/>
                                    </div>
                                </div>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <div class="form-group col-md-6">
                                        <label class="control-label" for="userProf"><spring:message code="sign.up.user.role"/> </label>
                                        <form:select path="userRole" name="userProf" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control" id="mysel"/>
                                        <div class="has-error">
                                            <form:errors path="userProfiles" class="help-inline"/>
                                        </div>
                                    </div>
                                </sec:authorize>
                                <%
                                    ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Ld8hBQUAAAAAAZXgcja0Nk79pBlBhlsuMJ-1RZy", "6Ld8hBQUAAAAAP6tB5nNMZDeg8O1TGbv7W_wDvaF", false);
                                    out.print(c.createRecaptchaHtml(null, null));
                                %>
                                <!-- Form actions -->
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group col-md-s col-sm-3">
                                        <div class="col-md-12 text-left">
                                            <button type="submit" class="btn btn-primary btn-lg"><spring:message code="sign.up.register"/> </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
