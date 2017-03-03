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
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
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
                                        <img src="data:image/jpg;base64,${image}">
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="col-md-8">
                            <div class="title">
                                <h2>${work.serviceName}</h2>
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
                </div>
            </div>
        </div>
        <div class="col-md-3" dir="rtl">
            <jsp:include page="menu.jsp"/>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"/>
</body>
</html>
