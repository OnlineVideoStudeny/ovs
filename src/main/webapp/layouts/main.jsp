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


			<div class="naviga-bar">
				<ul class="nav-dao">

					<li><a href="${ctx}/index" class="nav-hang">首页</a></li>
					<li><a href="http://www.baidu.com" class="nav-hang">在线视频</a></li>
					<li><a href="#" class="nav-hang">加入收藏</a></li>
					<li><a href="#" class="nav-hang">关于我们</a></li>

				</ul>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<shiro:guest>
						<li><a href="${ctx}/registered" class="navbar-div-1"><b>注册</b></a></li>
						<li><a href="${ctx}/login" class="navbar-div-2"><b>登陆</b></a></li>
					</shiro:guest>
					 <shiro:user>
						<div>
                            <li><a href="#" class="navbar-div-1"><b>欢迎<shiro:principal/>登陆</b></a></li>
						</div>
						<div>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">个人中心 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
						</div>
					</shiro:user>

				</ul>
			</div>
		</div>
	</header>
	<div class="container-fluid">
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
<%@ include file="/layouts/footer.jsp"%>
<sitemesh:write property='js' />
</html>
