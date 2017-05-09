<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/21/16
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <%--External sources--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<link href = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet">--%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <%--<script src = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>--%>
    <%--Internal sources--%>


    <%--<script src="<c:url value="/resources/js/jquery-3.1.1.min.js" />"></script>--%>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <%--<script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>--%>
    <%--<link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">--%>
    <%--<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">--%>
</head>
<body>
<header>
    <div class="header" style="text-align: right">

        <div class="primary-nav" dir="rtl">
            <div class="container">
                <div class="row">
                    <ul class="nav navbar-nav navbar-right">
                        <li></li>
                        <li>
                            <c:choose>
                                <c:when test="${pageContext.request.userPrincipal.authenticated}">
                                    <div class="user-menu-header">
                                        <div onclick="location.href='logout'" class="login">
                                            <i class="glyphicon glyphicon-user"></i>
                                            <span>${loggedinuserName}</span>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="btn-group-horizontal">
                                                    <a href="<%=request.getContextPath() %>/logout"
                                                       class="btn btn-primary"><spring:message
                                                            code="header.logout"/></a>
                                                    <a href="<%=request.getContextPath() %>/user-panel/${loggedinuser}"
                                                       class="btn btn-primary">ناحیه کاربری</a>
                                                    <sec:authorize access="hasRole('ADMIN')">
                                                        <a href="<%=request.getContextPath() %>/admin/"
                                                           class="btn btn-primary">پنل مدیریت</a>
                                                    </sec:authorize>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="user-menu-header">
                                        <div onclick="location.href='login'" class=" login">
                                            <i class="glyphicon glyphicon-user"></i>
                                            <span><spring:message code="header.login"/></span>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="btn-group-horizontal">
                                                    <a href="<%=request.getContextPath() %>/login"
                                                       class="btn btn-primary"><spring:message code="header.login"/></a>
                                                    <a href="<%=request.getContextPath() %>/newuser"
                                                       class="btn btn-primary"><spring:message
                                                            code="login.register.button"/> </a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li></li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="secondary-nav">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 pull-right" dir="rtl">
                        <a class="navbar-brand" href="<%=request.getContextPath() %>/"><spring:message code="site.name"
                                                                                                       text="site.name"/> </a>
                    </div>
                    <div class="col-md-2 col-sm-2" dir="rtl">
                        <%--<div type="button" class="btn btn-primary ads-btn" onclick="location.href='product'">
                            <span>آگهی خرید</span>
                        </div>--%>
                        <button class="btn btn-primary ads-btn" onclick="location.href='buy-ads'">آگهی خرید</button>
                    </div>
                    <div class="col-md-5 col-sm-5 form-inline">
                        <form:form id="search-form" class="form-inline search-input" role="search" method="get"
                                   action="search">
                            <%--<form:form id="search-form" class="search-input" role="search" method="get" action="search">--%>
                            <div class="input-group">
                                <span class="input-group-btn">
                         <button type="submit" class="btn btn-primary search-btn" data-target="#search-form">
                             <i class="glyphicon glyphicon-search "></i>
                         </button>
                        </span>
                                <input type="hidden" name="search_param" value="all" id="search_param">
                                <input type="text" class="form-control search-form"
                                       placeholder="<spring:message code="header.search"/>" dir="rtl" name="srch"
                                       id="search-box"/>
                                <div id="search-result"></div>
                                <div class="input-group-btn search-panel">
                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown">
                                        <span id="search_concept">دسته‌بندی</span> <span class="caret"></span>
                                    </button>
                                    <input type="hidden" id="filter_param">
                                    <ul class="dropdown-menu" role="menu">
                                        <c:forEach items="${allCategories}" var="category">
                                            <%--<li><div onclick="setserch('${category.categoryName}'); ">${category.categoryName}</div></li>--%>
                                            <li><a href="#${category.categoryLink}">${category.categoryName}</a></li>
                                        </c:forEach>
                                        <li class="divider"></li>
                                        <li><a href="#all">همه</a></li>
                                    </ul>
                                </div>
                            </div>
                        </form:form>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span id="filter_concept">دسته‌بندی</span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu filter-city" role="menu">
                            <c:forEach items="${cityFilter}" var="category">
                                <%--<li><div onclick="setserch('${category.categoryName}'); ">${category.categoryName}</div></li>--%>
                                <li><a href="#${category.state}">${category.state}</a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <%--<form:form class="navbar-form" role="search" method="get" action="search" commandName="home">
                        <div id="custom-search-input">
                            <div class="input-group col-md-8">
                                <input type="text" class="form-control" placeholder="<spring:message code="header.search" text="header.search"/>" name="srch" id="srch-term" onkeydown="if (event.keyCode == 13) window.location = 'search';">
                                <span class="input-group-btn">
                                            <button class="btn btn-danger" type="button">
                                                <span class=" glyphicon glyphicon-search"></span>
                                            </button>
                                </span>
                            </div>
                        </div>
                    </form:form>--%>

                </div>
            </div>
        </div>
    </div>


    <c:url value="/place-filter" var="pageURL"/>
    <script>
        /*function setserch(id) {
         var categoryItems =  "، ";
         var searchBox = $('#search-box');
         if (searchBox.val()=="")
         categoryItems = id;
         else
         categoryItems = searchBox.val()+categoryItems+id;
         searchBox.val(categoryItems);
         }*/
        $(document).ready(function (e) {
            $('.search-panel .dropdown-menu').find('a').click(function (e) {
                e.preventDefault();
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('.search-panel span#search_concept').text(concept);
                $('.input-group #search_param').val(param);
            });

            $('.filter-city').find('a').click(function (e) {
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('#filter_param').val(param);
                $('#filter_concept').text(concept);
                $.getJSON('${pageURL}', {
                    state: param
                }, function (data) {

                });

            });

        });
    </script>
