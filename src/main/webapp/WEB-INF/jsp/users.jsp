<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <sec:authorize access="hasRole('ADMIN')">
            <div>
                <a href="<c:url value='newuser' />"><i class="fa fa-user-plus" aria-hidden="true"></i>افزودن کاربر</a>
            </div>
        </sec:authorize>
    </div>
</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="users.id"/></th>
            <th><spring:message code="users.first.name"/></th>
            <th><spring:message code="users.last.name"/></th>
            <th><spring:message code="users.username"/></th>
            <th><spring:message code="users.email"/></th>
            <th><spring:message code="users.role"/></th>
            <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                <th width="100"></th>
            </sec:authorize>
            <sec:authorize access="hasRole('ADMIN')">
                <th width="100"></th>
            </sec:authorize>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.ssoId}</td>
                <td>${user.email}</td>
                <td>${user.userRole}</td>
                <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                    <td><a href="<c:url value='edit-user-${user.ssoId}' />" class="btn btn-success custom-width">edit</a></td>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
                    <td><a href="<c:url value='delete-user-${user.ssoId}' />" class="btn btn-danger custom-width">delete</a></td>
                </sec:authorize>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
