<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>视频列表</title>
</head>
<body>
    <section>
        <c:forEach items="${coursesList}" var="video">
                <span>
                    <a href="${ctx}/courses/index?id=${video.id}" class="">
                        <img src="${ctx}${video.img}">
                        <label class="">
                                ${video.description}
                        </label>
                    </a>
                </span>
        </c:forEach>
    </section>
</body>
</html>
