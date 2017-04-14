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
    <%@ include file="/layouts/system-header.jsp"%>
</head>
<body>
<header class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <div class="gen">跟谁学习网</div>
            <br> <span class="shui">GenShuiXue.com</span>
        </div>
    </div>
</header>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <%@ include file="/layouts/system-sidebar.jsp"%>
        </div>
        <div class="col-md-10">
            <sitemesh:write property='body' />
        </div>
    </div>
</div>
</body>
<sitemesh:write property="js" />
<%@ include file="/layouts/system-footer.jsp"%>
</html>
