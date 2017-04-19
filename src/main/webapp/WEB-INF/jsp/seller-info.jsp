<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/18/17
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>مشخصات فروشنده</title>
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.fa.min.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <style>
        .information-form{
            padding: 5%;
        }
        .item-group{
            border: solid 1px #337ab7;
        }
    </style>
</head>
<body dir="rtl">
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
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
                        <div class="col-md-4">
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
                                <select id="second-sub-category" class="form-control">
                                    <option value="num1">خرد دسته‌ی اول</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-check form-check-inline">
                        <label for="business-type" class="col-md-12 bg-primary">نوع کسب و کار</label>
                        <div id="business-type" class="item-group">
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">تولیدکننده/ کارگاه/ کارخانه</span>
                                <input type="checkbox" id="producer-manufactory" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">توزیع‌کننده/عمده فروش</span>
                                <input type="checkbox" id="distributor-wholesaler" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">واردکننده</span>
                                <input type="checkbox" id="importer" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">صادرکننده</span>
                                <input type="checkbox" id="exporter" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">دفتر نمایندگی</span>
                                <input type="checkbox" id="agency" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">فروشگاه/مغازه</span>
                                <input type="checkbox" id="shop" class="custom-control-input">
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">خرده‌فروش</span>
                                <input type="checkbox" id="retailer" class="custom-control-input">
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="business-name">نام واحد کسب و کار</label>
                            <input id="business-name" type="text" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="brand-name">نام برند</label>
                            <input id="brand-name" type="text" class="form-control">
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
                        <div class="control-group">
                            <label class="control-label" for="datepicker">Date</label>
                            <div class="controls">
                                <div class="input-append">
                                    <input id="datepicker" class="input-small" type="text">
                                    <button id="datepickerbtn" class="btn " type="button"><i class="fa fa-calendar" aria-hidden="true"></i></button>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="number-of-staff">تعداد پرسنل</label>
                            <input id="number-of-staff" type="number">
                        </div>
                        <div class="form-group">
                            <label for="stock">موجودی کالا/ظرفیت تولید</label>
                            <input id="stock" type="number">
                        </div>
                        <div class="form-group">
                            <label for="total-revenue">مجموع درآمد سالیانه</label>
                            <input id="total-revenue" type="number">
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="contact-info">اطلاعات تماس</label>
                            <ul id="contact-info" class="list-inline">
                                <li>
                                    <label for="contact-name">ارتباط با آقا/خانم</label>
                                    <input id="contact-name" type="text">
                                </li>
                                <li>
                                    <label for="contact-phone-number">تلفن</label>
                                    <input id="contact-phone-number" type="text">
                                </li>
                                <li>
                                    <label for="contact-mobile-number">موبایل</label>
                                    <input id="contact-mobile-number" type="text">
                                </li>
                                <li>
                                    <label for="contact-fax-number">فکس</label>
                                    <input id="contact-fax-number" type="text">
                                </li>
                                <li>
                                    <label for="contact-email">ایمیل</label>
                                    <input id="contact-email" type="text">
                                </li>
                                <li>
                                    <label for="contact-website">وب‌سایت</label>
                                    <input id="contact-website" type="text">
                                </li>
                                <li>
                                    <label for="contact-social-links">شبکه‌ی اجتماعی</label>
                                    <input id="contact-social-links" type="text">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="transmission-methods">روش‌های ارسال کالا</label>
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
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="payment-methods">روش‌های پرداخت</label>
                            <ul id="payment-methods">
                                <li>
                                    <label for="installments">اقساط</label>
                                    <input id="installments" type="checkbox">
                                </li>
                                <li>
                                    <label for="check">چک</label>
                                    <input id="check" type="checkbox">
                                </li>
                                <li>
                                    <label for="online">آنلاین</label>
                                    <input id="online" type="checkbox">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="delivery-place">محل تحویل کالا</label>
                            <ul id="delivery-place">
                                <li>
                                    <label for="own-city">شهر (خودش)</label>
                                    <select id="own-city">
                                        <option value="tehren">تهران</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="own-state">استان (خودش)</label>
                                    <select id="own-state">
                                        <option value="tehren">تهران</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="other-city">دیگر شهرها</label>
                                    <select id="other-city" type="checkbox">
                                        <option value="tehren">تهران</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="keywords">کلمات کلیدی</label>
                            <input id="keywords" type="text">
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="business-info">اطلاعات و توضیحات کسب و کار</label>
                            <input id="business-info" type="text">
                        </div>
                        <div class="form-group">
                            <label for="username">نام کاربری (شماره موبایل)</label>
                            <input id="username" type="text">
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="how-to-familiarity">نحوه‌ی آشنایی</label>
                            <ul id="how-to-familiarity">
                                <li>
                                    <label for="social-networks">شبکه‌های اجتماعی</label>
                                    <input id="social-networks" type="checkbox">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="rules">قوانین را خوانده‌ام و موافقم</label>
                            <input id="rules" type="checkbox">
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="verification-code">کد تایید</label>
                            <input id="verification-code" type="text">
                        </div>
                    </div>
                    <div class="form-inline">
                        <input type="submit" value="ارسال کد تایید">
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
        })
    });
</script>
</body>
</html>
