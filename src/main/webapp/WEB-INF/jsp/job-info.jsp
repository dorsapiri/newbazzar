<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/18/17
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>خدمات(حرفه)</title>
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.fa.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <style>
        .information-form{
            padding: 5%;
        }
        .item-group{
            /*border: solid 1px #337ab7;*/
        }
        .post-inline{
            display: inline-flex;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-body information-form">
                <form:form method="post" acceptcharset="UTF-8">
                    <div class="form-group row">
                        <div class="col-md-6 pull-right">
                            <label for="name-owner">نام حساب کاربری (صاحب)</label>
                            <input id="name-owner" type="text" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label for="familyName">نام خانوادگی صاحب حساب کاربری</label>
                            <input id="familyName" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4 pull-right">
                            <div class="form-group">
                                <label for="category">دسته‌ی تجاری</label>
                                <select id="category" class="form-control">
                                    <option value="num1">دسته‌ی اول</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 pull-right">
                            <div class="form-group">
                                <label for="sub-category">زیردسته</label>
                                <select id="sub-category" class="form-control">
                                    <option value="num1">زیردسته‌ی اول</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="second-sub-category">خرد دسته</label>
                                <select id="second-sub-category" class="form-control" multiple="true">
                                    <option value="num1">خرد دسته‌ی اول</option>
                                    <option value="num1">خرد دسته‌ی دوم</option>
                                    <option value="num1">خرد دسته‌ی سوم</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-check form-check-inline">
                        <label for="business-type" class="col-md-12 bg-primary">نوع خدمات/حرفه</label>
                        <div id="business-type" class="item-group">
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">شرکت</span>
                                <input type="checkbox" id="producer-manufactory" class="checkbox-primary custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">شخص</span>
                                <input type="checkbox" id="distributor-wholesaler" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">کارگاه</span>
                                <input type="checkbox" id="importer" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">دفتر</span>
                                <input type="checkbox" id="exporter" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">مغازه</span>
                                <input type="checkbox" id="agency" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">سایر</span>
                                <input type="checkbox" id="shop" class="custom-control-input">
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="business-name">نام واحد خدمات(حرفه)</label>
                            <input id="business-name" type="text" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="profile-img">ارسال عکس</label>
                            <img id="profile-img" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="address" class="col-md-12 bg-primary">آدرس</label>
                        <div id="address">
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">کشور</span>
                                <select id="country" class="form-control">
                                    <option value="iran">ایران</option>
                                </select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">استان</span>
                                <select id="state" class="form-control">
                                    <option value="tehran">تهران</option>
                                </select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">شهر</span>
                                <select id="city" class="form-control">
                                    <option value="tehran">تهران</option>
                                </select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">کشور</span>
                                <select id="region" class="form-control">
                                    <option value="iran">منطقه‌ی شهری برای کلان‌شهرها</option>
                                </select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">ادامه‌ی آدرس</span>
                                <input id="complete-address" type="text" class="form-control">
                            </label>

                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="control-group col-md-3 pull-right">
                            <label class="control-label" for="year">تاریخ تاسیس شروع فعالیت</label>
                            <select id="year" class="form-control">
                                <option>1396</option>
                                <option>1395</option>
                                <option>1394</option>
                            </select>

                        </div>

                        <div class="col-md-3 pull-right">
                            <label for="number-of-staff">تعداد پرسنل</label>
                            <div class="post-inline">
                                <input id="number-of-staff" type="number" class="form-control">
                                <small style="padding: 6%;">نفر</small>
                            </div>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label for="stock">تعداد ارائه‌ی خدمات سالیانه</label>
                            <input id="stock" type="number" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contact-info" class="col-md-12 bg-primary">اطلاعات تماس</label>
                        <div id="contact-info" class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">ارتباط با آقا/خانم</span>
                                        <input id="contact-name" type="text" class="form-control">
                                    </label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">تلفن</span>
                                        <input id="contact-phone-number" type="text" class="form-control">
                                    </label>
                                </div>

                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">موبایل</span>
                                        <input id="contact-mobile-number" type="text" class="form-control">
                                    </label>
                                </div>

                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">فکس</span>
                                        <input id="contact-fax-number" type="text" class="form-control">
                                    </label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">ایمیل</span>
                                        <input id="contact-email" type="text" class="form-control">
                                    </label>
                                </div>

                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">وب‌سایت</span>
                                        <input id="contact-website" type="text" class="form-control">
                                    </label>
                                </div>

                                <div class="col-md-4">
                                    <label class="custom-control" >
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">شبکه‌ی اجتماعی</span>
                                        <input id="contact-social-links" type="text" class="form-control">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-7">
                            <label for="transmission-methods" class="col-md-12 bg-primary">روش‌های ارسال کالا</label>
                            <ul id="transmission-methods" class="list-group list-inline">
                                <li class="list-group-item">
                                    <label for="delivery-man">پیک</label>
                                    <input type="checkbox" id="delivery-man">
                                </li>
                                <li class="list-group-item">
                                    <label for="express-mail">پست پیشتاز</label>
                                    <input type="checkbox" id="express-mail">
                                </li>
                                <li class="list-group-item">
                                    <label for="regular-mail">پست معمولی</label>
                                    <input type="checkbox" id="regular-mail">
                                </li>
                                <li class="list-group-item">
                                    <label for="tipaxco">تیپاکس</label>
                                    <input type="checkbox" id="tipaxco">
                                </li>
                                <li class="list-group-item">
                                    <label for="porterage">باربری</label>
                                    <input type="checkbox" id="porterage">
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-5">
                            <label for="payment-methods" class="col-md-12 bg-primary">روش‌های پرداخت</label>
                            <ul id="payment-methods" class="list-group list-inline">
                                <li class="list-group-item">
                                    <label for="installments">اقساط</label>
                                    <input id="installments" type="checkbox">
                                </li>
                                <li class="list-group-item">
                                    <label for="check">چک</label>
                                    <input id="check" type="checkbox">
                                </li>
                                <li class="list-group-item">
                                    <label for="online">آنلاین</label>
                                    <input id="online" type="checkbox">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="control-group col-md-3 pull-right">
                            <label class="control-label" for="datepicker">زمان ارائه‌ی خدمات</label>
                            <div class="controls">
                                <div class="input-append" style="display: inline-flex">
                                    <input id="datepicker" class="form-control input-small" type="text" style="border-radius: 0 4px 4px 0;">
                                    <button id="datepickerbtn" class="btn " type="button" style="border-radius: 4px 0 0 4px;">
                                        <span class="add-on">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="keywords">کلمات کلیدی</label>
                            <input id="keywords" type="text" class="form-control" data-role="tagsinput">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6 pull-right">
                            <label for="business-info">اطلاعات و توضیحات خدمات(حرفه)</label>
                            <input id="business-info" type="text" class="form-control">
                            <small>۱۰۰حرف</small>
                        </div>
                            <%--<div class="col-md-6">
                                <label for="username">نام کاربری (شماره موبایل)</label>
                                <input id="username" type="text" class="form-control">
                            </div>--%>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="how-to-familiarity">نحوه‌ی آشنایی</label>
                            <div id="how-to-familiarity" class="item-group">
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">شبکه‌های اجتماعی</span>
                                    <input type="checkbox" id="social-networks" class="checkbox-primary custom-control-input">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="rules">قوانین را خوانده‌ام و موافقم</label>
                            <input id="rules" type="checkbox">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6 pull-right">
                            <label for="verification-code">کد تایید</label>
                            <input id="verification-code" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <input type="submit" class="btn btn-default" value="ارسال کد تایید">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#datepicker").datepicker();
        $("#datepickerbtn").click(function(event) {
            event.preventDefault();
            $("#datepicker").focus();
        });
        $(window).keydown(function(event){
            if(event.keyCode == 13) {
                event.preventDefault();
                return false;
            }
        });

        $('#keywords').tagsinput({
            confirmKeys: [13, 44]
        });
    });
</script></body>
</html>
