<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 3/27/17
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>اسلایدشوها</title>
</head>
<body>
<div class="actions">
    <div class="col-md-3 pull-right">
        <a href="new-slideshow"><i class="glyphicon glyphicon-plus-sign"></i>افزودن تصویر</a>
    </div>
</div>
<div class="container table-responsive">
    <c:forEach items="${slides}" var="slide">

        <div class="col-md-2 column pull-right">
            <a href="<c:url value="remove-slide-${slide.id}"/>"><i class="fa fa-remove"></i> </a>
                ${slide.title}

            <img src="<c:url value="/resources/images/${slide.slideImage.path}"/>" width="100%" >
        </div>
    </c:forEach>
</div>
</body>
</html>
