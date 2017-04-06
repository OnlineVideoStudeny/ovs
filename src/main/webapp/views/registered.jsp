<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title> <
</head>
<%
	String msg = "";
	msg = (String) request.getAttribute("msg");
%>
<body>
	<center>
		<table>
			<form action="login.jsp" method="post" onsubmit="return regis();">
				<tr height="50px;">
					<td></td>
					<td><h2 style="color: blue;">注册界面</h2></td>
					<td></td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input type="text" id="username" name="username" /></td>
					<td height="30px;" width="200px"><span id="umeg"
						style="color: red;"></span> <c:if test="${msg!=''}">
							<span style="color: red;">${msg}</span>
						</c:if></td>
				</tr>
				<tr>
					<td>密&nbsp码:</td>
					<td height="30px;"><input type="password" id="password"
						name="password" /></td>
					<td width="200px"><span id="pwd" style="color: red;"></span></td>
				</tr>

				<tr>
					<td>确认密码:</td>
					<td height="30px;"><input type="password" id="repwd"
						name="repwd" /></td>
					<td width="200px"><span id="pwdmeg" style="color: red;"></span></td>
				</tr>

				<tr>
					<td></td>
					<td align="center"><input type="submit" value="提交" /></td>
					<td></td>

				</tr>


			</form>
		</table>
	</center>

</body>


<script type="text/javascript">
	function regis() {
		document.getElementById("umeg").innerHTML = "";
		document.getElementById("pwd").innerHTML = "";
		document.getElementById("pwdmeg").innerHTML = "";
		var flag = true;
		var username = document.getElementById("username").value;
		if (username == "") {
			document.getElementById("umeg").innerHTML = "用户名不能为空";
			flag = false;

		}

		var password = document.getElementById("password").value;
		if (password == "") {
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
</script>
</html>