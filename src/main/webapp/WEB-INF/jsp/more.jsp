<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 6/25/17
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <c:if test="${not empty allWorks}">
        <title>Works</title>
    </c:if>
    <c:if test="${not empty allProducts}">
        <title>Products</title>
    </c:if>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css" />" rel="stylesheet">
    <style>
        .comparison-box{
        translateX(100%);
            position: absolute;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div id="body" class="container">
    <div class="row comparison-items">
        <div class="col-md-3">
            <form:form method="get" commandName="comparison" id="comp-form" action="/baz/comparison">
                <div class="form-group">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary btn-lg" id="comparison-button">مقایسه</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
    <div class="row">
        <c:if test="${not empty allWorks}">
            <c:forEach items="${allWorks}" var="work">
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
                            <span>${work.countFav}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${not empty allProducts}">
            <c:forEach items="${allProducts}" var="product">
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
                            <dt><spring:message code="item.work.profession"/></dt>
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
                                <div class="row comparison-box pull-left" hidden>
                                    <div class="col-md-12">
                                        <label for="comparison-${product.id}">مقایسه</label>
                                        <input type="checkbox" value="${product.id}" id="comparison-${product.id}"
                                               class="comparison">
                                    </div>
                                </div>
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
                            <span>${product.countFav}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $('.servicebox').on('mouseenter',function () {
            $(".comparison-box").show();
        });
        $('.servicebox').on('mouseleave',function () {
            $(".comparison-box").hide();
        });
        $('#comparison-button').hide();
        var itemValues = [];
        $('.comparison').on('click',function () {
//            var box = "<div class="+$(this).val()+"><p>"+$(this).val()+"</p></div>";
            var box = "<div class="+$(this).val()+">"+"<div class='form-group'><input name='listStuffs' type='hidden' id='comp-item-0' value='"+$(this).val()+"'/></div>"+"</div>";
            var itemValue = $(this).val();

            if($(this).is(':checked')){
//                $('.comparison-items').append(box);
                $('#comp-form').append(box);
                if(itemValues[0]==null){
                    itemValues[0]= itemValue;
                }else if($.inArray(itemValue,itemValues)){
//                    itemValues+=itemValue;
                    itemValues.push(itemValue);
                }
//                $('#comp-item-0').val(itemValue);
//                $('#comp-item-1').val(itemValue);
            }else {
                var innerInput = document.getElementsByClassName('form-group');
                $('#comp-form').find('.'+$(this).val()).find("div > input").remove();
//                $('.comparison-items').find('div:contains('+$(this).val()+')').remove();
            }
            $('#comparison-button').show();
        });
    });
</script>
</html>
