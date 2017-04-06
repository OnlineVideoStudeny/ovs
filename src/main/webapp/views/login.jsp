<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆界面</title>

    <style type="text/css">


        }
    </style>
</head>
<body style="background:url('../static/images/timg.jpg')">
<%
    String msg = "";
    msg = (String) request.getAttribute("msg");
%>
<center style="padding:500px" >
    <form action="/index.html" " "src/main/webapp/views/login.jsp"method="post" onsubmit="return check();" >
    用户名:<input type="text" id="username" name="username" /> <span
        id="userPmg" style="color: red;"></span><br> <br>
    密    码：<input type="password" id="password" name="password" />
    <span id="pwd" style="color: red;"></span><br> <br> <input
        type="submit" value="登陆" /><br>
    <c:if test="${msg} }">
        <span style="color: red;">${msg} }</span>
    </c:if>
    </form>
</center>

</body>

<js>
    <script type="text/javascript">
        function check() {
            document.getElementById("userPmg").innerHTML = "";
            document.getElementById("pwd").innerHTML = "";
            var flag = true;
            var username = document.getElementById("username").value;
            if (username.length == 0) {
                document.getElementById("userPmg").innerHTML = "*不能为空";
                flag = false;
            }
            var password = document.getElementById("password").value;
            if (password.length == 0) {
                document.getElementById("pwd").innerHTML = "*不能为空";
                flag = false;
            }
            return flag;

        }
    </script>
</js>
</html>