<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/25/17
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>آگهی خرید</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/registration-javascript.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/registration-style.css"/>" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3 ">
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h1 dir="rtl">آگهی خرید</h1>
                    </div>
                </div>

                <div class="panel-body" dir="rtl">
                    <form>

                        <!--ردیف اول-->
                        <div class="form-group row">
                            <!--دسته ها-->
                            <div class="col-md-3 required pull-right">
                                <label for="category">دسته ها</label>
                                <select id="category" class="form-control" required>
                                    <option>دسته ی اول</option>
                                    <option>دسته ی دوم</option>
                                </select>

                            </div>
                            <!--زیر دسته ها -->
                            <div class="col-md-3 required pull-right">
                                <label for="category2"> زیر دسته ها </label>
                                <select id="category2" class="form-control" required>
                                    <option>زیر دسته اول</option>
                                    <option>زیر دسته دوم</option>
                                </select>
                            </div>

                            <!--خرد دسته ها -->
                            <div class="col-md-3 required pull-right">
                                <label for="category3"> خرد دسته ها </label>
                                <select id="category3" class="form-control" required>
                                    <option>خرد دسته اول</option>
                                    <option>خرد دسته دوم</option>
                                </select>

                            </div>
                            <!--نوع خرید-->
                            <div class="col-md-3 required pull-right">
                                <label for="category4">نوع خرید </label>
                                <select id="category4" class="form-control" required>
                                    <option>عمده</option>
                                    <option>خرده</option>
                                </select>

                            </div>
                        </div>
                        <!--ردیف دوم-->
                        <div class="form-group row">
                            <!--نام کالا-->
                            <div class="col-md-4 required pull-right">
                                <label for="Commodity-name">نام کالا/محصول</label>
                                <input id="commodity-name" class="form-control" name="commodity-name" type="text"
                                       required>
                            </div>
                            <!--تعداد کالا-->
                            <div class="col-md-4 required pull-right">
                                <label for="number">تعداد</label>
                                <input id="number" class="form-control" type="number" name="number" required>
                            </div>
                            <!--واحد-->
                            <div class="col-md-4 required pull-right">
                                <label for="unit"> واحد </label>
                                <select id="unit" class="form-control" required>
                                    <option>واحد 1</option>
                                    <option>واحد 2</option>
                                </select>

                            </div>
                        </div>
                        <!--ردیف سوم-->
                        <div class="form-group row">
                            <!--جزئیات کالا-->
                            <div class="col-md-12 required pull-right">
                                <label for="detail">جزئیات کالا</label>
                                <textarea class="form-control" id="detail" rows="5" required></textarea>
                            </div>
                        </div>

                        <!--پنل دوم-->
                        <div id="title2">
                            <h4 dir="rtl">اطلاعات تماس</h4>
                        </div>

                        <div>
                            <!--ردیف اول-->
                            <div class="form-group row">
                                <!--نام-->
                                <div class="col-md-6 required pull-right">
                                    <label for="name">نام و نام خانوادگی</label>
                                    <input id="name" type="text" class="form-control " required>
                                </div>
                            </div>
                            <!--ردیف دوم-->
                            <div class="row form-group">
                                <!--موبایل-->
                                <div class="col-md-6 required pull-right">
                                    <label for="mobile">تلفن همراه</label>
                                    <input id="mobile" type="text" class="form-control" required>
                                </div>
                            </div>
                            <!--ردیف سوم-->
                            <div class="row form-group">
                                <!--موبایل-->
                                <div class="col-md-6 required pull-right">
                                    <label for="home-number">تلفن ثابت (همراه با پیش شماره)</label>
                                    <input id="home-number" type="text" class="form-control" required>
                                </div>
                            </div>
                            <!--ردیف چهارم-->
                            <div class="row form-group">
                                <!--ایمیل-->
                                <div class="col-md-6 required pull-right">
                                    <label for="emaile2"> ایمیل</label>
                                    <input id="emaile2" type="email" required class="form-control">
                                </div>
                            </div>
                            <!--ردیف پنجم - دکمه-->
                            <div class="row pull-right">
                                <div>
                                    <input class="btn btn-default form-control" id="mysub2" type="submit" onclick="checkPhone()">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>

    </div>
</div>
</body>
</html>
