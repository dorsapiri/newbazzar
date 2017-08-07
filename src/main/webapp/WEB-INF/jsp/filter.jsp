<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/7/17
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>فیلتر</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container" id="body">
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
<jsp:include page="footer.jsp"/>
</body>
</html>
