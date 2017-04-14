
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
	<video height="400" width="500" controls="controls">
		<%-- <c:forEach items="${contents}" var="category">
			<option value="${category.id}">${category.img}</option>
		</c:forEach> --%>
		<source src="${ctx}/static/mp4/0_1.mp4">
	</video>
</div>
<div class="row">
	<ul class="nav nav-tabs">
		<li><a href="#details" data-toggle="tab">详情</a></li>
		<li><a href="#contents" data-toggle="tab">目录</a></li>
		<li><a href="#comment" data-toggle="tab">评论</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="details">
			测试详情
			 <br />
			<div class="">视频的详情介绍</div>
		</div>


		<div class="tab-pane" id="contents">
			测试目录
			<div>
				<table class="table">
					<tr>
						<td>名称</td>
					</tr>
					<c:set var="index" value="0" scope="request" />
					<c:set var="level" value="0" scope="request" />
					<c:import url="_r.jsp" />

				</table>
			</div>


		</div>

		<div class="tab-pane" id="comment">
			测试评论
			<br>
			<div>用户评论</div>


		</div>

	</div>
</div>
</body>
</html>
