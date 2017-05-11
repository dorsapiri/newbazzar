<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/23/17
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>بازاری‌باز</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" class="container">
    <div class="col-sm-3 col-md-3 sidebar-first" dir="rtl">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <span class="glyphicon glyphicon-folder-close"></span>
                            فیلتر
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
    <c:if test="${not empty works}">
        <c:forEach items="${works}" var="work">
            <div class="col-md-3 column servicebox pull-right">
                    <%--<img src="/edustry/resources/img/brush.jpg" class="img-responsive">--%>
                <div class="image-container">
                    <c:forEach items="${work.images}" var="image">
                        <c:choose>
                            <c:when test="${image!=null}">
                                <img src="<c:url value="/resources/img/${image.path}"/>" class="cut-img" height="100px">
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
                    </dl>
                </div>
                <div class="productprice">
                    <div class="pull-right">
                        <a href="#" class="btn btn-danger btn-sm" role="button">بیشتر</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty works}">
        <p>Found Nothing</p>
    </c:if>
</div>
<jsp:include page="footer.jsp"/>


</body>
</html>
