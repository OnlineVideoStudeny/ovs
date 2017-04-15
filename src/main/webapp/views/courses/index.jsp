
<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/4/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title><sitemesh:write property='title' /></title>
<%@ include file="/layouts/header.jsp"%>
</head>

<div class="row">
	<video height="400" width="500" src="${ctx}${courses.dir}" controls="controls"/>
</div>
<div class="row">
	<ul class="nav nav-tabs">
		<li><a href="#details" data-toggle="tab">详情</a></li>
		<li><a href="#contents" data-toggle="tab">目录</a></li>
		<li><a href="#comment" data-toggle="tab">评论</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="details">
			<details>
                ${courses.description}
            </details>
		</div>


		<div class="tab-pane" id="contents">
			<label>目录</label>
			<div>
                <%--<ul class="tree">
                    <c:set var="index" value="0" scope="request" />
                    <c:set var="level" value="0" scope="request" />
                    <c:import url="_r.jsp" />
                </ul>--%>
			</div>
		</div>

		<div class="tab-pane" id="comment">
            <label>用户评论</label>
			<br>
			<div>
                <c:forEach items="${comment}" var="com">
                    <label>
                            ${com.content}
                    </label>
                </c:forEach>
            </div>


		</div>

	</div>
</div>
</body>
</html>
