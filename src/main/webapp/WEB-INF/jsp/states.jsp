<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 4/22/17
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>مکان‌ها</title>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <style>
        tbody tr:first-child{
            display: none;
        }
        table tbody tr.d-3 td.cat-name{
            padding-right: 30px;
        }
        table tbody tr.d-4 td.cat-name{
            padding-right: 60px;
        }
        table tbody tr.d-5 td.cat-name{
            padding-right: 70px;
        }
    </style>
</head>
<body>
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
        <jsp:include page="new-state.jsp"/>
    </div>
</div>


<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>شناسه</th>
            <th>مکان</th>
            <th>شناسه‌ی والد</th>
            <th width="100"></th>
            <th width="100"></th>
        </tr>
        </thead>
        <tbody>
        ${treeStates}
        </tbody>
    </table>
</div>
</body>
</html>
