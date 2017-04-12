<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:forEach var="cur" items="${categoryList}" varStatus="vs">
    <c:set var="index" value="${index + 1}" scope="request" />
    <c:choose>
        <c:when test="${fn:length(cur.children) <= 0}">
            <li><a href="${ctx}/courses/list?id=${cur.id}">${cur.name}</a></li>
        </c:when>
        <c:otherwise>
            <c:set var="level" value="${level + 1}" scope="request" />
            <c:set var="categoryList" value="${cur.children}" scope="request" />
            <li><a href="${ctx}/courses/list?id=${cur.id}">${cur.name}<span class="submenu-icon"></span></a>
            <ul>
                <c:import url="_r.jsp" />
            </ul>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:set var="level" value="${level - 1}" scope="request" />
