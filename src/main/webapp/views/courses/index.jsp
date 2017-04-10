<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/4/2017
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>index</title>
<body>
    <div class="row">
        <video height="400" controls></video>
    </div>
    <div class="row">
        <ul class="nav nav-tabs">
            <li><a href="#details" data-toggle="tab">详情</a></li>
            <li><a href="#contents" data-toggle="tab">目录</a></li>
            <li><a href="#comment" data-toggle="tab">评论</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="details">测试详情</div>
            <div class="tab-pane" id="contents">测试目录</div>
            <div class="tab-pane" id="comment">测试评论</div>
        </div>
    </div>
</body>
