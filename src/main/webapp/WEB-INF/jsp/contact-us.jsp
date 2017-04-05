<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/23/16
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">

    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/place/nearbysearch/json" key="AIzaSyCsd-2oiWxJsS5Zi6t7H0nfUhkCoFZx86w" type="text/javascript"></script>

</head>
<body style="direction: rtl">

<jsp:include page="header.jsp"/>
<div class="google_map" onload="loadMap()">
    <div id="map_container"></div>
</div>
<div class="contact-form" id="body">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="well well-sm">
                    <form class="form-horizontal" action="" method="post">
                        <fieldset>
                            <legend class="text-center"><spring:message code="form.contact.us"/></legend>

                            <!-- Name input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="name"><spring:message code="form.contact.name"/> </label>
                                <div class="col-md-9">
                                    <input id="name" name="name" type="text" placeholder="<spring:message code="form.contact.name"/>" class="form-control">
                                </div>
                            </div>

                            <!-- Email input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email"><spring:message code="form.contact.email"/> </label>
                                <div class="col-md-9">
                                    <input id="email" name="email" type="text" placeholder="<spring:message code="form.contact.email"/>" class="form-control">
                                </div>
                            </div>

                            <!-- Message body -->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="message"><spring:message code="form.contact.message"/> </label>
                                <div class="col-md-9">
                                    <textarea class="form-control" id="message" name="message" placeholder="<spring:message code="form.contact.text.area.message"/> " rows="5"></textarea>
                                </div>
                            </div>

                            <!-- Form actions -->
                            <div class="form-group">
                                <div class="col-md-12 text-left">
                                    <button type="submit" class="btn btn-primary btn-lg"><spring:message code="site.submit"/> </button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>


</body>
</html>
