<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/2
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>信息展示</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jQ.js"></script>
    <script src="js/fn_js.min.js" type="text/javascript"></script>
    <link href="css/skin.css" rel="stylesheet" />
    <style>
        body{
            background:  url(images/bg3.png) center center no-repeat;
            /*            -webkit-background-size: cover;
                        background-size: cover;*/
        }
    </style>
</head>

<body style="overflow: hidden">
<div class="frame_register">
    <div class="main_register">
        <!-----注册页面---->
        <div class="logo_window">
            <div class="logo" style="position: absolute;left: 78%;top: 5%">
                <img src="images/帮助2.png"  width="50px" height="50px" alt=""/>
            </div>
            <div style="position: absolute;left: 91.5%;top: 17%;font-size: 20px;font-family: 宋体">
                <a href="help.html" target="_blank" style="color:cornflowerblue">帮助</a>
            </div>
            <div class="logo_window1">

                <form name="userLoginActionForm" id="userLoginActionForm" method="POST" action="#" target="_parent">
                    <div class="logo_window_L" style="margin: 0 auto;float: inherit;">
                        <span class="logo-form-title">用户信息</span>
                        <div class="infoBox">
                            <div class="info clearfix">
                                <div class="fl infoleft">用户名:</div>
                                <div class="fr infoRight">
                                    <input type="text" value="<%=application.getAttribute("姓名")%>" readonly/>
                                </div>

                            </div>
                            <span style="width: 100px"></span>
                            <span  float="left" style="position: absolute;left: 70px;top: 120px" >
                            <img src="images/出售.png" width="100px" style="background-color:lightpink" height="100px" alt=""/>
                        </span>
                            <span    float="left" style="position: absolute;left: 190px;top: 120px">
                                <img src="images/商城.png" style="background-color: pink" width="100px" height="100px" alt=""/>
                            </span>
                            <span   float="left" style="position: absolute;left: 310px;top: 120px">
                                <img src="images/购物车-23.png" style="background-color: pink" width="100px" height="100px" alt=""/>
                            </span>
                            <br>
                            <span  float="left" style="position: absolute;left: 60px;top: 230px;"  >
  <a  href="upload.jsp"  target="_blank" style="font-size: 20px">&nbsp;&nbsp;出售商品</a>
                        </span>
                            <span   float="left" style="position: absolute;left: 190px;top: 230px">
                               <a href="ShoppingMall.jsp" target="_blank" style="font-size: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商城</a>
                             </span>
                            <span   float="left" style="position: absolute;left: 310px;top: 230px">
                                <a href="Shopping.jsp" target="_blank" style="font-size: 20px">&nbsp;&nbsp;我的已购</a>
                             </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>