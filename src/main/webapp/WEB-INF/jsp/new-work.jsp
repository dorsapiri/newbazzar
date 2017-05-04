<%@ page import="com.newbaz.model.Category" %>
<%@ page import="com.newbaz.service.CategoryService" %>
<%@ page import="java.util.List" %><%--<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 12/29/16
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><c:if test="${edit}">${work.name}</c:if></title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-tagsinput.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jasny-bootstrap/js/jasny-bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-tagsinput.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/jasny-bootstrap/css/jasny-bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="work-form" dir="rtl">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="well well-sm">
                    <%--enctype="multipart/form-data"--%>

                    <form:form class="form-horizontal" method="post" commandName="work" enctype="multipart/form-data" accept-charset="UTF-8"
                               action="?${_csrf.parameterName}=${_csrf.token}">
                        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                        <fieldset>
                            <legend class="text-center">
                                <c:if test="${not edit}">
                                    <spring:message code="form.servive.title"/>
                                </c:if>
                                <c:if test="${edit}">ویرایش خدمت</c:if>
                            </legend>
                            <form:input path="id" id="id" type="hidden"/>

                            <!-- Work Name input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="service-name"><spring:message code="form.work.serviceTitle"/> </label>
                                <div class="col-md-9">
                                    <form:input path="name" id="service-name" name="service-name" type="text" class="form-control"/>
                                </div>
                            </div>

                            <!-- Profession input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="profession"><spring:message code="form.work.guild"/> </label>
                                <div class="col-md-9">
                                    <form:input path="profession" id="profession" name="profession" type="text" class="form-control"/>
                                </div>
                            </div>
                            <!-- State input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="state"><spring:message code="form.work.state"/> </label>
                                <div class="col-md-9">
                                    <form:input path="state" id="state" name="state" type="text" class="form-control"/>
                                </div>
                            </div>
                            <!-- Category-->
                            <div class="form-group row">
                                <label class="col-md-3 control-label" for="categories">دسته</label>
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
                                    <%
                                        String parentCat = (String) request.getParameter("categoryItem");
                                        request.setAttribute("myid",parentCat);
                                    %>
                                </div>
                            </div>
                            <!--File Input-->
                            <div class="form-group">
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
                            <!-- Tags -->
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="tags">tags</label>
                                <div class="col-md-9">
                                    <form:input path="keywords" class="form-control" type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo"
                                           data-role="tagsinput" id="tags" name="tags"/>
                                </div>
                            </div>--%>
                            <%--<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />--%>
                            <!-- Form actions -->
                            <div class="form-group">
                                <div class="col-md-12 text-right">
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
                        </fieldset>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<c:url var="pageurl" value="/load_selct"/>
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
