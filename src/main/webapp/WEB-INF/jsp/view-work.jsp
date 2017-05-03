<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/9/17
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${work.name}</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-star-rating/css/star-rating.min.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/bootstrap-star-rating/themes/krajee-svg/theme.css" />" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>

    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-star-rating/js/star-rating.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-star-rating/themes/krajee-svg/theme.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-star-rating/js/locales/fa.js" />"></script>


    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-star-rating/themes/krajee-svg/theme.css" />" rel="stylesheet">

<%--<script src="<c:url value="/resources/js/stars.js" />"></script>--%>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container" id="body">
    <div class="row">
        <%-- Start Carousel--%>

        <div class="col-md-9" dir="rtl">
            <div class="card product-detail">
                <div class="card-content">
                    <div class="row border-bottom">
                        <div class="col-md-4 pull-right service-picture">
                            <c:forEach items="${work.images}" var="image">
                                <c:choose>
                                    <c:when test="${image!=null}">
                                        <img src="<c:url value="/resources/img/${image.path}"/>">
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="col-md-8">
                            <div class="title">
                                <h2>${work.name}</h2>
                            </div>
                            <ul class="service-details">
                                <li class="service-detail-item">
                                    <i class="glyphicon glyphicon-briefcase"></i>
                                    <span>${work.profession}</span>
                                </li>
                                <li class="service-detail-item">
                                    <i class="glyphicon glyphicon-map-marker"></i>
                                    <span>${work.state}</span>
                                </li>
                                <li class="service-detail-item">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                    <span>${work.createDate}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p class="service-description">
                                توضیحات محصول
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <%--<div class="social-links">
                            <i class="glyphicon glyphicon-send"></i>
                        </div>--%>
                    </div>
                    <%--<div class="row lead">
                        <div id="stars" class="starrr"></div>
                        <span id="count">0</span>
                    </div>--%>

                </div>
            </div>
        </div>

        <div class="col-md-3" dir="rtl">
            <jsp:include page="menu.jsp"/>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <input id="input-1-ltr-star-xs" name="input-1-ltr-star-xs" class="kv-ltr-theme-default-star rating-loading" value="1" dir="ltr" data-size="xs" lang="fa">
            <script>
                $(document).on('ready', function(){
                    $('.kv-ltr-theme-default-star').rating({
                        hoverOnClear: false,
                        containerClass: 'is-star'
                    });
                });
                $('#input-1-ltr-star-xs').on('rating.change', function(event, value, caption) {
                    console.log(value);
//                    console.log(caption);
                });

            </script>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"/>
<script>

</script>
</body>
</html>