</header>
<%--navbar--%>
<%--
<div class="container-navbar" style="direction: rtl">
    <nav class="navbar navbar-default" data-spy="affix" data-offset-top="57">
        <div class="navbar-header navbar-right">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/edustry"><spring:message code="site.name" text="site.name"/> </a>
        </div>
        <div class="collapse navbar-collapse js-navbar-collapse pull-right">
            <ul class="nav navbar-nav">
                <li class="dropdown mega-dropdown navbar-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <spring:message code="menu.works"/>
                        &lt;%&ndash;<span class="caret"></span>&ndash;%&gt;
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                        &lt;%&ndash;<li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Men Collection</li>
                                <div id="menCollection" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 1"></a>
                                            <h4>
                                                <small>Summer dress floral prints</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">49,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 2"></a>
                                            <h4>
                                                <small>Gold sandals with shiny touch</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">9,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 3"></a>
                                            <h4>
                                                <small>Denin jacket stamped</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">49,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                    </div><!-- End Carousel Inner -->
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#menCollection" role="button"
                                       data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#menCollection" role="button"
                                       data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div><!-- /.carousel -->
                                <li class="divider"></li>
                                <li><a href="#">View all Collection <span
                                        class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                            </ul>
                        </li>&ndash;%&gt;
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">حرفه</li>
                                <li><a href="#">کابینت</a></li>
                                <li><a href="#">کاغذ دیواری</a></li>
                                <li><a href="#">تعمیرکار</a></li>
                                <li><a href="#">تعمیرات دکوراسیون</a></li>
                                <li class="divider"></li>
                                <li class="dropdown-header">صنف</li>
                                <li><a href="#">طراحی</a></li>
                                <li><a href="#">صنایع چوب</a></li>
                            </ul>
                        </li>
                        &lt;%&ndash;<li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Plus</li>
                                <li><a href="#">Navbar Inverse</a></li>
                                <li><a href="#">Pull Right Elements</a></li>
                                <li><a href="#">Coloured Headers</a></li>
                                <li><a href="#">Primary Buttons & Default</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Much more</li>
                                <li><a href="#">Easy to Customize</a></li>
                                <li><a href="#">Calls to action</a></li>
                                <li><a href="#">Custom Fonts</a></li>
                                <li><a href="#">Slide down on Hover</a></li>
                            </ul>
                        </li>&ndash;%&gt;
                    </ul>
                </li>
                <li class="dropdown mega-dropdown navbar-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <spring:message code="menu.products"/>
                        &lt;%&ndash;<span class="caret"></span>&ndash;%&gt;
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">لوازم خانگی</li>
                                <li><a href="#">یخچال</a></li>
                                <li><a href="#">ماشین لباسشویی</a></li>
                                <li><a href="#">گاز</a></li>
                                <li><a href="#">جاروبرقی</a></li>
                                <li class="divider"></li>
                                &lt;%&ndash;<li class="dropdown-header">Fonts</li>
                                <li><a href="#">Glyphicon</a></li>
                                <li><a href="#">Google Fonts</a></li>&ndash;%&gt;
                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">کالای دیجیتال</li>
                                <li><a href="#">رایانه</a></li>
                                <li><a href="#">تلفن همراه</a></li>
                                <li><a href="#">لوازم جانبی</a></li>
                                <li><a href="#">ماشین‌های اداری</a></li>
                            </ul>
                        </li>
                        &lt;%&ndash;<li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Much more</li>
                                <li><a href="#">Easy to Customize</a></li>
                                <li><a href="#">Calls to action</a></li>
                                <li><a href="#">Custom Fonts</a></li>
                                <li><a href="#">Slide down on Hover</a></li>
                            </ul>
                        </li>&ndash;%&gt;
                        &lt;%&ndash;<li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Women Collection</li>
                                <div id="womenCollection" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 1"></a>
                                            <h4>
                                                <small>Summer dress floral prints</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">49,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 2"></a>
                                            <h4>
                                                <small>Gold sandals with shiny touch</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">9,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img
                                                    src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection"
                                                    class="img-responsive" alt="product 3"></a>
                                            <h4>
                                                <small>Denin jacket stamped</small>
                                            </h4>
                                            <button class="btn btn-primary" type="button">49,99 €</button>
                                            <button href="#" class="btn btn-default" type="button"><span
                                                    class="glyphicon glyphicon-heart"></span> Add to Wishlist
                                            </button>
                                        </div><!-- End Item -->
                                    </div><!-- End Carousel Inner -->
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#womenCollection" role="button"
                                       data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#womenCollection" role="button"
                                       data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div><!-- /.carousel -->
                                <li class="divider"></li>
                                <li><a href="#">View all Collection <span
                                        class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                            </ul>
                        </li>&ndash;%&gt;
                    </ul>
                </li>
                <li><a href="about-us"><spring:message code="menu.about.us" text="about us"/></a></li>
                <li><a href="contact-us"><spring:message code="menu.contact.us" text="contact us"/></a></li>
            </ul>
            &lt;%&ndash;<ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My
                        account <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
                <li><a href="#">My cart (0) items</a></li>
            </ul>&ndash;%&gt;
        </div><!-- /.nav-collapse -->
    </nav>
</div>
--%>

</body>
</html>