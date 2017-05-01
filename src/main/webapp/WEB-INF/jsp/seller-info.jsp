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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>مشخصات فروشنده</title>
    <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.fa.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js" />"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-jalali-datepicker/bootstrap-datepicker.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

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
<body>
<div class="row" dir="rtl">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-body information-form">
                <form:form method="post" acceptcharset="UTF-8" commandName="userMoreInfo"  enctype="multipart/form-data" accept-charset="UTF-8"
                           action="${currentPage}?${_csrf.parameterName}=${_csrf.token}">
                    <form:input path="id" id="id" type="hidden"/>
                    <div class="form-group row">
                        <div class="col-md-6 required pull-right">
                            <label for="name-owner">نام حساب کاربری (صاحب)</label>
                            <form:input path="name" id="name-owner" type="text" class="form-control" required="required"/>
                        </div>
                        <div class="col-md-6 required">
                            <label for="familyName">نام خانوادگی صاحب حساب کاربری</label>
                            <form:input path="family" id="familyName" type="text" class="form-control" required="required"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4 required pull-right">
                            <label for="categories">دسته‌ی تجاری</label>
                            <form:select path="categoryItem" id="categories" name="categories" multiple="false" class="selectpicker form-control">
                                <form:option value="0" selected="selected">--none--</form:option>
                                <form:options items="${pcat}" itemValue="id" itemLabel="categoryName"/>
                            </form:select>
                        </div>
                        <div class="col-md-4 required pull-right">
                            <label for="secondSelect">زیردسته</label>
                            <form:select path="categoryItem" id="secondSelect" multiple="false" class="selectpicker form-control">
                                <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                            </form:select>
                        </div>
                        <div class="col-md-4 required">
                            <label for="thirdSelect">خرد دسته</label>
                            <form:select path="categoryItem" id="thirdSelect" multiple="true" class="selectpicker form-control">
                                <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-check form-check-inline required">
                        <label for="business-type" class="col-md-12 bg-primary">نوع کسب و کار</label>
                        <div id="business-type" class="item-group">
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">تولیدکننده/ کارگاه/ کارخانه</span>
                                <form:checkbox path="businessType" value="تولیدکننده/ کارگاه/ کارخانه"  id="producer-manufactory" class="checkbox-primary custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">توزیع‌کننده/عمده فروش</span>
                                <form:checkbox path="businessType" value="توزیع‌کننده/عمده فروش" id="distributor-wholesaler" class="custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">واردکننده</span>
                                <form:checkbox path="businessType" value="واردکننده" id="importer" class="custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">صادرکننده</span>
                                <form:checkbox path="businessType" value="صادرکننده" id="exporter" class="custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">دفتر نمایندگی</span>
                                <form:checkbox path="businessType" value="دفتر نمایندگی" id="agency" class="custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">فروشگاه/مغازه</span>
                                <form:checkbox path="businessType" value="فروشگاه/مغازه" id="shop" class="custom-control-input"/>
                            </label>
                            <label class="custom-control custom-checkbox" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">خرده‌فروش</span>
                                <form:checkbox path="businessType" value="خرده‌فروش" id="retailer" class="custom-control-input"/>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="business-name">نام واحد کسب و کار</label>
                            <form:input path="businessName" id="business-name" type="text" class="form-control"/>
                        </div>
                        <div class="col-md-4">
                            <label for="brand-name">نام برند</label>
                            <form:input path="brandName" id="brand-name" type="text" class="form-control"/>
                        </div>
                        <div class="col-md-4">
                            <label class="col-md-3 control-label" for="fileinput"><spring:message code="form.image"/> </label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div id="fileinput" class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                <div>
                                        <span class="btn btn-default btn-file">
                                            <span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
                                            <form:input path="files" type="file" name="fileUpload"/>
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
                                <form:select path="addressItem" id="country" name="country" multiple="false" class="form-control">
                                    <form:option value="0" selected="selected">--none--</form:option>
                                    <form:options items="${country}" itemValue="id" itemLabel="state"/>
                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">استان</span>
                                <form:select path="addressItem" id="add-state" name="add-state" multiple="false" class="form-control">

                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">شهر</span>
                                <form:select path="addressItem" id="city" name="city" multiple="false" class="form-control">

                                </form:select>
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
                        <input type="submit" class="btn btn-default" value="ارسال کد تایید" id="submit">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<c:url var="pageurl" value="load_selct"/>
<c:url var="pageurlAddress" value="load_address"/>
<script>

    $(document).ready(function(){

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

        $('#rules').click(function (event) {
            if(event==1)
                $('#submit').enable();
            else
                $('#submit').disable();
        });

        var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        $('#categories').change(function () {
            var cId= $(this).val();

            $.getJSON('${pageurl}',
                {
                    ajax:true,
                    catId:cId
                },function (data) {
                    var html = '<option value="0">--select subcat--</option>';
                    var len = data.length;
                    for ( var i = 0; i < len; i++) {
                        html += '<option value="' + data[i].id + '">'
                            + data[i].categoryName + '</option>';
                    }
                    html += '</option>';
                    //now that we have our options, give them to our select
                    $('#secondSelect').html(html);
                });
        });

        $('#secondSelect').change(function () {
            var cId= $(this).val();
            $.getJSON('${pageurl}',{
                catId:cId
            },function (data) {
                var html = '<option value="0">--select subcat--</option>';
                var len = data.length;
                for ( var i = 0; i < len; i++) {
                    html += '<option value="' + data[i].id + '">'
                        + data[i].categoryName + '</option>';
                }
                html += '</option>';
                //now that we have our options, give them to our select
                $('#thirdSelect').html(html);
            });
        });

        $('#country').change(function () {
            var aId = $(this).val();
            $.getJSON('${pageurlAddress}',{
                addressId:aId
            },function (data) {
                var html = '<option value="0">--select subcat--</option>';
                var len = data.length;
                for ( var i = 0; i < len; i++) {
                    html += '<option value="' + data[i].id + '">'
                        + data[i].state + '</option>';
                }
                html += '</option>';
                $('#add-state').html(html);
            });
        });
        $('#add-state').change(function () {
            var aId = $(this).val();
            $.getJSON('${pageurlAddress}',{
                addressId:aId
            },function (data) {
                var html = '<option value="0">--select subcat--</option>';
                var len = data.length;
                for ( var i = 0; i < len; i++) {
                    html += '<option value="' + data[i].id + '">'
                        + data[i].state + '</option>';
                }
                html += '</option>';
                $('#city').html(html);
            });
        });
    });
</script>
</body>
</html>
