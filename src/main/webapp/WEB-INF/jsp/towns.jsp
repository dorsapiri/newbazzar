<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/22/17
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>شهرها</title>
</head>
<body>
<form method="post" action="home">
    <div class="container">
        <div class="row">
            <div class="ccol-md-8 col-md-offset-1">
                <ul>
                    <c:forEach items="${cityFilter}" var="city">
                        <li>
                            <label for="towns">${city.state}</label>
                            <input id="towns" type="checkbox" value="${city.state}">
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="submit" value="فیلتر">
            </div>
        </div>
    </div>
</form>


</body>
</html>
