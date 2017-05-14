<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/23/16
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>


</head>
<body>
<%--slideshow--%>
<div id="myCarousel" class="carousel slide">
    <%--<ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="" contenteditable="false"></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active" contenteditable="false"></li>
        <li data-target="#myCarousel" data-slide-to="2" class="" contenteditable="false"></li>
        <li data-target="#myCarousel" data-slide-to="3" class="" contenteditable="false"></li>
    </ol>--%>
    <div class="carousel-inner">
        <div class="item" style="">
            <img src="http://worldofwood.life/wp-content/uploads/2016/07/cropped-image-7-1-1200x400.jpg" alt="" class="">
            <%--<div class="carousel-caption">
                <h4 class="">First Slide Title</h4>
                <p class="">
                    Description for First Slide, this First Slide.
                </p>
            </div>--%>
        </div>
        <div class="item active">
            <img src="http://mns.design/wp-content/uploads/2015/06/image1.jpg" alt="" class="">
            <%--<div class="carousel-caption">
                <h4 class="">Second Slide Title</h4>

                <p class="">
                    Description for Second Slide, this is Second Slide.
                </p>
            </div>--%>
        </div>
        <div class="item" style="">
            <img src="http://www.customwallpaper.net.au/wp-content/uploads/2016/05/hp_elephant.jpg" alt="" class="">
            <%--<div class="carousel-caption">
                <h4 class="">Third Slide Title</h4>

                <p class="">
                    Description for Third Slide, this is Third Slide.
                </p>
            </div>--%>
        </div>
        <div class="item" style="">
            <img src="http://www.applicart.co.uk/wp-content/uploads/2015/03/LatticeWhiteHeader-1200x400.jpg" alt="" class="">
            <%--<div class="carousel-caption">
                <h4 class="">Third Slide Title</h4>

                <p class="">
                    Description for Third Slide, this is Third Slide.
                </p>
            </div>--%>
        </div>
        <c:forEach items="${slides}" var="slide">
            <div class="item" style="">
                <img src="<c:url value="/resources/images/${slide.slideImage.path}"/> " alt="" class="">
                    <%--<div class="carousel-caption">
                        <h4 class="">Third Slide Title</h4>

                        <p class="">
                            Description for Third Slide, this is Third Slide.
                        </p>
                    </div>--%>
            </div>
        </c:forEach>
    </div>

    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>

    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>


</div>


</body>
</html>
