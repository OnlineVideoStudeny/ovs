<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title>

<style type="text/css">
html {
	width: 100%;
	height: 100%;
	overflow: hidden;
	font-style: sans-serif;
}

body {
	width: 100%;
	height: 100%;
	font-family: 'Open Sans', sans-serif;
	margin: 0;
	background:url('${ctx}/static/images/login.jpg');
	background-repeat:no-repeat;
	background-size:100%;
}

#login {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width: 400px;
	height: 300px;
	
}

#login h3{
	color: #fff;
	text-shadow: 0 0 10px;
	letter-spacing: 1px;
	text-align: center;
   
}

h3{
	font-size: 2em;
	margin: 0.67em 0;
}

input {
	width: 278px;
	height: 18px;
	margin-bottom: 10px;
	padding: 10px;
	font-size: 13px;
	color:#000000;
	text-shadow: 1px 1px 1px;
	border-top: 1px solid #312E3D;
	border-left: 1px solid #312E3D;
	border-right: 1px solid #312E3D;
	border-bottom: 1px solid #56536A;
	border-radius: 4px;
	background-color:rgba(255,255,255,.5);
	margin-left:50px;
}
span{
margin-left:50px;
}


.sub {
	width: 300px;
	min-height: 40px;
	display: block;
	background-color: #6495ED;
	border: 1px solid #3762bc;
	color: #fff;
	padding: 9px 14px;
	font-size: 20px;
	line-height: normal;
	border-radius: 5px;
	margin-left:50px;
}
</style>
</head>
<body>
	<%
		String msg = "";
		msg = (String) request.getAttribute("msg");
	%>
	<div id="login">
		<h3>欢迎登陆跟谁学视频网站</h3>
		<form action="${ctx}/login" method="post" onsubmit="return check();">
			<input type="text" id="username" name="username" placeholder="用户名" /><br>
			<span id="userPmg"></span><br> <br> <input type="password"
				id="password" name="password" placeholder="密码" /> <br><span id="pwd"></span><br>
			<br> <input type="submit" class="sub" value="登陆"> <br>
		</form>

	</div>
</body>
<js> <script type="text/javascript">
	function check() {
		var flag = true;
		//根据输入框的id属性获得输入框的内容
		document.getElementById("userPmg").innerHTML == "";
		var username = document.getElementById("username").value;
		if (username == "" || username == null) {
			document.getElementById("userPmg").innerHTML = "<font color='red'>*用户名不能为空！</font>";
			flag = false;

		}
		/**
		 * 验证密码
		 */
		document.getElementById("pwd").innerHTML == "";
		var password = document.getElementById("password").value;
		if (password == "" || password == null) {
			document.getElementById("pwd").innerHTML = "<font color='red'>* 密码不能为空</font>";
			flag = false;
		}
		return flag;
	}
</script> </js>
</html>