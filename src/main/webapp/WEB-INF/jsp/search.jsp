<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/12/16
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="UTF-8">
    <title>Search</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container" dir="rtl">

    <div class="row">
        <%--Sidebar--%>
        <div class="col-sm-3 col-md-3 sidebar-first">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                <span class="glyphicon glyphicon-folder-close"></span>
                                <spring:message code="menu.works" text="works"/>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul>
                                <c:forEach items="${professions}" var="profession">
                                    <li data-toggle="collapse">
                                        <span class="glyphicon glyphicon-grain text-primary"></span>
                                        <a href="#">${profession}</a>
                                    </li>
                                    <c:forEach var="count" items="${shj}">
                                        <c:if test="${profession == count.profession}">
                                            <ul>
                                                <li>${count.name}</li>
                                            </ul>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Search Reasult--%>
        <div class="col-md-8">
            <c:if test="${not empty shj}">
                <div class="row work-result">
                    <h4>جستجوی خدمات</h4>
                    <hr>
                    <c:forEach var="count" items="${shj}">
                        <div class="col-md-4 column servicebox pull-right">
                                <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                            <div>
                                <c:forEach items="${count.images}" var="image">
                                    <c:choose>
                                        <c:when test="${image!=null}">
                                            <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100px">
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <div class="servicetitle">
                                <dl>
                                        <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                                    <dt><spring:message code="item.work.profession"/> </dt>
                                    <dd>
                                            ${count.profession}
                                    </dd>
                                    <dt><spring:message code="item.work.nameservice"/></dt>
                                    <dd>
                                            ${count.name}
                                    </dd>
                                    <dt><spring:message code="item.work.state"/></dt>
                                    <dd>
                                            ${count.place.state}
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
            </c:if>
            <c:if test="${not empty productasearch}">
                <div class="row product-result">
                    <h4>جستجوی محصولات</h4>
                    <hr>
                    <c:forEach var="prs" items="${productasearch}">
                        <div class="col-md-4 column servicebox pull-right">
                                <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                            <div>
                                <c:forEach items="${prs.images}" var="image">
                                    <c:choose>
                                        <c:when test="${image!=null}">
                                            <img src="<c:url value="/resources/images/${image.path}"/>" class="cut-img" height="100px">
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <div class="servicetitle">
                                <dl>
                                        <%--<dt><c:out value="${vars.serviceName}"/></dt>--%>
                                    <dt><spring:message code="item.work.profession"/> </dt>
                                    <dd>
                                            ${prs.modelName}
                                    </dd>
                                    <dt><spring:message code="item.work.nameservice"/></dt>
                                    <dd>
                                            ${prs.name}
                                    </dd>
                                    <dt><spring:message code="item.work.state"/></dt>
                                    <dd>
                                            ${prs.price}
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
            </c:if>
            <c:if test="${empty shj && empty productasearch}">
                <p>Found Nothing</p>
            </c:if>
        </div>
    </div>
</div>



</body>
</html>
