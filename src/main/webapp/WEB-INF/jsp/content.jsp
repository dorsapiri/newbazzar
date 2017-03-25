<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="last-work" dir="rtl">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8 pull-right">
                <h3 class="section-title">آخرین خدمات</h3>
            </div>
            <div class="col-md-4 pull-left text-left">
                <a href="#" class="btn btn-success more-btn">بیشتر</a>
            </div>
        </div>
        <hr>
    </div>

    <div class="container-fluid table" align="center">
        <c:forEach var="work" items="${works}">
            <div class="col-md-3 col- column servicebox pull-right" onclick="openPage('view-work-${work.id}');">
                <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                    <c:forEach items="${work.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">


                                <img src="data:image/jpg;base64,${image}"  height="100">

                            </c:when>
                        </c:choose>
                    </c:forEach>
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
                                ${work.state}
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

<div class="most-visited-work" dir="rtl">
    <div class="section-header">
        <div class="row">
            <div class="col-md-8 pull-right">
                <h3 class="section-title">پر بازدیدترین خدمات</h3>
            </div>
            <div class="col-md-4 pull-left text-left">
                <a href="#" class="btn btn-success more-btn">بیشتر</a>
            </div>
        </div>
        <hr>
    </div>

    <div class="container-fluid table" align="center">
        <c:forEach var="work" items="${works}">
            <div class="col-md-3 column servicebox pull-right" onclick="openPage('view-work-${work.id}');">
                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                <div>
                    <c:forEach items="${work.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">

                                <img src="data:image/jpg;base64,${image}" height="100">

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
                                ${work.state}
                        </dd>
                        <dd>

                        </dd>
                    </dl>

                </div>
                        <div class="col-md-7 text-center">
                                <%--<h2> 14240 <small> votes </small></h2>--%>
                                <%--<button type="button" class="btn btn-default"> Vote Now! </button>--%>
                            <div class="stars">
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                            </div>
                                <%--<p> Average 4.5 <small> / </small> 5 </p>--%>
                        </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="#" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
