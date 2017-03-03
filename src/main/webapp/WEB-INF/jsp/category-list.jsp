<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 2/18/17
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category List</title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <%--<script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>--%>
</head>
<body>
<%--<jsp:include page="new-category.jsp"/>--%>
<div class="actions" dir="rtl">
    <div class="col-md-3 pull-right" >
        <button id="myBtn" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>ایجاد دسته</button>
        <!-- Trigger/Open The Modal -->
        <%--<button  class="btn btn-primary">افزودن دسته</button>--%>
    </div>
    <!-- The Modal -->
</div>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <jsp:include page="new-category.jsp"/>
    </div>
</div>

    <div class="table-responsive" dir="rtl">
        <table class="table table-hover tree-table-view">
            <thead>
            <tr>
                <%--<th><spring:message code="works.id"/> </th>
                <th><spring:message code="works.name"/> </th>
                <th><spring:message code="works.guild"/> </th>
                <th><spring:message code="works.comment"/> </th>--%>
                <th>شناسه </th>
                <th>عنوان دسته</th>
                <th>والد</th>
                <th>ویرایش</th>
            </tr>
            </thead>
            <tbody>



            <c:forEach items="${categories}" var="category">
                <tr>
                    <td>${category.key.id}</td>
                    <td>${category.key.categoryName}</td>
                    <td>${category.key.parentId}</td>
                        <%--<td>${categoryI.createDate}</td>
                        <td>${work.owner.ssoId}</td>--%>
                    <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
                </tr>
                <c:forEach items="${category.value}" var="child">
                    <tr>
                        <td>${child.id}</td>
                        <td style="padding-right: 55px;">${child.categoryName}</td>
                        <td>${child.parentId}</td>
                            <%--<td>${categoryI.createDate}</td>
                            <td>${work.owner.ssoId}</td>--%>
                        <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            <c:forEach items="${singles}" var="single">
                <tr>
                    <td>${single.id}</td>
                    <td>${single.categoryName}</td>
                    <td>${single.parentId}</td>
                        <%--<td>${categoryI.createDate}</td>
                        <td>${work.owner.ssoId}</td>--%>
                    <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

<script>
    $(document).ready(function () {
        var parentNumber = $('table tr.data-tree .parent-n').innerHTML;

    });
</script>
</body>
</html>
