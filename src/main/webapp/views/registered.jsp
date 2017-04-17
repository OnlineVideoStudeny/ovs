<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title>
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
	background: url('${ctx}/static/images/regis.jpg');
	background-repeat: no-repeat;
	background-size: 100%;
}

#regis {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width: 300px;
	height: 300px;
}

#regis h3 {
	color: #fff;
	text-shadow: 0 0 10px;
	letter-spacing: 1px;
	text-align: center;
}

h3 {
	font-size: 2em;
	margin: 0.67em 0;
}

input {
	width: 278px;
	height: 18px;
	margin-bottom: 10px;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px;
	border-top: 1px solid #312E3D;
	border-left: 1px solid #312E3D;
	border-right: 1px solid #312E3D;
	border-bottom: 1px solid #56536A;
	border-radius: 4px;
	background-color: #2D2D3F;
}

.reg {
	width: 300px;
	min-height: 40px;
	display: block;
	background-color: #4a77d4;
	border: 1px solid #3762bc;
	color: #fff;
	padding: 9px 14px;
	font-size: 15px;
	line-height: normal;
	border-radius: 5px;
	margin: 0;
}
</style>
</head>
<%
	String msg = "";
	msg = (String) request.getAttribute("msg");
%>
<body>

	<div id="regis">
		<h3>欢迎注册</h3>
		<form action="${ctx}/login" method="post" onsubmit="return regis();">
			<input type="text" id="name" name="nickname" placeholder="用户名" /> <span
				id="userPmg"></span> <br> <br> <input type="password"
				id="password" name="password" placeholder="密码" /> <span id="pwd"></span><br>
			<br> <input type="password" id="repwd" name="repeatPassword"
				placeholder="确认密码" /> <span id="pwdmeg"></span><br> <br>
			<input type="submit" class="reg" value="注册"> <br>
		</form>
		</table>
	</div>

</body>


<js> <script type="text/javascript">
	function regis() {
		document.getElementById("userPmg").innerHTML = "";
		document.getElementById("pwd").innerHTML = "";
		document.getElementById("pwdmeg").innerHTML = "";
		var flag = true;
		var name = document.getElementById("name").value;
		if (name == "" || name == null) {
			document.getElementById("userPmg").innerHTML = "用户名不能为空";
			flag = false;

		}

		var password = document.getElementById("password").value;
		if (password == "" || password == null) {
			document.getElementById("pwd").innerHTML = "密码不能为空";
			flag = false;

		}

		var repwd = document.getElementById("repwd").value;
		if (repwd != password) {

			document.getElementById("pwdmeg").innerHTML = "两次密码不一致";
			flag = false;
		}

		return flag;

	}
</script> </js>
</html>