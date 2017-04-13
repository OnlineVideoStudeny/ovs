<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>用户信息修改</title>
</head>
<body>
	<form method="post" action="/user/update" enctype="multipart/form-data"
		id="userInfoSubmit">
		<fieldset>
			<input name="id" type="hidden">
			<div>
				<label> 头像： </label> <input name="file" type="file" id="files">
			</div>
			<div>
				<label> 姓名： </label> <input name="name" id="name">
			</div>
			<div>
				<label> 昵称： </label> <input name="nickName" id="nickName">
			</div>
			<div>
				<label> 性别： </label> <select name="gender" id="gender">
					<option value="M" selected>男</option>
					<option value="W">女</option>
				</select>
			</div>
			<div>
				<label> 电话： </label> <input name="phone" id="phone">
			</div>
		</fieldset>
		<div>
			<button type="submit" id="editsSubmit">修改</button>
		</div>
	</form>
</body>
<script type="text/javascript">
	$(function() {
		$("#editsSubmit").click(
				function() {
					var file = $("#files").val();
					var name = $("#name").val();
					var nickName = $("#nickName").val();
					var gender = $("#gender").val();
					var phone = $("#phone").val();

					if ((file === null || file === "")
							&& (name === null || name === "")
							&& (nickName === null || nickName === "")
							&& (gender === null || gender === "")
							&& (phone === null || phone === "")) {
						alert("请将信息填完整");
					} else {
						$("#userInfoSubmit").submit();
					}
				})
	})
</script>

</html>
