<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 5/4/17
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>لیست آگهی خرید</title>
</head>
<body>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>شناسه </th>
            <th>تاریخ </th>
            <th>نام کالا</th>
            <th>تعداد</th>
            <th>نوع خرید</th>
            <th>اطلاعات تماس </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productAds}" var="productAd">
            <tr>
                <td>${productAd.id}</td>
                <td>${productAd.createDate}</td>
                <td>${productAd.name}</td>
                <td>${productAd.numberItems}-${productAd.unit}</td>
                <td>${productAd.type}</td>
                <td>${productAd.nameFamily}</td>
                <td>${productAd.mobile}</td>
                <td>${productAd.telephone}</td>
                <td>${productAd.email}</td>
                <%--<td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
