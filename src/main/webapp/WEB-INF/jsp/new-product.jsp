<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/> ">
    <link href="<c:url value="/resources/bootstrap-rtl/dist/css/bootstrap-rtl.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="work-form" >
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="well well-sm">
                            <form:form class="form-horizontal" method="post" commandName="product" enctype="multipart/form-data" accept-charset="UTF-8"
                                       action="./new-product?${_csrf.parameterName}=${_csrf.token}">
                                <fieldset>
                                    <legend class="text-center"><spring:message code="form.product.title"/></legend>

                                    <form:input path="id" id="id" type="hidden"/>
                                    <form:select path="status">
                                        <form:option value="true" label="Visible" />
                                        <form:option value="false" label="Not Visible"/>
                                    </form:select>

                                    <!-- Product Name input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="name"><spring:message code="form.product.productTitle"/> </label>
                                        <div class="col-md-8">
                                            <form:input path="name" id="name" name="name" type="text" class="form-control" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Model Name input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="model-name">نام مدل</label>
                                        <div class="col-md-8">
                                            <form:input path="modelName" id="model-name" name="model-name" type="text" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Made in input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="madeIn">ساخته شده در</label>
                                        <div class="col-md-8">
                                            <form:input path="madeIn" id="madeIn" name="madeIn" type="text" placeholder="ساخته شده در" class="form-control" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Material input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="material">مواد تشکیل دهنده </label>
                                        <div class="col-md-8">
                                            <form:input path="material" id="f2" name="material" type="text" placeholder="مواد تشکیل دهنده " class="form-control" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Brand Name input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="brand-name">نام برند </label>
                                        <div class="col-md-8">
                                            <form:input path="brandName" id="brand-name" name="brand-name" type="text" placeholder="نام برند" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Performance input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="performance">عملکرد </label>
                                        <div class="col-md-8">
                                            <form:input path="performance" id="performance" name="performance" type="text" placeholder="عملکرد" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Quantity Degree input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="quantityDegree">درجه‌ی کیفیت</label>
                                        <div class="col-md-8">
                                            <form:input path="quantityDegree" id="quantityDegree" name="quantityDegree" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-sku"><spring:message code="form.product.SKU"/> </label>
                                        <div class="col-md-8">
                                            <form:input path="sku" id="product-sku" name="product-sku" type="text" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Color input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="color">رنگ </label>
                                        <div class="col-md-8">
                                            <form:input path="color" id="color" name="color" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <%--<!-- Price input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-sku">قیمت</label>
                                        <div class="col-md-8">
                                            <input id="f8" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>--%>

                                    <!-- Feature input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="features">ویژگی</label>
                                        <div class="col-md-8">
                                            <form:input path="features" id="f9" name="features" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Size input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="size">سایز بندی</label>
                                        <div class="col-md-8">
                                            <form:input path="size" id="size" name="size" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Minimum Order input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="min-order">حداقل سفارش</label>
                                        <div class="col-md-8">
                                            <form:input path="minOrder" id="min-order" name="min-order" type="number" placeholder="" class="form-control" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Maximum Order input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="max-order">حداکثر سفارش</label>
                                        <div class="col-md-8">
                                            <form:input path="maxOrder" id="max-order" name="max-order" type="number" placeholder="" class="form-control" required="required"/>
                                        </div>
                                    </div>

                                    <!-- Number In Year input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="number-in-year">تعداد</label>
                                        <div class="col-md-8">
                                            <form:input path="numberInYear" id="number-in-year" name="number-in-year" type="number" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <%--<!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-sku">قیمت کل</label>
                                        <div class="col-md-8">
                                            <input id="f15" name="product-sku" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>--%>

                                    <!-- Product Specification input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-sp">خصوصیات محصول</label>
                                        <div class="col-md-8">
                                            <form:input path="productSpecification" id="product-sp" name="product-sp" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Use cases input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="use-case">موارد استفاده</label>
                                        <div class="col-md-8">
                                            <form:input path="useCase" id="use-case" name="use-case" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- SKU input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-type">نوع محصول</label>
                                        <div class="col-md-8">
                                            <form:input path="productType" id="product-type" name="product-type" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>


                                    <!-- Stock input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="stock">موجودی</label>
                                        <div class="col-md-8">
                                            <form:input path="stock" id="stock" name="stock" type="number" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Unit input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="unit">واحد</label>
                                        <div class="col-md-8">
                                            <form:input path="unit" id="unit" name="unit" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Company Producer input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="company-producer">محصول شرکت</label>
                                        <div class="col-md-8">
                                            <form:input path="companyProducer" id="company-producer" name="company-producer" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Standards input-->
                                    <div class="form-group required">
                                        <label class="col-md-4 control-label" for="standards">استانداردها</label>
                                        <div class="col-md-8">
                                            <form:input path="standards" id="standards" name="standards" type="text" placeholder="" class="form-control" required="required"/>
                                        </div>
                                    </div>
                                    <!-- Product Ability input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="product-ability">قابلیت محصول</label>
                                        <div class="col-md-8">
                                            <form:input path="productAbility" id="product-ability" name="product-ability" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>
                                    <!-- Special features input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="special-features">امکانات ویژه</label>
                                        <div class="col-md-8">
                                            <form:input path="specialFeatures" id="special-features" name="special-features" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>
                                    <!-- Manufacture technology input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="manufacture-technology">تکنولوژی ساخت</label>
                                        <div class="col-md-8">
                                            <form:input path="manufactureTechnology" id="manufacture-technology" name="manufacture-technology" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>
                                    <!-- Sales Amount input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="sales-amount">میزان فروش سالیانه‌ی محصول</label>
                                        <div class="col-md-8">
                                            <form:input path="salesAmount" id="sales-amount" name="sales-amount" type="text" placeholder="" class="form-control"/>
                                        </div>
                                    </div>

                                    <!-- Unit Price-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="unit-price">قیمت</label>
                                        <div class="col-md-8">
                                            <form:input path="price" id="unit-price" name="unit-price" type="text" placeholder="" class="form-control"/>
                                            <label for="dolar">$</label>
                                            <form:radiobutton path="currency" id="dolar" value="dolar"/>
                                            <label for="rial">﷼</label>
                                            <form:radiobutton path="currency" id="rial" value="rial"/>
                                        </div>
                                    </div>


                                    <!--File Input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="fileinput"><spring:message code="form.image"/> </label>
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

                                    <!-- Form actions -->
                                    <div class="form-group">
                                        <div class="col-md-12 text-right">
                                            <button type="submit" class="btn btn-primary btn-lg"><spring:message code="form.submit"/> </button>
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
</div>
<jsp:include page="footer.jsp"/>
<script>
    $(document).ready(function () {
        $('#unit-price').change(function () {
            var price = $(this). val();
            var priceRegex= /^\d+$/;
            if(!price.match(priceRegex))
                alert("Price is not valid");
        });
    });
</script>
</body>
</html>
