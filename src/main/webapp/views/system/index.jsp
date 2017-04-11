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

<body>

	<header class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="gen">跟谁学习网</div>
				<br> <span class="shui">GenShuiXue.com</span>
			</div>
		</div>
	</header>

	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li class="active"><a href="#"> <i
							class="glyphicon glyphicon-th-large"></i> 首页
					</a></li>
					<li><a href="#systemSetting" class="nav-header collapsed"
						data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
							系统管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul id="systemSetting" class="nav nav-list collapse secondmenu"
							style="height: 0px;">
							<li><a href="#"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-th-list"></i>菜单管理</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
						</ul></li>
					<li><a href="./plans.html"> <i
							class="glyphicon glyphicon-credit-card"></i> 视频管理
					</a></li>
					<li><a href="./grid.html"> <i
							class="glyphicon glyphicon-globe"></i> 目录管理
					</a></li>
					<li><a href="./charts.html"> <i
							class="glyphicon glyphicon-calendar"></i> 分类管理
					</a></li>
					<li><a href="#"> <i class="glyphicon glyphicon-fire"></i>
							关于系统
					</a></li>
				</ul>
			</div>
			
		</div>
	</div>
	   <div class="index-right">
		<div class="row">
			<div class="col-md-2">
				<%@ include file="/layouts/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<sitemesh:write property='body' />
			</div>
		</div>
	</div>
</body>
  
</html>
