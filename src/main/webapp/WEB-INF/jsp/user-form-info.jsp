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
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="body" class="container" dir="rtl">
    <div class="form-selector">
        <div class="form-inline">
            <div class="form-group">
                <label for="seller">فروشنده</label>
                <input type="checkbox" id="seller" name="form-type">

                <label for="customer">خریدار</label>
                <input type="checkbox" id="customer" name="form-type">

                <label for="job">حرفه(خدمات)</label>
                <input type="checkbox" id="job" name="form-type">
            </div>
        </div>
    </div>
    <div id="result"></div>
</div>
<jsp:include page="footer.jsp"/>

<script>
    $(document).ready(function () {
        $('#seller').click(function () {
            if ($('#seller').is(':checked')){
                $('#result').load('seller-info');
            }else {
                $('#result').text("select item");
            }
        });
        $('#customer').click(function () {
            if ($('#customer').is(':checked')){
                $('#result').load('customer-info');
            }else {
                $('#result').text("select item");
            }
        });
        $('#job').click(function () {
            if ($('#job').is(':checked')){
                $('#result').load('job-info');
            }else {
                $('#result').text("select item");
            }
        });
    });
</script>
</body>
</html>
