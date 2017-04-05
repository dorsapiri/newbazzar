<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/4/17
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Services</title>
</head>
<body>
<div class="actions">
    <div class="col-md-3 pull-right">
        <a href="new-work"><i class="glyphicon glyphicon-plus-sign"></i><spring:message code="works.add.work"/></a>
    </div>
</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="works.id"/> </th>
            <th><spring:message code="works.name"/> </th>
            <th><spring:message code="works.guild"/> </th>
            <th><spring:message code="works.comment"/> </th>
            <th>Owner </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${works}" var="work">
            <tr>
                <td>${work.id}</td>
                <td>${work.name}</td>
                <td>${work.profession}</td>
                <td>${work.createDate}</td>
                <td>${work.owner.ssoId}</td>
                <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
