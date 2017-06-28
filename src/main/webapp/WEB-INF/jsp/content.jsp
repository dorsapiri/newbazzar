<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/31/17
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css" />" rel="stylesheet">
<style>
    a#fav{
        text-decoration: none;
    }

    .image-section{
        z-index: -1;
    }
</style>
</head>
<body>
${filterWorks}

<div id="filter_result">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8 ">
                <h3 class="section-title">نتایج فیلتر</h3>
            </div>
        </div>
        <hr>
    </div>
    <c:forEach items="${workFiltered}" var="filterW">
        <div class="col-md-3 col- column servicebox pull-right">
                <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
            <div class="row image-section">
                <div class="col-md-12">
                    <c:forEach items="${filterW.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">
                                <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
            <div class="servicetitle caption">
                <dl>
                        <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                    <dt><spring:message code="item.work.profession"/> </dt>
                    <dd>
                            ${filterW.profession}
                    </dd>
                    <dt><spring:message code="item.work.nameservice"/></dt>
                    <dd>
                            ${filterW.name}
                    </dd>
                    <dt><spring:message code="item.work.state"/></dt>
                    <dd>
                            ${filterW.place.state}
                    </dd>
                    <dd>
                        <div  class="row comparison-box pull-left" hidden>
                            <div class="col-md-12">
                                <label for="comparison-${filterW.id}">مقایسه</label>
                                <input type="checkbox" value="${filterW.id}" id="comparison-${filterW.id}" class="comparison">
                            </div>
                        </div>
                    </dd>
                </dl>
            </div>
            <div class="productprice">
                <div class="pull-right">filterW</div>
                <div class="favorite-box">
                    <c:choose>
                        <c:when test="${empty filterW.favorite}">
                            <a href="add-to-favorite/${filterW.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>

                        </c:when>
                        <c:otherwise>
                            <c:set var="isFavw" value="false"/>
                            <c:forEach items="${filterW.favorite}" var="favuser">
                                <c:choose>
                                    <c:when test="${favuser.ssoId == loggedinuser}">
                                        <c:set var="isFavw" value="true"/>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${isFavw == true}">
                                <a href="remove-from-favorite/${filterW.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                            </c:if>
                            <c:if test="${isFavw == false}">
                                <a href="add-to-favorite/${filterW.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <span>${filterW.countFav}</span>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="last-work" dir="rtl">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8 ">
                <h3 class="section-title">آخرین خدمات</h3>
            </div>
            <div class="col-md-4 text-left">
                <a href="more/works" class="btn btn-success more-btn">بیشتر</a>
            </div>
        </div>
        <hr>
    </div>

    <div class="container-fluid table" align="center">
        <c:forEach var="work" items="${works}">
            <div class="col-md-3 col- column servicebox pull-right">
                <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                    <div class="row image-section">
                        <div class="col-md-12">
                            <c:forEach items="${work.images}" var="image">
                                <c:choose>
                                    <c:when test="${image!=null}">
                                        <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                <div class="servicetitle caption">
                    <dl>
                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                        <dt><spring:message code="item.work.profession"/> </dt>
                        <dd>
                                ${work.profession}
                        </dd>
                        <dt><spring:message code="item.work.nameservice"/></dt>
                        <dd>
                                ${work.name}
                        </dd>
                        <dt><spring:message code="item.work.state"/></dt>
                        <dd>
                                ${work.place.state}
                        </dd>
                        <dd>
                            <div  class="row comparison-box pull-left" hidden>
                                <div class="col-md-12">
                                    <label for="comparison-${work.id}">مقایسه</label>
                                    <input type="checkbox" value="${work.id}" id="comparison-${work.id}" class="comparison">
                                </div>
                            </div>
                        </dd>
                    </dl>
                </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="view-work-${work.id}" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                    <div class="favorite-box">
                        <c:choose>
                            <c:when test="${empty work.favorite}">
                                <a href="add-to-favorite/${work.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>

                            </c:when>
                            <c:otherwise>
                                <c:set var="isFavw" value="false"/>
                                <c:forEach items="${work.favorite}" var="favuser">
                                    <c:choose>
                                        <c:when test="${favuser.ssoId == loggedinuser}">
                                            <c:set var="isFavw" value="true"/>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${isFavw == true}">
                                    <a href="remove-from-favorite/${work.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                                </c:if>
                                <c:if test="${isFavw == false}">
                                    <a href="add-to-favorite/${work.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <%--<c:if test="${empty work.favorite}">
                            <a href="add-to-favorite/${work.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                        </c:if>--%>
                        <%--<c:set var="isFavw" value="false"/>
                        <c:forEach items="${work.favorite}" var="favuser">
                            <c:choose>
                                <c:when test="${favuser.ssoId == loggedinuser}">
                                    <c:set var="isFavw" value="true"/>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${isFavw == true}">
                            <a href="remove-from-favorite/${work.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                        </c:if>
                        <c:if test="${isFavw == false}">
                            <a href="add-to-favorite/${work.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                        </c:if>--%>

                        <span>${work.countFav}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="most-visited-work" dir="rtl">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8">
                <h3 class="section-title">پر بازدیدترین خدمات</h3>
            </div>
            <div class="col-md-4 text-left">
                <a href="#" class="btn btn-success more-btn">بیشتر</a>
            </div>
        </div>
        <hr>
    </div>
    <div class="container-fluid table" align="center">
        <c:forEach var="work" items="${works}">
            <div class="col-md-3 column servicebox pull-right">
                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                <div class="image-container">
                    <c:forEach items="${work.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">

                                <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">

                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="servicetitle">
                    <dl>
                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                        <dt><spring:message code="item.work.profession"/> </dt>
                        <dd>
                                ${work.profession}
                        </dd>
                        <dt><spring:message code="item.work.nameservice"/></dt>
                        <dd>
                                ${work.name}
                        </dd>
                        <dt><spring:message code="item.work.state"/></dt>
                        <dd>
                                ${work.place.state}
                        </dd>
                        <dd>

                        </dd>
                    </dl>

                </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="view-work-${work.id}" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%--products--%>

