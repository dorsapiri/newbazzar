<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/25/17
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>آگهی خرید</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/registration-javascript.js" />"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/registration-style.css"/>" rel="stylesheet">
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h1 dir="rtl">آگهی خرید</h1>
                        </div>
                    </div>

                    <div class="panel-body" dir="rtl">
                        <form:form class="form-horizontal" method="post" commandName="productAd" accept-charset="UTF-8">
                            <form:input path="id" id="id" type="hidden"/>
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label pull-right" for="categories">دسته</label>
                                            <div class="col-md-9">
                                                <div class="row">
                                                    <div class="col-md-4 pull-right">
                                                        <form:select path="categoryItem" id="categories" name="categories" multiple="false" class="selectpicker form-control">
                                                            <form:option value="0" selected="selected">--none--</form:option>
                                                            <form:options items="${pcat}" itemValue="id" itemLabel="categoryName"/>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-4 pull-right">
                                                        <form:select path="categoryItem" id="secondSelect" multiple="false" class="selectpicker form-control">
                                                            <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <form:select path="categoryItem" id="thirdSelect" multiple="false" class="selectpicker form-control">
                                                            <%--<form:options items="${}" itemValue="id" itemLabel="categoryName"/>--%>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-3 required pull-right">
                                                <label for="type">نوع خرید </label>
                                                <form:select path="type" id="type" class="form-control" required="required">
                                                    <form:option value="عمده">عمده</form:option>
                                                    <form:option value="خرده">خرده</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                        <!--ردیف دوم-->
                                        <div class="form-group row">
                                            <!--نام کالا-->
                                            <div class="col-md-4 required pull-right">
                                                <label for="commodity-name">نام کالا/محصول</label>
                                                <form:input path="name" id="commodity-name" class="form-control" name="commodity-name" type="text"
                                                            required="required"/>
                                            </div>
                                            <!--تعداد کالا-->
                                            <div class="col-md-4 required pull-right">
                                                <label for="number">تعداد</label>
                                                <form:input path="numberItems" id="number" class="form-control" type="number" name="number" required="required"/>
                                            </div>
                                            <!--واحد-->
                                            <div class="col-md-4 required pull-right">
                                                <label for="unit"> واحد </label>
                                                <form:select path="sUnit" id="unit" class="form-control" required="required">
                                                    <form:options items="${units}" itemValue="id" itemLabel="unitName"/>
                                                </form:select>

                                            </div>
                                        </div>
                                        <!--ردیف سوم-->
                                        <div class="form-group row">
                                            <!--جزئیات کالا-->
                                            <div class="col-md-12 required pull-right">
                                                <label for="detail">جزئیات کالا</label>
                                                <form:textarea path="prductDetails" class="form-control" id="detail" rows="5" required="required"/>
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
                                                    <form:input path="nameFamily" id="name" type="text" class="form-control " required="required"/>
                                                </div>
                                            </div>
                                            <!--ردیف دوم-->
                                            <div class="row form-group">
                                                <!--موبایل-->
                                                <div class="col-md-6 required pull-right">
                                                    <label for="mobile">تلفن همراه</label>
                                                    <form:input path="mobile" id="mobile" type="text" class="form-control" required="required"/>
                                                </div>
                                            </div>
                                            <!--ردیف سوم-->
                                            <div class="row form-group">
                                                <!--موبایل-->
                                                <div class="col-md-6 required pull-right">
                                                    <label for="home-number">تلفن ثابت (همراه با پیش شماره)</label>
                                                    <form:input path="telephone" id="home-number" type="text" class="form-control" required="required"/>
                                                </div>
                                                <div>
                                                    <form:errors path="telephone" class="help-inline"/>
                                                </div>
                                            </div>
                                            <!--ردیف چهارم-->
                                            <div class="row form-group">
                                                <!--ایمیل-->
                                                <div class="col-md-6 required pull-right">
                                                    <label for="emaile2"> ایمیل</label>
                                                    <form:input path="email" id="emaile2" type="email" required="required" class="form-control"/>
                                                </div>
                                            </div>
                                            <!--ردیف پنجم - دکمه-->
                                            <div class="form-group row">
                                                <div class="col-md-12 text-left">
                                                    <c:choose>
                                                        <c:when test="${edit}">
                                                            <button type="submit" class="btn btn-primary btn-lg" >edit</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="submit" class="btn btn-primary btn-lg" ><spring:message code="form.submit"/></button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<c:url var="pageurl" value="load_selct"/>
<script>
    $(document).ready(function(){
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
    });

    /*
     * type:"POST",
     url:"/load_selct",
     beforeSend: function(xhr){
     xhr.setRequestHeader(header, token);
     },
     data:{"catId":cId},
     success:function (data) {
     var op2 = $('#secondSelec');
     }

     * */

</script>
</body>
</html>
