<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 1/30/17
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="category">
    <h2 class="heading">دسته‌بندی‌ها <span class="pull-right"><i class="fa fa-bars"></i></span></h2>
    <ul class="list-unstyled">
        <%--<li>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Automobiles
                    <span class="glyphicon glyphicon-menu-left pull-left"></span>
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>


                </div>
            </div>
        </li>--%>
        <c:forEach items="${rootCategories}" var="root">
            <li>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${root.categoryName}
                        <span class="fa fa-chevron-left pull-left" aria-hidden="true"></span>
                    </button>
                    <c:forEach items="${allParent}" var="child">
                        <c:if test="${child.key.id == root.id}">
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                                <c:forEach items="${child.value}" var="ch">
                                    <div class="col-sm-4 pull-right">
                                        <div class="sub-cat">
                                            <h3>${ch.categoryName}<span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                                            <ul class="list-unstyled">
                                                <c:forEach items="${allChildren}" var="grandch">
                                                    <c:if test="${ch.id == grandch.key.id}">
                                                        <c:forEach items="${grandch.value}" var="chitem">
                                                            <li><a href="category?url=${chitem.categoryLink}" title="${chitem.categoryName}">${chitem.categoryName}</a></li>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </li>
        </c:forEach>
        <%--<li>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Automobiles
                    <span class="glyphicon glyphicon-menu-left pull-left"></span>
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="sub-cat">
                            <h3>Cars <span class="pull-right"><i class="fa fa-chevron-right"></i></span></h3>
                            <ul class="list-unstyled">
                                <li><a href="" title="">Toyota</a></li>
                                <li><a href="" title="">Suzuki</a></li>
                                <li><a href="" title="">Ford</a></li>
                                <li><a href="" title="">BMW</a></li>
                                <li><a href="" title="">Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li><a href="" title="">Furnitures</a></li>--%>
    </ul>
</div>
</body>
</html>
