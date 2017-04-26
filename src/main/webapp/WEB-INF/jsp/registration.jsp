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


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/registration-javascript.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/registration-style.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">


</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" >
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 ">
                <div class="panel panel-defualt">
                    <div class="panel-heading">
                        <div class="panel-title text-center">
                            <h1 dir="rtl">ثبت نام</h1>
                        </div>
                    </div>
                    <div class="panel-body">
                        <form:form class="form-horizontal" method="post" commandName="user" acceptcharset="UTF-8">
                            <fieldset>
                                <legend class="text-center"><spring:message code="sign.up.page.title"/></legend>
                                <form:input path="id" id="id" type="hidden"/>
                                <div class="row " dir="rtl">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group">
                                            <label for="mobile-phone">شماره تلفن همراه</label>
                                            <div class="input-group"><span class="input-group-addon">
                                                <span class="glyphicon glyphicon-earphone"></span></span>
                                                <c:choose>
                                                    <c:when test="${edit}">
                                                        <form:input path="ssoId" id="mobile-phone" class="form-control" required="required" name="mobile-phone"
                                                                    type="text" disabled="true"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form:input path="ssoId" id="mobile-phone" class="form-control" required="required" name="mobile-phone"
                                                                    type="text"/>
                                                    </c:otherwise>
                                                </c:choose>


                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="email">پست الکترونیک </label>
                                            <div class="input-group"><span class="input-group-addon">
                                    <span class="glyphicon glyphicon-envelope"></span></span>
                                                <form:input path="email" id="email" class="form-control" name="email" type="email" required="required"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>گذر واژه</label>
                                            <div class="input-group"><span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span></span>
                                                <form:input path="password" type="password" class="form-control" name="password" id="password"
                                                            placeholder="Password"
                                                            required="required" data-toggle="popover" title="Password Strength"
                                                            data-content="Enter Password..."/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>تکرار گذر واژه</label>
                                            <div class="input-group"><span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-ok"></span></span>
                                                <input type="password" class="form-control" name="confirm" id="confirm"
                                                       placeholder="Confirm Password" required onchange="myfunc()">
                                            </div>
                                        </div>
                                        <div class="form-inline">
                                            <label for="chekbox">با قوانین سایت موافقم</label>
                                            <input id="chekbox" name="chekbox" class="checkbox" type="checkbox" required>
                                        </div>
                                        <sec:authorize access="hasRole('ADMIN')">
                                            <div class="form-group col-md-6">
                                                <label class="control-label" for="userProf"><spring:message
                                                        code="sign.up.user.role"/> </label>
                                                <form:select path="userRole" name="userProf" items="${roles}"
                                                             multiple="true" itemValue="id" itemLabel="type"
                                                             class="form-control" id="mysel"/>
                                                <div class="has-error">
                                                    <form:errors path="userProfiles" class="help-inline"/>
                                                </div>
                                            </div>
                                        </sec:authorize>
                                    </div>
                                </div>
                                <div class="row custom-row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <!--slider captcha-->
                                        <div id="slider_captcha">
                                            <p id="succes">succes!</p>
                                            <div id="slider0">
                                                <span><p id="text">slide to verifier</p></span>
                                                <div id="green-area"></div>
                                                <div id="slider1" draggable="true">
                                                    <i class="fa fa-angle-double-right fa-2x icolor"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row custom-row" dir="rtl">
                                    <div class="col-md-2 col-md-offset-1">
                                        <div>
                                            <button class="btn btn-default" id="mysub" type="submit" disabled="disabled">ثبت‌نام</button>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
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
