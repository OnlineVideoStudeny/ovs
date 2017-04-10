<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/4/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>Title</title>
<body>
    <div>
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="active item">
                    <img src="${ctx}/static/images/regis.jpg">

                    </img>
                </div>
                <div class="item">
                    <img src="${ctx}/static/images/login.jpg">

                    </img>
                </div>
                <div class="item">
                    <img src="${ctx}/static/images/login.jpg">

                    </img>
                </div>
            </div>
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>
<js>
    <script>
        $('.carousel').carousel({
            interval: 2000
        })
    </script>
</js>
</body>
