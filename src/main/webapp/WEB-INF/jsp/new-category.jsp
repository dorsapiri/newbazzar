<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/18/17
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>category</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <%--<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">--%>

</head>
<body>

<div class="category-form" dir="rtl">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form:form class="form-horizontal" method="post" commandName="category">
                    <legend class="text-center">افزودن دسته‌بندی</legend>
                    <form:input path="id" id="id" type="hidden"/>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="name">عنوان دسته‌بندی</label>
                        <div class="col-md-9">
                            <form:input path="categoryName" id="name" name="name" type="text" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="link">آدرس پیوست</label>
                        <div class="col-md-9">
                            <form:input path="categoryLink" id="link" name="link" type="text" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--<label class="col-md-3 control-label" for="parentid">دسته‌بندی والد</label>--%>
                        <div class="col-md-5">
                            <%--<form:input path="childCategories" type="text"/>--%>
                                <form:select path="parentId" id="id" class="selectpicker form-control">
                                    <%--<form:option value="${precategory.id}">${categoryI.categoryName}</form:option>--%>
                                    <form:options items="${parents}" itemValue="id" itemLabel="categoryName"/>
                                    <form:option value="0">--none--</form:option>
                                </form:select>
                            <%--<form:input path="parentId" id="parentid" name="parentid" type="number" class="form-control"/>--%>
                        </div>
                        <div class="col-md-4">
                            <c:forEach items="${categories}" var="cat">
                                <%--<c:if test="${param['parentId'] eq cat.key.id }">--%>
                                <form:select path="parentId" id="id" class="selectpicker form-control">
                                    <form:options items="${cat.value}" itemValue="id" itemLabel="categoryName"/>
                                </form:select>
                                <%--</c:if>--%>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="sort">ترتیب دسته‌بندی</label>
                        <div class="col-md-9">
                            <form:input path="sortOrder" id="sort" name="sort" type="number" class="form-control"/>
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
