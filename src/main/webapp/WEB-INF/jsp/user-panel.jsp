<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css" />" rel="stylesheet">
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
                <li><a href="#my-favorite">علاقه‌مندی‌ها</a></li>
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
                    <div class="row">
                        <div class="col-md-4 pull-right">
                            <a href="<%=request.getContextPath() %>/new-work/" class="btn btn-bottom">افزودن خدمت</a>
                        </div>
                    </div>
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
                                        <div id="work-state">${work.place.state}</div>
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
                    <c:if test="${empty moreInfo}">
                        <a href="<c:url value="/information/${user.ssoId}"/>" class="btn btn-bottom">تکمیل اطلاعات ثبت‌نام</a>
                    </c:if>

                    <h3> اطلاعات کامل</h3>
                    <table class="table">
                        <tr>
                            <th>
                                <label for="work-title">شناسه کاربر</label>
                            </th>
                            <th>
                                <label for="work-profession">نام</label>
                            </th>
                            <th>
                                <label for="work-state">تاریخ عضویت</label>
                            </th>
                            <%--<th>
                                <label for="work-date">تاریخ</label>
                            </th>--%>
                        </tr>
                        <c:if test="${not empty moreInfo}">
                            <%--<c:forEach items="${moreInfo}" var="work">--%>
                                <tr>
                                    <td>
                                        <div id="user-info-username">${moreInfo.user.ssoId}</div>
                                    </td>
                                    <td>
                                        <div id="user-info-name">${moreInfo.name}</div>
                                    </td>
                                    <td>
                                        <div id="user-info-date">${moreInfo.user.createDate}</div>
                                    </td>
                                    <%--<td>
                                        <div id="work-date">${work.createDate}</div>
                                    </td>--%>
                                </tr>
                            <%--</c:forEach>--%>
                        </c:if>
                    </table>
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


                                                        <img src="<c:url value="/resources/images/${image.path}"/>"  height="100">

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
                <div id="my-favorite" class="tab-pane fade">
                    <h3> لیست علاقه‌مندی‌ها</h3>
                    <c:if test="${not empty favWorks}">
                        <c:forEach var="favwork" items="${favWorks}">
                            <div class="col-md-3 col- column servicebox pull-right">
                                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                                <c:forEach items="${favwork.images}" var="image">
                                    <c:choose>
                                        <c:when test="${image!=null}">


                                            <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">

                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <div class="servicetitle caption">
                                    <dl>
                                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                                        <dt><spring:message code="item.work.profession"/> </dt>
                                        <dd>
                                                ${favwork.profession}
                                        </dd>
                                        <dt><spring:message code="item.work.nameservice"/></dt>
                                        <dd>
                                                ${favwork.name}
                                        </dd>
                                        <dt><spring:message code="item.work.state"/></dt>
                                        <dd>
                                                ${favwork.place.state}
                                        </dd>
                                    </dl>
                                </div>
                                <div class="productprice">
                                    <div class="pull-right">
                                        <a href="view-work-${favwork.id}" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                                    </div>
                                    <div class="favorite-box pull-left">
                                        <c:if test="${empty favwork.favorite}">
                                            <a href="add-to-favorite/${favwork.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                        </c:if>
                                        <c:set var="isFavw" value="false"/>
                                        <c:forEach items="${favwork.favorite}" var="favuser">
                                            <c:choose>
                                                <c:when test="${favuser.ssoId == loggedinuser}">
                                                    <c:set var="isFavw" value="true"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${isFavw == true}">
                                            <a href="remove-from-favorite/${favwork.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                                        </c:if>
                                        <c:if test="${isFavw == false}">
                                            <a href="add-to-favorite/${favwork.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                        </c:if>

                                        <span>${favwork.countFav}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty favProducts}">
                        <c:forEach var="favproduct" items="${favProducts}">
                            <div class="col-md-3 col- column servicebox pull-right">
                                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                                <c:forEach items="${favproduct.images}" var="image">
                                    <c:choose>
                                        <c:when test="${image!=null}">


                                            <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">

                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <div class="servicetitle caption">
                                    <dl>
                                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                                        <dt>مدل محصول </dt>
                                        <dd>
                                                ${favproduct.modelName}</br>
                                        </dd>
                                        <dt>نام محصول </dt>
                                        <dd>
                                                ${favproduct.name}
                                        </dd>
                                        <dt>قیمت</dt>
                                        <dd>
                                                ${favproduct.price}
                                        </dd>
                                        <dd>

                                        </dd>
                                    </dl>
                                </div>
                                <div class="productprice">
                                    <div class="pull-right">
                                        <a href="view-work-${favproduct.id}" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                                    </div>
                                    <div class="favorite-box pull-left">
                                        <c:if test="${empty favproduct.favorite}">
                                            <a href="add-to-favorite/${favwork.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                        </c:if>
                                        <c:set var="isFavw" value="false"/>
                                        <c:forEach items="${favproduct.favorite}" var="favuser">
                                            <c:choose>
                                                <c:when test="${favuser.ssoId == loggedinuser}">
                                                    <c:set var="isFavw" value="true"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${isFavw == true}">
                                            <a href="remove-from-favorite/${favproduct.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                                        </c:if>
                                        <c:if test="${isFavw == false}">
                                            <a href="add-to-favorite/${favproduct.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                        </c:if>

                                        <span>${favproduct.countFav}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
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
