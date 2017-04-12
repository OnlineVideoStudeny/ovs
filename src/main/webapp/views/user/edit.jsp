<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/12/2017
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息修改</title>
</head>
<body>
<form method="post" action="/user/update" enctype="multipart/form-data">
    <fieldset>
        <input name="id" type="hidden">
        <div>
            <label>
                头像：
            </label>
            <input name="file" type="file">
        </div>
        <div>
            <label>
                姓名：
            </label>
            <input name="name">
        </div>
        <div>
            <label>
                昵称：
            </label>
            <input name="nickName">
        </div>
        <div>
            <label>
                性别：
            </label>
            <select name="gender">
                <option value="M" selected>男</option>
                <option value="W">女</option>
            </select>
        </div>
        <div>
            <label>
                电话：
            </label>
            <input name="phone">
        </div>
    </fieldset>
    <div>
        <button type="submit">
            修改
        </button>
    </div>
</form>
</body>
</html>
