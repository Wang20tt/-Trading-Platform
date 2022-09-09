<%@ page import="javafx.application.Application" %>
<%@ page import="javax.swing.text.Document" %><%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/3
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script type="text/javascript">
        function validForm(fm){


              fm.action = fm.action + "?username=" + fm['username'].value;
            fm.action = fm.action + "&price=" +fm['price'].value;
             fm.action = fm.action + "&comment=" + fm['comment'].value;
             fm.action = fm.action + "&goodsname=" + fm['goodsname'].value;
            return true;
        }
    </script>

    <style type="text/css">
        html,body{
            width: 100%;
            height: 100%;
        }

        .mui-content{
            background: url(images/SharedScreenshot.jpg) bottom center no-repeat #efeff4 ;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            position: relative;
        }
        #box_relative {
            position: absolute;
            left: 49%;
            top: 15%;
            font-size: 25px;
            font-family: 宋体;
        }
        #box_relative2 {
            position: absolute;
            left: 50%;
            top: 23.5%;
            font-size: 25px;
            font-family: 宋体;
        }
        #box_relative3 {
            position: absolute;
            left: 50%;
            top: 31.5%;
            font-size: 25px;
            font-family: 宋体;
        }
        #box_relative4 {
            position: absolute;
            left: 50%;
            top: 39%;
            font-size: 25px;
            font-family: 宋体;
        }

        .input1{
            position: absolute;
            left: 60%;
            top: 18%;
            font-size: 25px;
            font-family: 宋体;
            width: 100px;
        }
        .input2{
            position: absolute;
            left: 60%;
            top: 26%;
            font-size: 25px;
            font-family: 宋体;
            width: 100px;
        }

        .input3{
            position: absolute;
            left: 60%;
            top: 34.5%;
            font-size: 20px;
            font-family: 宋体;
            width: 100px;

        }
        .input4{
            position: absolute;
            left: 50%;
            top: 48%;
            font-size: 15px;
            font-family: 宋体;
            width: 350px;


        }
        .input5{
            position: absolute;
            left: 50%;
            top: 58%;
            font-size: 20px;
            font-family: 宋体;
            width: 150px;
            height: 50px;
            background-color:lightpink;
            border-style: none;

        }
    </style>
</head>
<body background="SharedScreenshot.jpg" class="mui-content" >

<%--<form method="post" action="UploadServlet" enctype="multipart/form-data">--%>
<%--    <input type="file" class="input3" name="uploadFile" />--%>
<%--    <input type="submit"  class="input5" value="点我上传" />--%>
<%--</form>--%>


<form method="post" action="UploadServlet" enctype="multipart/form-data"  onsubmit="return validForm(this)">
    <p id="box_relative">&nbsp;&nbsp;商品名称</p>
    <input type="hidden" name="username" value="<%=application.getAttribute("姓名")%>" id="username" class="username">

    <input type="text"  name="goodsname" class="input1"  >
    <p id="box_relative2" > &nbsp;价格(元)</p>
    <input type="text"  name="price" class="input2"  >
    <p id="box_relative3"> 上传商品图片</p>
    <input type="file" class="input3" name="uploadFile" />


    <p id="box_relative4" > 请您简短描述下您的商品:</p>
    <textarea class="input4" rows="3" name="comment"></textarea>

    <%
//        session.setAttribute("姓名",application.getAttribute("姓名"));
//        session.setAttribute("price",re);
//        session.setAttribute("goodsname",application.getAttribute("姓名"));
//        session.setAttribute("comment",application.getAttribute("姓名"));


    %>
    <input type="submit"  class="input5" value="点我上传" />
</form>
</body>
</html>