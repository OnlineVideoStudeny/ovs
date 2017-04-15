<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="cur" items="${category}" varStatus="vs">
	<c:set var="index" value="${index + 1}" scope="request" />
    <li>
        <c:choose>
            <c:when test="${fn:length(cur.children) > 0}">
                <a href="#">${cur.id}:${cur.name}</a>
            </c:when>
            <c:otherwise>
                <a href="#">${cur.id}:${cur.name}</a><span><a href="#" onclick="del(${cur.id})">&#8195;<i class="icon-trash">删除</i></a></span>
            </c:otherwise>
        </c:choose>
    </li>
    <c:if test="${fn:length(cur.children) > 0}">
    <c:set var="level" value="${level + 1}" scope="request" />
    <c:set var="category" value="${cur.children}" scope="request" />
    <ul style="padding-left: 45px">
        <c:import url="_r.jsp" />
    </ul>
	</c:if>
</c:forEach>
<c:set var="level" value="${level - 1}" scope="request" />
