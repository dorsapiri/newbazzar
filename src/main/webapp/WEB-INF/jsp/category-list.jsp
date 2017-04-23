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

    <style>
        tbody tr:first-child{
            display: none;
        }
        .tree-table-view tbody tr.d-3 td.cat-name{
            padding-right: 30px;
        }
        .tree-table-view tbody tr.d-4 td.cat-name{
            padding-right: 60px;
        }
    </style>
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
    <div class="modal-content"  style="max-width: 800px;">
        <span class="close" id="close">&times;</span>
        <jsp:include page="new-category.jsp"/>
    </div>
</div>
<%--<div class="table-responsive" dir="rtl">
    <table class="table table-hover tree-table-view">
        <thead>
        <tr>
            &lt;%&ndash;<th><spring:message code="works.id"/> </th>
            <th><spring:message code="works.name"/> </th>
            <th><spring:message code="works.guild"/> </th>
            <th><spring:message code="works.comment"/> </th>&ndash;%&gt;
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
                    &lt;%&ndash;<td>${categoryI.createDate}</td>
                    <td>${work.owner.ssoId}</td>&ndash;%&gt;
                <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
            </tr>
            <c:forEach items="${category.value}" var="child">
                <tr>
                    <td>${child.id}</td>
                    <td style="padding-right: 55px;">${child.categoryName}</td>
                    <td>${child.parentId}</td>
                        &lt;%&ndash;<td>${categoryI.createDate}</td>
                        <td>${work.owner.ssoId}</td>&ndash;%&gt;
                    <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
                </tr>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${singles}" var="single">
            <tr>
                <td>${single.id}</td>
                <td>${single.categoryName}</td>
                <td>${single.parentId}</td>
                    &lt;%&ndash;<td>${categoryI.createDate}</td>
                    <td>${work.owner.ssoId}</td>&ndash;%&gt;
                <td><a href="<c:url value="edit-work-${work.id}"/>"class="btn btn-success custom-width"><spring:message code="site.edit"/> </a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>--%>


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

        ${treeCategories}

        </tbody>
    </table>
</div>
</body>
</html>
