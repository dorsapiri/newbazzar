<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 3/26/17
  Time: 12:42 PM
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
<div class="container">
    <div class="row">
        <div class="col-md-4 col-sm-5 col-md-offset-4 col-sm-offset-3">
            <form:form class="form-horizontal" method="post" commandName="slideshow" enctype="multipart/form-data" accept-charset="UTF-8"
                       action="./new-slideshow?${_csrf.parameterName}=${_csrf.token}">
                <fieldset>
                    <form:input path="id" id="id" type="hidden"/>
                    <!-- Work Name input-->
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="slide-name">نام اسلایدشو</label>
                        <div class="col-md-9">
                            <form:input path="slideName" id="slide-name" name="service-name" type="text" class="form-control"/>
                        </div>
                    </div>
                    <!--File Input-->
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="fileinput"><spring:message code="form.image"/> </label>
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div id="fileinput" class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                            <div>
                            <span class="btn btn-default btn-file">
                                <span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
                                <form:input path="sUploadFile" type="file" name="fileUpload"/>
                            </span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                    </div>
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
                </fieldset>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
