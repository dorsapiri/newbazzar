<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/13/17
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>پنل کاربری</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body">
    <div class="container" dir="rtl">
        <div class="right-tabs clearfix">
            <ul class="nav nav-tabs ">
                <li class="active"><a href="#user-info">مشخصات کاربر</a></li>
                <li><a href="#my-work">خدمات</a></li>
                <li><a href="#more-info">اطلاعات تکمیلی</a></li>
                <li><a href="#my-product">محصول</a></li>
            </ul>
            <div class="tab-content">
                <div id="user-info" class="tab-pane fade in active">
                    <h3> مشخصات کاربر</h3>
                    <table class="table">
                        <tr>
                            <th>
                                <label for="username">نام کاربری</label>
                            </th>
                            <td>
                                <div id="username">${user.ssoId}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="name">نام</label>
                            </th>
                            <td>
                                <div id="name">${user.firstName}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="lastname">نام خانوادگی</label>
                            </th>
                            <td>
                                <div id="lastname">${user.lastName}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="email">پست الکترونیکی</label>
                            </th>
                            <td>
                                <div id="email">${user.email}</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="my-work" class="tab-pane fade">
                    <h3> خدمات</h3>
                    <table class="table">
                        <tr>
                            <th>
                                <label for="work-title">عنوان خدمت</label>
                            </th>
                            <th>
                                <label for="work-profession">صنف</label>
                            </th>
                            <th>
                                <label for="work-state">مکان</label>
                            </th>
                            <th>
                                <label for="work-date">تاریخ</label>
                            </th>
                        </tr>
                        <c:if test="${not empty works}">
                            <c:forEach items="${works}" var="work">
                                <tr>
                                    <td>
                                        <div id="work-title">${work.name}</div>
                                    </td>
                                    <td>
                                        <div id="work-profession">${work.profession}</div>
                                    </td>
                                    <td>
                                        <div id="work-state">${work.state}</div>
                                    </td>
                                    <td>
                                        <div id="work-date">${work.createDate}</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
                <div id="more-info" class="tab-pane fade">
                    <a href="<c:url value="/information/${user.ssoId}"/>" class="btn btn-bottom">تکمیل اطلاعات ثبت‌نام</a>
                </div>
                <div id="my-product" class="tab-pane fade">
                    <a href="<c:url value="/${loggedinuser}/new-product"/>" class="btn btn-bottom">افزودن محصول</a>
                    <h3> محصولات</h3>
                    <table class="table">
                        <tr>
                            <th>
                                <label for="product-title">عنوان محصول</label>
                            </th>
                            <th>
                                <label for="product-sku">کد محصول</label>
                            </th>
                            <th>
                                <label for="product-stock">موجودی</label>
                            </th>
                            <th>
                                <label for="product-image">تصویر</label>
                            </th>
                        </tr>
                        <c:if test="${not empty products}">
                            <c:forEach items="${products}" var="product">
                                <tr>
                                    <td>
                                        <div id="product-title">${product.name}</div>
                                    </td>
                                    <td>
                                        <div id="product-sku">${product.sku}</div>
                                    </td>
                                    <td>
                                        <div id="product-stock">${product.stock}</div>
                                    </td>
                                    <td>
                                        <div id="product-image">
                                            <c:forEach items="${product.images}" var="image">
                                                <c:choose>
                                                    <c:when test="${image!=null}">


                                                        <img src="<c:url value="/resources/img/${image.path}"/>"  height="100">

                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>

<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function(){
            $(this).tab('show');
        });
    });
</script>
</body>
</html>
