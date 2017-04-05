<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/31/16
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add product</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="work-form" dir="rtl">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="well well-sm">
                            <form class="form-horizontal" action="" method="post">
                                <fieldset>
                                    <legend class="text-center"><spring:message code="form.product.title"/></legend>

                                    <!-- Work Name input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="name"><spring:message code="form.product.productTitle"/> </label>
                                        <div class="col-md-9">
                                            <input id="name" name="name" type="text" placeholder="<spring:message code="form.product.productTitle"/>" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku"><spring:message code="form.product.SKU"/> </label>
                                        <div class="col-md-9">
                                            <input id="product-sku" name="product-sku" type="text" placeholder="<spring:message code="form.product.SKU"/>" class="form-control">
                                        </div>
                                    </div>

                                    <!-- Work Name input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="name">ساخته شده در</label>
                                        <div class="col-md-9">
                                            <input id="f1" name="name" type="text" placeholder="ساخته شده در" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">مواد تشکیل دهنده </label>
                                        <div class="col-md-9">
                                            <input id="f2" name="product-sku" type="text" placeholder="مواد تشکیل دهنده " class="form-control">
                                        </div>
                                    </div>

                                    <!-- Work Name input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="name">نام برند </label>
                                        <div class="col-md-9">
                                            <input id="f3" name="name" type="text" placeholder="نام برند" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">عملکرد </label>
                                        <div class="col-md-9">
                                            <input id="f4" name="product-sku" type="text" placeholder="عملکرد" class="form-control">
                                        </div>
                                    </div>

                                    <!-- Work Name input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="name">درجه‌ی کیفیت </label>
                                        <div class="col-md-9">
                                            <input id="f5" name="name" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">شماره‌ی مدل</label>
                                        <div class="col-md-9">
                                            <input id="f6" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">رنگ </label>
                                        <div class="col-md-9">
                                            <input id="f7" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">قیمت</label>
                                        <div class="col-md-9">
                                            <input id="f8" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">ویژگی</label>
                                        <div class="col-md-9">
                                            <input id="f9" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">سایز بندی</label>
                                        <div class="col-md-9">
                                            <input id="f10" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">حداقل سفارش</label>
                                        <div class="col-md-9">
                                            <input id="f11" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">حداکثر سفارش</label>
                                        <div class="col-md-9">
                                            <input id="f12" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">تعداد</label>
                                        <div class="col-md-9">
                                            <input id="f13" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">قیمت واحد</label>
                                        <div class="col-md-9">
                                            <input id="f14" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">قیمت کل</label>
                                        <div class="col-md-9">
                                            <input id="f15" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">خصوصیات محصول</label>
                                        <div class="col-md-9">
                                            <input id="f16" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">نوع</label>
                                        <div class="col-md-9">
                                            <input id="f17" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>


                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">موارد استفاده</label>
                                        <div class="col-md-9">
                                            <input id="f18" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">موچودی</label>
                                        <div class="col-md-9">
                                            <input id="f20" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">محصول شرکت</label>
                                        <div class="col-md-9">
                                            <input id="f21" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">استانداردها</label>
                                        <div class="col-md-9">
                                            <input id="f22" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">قابلیت محصول</label>
                                        <div class="col-md-9">
                                            <input id="f23" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">امکانات ویژه</label>
                                        <div class="col-md-9">
                                            <input id="f24" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">تکنولوژی ساخت</label>
                                        <div class="col-md-9">
                                            <input id="f25" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="product-sku">میزان فروش سالیانه‌ی محصول</label>
                                        <div class="col-md-9">
                                            <input id="f26" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>


                                    <!-- Message body -->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="message"><spring:message code="form.comment"/> </label>
                                        <div class="col-md-9">
                                            <textarea class="form-control" id="message" name="message" placeholder="<spring:message code="form.comment"/> " rows="5"></textarea>
                                        </div>
                                    </div>

                                    <!-- Form actions -->
                                    <div class="form-group">
                                        <div class="col-md-12 text-right">
                                            <button type="submit" class="btn btn-primary btn-lg"><spring:message code="form.submit"/> </button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
