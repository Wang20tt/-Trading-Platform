<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/2
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <script type="text/javascript">


//        function a() {
//
//            const name = document.getElementById('username');
//            const pass = document.getElementById('password');
//            const xhr = new XMLHttpRequest();
//
//            var param=name.value;
//            var param2=pass.value;
//
//
//
//
//            xhr.onreadystatechange = function () {     //对ajax对象进行监听
//                if (xhr.readyState == 4) {         //4表示解析完毕
//                    if (xhr.status == 200) {
//                        //200为正常返回
//
//
//                        // var data = xhr.responseText;   //返回的文本内容
//                        // result.innerHTML += data;
//
//                    }
//                }
//            }
//
//            xhr.send();
//        }
    </script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录管理后台</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jQ.js"></script>

    <script src="js/fn_js.min.js" type="text/javascript"></script>
    <link href="css/skin.css" rel="stylesheet" /></head>

<body style="overflow: hidden">
<div class="frame_register">
    <div class="main_register">
        <div class="logo_window">
            <div class="logo">
            </div>
            <div class="logo_window1">
                <form name="userLoginActionForm" id="userLoginActionForm" method="get" action="LoginCheck.jsp" target="_parent">
                    <div class="logo_window_L" style="margin: 0 auto;float: inherit;">
                        <span class="logo-form-title">用户登录</span>
                        <div class="register_form2">
                            <input class="user-name" id="username" name="username" type="text" placeholder="用户名" maxlength="20" required/>
                        </div>
                        <div class="register_form2" style="position:relative;height:50px">
                            <input class="user-pass" type="text" id="p_t" name="p_t" value="密码" onfocus="hide_pw()" style="z-index:2;position:absolute;" required/>
                            <input class="user-pass" type="password" id="password" name="password" maxlength="32" onblur="check_pw();" style="z-index:1;position:absolute;" />
                        </div>

                        <div class="button_a" align="center">
<%--                            <a  href="#" class="login-btn" style="margin: 0 auto;display: block;" id="login_bt" name="login_bt" onclick="a()">登录</a>--%>
                            <input type="submit" align="middle" style="background:transparent; border-width:0px;
                            text-align: center; font-size: 15px;outline:none; " value="登录">

                        </div>

                        <div class="button_b">
                            <a href="Register.jsp" >注册</a>

                        </div>
                    </div>
                    <input type="hidden" id="is_cs" name="is_cs" value="0" />
                    <input type="hidden" id="is_get" name="is_get" value="1" />
                    <input type="hidden" id="show_msg" name="show_msg" value="" />
                    <input type="hidden" id="jz" name="jz" value="0" />
                    <input type="hidden" id="no_new" name="no_new" value="0" />
                    <input type="hidden" id="gobuy" name="gobuy" value="0" />
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>