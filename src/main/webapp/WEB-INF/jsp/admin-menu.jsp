<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/20/17
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css"/>" rel="stylesheet">
    <%--<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">--%>
    <style>
        #wrapper {
            padding-right: 0;
            -webkit-transition: all 0.6s ease;
            -moz-transition: all 0.6s ease;
            -o-transition: all 0.6s ease;
            transition: all 0.6s ease;

        }

        #wrapper.toggled {
            padding-right: 120px;
        }

        #sidebar-wrapper {
            z-index: 1000;
            position: fixed;
            right: 250px;

            width: 0;
            height: 100%;
            margin-right: -250px;
            overflow-y: auto;
            background-color:#312A25 !Important;

            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
        }

        #wrapper.toggled #sidebar-wrapper {
            width: 0;
        }

        #page-content-wrapper {
            width: 100%;
            position: absolute;
            padding: 10px;
        }

        #wrapper.toggled #page-content-wrapper {
            position: absolute;
            margin-right:-250px;
        }

        /* Sidebar Styles */

        .sidebar-nav {
            position: absolute;
            top: 0;
            right:15px;
            width: 200px;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .sidebar-nav li {
            text-indent: 5px;
            line-height: 40px;
        }

        .sidebar-nav li a {
            display: block;
            text-decoration: none;
            color: #999999;
        }

        .sidebar-nav li a:hover {
            text-decoration: none;
            color: #fff;
            background: #312A25;
        }

        .sidebar-nav li a:active,
        .sidebar-nav li a:focus {
            text-decoration: none;
        }

        .sidebar-nav > .sidebar-brand {
            height: 65px;
            font-size: 18px;
            line-height: 60px;
        }

        .sidebar-nav > .sidebar-brand a {
            color: #999999;
        }

        .sidebar-nav > .sidebar-brand a:hover {
            color: #fff;
            background: none;
        }

        @media(min-width:768px) {
            #wrapper {
                padding-right: 150px;
            }

            #wrapper.toggled {
                padding-left: 0;
            }

            #sidebar-wrapper {
                width: 200px;
            }

            #wrapper.toggled #sidebar-wrapper {
                width: 60px;


            }

            #wrapper.toggled span {
                visibility:hidden;

            }
            #wrapper.toggled   i {
                float:right;
            }

            #page-content-wrapper {
                padding: 20px;
                position: relative;
            }

            #wrapper.toggled #page-content-wrapper {
                position: relative;
                margin-right: 0;
            }
        }


        @media(max-width:414px) {

            #wrapper.toggled #page-content-wrapper {
                position: absolute;
                margin-right:60px;
            }

            #wrapper.toggled {
                padding-right: 60px;
            }

            #wrapper {
                padding-left: 20px;
            }

            #wrapper.toggled {
                padding-left: 0;
            }

            #sidebar-wrapper {
                width: 50px;
            }

            #wrapper.toggled #sidebar-wrapper {
                width: 140px;


            }

            #wrapper.toggled span {
                visibility:visible;
                position:relative;
                left:70px;
                bottom:13px;

            }

            #wrapper span {
                visibility:hidden;

            }
            #wrapper.toggled   i {
                float:right;
            }

            #wrapper   i {
                float:right;
            }

            #page-content-wrapper {
                padding: 5px;
                position: relative;
            }

            #wrapper.toggled #page-content-wrapper {
                position: relative;
                margin-right: 0;
            }

        }


    </style>
</head>
<body dir="rtl">
<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav" style="margin-left:0;">
            <li class="sidebar-brand">

                <a href="#menu-toggle"  id="menu-toggle" style="margin-top:0px;float:right;" >
                    <i class="fa fa-align-justify" style="font-size:20px !Important;" aria-hidden="true" aria-hidden="true"></i>
                </a>

            </li>
            <li >
                <a id="h" href="#dashboard"><i class="fa fa-home fa-lg" aria-hidden="true"> </i> <span style="margin-right:10px;">خانه</span>  </a>
            </li>
            <li >
                <a id="service" href="#works"> <i class="fa fa-wrench" aria-hidden="true"> </i> <span style="margin-right:10px;"> خدمات</span> </a>
            </li>
            <li >
                <a id="product" href="#products"> <i class="fa fa-wrench" aria-hidden="true"> </i> <span style="margin-right:10px;">محصولات</span> </a>
            </li>
            <li>
                <a id="category" href="#category"> <i class="fa fa-tags" aria-hidden="true"> </i> <span style="margin-right:10px;"> دسته‌بندی‌ها</span> </a>
            </li>
            <li >
                <a id="user" href="#users"> <i class="fa fa-users" aria-hidden="true"> </i> <span style="margin-right:10px;"> کابرها</span> </a>
            </li>
            <li>
                <a id="slideshow" href="#slideshow"><i class="fa fa-info-circle " aria-hidden="true"> </i> <span style="margin-left:10px;">اسلایدشو</span> </a>
            </li>
            <li>
                <a id="states" href="#states"><i class="fa fa-info-circle " aria-hidden="true"> </i> <span style="margin-left:10px;">مکان‌ها</span> </a>
            </li>
            <li>
                <a id="buy-ads" href="#buy-ads"><i class="fa fa-info-circle " aria-hidden="true"> </i> <span style="margin-left:10px;">آگهی خرید</span> </a>
            </li>
            <li>
                <a id="units" href="#buy-ads"><i class="fa fa-info-circle " aria-hidden="true"> </i> <span style="margin-left:10px;">واخدها</span> </a>
            </li>
            <%--<li>
                <a href="#"> <i class="fa fa-comment-o" aria-hidden="true"> </i> <span style="margin-left:10px;"> Section</span> </a>
            </li>--%>
        </ul>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-10 col-md-8">

                    <div id="result">

                    </div>


                    <script>
                        $("#menu-toggle").click(function(e) {
                            e.preventDefault();
                            $("#wrapper").toggleClass("toggled");
                        });

                    </script>



                </div><!-- /col-3 -->
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#service").click(function () {
            $("#result").load('work-list');
        });
        $("#product").click(function () {
            $("#result").load('products');
        });
        $("#category").click(function () {
            $("#result").load('category-list');
        });
        $("#user").click(function () {
            $("#result").load('users');
        });
        $("#slideshow").click(function () {
            $("#result").load('slideshow');
        });
        $("#states").click(function () {
            $("#result").load('states');
        });
        $("#buy-ads").click(function () {
            $("#result").load('buy-ads-list');
        });
        $("#units").click(function () {
            $("#result").load('units');
        });
    })
</script>
</body>
</html>
