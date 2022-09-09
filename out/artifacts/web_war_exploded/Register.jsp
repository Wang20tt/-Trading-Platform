<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/2
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jQ.js"></script>
    <script src="js/fn_js.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function check() {
            if (document.getElementById('username').value == "") {
                alert("请输入登录账号!");
                return false;
            }
            if (document.getElementById('password').value == "") {
                alert("请输入登录密码!");
                return false;
            }


            // window.location.href="Information.jsp"
            return true;
        }

        function cao() {
            if (document.getElementById('username').value == "") {
                alert("请输入登录账号!");
                return false;
            }
            if (document.getElementById('password').value == "") {
                alert("请输入登录密码!");
                return false;
            }


            const xhr = new XMLHttpRequest();
            var a3 = document.getElementById("username");

            xhr.open('post', '/web实验五/login2?username=' + a3.value+'&password='+document.getElementById("password").value);

alert("注册成功")
            xhr.send();

        }
    </script>
    <link href="css/skin.css" rel="stylesheet"/>
</head>
<body style="overflow: hidden">
<div class="frame_register">
    <div class="main_register">
        <!-----注册页面---->
        <div class="logo_window">
            <div class="logo">
            </div>
            <div class="logo_window1">
                <%--                <form name="userLoginActionForm" id="userLoginActionForm" method="POST" action="/login2" >--%>
                <form name="userLoginActionForm" id="userLoginActionForm" method="POST" action="Information.jsp">
                    <div class="logo_window_L" style="margin: 0 auto;float: inherit;">
                        <span class="logo-form-title">用户注册</span>
<%--                        <form name="userLoginActionForm" id="userLoginActionForm" method="POST" action="Information.jsp">--%>

                        <div class="register_form2">
                            <input class="user-name" id="username" name="username" type="text" placeholder="用户名"
                                   maxlength="20" required/>
                        </div>

                        <div class="register_form2" style="position:relative;height:50px">
                            <input class="user-pass" type="text" id="p_t" name="p_t" placeholder="密码"
                                   onfocus="hide_pw()" style="z-index:2;position:absolute;" required/>
                            <input class="user-pass" type="password" id="password" name="password" maxlength="32"
                                   onblur="check_pw();" style="z-index:1;position:absolute;"/>
                        </div>


                        <div class="button_a" align="center">

                            <input class="button_a" align="center" type="submit" align="middle"
                                   style="background:transparent; border-width:0px;
                            text-align: center; font-size: 15px;outline:none; " value="注册" onclick="cao()">

                        </div>

                        <div class="button_b">
                            <a href="Login.jsp">登录</a>
                        </div>

                    </div>
                    <input type="hidden" id="is_cs" name="is_cs" value="0"/>
                    <input type="hidden" id="is_get" name="is_get" value="1"/>
                    <input type="hidden" id="show_msg" name="show_msg" value=""/>
                    <input type="hidden" id="jz" name="jz" value="0"/>
                    <input type="hidden" id="no_new" name="no_new" value="0"/>
                    <input type="hidden" id="gobuy" name="gobuy" value="0"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>