<div class="most-visited-work" dir="rtl">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8 pull-right">
                <h3 class="section-title">آخرین محصولات</h3>
            </div>
            <div class="col-md-4 pull-left text-left">
                <a href="more/products" class="btn btn-success more-btn">بیشتر</a>
            </div>
        </div>
        <hr>
    </div>
    <div class="container-fluid table" align="center">
        <c:forEach var="product" items="${products}">
            <div class="col-md-3 column servicebox pull-right">
                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                <div class="image-container">
                    <c:forEach items="${product.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">

                                <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100">

                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="servicetitle">
                    <dl>
                            <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                        <dt><spring:message code="item.work.profession"/> </dt>
                        <dd>
                                ${product.modelName}
                        </dd>
                        <dt><spring:message code="item.work.nameservice"/></dt>
                        <dd>
                                ${product.name}
                        </dd>
                        <dt><spring:message code="item.work.state"/></dt>
                        <dd>
                                ${product.price}
                        </dd>
                        <dd>

                        </dd>
                    </dl>

                </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="view-product-${product.id}" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                    <div class="favorite-box">
                        <c:choose>
                            <c:when test="${empty product.favorite}">
                                <a href="add-to-favorite/${product.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                            </c:when>
                            <c:otherwise>
                                <c:set var="isFav" value="false"/>
                                <c:forEach items="${product.favorite}" var="favuser">
                                    <c:choose>
                                        <c:when test="${favuser.ssoId == loggedinuser}">
                                            <c:set var="isFav" value="true"/>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${isFav == true}">
                                    <a href="remove-from-favorite/${product.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                                </c:if>
                                <c:if test="${isFav == false}">
                                    <a href="add-to-favorite/${product.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <%--<c:if test="${empty product.favorite}">
                            <a href="add-to-favorite/${product.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                        </c:if>--%>
                        <%--<c:set var="isFav" value="false"/>
                        <c:forEach items="${product.favorite}" var="favuser">
                            <c:choose>
                                <c:when test="${favuser.ssoId == loggedinuser}">
                                    <c:set var="isFav" value="true"/>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${isFav == true}">
                            <a href="remove-from-favorite/${product.id}" id="dis-fav" class="fa fa-heart" aria-hidden="true"></a>
                        </c:if>
                        <c:if test="${isFav == false}">
                            <a href="add-to-favorite/${product.id}" id="fav" class="fa fa-heart-o" aria-hidden="true"></a>
                        </c:if>--%>

                        <span>${product.countFav}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.filter-city').find('a').click(function (e) {
            var param = $(this).attr("href").replace("#", "");
            var concept = $(this).text();
            $('#filter_param').val(param);
            $('#filter_concept').text(concept);
            $.ajax({
                type: "GET",
                url:'place-filter',
                data: ({state:param}),
                success:function (data) {
//                    $('#filter_result').html(data[0].name);
                    $('#filter_result').append("<c:forEach items='${data}' var='filterW'>"+"<div class='col-md-3 col- column servicebox pull-right'>" +"${filterW.profession}"+
                        "</div>"+"</c:forEach>");
                    for (x in data){
                        $('#filter_result').append("<div class='col-md-3 col- column servicebox pull-right'>"+data[x].profession+"</div>");
                    }

                }
            });

        });



    });
</script>
</body>
</html>
