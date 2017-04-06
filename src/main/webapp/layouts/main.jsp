<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/4/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><sitemesh:write property='title' /></title>
    <%@ include file="/layouts/header.jsp"%>
</head>
<body>
<header>
    <div class="container-fluid">
        516516
    </div>
</header>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <%@ include file="/layouts/sidebar.jsp"%>
        </div>
        <div class="col-md-10">
            <sitemesh:write property='body' />
        </div>
    </div>
</div>
</body>
<%@ include file="/layouts/footer.jsp"%>
</html>
