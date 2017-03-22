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

   <ul class="table">
       <c:forEach items="${roots}" var="root">
           <li>${root.categoryName}</li>
           <c:forEach items="${categories}" var="mcategory">
               <c:if test="${root.id eq mcategory.key.id}">
                   <ul>
                       <c:forEach items="${mcategory.value}" var="ch">
                           <li>${ch.categoryName}</li>
                           <c:forEach items="${categories}" var="mcategory">
                               <c:if test="${ch.id eq mcategory.key.id}">
                                   <ul>
                                       <c:forEach items="${mcategory.value}" var="ch">
                                           <li>${ch.categoryName}</li>
                                       </c:forEach>
                                   </ul>
                               </c:if>
                           </c:forEach>
                       </c:forEach>
                   </ul>
               </c:if>
           </c:forEach>
       </c:forEach>
   </ul>

<script>
    $(document).ready(function () {
        var parentNumber = $('table tr.data-tree .parent-n').innerHTML;

    });
</script>
</body>
</html>
