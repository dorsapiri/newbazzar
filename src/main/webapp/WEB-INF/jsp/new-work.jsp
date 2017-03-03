<%--<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/29/16
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="work-form" dir="rtl">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="well well-sm">
                    <%--enctype="multipart/form-data"--%>
                    <form:form class="form-horizontal" method="post" commandName="work" enctype="multipart/form-data" accept-charset="UTF-8"
                               action="./new-work?${_csrf.parameterName}=${_csrf.token}">
                        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                        <fieldset>
                            <legend class="text-center"><spring:message code="form.servive.title"/></legend>
                            <form:input path="id" id="id" type="hidden"/>

                            <!-- Work Name input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="name"><spring:message code="form.work.serviceTitle"/> </label>
                                <div class="col-md-9">
                                    <form:input path="serviceName" id="name" name="name" type="text" class="form-control"/>
                                </div>
                            </div>

                            <!-- Profession input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="profession"><spring:message code="form.work.guild"/> </label>
                                <div class="col-md-9">
                                    <form:input path="profession" id="profession" name="profession" type="text" class="form-control"/>
                                </div>
                            </div>
                            <!-- State input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="state"><spring:message code="form.work.state"/> </label>
                                <div class="col-md-9">
                                    <form:input path="state" id="state" name="state" type="text" class="form-control"/>
                                </div>
                            </div>
                            <!-- Date input-->
                            <%--<div class="form-group" hidden>
                                <label class="col-md-3 control-label" for="date"><spring:message code="form.work.state"/> </label>
                                <div class="col-md-9">
                                    <form:input path="createDate" id="date" name="state" type="text" class="form-control"/>
                                </div>
                            </div>--%>
                            <!--File Input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="fileinput"><spring:message code="form.image"/> </label>
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div id="fileinput" class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                    <div>
                                        <span class="btn btn-default btn-file">
                                            <span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
                                            <form:input path="uploadFile" type="file" name="fileUpload"/>
                                        </span>
                                        <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Tags -->
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="tags">tags</label>
                                <div class="col-md-9">
                                    <form:input path="keywords" class="form-control" type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo"
                                           data-role="tagsinput" id="tags" name="tags"/>
                                </div>
                            </div>--%>
                            <!-- Message body -->
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="message"><spring:message code="form.comment"/> </label>
                                <div class="col-md-9">
                                    <form:textarea path="message" class="form-control" id="message" name="message" rows="5"/>
                                </div>
                            </div>--%>

                            <%--<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />--%>
                            <!-- Form actions -->
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
                            <%--<input type="hidden" form:name="${_csrf.parameterName}" form=:value="${_csrf.token}"/>--%>
                        </fieldset>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
