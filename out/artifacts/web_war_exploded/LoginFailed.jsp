<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2020/12/11
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=Login.jsp">
    <title>登录失败</title>
    <script type="text/javascript">
        function info() {
//循环执行,1秒执行一次
            window.setInterval("daojishi()", 1000);
        }
        function daojishi() {
            if(document.getElementById("msg").innerHTML!=1){
                document.getElementById("msg").innerHTML=document.getElementById("msg").innerHTML-1;
            }
        }
    </script>
</head>
<body onload="info()" >
用户名或密码错误,<span id="msg">3</span>秒返回登录页面
</body>
</html>

