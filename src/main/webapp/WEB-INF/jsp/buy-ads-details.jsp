<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 6/28/17
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tit.le</title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" class="container">
    <div class="row">
        <div class="col-md-8 col-lg-offset-2">
            <div class="card buy-ads-details">
                <div class="card-content">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="title">
                                <h2>${product.name}</h2>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>دسته</th>
                                        <td>
                                            <c:forEach items="${product.categories}" var="cat">
                                            <p>${cat.categoryName}</p>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>نوع خرید</th>
                                        <td>
                                            ${product.type}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>تعداد</th>
                                        <td>
                                            ${product.numberItems}
                                            <span>${product.unit.unitName}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>جزئیات کالا</th>
                                        <td>${product.prductDetails}</td>
                                    </tr>
                                </table>
                            </div>
                            <h3>اطلاعات تماس</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>نام و نام خانوادگی</th>
                                        <td>${product.nameFamily}</td>
                                    </tr>
                                    <tr>
                                        <th>تلفن همراه</th>
                                        <td>${product.mobile}</td>
                                    </tr>
                                    <tr>
                                        <th>تلفن ثابت</th>
                                        <td>${product.telephone}</td>
                                    </tr>
                                    <tr>
                                        <th>پست الکترونیکی</th>
                                        <td>${product.email}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
