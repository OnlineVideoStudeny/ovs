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
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                     <img src="${ctx}/static/images/lf.jpg"/> 
                    <div class="carousel-caption">
                        测试0
                    </div>
                </div>
                <div class="item">
                    <img src="${ctx}/static/images/top2.jpg"/>
                    <div class="carousel-caption">
                        测试1
                    </div>
                </div>
                <div class="item">
                    <img src="${ctx}/static/images/lf2.jpg"/>
                    <div class="carousel-caption">
                        测试2
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="navg-small">
            <hr class="html-editor-hr"/>
            <h3>热门课程</h3>
        </div>
        <div>
            <span>
                <a href="#" class="">
                    <img src="${ctx}/static/images/regis.jpg">
                <label class="">
                    description
                </label>
                </a>
            </span>
            
            <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
            <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
             <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
        </div>
    </div>
    <div class="row">
        <div>
            <hr class="html-editor-hr"/>
            <h3>最新课程</h3>
        </div>
        <div>
            <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
            <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
            <span>
                <a href="#">
                    <img src="${ctx}/static/images/regis.jpg">
                <label>
                    description
                </label>
                </a>
            </span>
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
