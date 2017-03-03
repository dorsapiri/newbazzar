<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.example.i18n.text" />
<%--<%@ page session="false"%>--%>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/3/16
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html lang="${language}">
<head>

    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".container-navbar" data-offset="50">


<%--Header and Menu--%>
<jsp:include page="header.jsp"/>
<div class="container content-page">
    <%--<div class="row">--%>

    <%--</div>--%>
    <div class="row">
        <%-- Start Carousel--%>
        <div class="col-md-2">
            <h3>تبلیغات</h3>
        </div>
        <div class="col-md-7" dir="rtl">
            <jsp:include page="carousel.jsp"/>

        </div>
        <div class="col-md-3" dir="rtl">
            <jsp:include page="menu.jsp"/>
        </div>
    </div>
    <div class="row">
        <jsp:include page="content.jsp"/>
    </div>

</div>

<!-- End Carousel -->



<%--content container--%>
<div class="container" id="body">

    <%-- Work Items--%>
    <div class="container-fluid table" align="center">
        <c:forEach var="mitem" items="${myservice}">
            <div class="col-md-4 column servicebox pull-right">
                <img src="/edustry/resources/img/brush.jpg" class="img-responsive">
                <div class="servicetitle">
                    <dl>
                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                        <dt><spring:message code="item.work.profession"/> </dt>
                        <dd>
                                ${mitem.profession}
                        </dd>
                        <dt><spring:message code="item.work.nameservice"/></dt>
                        <dd>
                                ${mitem.serviceName}
                        </dd>
                        <dt><spring:message code="item.work.state"/></dt>
                        <dd>
                                ${mitem.state}
                        </dd>
                    </dl>
                </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="#" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div style="display: inline;">
        <%--<h3 style="margin-top: 3%; margin-right: 3%;">محصولات</h3>--%>
    </div>
    <div class="product-container">
        <c:forEach var="mitem" items="${myproduct}">
            <div class="col-md-2 column pull-right productbox">
                <img src="resources/img/refreg.jpg" class="img-responsive">
                <div class="producttitle">${mitem.productType}</div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="#" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                    <div class="pricetext">${mitem.price}تومان</div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--footer--%>
<jsp:include page="footer.jsp"/>
</body>
</html>
