<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 5/15/17
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>واخدها</title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div class="actions" dir="rtl">
    <div class="col-md-3 pull-right" >
        <button id="myBtn" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>افزودن واحد</button>
        <!-- Trigger/Open The Modal -->
        <%--<button  class="btn btn-primary">افزودن دسته</button>--%>
    </div>
    <!-- The Modal -->
</div>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content"  style="max-width: 800px;">
        <span class="close" id="close">&times;</span>
        <jsp:include page="new-unit.jsp"/>
    </div>
</div>

<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>

            <th>شناسه</th>
            <th>واحد </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${units}" var="punit">
            <tr>

                <td>${punit.id}</td>
                <td>${punit.unitName}</td>
                <td><a href="<c:url value="edit-unit-${punit.id}"/>"class="btn btn-success custom-width">ویرایش واحد</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
