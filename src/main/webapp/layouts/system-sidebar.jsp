<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script>
	$(document).ready(function() {
		$(".vertical-nav").verticalnav({
			speed : 400,
			align : "left"
		});
	});
</script>
<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
	<li class="active"><a href="${ctx}/index" > <i
			class="glyphicon glyphicon-th-large"></i> 首页
	</a></li>
	<li><a href="#systemSetting" class="nav-header collapsed"
		data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
			系统管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
	</a>
		 <ul id="systemSetting" class="nav nav-list collapse secondmenu"
			style="height: 0px;">
			<li><a href="${ctx}/user/edit"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-edit"></i>信息修改</a></li>
		</ul></li> 
	<li><a href="${ctx}/system/category/add"> <i
			class="glyphicon glyphicon-credit-card"></i> 分类管理
	</a></li>
	<li><a href="${ctx}/courses/add"> <i
			class="glyphicon glyphicon-globe"></i> 目录管理
	</a></li>
	<li><a href="${ctx}/courses/add"> <i
			class="glyphicon glyphicon-calendar"></i> 课程管理
	</a></li>
	<li><a href="#"> <i class="glyphicon glyphicon-fire"></i> 关于系统
	</a></li>
</ul>