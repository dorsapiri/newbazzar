<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/23/17
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>user complete information</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $("#seller").on("change",function () {
                if(this.checked){
                    $("#more-information").removeAttr("hidden");
                }
                if(!this.checked){
                    $("#more-information").attr("hidden");
                }
            })
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" class="container" dir="rtl">
    <div class="form-inline">
        <div class="form-group">
            <label for="seller">فروشنده</label>
            <input type="checkbox" id="seller">
        </div>
        <div class="form-group">
            <label for="customer">خریدار</label>
            <input type="checkbox" id="customer">
        </div>
        <div class="form-group">
            <label for="job">حرفه(خدمات)</label>
            <input type="checkbox" id="job">
        </div>
    </div>
    <form:form id="my-form">
        <div id="more-information" hidden>
            <div class="form-inline">
                <div class="form-group">
                    <label for="name-owner">نام حساب کاربری (صاحب)</label>
                    <input id="name-owner" type="text">
                </div>
                <div class="form-group">
                    <label for="familyName">نام خانوادگی صاحب حساب کاربری</label>
                    <input id="familyName" type="text">
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="category">دسته‌ی تجاری</label>
                    <select id="category">
                        <option value="num1">دسته‌ی اول</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sub-category">زیردسته</label>
                    <select id="sub-category">
                        <option value="num1">زیردسته‌ی اول</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="second-sub-category">خرد دسته</label>
                    <select id="second-sub-category">
                        <option value="num1">خرد دسته‌ی اول</option>
                    </select>
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="business-type">نوع کسب و کار</label>
                    <ul id="business-type" class="list-inline">
                        <li>
                            <label for="producer-manufactory">تولیدکننده/ کارگاه/ کارخانه</label>
                            <input type="checkbox" id="producer-manufactory">
                        </li>
                        <li>
                            <label for="distributor-wholesaler">توزیع‌کننده/عمده فروش</label>
                            <input type="checkbox" id="distributor-wholesaler">
                        </li>
                        <li>
                            <label for="importer">واردکننده</label>
                            <input type="checkbox" id="importer">
                        </li>
                        <li>
                            <label for="exporter">صادرکننده</label>
                            <input type="checkbox" id="exporter">
                        </li>
                        <li>
                            <label for="agency">دفتر نمایندگی</label>
                            <input type="checkbox" id="agency">
                        </li>
                        <li>
                            <label for="shop">فروشگاه/مغازه</label>
                            <input type="checkbox" id="shop">
                        </li>
                        <li>
                            <label for="retailer">خرده‌فروش</label>
                            <input type="checkbox" id="retailer">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="business-name">نام واحد کسب و کار</label>
                    <input id="business-name" type="text">
                </div>
                <div class="form-group">
                    <label for="brand-name">نام برند</label>
                    <input id="brand-name" type="text">
                </div>
                <div class="form-group">
                    <label for="profile-img">ارسال عکس</label>
                    <img id="profile-img">
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="address">آدرس</label>
                    <ul id="address" class="list-inline">
                        <li>
                            <label for="country">کشور</label>
                            <select id="country">
                                <option value="iran">ایران</option>
                            </select>
                        </li>
                        <li>
                            <label for="state">استان</label>
                            <select id="state">
                                <option value="tehran">تهران</option>
                            </select>
                        </li>
                        <li>
                            <label for="city">شهر</label>
                            <select id="city">
                                <option value="tehran">تهران</option>
                            </select>
                        </li>
                        <li>
                            <label for="region">کشور</label>
                            <select id="region">
                                <option value="iran">منطقه‌ی شهری برای کلان‌شهرها</option>
                            </select>
                        </li>
                        <li>
                            <label for="complete-address">ادامه‌ی آدرس</label>
                            <input id="complete-address" type="text">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="established-year">سال تاسیس (شروع فعالیت)</label>
                    <input id="established-year" type="date">
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
        </div>
    </form:form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
