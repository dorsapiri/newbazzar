<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 5/15/17
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ثبت واحد</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<div class="unit-form" dir="rtl">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-5">
                <form:form class="form-horizontal" method="post" commandName="unit" accept-charset="UTF-8">
                    <fieldset>
                        <legend class="text-center">
                            <c:if test="${not edit}">
                                ثبت واحد جدید
                            </c:if>
                            <c:if test="${edit}">ویرایش واحد</c:if>
                        </legend>
                        <form:input path="id" id="id" type="hidden"/>

                        <!-- Unit Name input-->
                        <div class="form-group required">
                            <label class="col-md-3 control-label" for="unit-name">نام واحد </label>
                            <div class="col-md-9">
                                <form:input path="unitName" id="unit-name" name="unit-name" type="text" class="form-control" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 text-right">
                                <c:choose>
                                    <c:when test="${edit}">
                                        <button type="submit" class="btn btn-primary btn-lg" >edit</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-primary btn-lg" ><spring:message code="form.submit"/></button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
