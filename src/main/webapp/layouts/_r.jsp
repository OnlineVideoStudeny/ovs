<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="cur" items="${treeList}" varStatus="vs">
    <c:set var="index" value="${index + 1}" scope="request" />
    <tr>
        <td align="center" nowrap="nowrap">${cur.id}</td>
        <td align="center" nowrap="nowrap">${cur.name}</td>
    </tr>
    <c:if test="${fn:length(cur.children) > 0}">
        <c:set var="level" value="${level + 1}" scope="request" />
        <c:set var="treeList" value="${cur.children}" scope="request" />
        <c:import url="_r.jsp" />
    </c:if>
</c:forEach>
<c:set var="level" value="${level - 1}" scope="request" />
