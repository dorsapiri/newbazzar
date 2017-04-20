<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">


<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">--%>
    <%--<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>--%>
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
        .required >label:after{
            content: " *";
            color: red;
        }
    </style>
</head>
<body >
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-body information-form">
                <form:form method="post" acceptcharset="UTF-8">
                    <div class="form-group row">
                        <div class="col-md-6 required pull-right">
                            <label for="name-owner">نام حساب کاربری (صاحب)</label>
                            <input id="name-owner" type="text" class="form-control" required>
                        </div>
                        <div class="col-md-6 required">
                            <label for="familyName">نام خانوادگی صاحب حساب کاربری</label>
                            <input id="familyName" type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4 required pull-right">
                            <label for="category">دسته‌ی تجاری</label>
                            <select id="category" class="form-control" required>
                                <option value="num1">دسته‌ی اول</option>
                            </select>
                        </div>
                        <div class="col-md-4 required pull-right">
                            <label for="sub-category">زیردسته</label>
                            <select id="sub-category" class="form-control" required>
                                <option value="num1">زیردسته‌ی اول</option>
                            </select>
                        </div>
                        <div class="col-md-4 required">
                            <label for="second-sub-category">خرد دسته</label>
                            <select id="second-sub-category" class="form-control" multiple="true" required>
                                <option value="num1">خرد دسته‌ی اول</option>
                                <option value="num1">خرد دسته‌ی دوم</option>
                                <option value="num1">خرد دسته‌ی سوم</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-check form-check-inline required">
                        <label for="business-type" class="col-md-12 bg-primary">نوع کسب و کار</label>
                        <div id="business-type" class="item-group">
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">تولیدکننده/ کارگاه/ کارخانه</span>
                                <input type="checkbox" id="producer-manufactory" class="checkbox-primary custom-control-input">
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
                            <label class="col-md-3 control-label" for="fileinput"><spring:message code="form.image"/> </label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div id="fileinput" class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                <div>
                                        <span class="btn btn-default btn-file">
                                            <span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
                                            <input path="files" type="file" name="fileUpload"/>
                                        </span>
                                    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
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
                            <label class="control-label" for="datepicker">تاریخ تاسیس شروع فعالیت</label>
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

                        <div class="col-md-3 pull-right">
                            <label for="number-of-staff">تعداد پرسنل</label>
                            <div class="post-inline">
                                <input id="number-of-staff" type="number" class="form-control">
                                <small style="padding: 6%;">نفر</small>
                            </div>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label for="stock">موجودی کالا/ظرفیت تولید</label>
                            <input id="stock" type="number" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="total-revenue">مجموع درآمد سالیانه</label>
                            <input id="total-revenue" type="number" class="form-control">
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
                        <div class="col-md-12">
                            <label for="delivery-place" class="col-md-12 bg-primary">محل تحویل کالا</label>
                            <div id="delivery-place">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="custom-control" >
                                            <span class="custom-control-indicator"></span>
                                            <span class="custom-control-description">شهر (خودش)</span>
                                            <select id="own-city" class="form-control">
                                                <option value="tehran">تهران</option>
                                            </select>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control" >
                                            <span class="custom-control-indicator"></span>
                                            <span class="custom-control-description">استان (خودش)</span>
                                            <select id="own-state" class="form-control">
                                                <option value="tehren">تهران</option>
                                            </select>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control" >
                                            <span class="custom-control-indicator"></span>
                                            <span class="custom-control-description">استان (خودش)</span>
                                            <select id="other-city" class="form-control">
                                                <option value="tehren">تهران</option>
                                            </select>
                                        </label>
                                    </div>
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
                            <label for="business-info">اطلاعات و توضیحات کسب و کار</label>
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
</script>
</body>
</html>
