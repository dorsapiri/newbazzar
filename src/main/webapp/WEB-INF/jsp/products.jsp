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
        <span class=""><a href="new-product"><i class="glyphicon glyphicon-plus-sign"></i><spring:message code="products.add.product"/> </a></span>
    </div>
</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="products.id"/> </th>
            <th><spring:message code="products.name"/> </th>
            <th><spring:message code="product.SKU"/> </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.sku}</td>
                <td>${product.createDate}</td>
                <td>${product.owner.ssoId}</td>
                <td><a href="<c:url value="edit-work-${product.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
