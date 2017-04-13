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
<c:forEach var="cur" items="${contents}" varStatus="vs">
	<c:set var="index" value="${index + 1}" scope="request" />
	<tr>
		<%--  <td>${cur.id}</td>   --%>
		<td>${cur.name}</td>
		<td>${cur.description}</td>
		<td>${cur.parentId}</td>
	</tr>
	<c:if test="${fn:length(cur.children) > 0}">
		<c:set var="level" value="${level + 1}" scope="request" />
		<c:set var="category" value="${cur.children}" scope="request" />
		<c:import url="_r.jsp" />
	</c:if>
