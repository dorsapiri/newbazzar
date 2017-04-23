<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/22/17
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>آدرس</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <style>
        #abc >option.d-5{
            background-color: red;
            margin-right: 10px;
        }
        #abc >option.d-4{
            background-color: lightblue;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="category-form" dir="rtl">
    <div class="container">
        <div class="row" >
            <div class="col-md-6 col-md-offset-5">
                <form:form class="form-horizontal" method="post" commandName="address">
                    <legend class="text-center">افزودن مکان</legend>
                    <form:input path="id" id="id" type="hidden"/>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="state">کشور/ استان / شهر /منطقه‌شهری</label>
                        <div class="col-md-9">
                            <form:input path="state" id="state" name="state" type="text" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                            <label class="col-md-3 control-label" >استان/ شهر/ منطقه‌ی شهری</label>
                        <div class="col-md-5">

                                <%--<form:input path="childCategories" type="text"/>--%>
                            <form:select path="parentId" id="abc" class="selectpicker form-control">
                                <%--<form:options items="${allStates}" itemValue="id" itemLabel="state"/>--%>
                                ${SelectListState}
                                <form:option value="0"><span class="d-0">-</span>--none--</form:option>
                            </form:select>
                                <%--<form:input path="parentId" id="parentid" name="parentid" type="number" class="form-control"/>--%>
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
                    <%--<input type="hidden" form:name="${_csrf.parameterName}" form=:value="${_csrf.token}"/>--%>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
