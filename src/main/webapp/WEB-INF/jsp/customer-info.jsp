<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/18/17
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>مشخصات مشتری</title>
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
                            <form:select path="categoryItem" id="categories" name="categories" multiple="false" class="selectpicker form-control" required="required">
                                <form:option value="0" selected="selected">--none--</form:option>
                                <form:options items="${pcat}" itemValue="id" itemLabel="categoryName"/>
                            </form:select>
                        </div>
                        <div class="col-md-4 required pull-right">
                            <label for="secondSelect">زیردسته</label>
                            <form:select path="categoryItem" id="secondSelect" multiple="false" class="selectpicker form-control" required="required">
                                <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                            </form:select>
                        </div>
                        <div class="col-md-4 required">
                            <label for="thirdSelect">خرد دسته</label>
                            <form:select path="categoryItem" id="thirdSelect" multiple="true" class="selectpicker form-control" required="required">
                                <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group row">
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
                    <div class="form-group row required">
                        <label for="address" class="col-md-12 bg-primary">آدرس</label>
                        <div id="address">
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">کشور</span>
                                <form:select path="addressItem" id="country" name="country" multiple="false" class="form-control" required="required">
                                    <form:option value="0" selected="selected">--none--</form:option>
                                    <form:options items="${country}" itemValue="id" itemLabel="state"/>
                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">استان</span>
                                <form:select path="addressItem" id="add-state" name="add-state" multiple="false" class="form-control" required="required">

                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">شهر</span>
                                <form:select path="addressItem" id="city" name="city" multiple="false" class="form-control" required="required">

                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">منطقه‌ی شهری</span>
                                <form:select path="addressItem" id="area" name="area" multiple="false" class="form-control" required="required">

                                </form:select>
                            </label>
                            <label class="custom-control" >
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">ادامه‌ی آدرس</span>
                                <form:input path="addressDetail" id="complete-address" type="text" class="form-control" required="required"/>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="control-group col-md-8 pull-right">
                            <label class="control-label" for="datepicker">تاریخ تولد</label>
                            <div class="controls">
                                <div class="input-append" style="display: inline-flex">
                                    <form:input path="establishedYear" id="datepicker" class="form-control input-small" type="text" style="border-radius: 0 4px 4px 0;"/>
                                    <button id="datepickerbtn" class="btn " type="button" style="border-radius: 4px 0 0 4px;">
                                        <span class="add-on">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 required">
                            <label for="gender-user">جنسیت</label>
                            <div id="gender-user" class="item-group">
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">مرد</span>
                                    <form:radiobutton path="gender" value="مرد" id="man" class="checkbox-primary custom-control-input"/>
                                </label>
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">زن</span>
                                    <form:radiobutton path="gender" value="زن" id="woman" class="custom-control-input"/>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="how-to-familiarity">نحوه‌ی آشنایی</label>
                            <div id="how-to-familiarity" class="item-group">
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">شبکه‌های اجتماعی</span>
                                    <form:checkbox path="howToFamiliarity" value="شبکه‌های اجتماعی" id="social-networks" class="checkbox-primary custom-control-input"/>
                                </label>
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">جستجو در اینترنت</span>
                                    <form:checkbox path="howToFamiliarity" value="جستجو در اینترنت" id="search-on-the-internet" class="custom-control-input"/>
                                </label>
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">دوستان</span>
                                    <form:checkbox path="howToFamiliarity" value="دوستان" id="friends" class="custom-control-input"/>
                                </label>
                                <label class="custom-control custom-checkbox" >
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">معرفی حضوری</span>
                                    <form:checkbox path="howToFamiliarity" value="معرفی حضوری" id="personal-interview" class="custom-control-input"/>
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
//  Data Field
        $("#datepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: '1100:2100'
        });
        $("#datepickerbtn").click(function(event) {
            event.preventDefault();
            $("#datepicker").focus();
        });
//  Disable 'Enter' key to submit
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
//  Category Fields
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
//  Address Field
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
            $('#own-state').val($('#add-state option[value="'+aId+'"]').text());
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
        $('#city').change(function () {
            var aId = $(this).val();
            $('#own-city').val($('#city option[value="'+aId+'"]').text());
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
                $('#area').html(html);
            });
        });

//        Validation
        var mobilPattern = "[0][9][0-9]{9}";
        var telPattern = "[0][2][0-9]{9}";
        var website = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;

        $('#contact-phone-number').on('change',function () {
            if(!$(this).val().match(telPattern)){
                alert("Please Enter your number with code.")
            }
        });
        $('#contact-mobile-number').on('change',function () {
            if(!$(this).val().match(mobilPattern)){
                alert("Please check your number.")
            }
        });
        $('#contact-fax-number').on('change',function () {
            if(!$(this).val().match(telPattern)){
                alert("Please Enter your number with code.")
            }
        });
        $('#contact-website').on('change',function () {
            var  url = $(this).val();
            if (!url.match(website)){
                alert("URL is not correct.");
            }
        });
    });
</script>
</body>
</html>
