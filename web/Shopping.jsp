<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/2
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript">
        window.onload=function () {

            i=0;



















        }
    </script>
    <%@ page contentType="text/html;charset=UTF-8"  %>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", -1);
        response.addHeader( "Cache-Control", "no-store");
//于客户机的每次请求，代理服务器必须想服务器验证缓存是否过时；
        response.addHeader( "Cache-Control", "must-revalidate");
    %>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta charset="UTF-8">
    <title>已购物品</title>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
        }
        .mui-content {
            background: url(images/shopping.png) bottom center no-repeat #efeff4;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            position: relative;
        }

        .main{
            width: 1000px;
            height: 600px;
            /*border: 1px solid red;*/
            margin:0px auto;
        }
        div{
            /*border:1px solid green;*/
            font-size: 12px;
        }
        img{
            display: block;
            width: 100px;
            height: 100px;
        }
        .detail{
            font-size:0px;
            /*background: url(./img/con.png) no-repeat 190px center;*/
            border:1px solid #E6E6E6;
        }
        .details{
            display: inline-block;
            padding-right: 13px;
            border-right: 1px solid #E6E6E6;
            text-align: center;
            text-indent: 1.2em;




        }
        .show{
            width: 220px;
            display: inline-block;
            margin-left: 20px;
        }
        .content{
            font-size: 0px;
            margin-bottom: 10px;
        }
        .price{
            font-size: 16px;
            color: red;
            font-weight: bold;
        }
        .store{
            color: #8236E5;
            text-decoration: underline;
            margin-bottom: 5px;
        }
        mark{
            background-color:transparent;
            color:green;
        }
        span{
            color: #8236E5;


        }
        div{
            font-size: 15px;
            font-family: 宋体;
        }
    </style>
</head>
<body class="mui-content">
<div style="height: 100px;width: 600px">
    <p style="font-family: 宋体;font-size: 40px;position: absolute;left: 10%;color:palevioletred">您的已购</p>

</div>
<div class="main">
    <%!

        Connection conn = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/userinformation?useSSL=false&serverTimezone=UTC";
        String username2 = "root";
        String password2 = "wjb201900301175.";
        Statement stmt = null;
        String sql;
        ResultSet rs=null;
        String s1[]=new String[30];
        String s2[]=new String[30];
        String s3[]=new String[30];
        String s4[]=new String[30];
        //        String s1,s2,s3,s4=null;
        int i=0;

    %>
    <%
        String username= null ;
username= (String) application.getAttribute("姓名");
        System.out.println(username);



        try {

            Class.forName(driver);
            conn = DriverManager.getConnection(url, username2, password2);
            System.out.println("数据库连接成功");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }
        // 判断数据库连接是否为空
        if(conn != null){
            sql="select * from usergoods where yourname ='"+username+"'";

            stmt = conn.createStatement();
            rs=stmt.executeQuery(sql);
//                rs=stmt.executeUpdate(sql);
            i=0;
            System.out.println(333);
            while (rs.next()) {


                s1[i] = rs.getString(1);
                s2[i] = rs.getString(2);
                s3[i] = rs.getString(3);
                s4[i] = rs.getString(4);
                System.out.println(s1[i]);
                i++;
//                    System.out.println(s1);
//                    System.out.println(888);
//                    System.out.println(s4);


            }


//                    response.sendRedirect("Information.jsp");
//                 RequestDispatcher rd=request.getRequestDispatcher("Information.jsp");
//                 rd.forward(request,response);
        }else{
        }


//                    response.sendRedirect("LoginFailed.jsp");
    %>
    <div class="content" id="aaa">
        <%
            int ii=0;
            while (ii<i){
                System.out.println(888);
                System.out.println(application.getAttribute("姓名"));

        %>
        <div class="show">
            <div class="imgbg">
                <img src="images/<%=s4[ii]%>"   alt="<%=s4[ii]%>">
            </div>
            <div class="price">
                ¥<%=s2[ii]%>
            </div>


                <div class="introduce" >
                      <p name="username"  style="border:none;background-color: white;color:black ;
                    font-size: 15px;font-family: 宋体;outline: none" readonly>卖家:<%=s1[ii]%></p>

                </div>

                <div class="store" onclick="">
                    <p name="username"  style="border:none;background-color: white;color:black ;
                    font-size: 15px;font-family: 宋体;outline: none" readonly>物品名称:<%=s3[ii]%></p>

                </div>


            <div class="detail">
<%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
<%--                <div class="details">评价<span>2192</span></div>--%>

            </div>
        </div>
        <% ii++; } %>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j2.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交2102笔</div>--%>
        <%--                <div class="details">评价2192</div>--%>
        <%--                <div class="details">--%>

        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j3.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
        <%--                <div class="details">评价<span>2192</span></div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j4.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
        <%--                <div class="details">评价<span>2192</span></div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        <%--    <div class="content">--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j5.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
        <%--                <div class="details">评价<span>2192</span></div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j6.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交2102笔</div>--%>
        <%--                <div class="details">评价2192</div>--%>
        <%--                <div class="details">--%>

        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j7.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
        <%--                <div class="details">评价<span>2192</span></div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="show">--%>
        <%--            <div class="imgbg">--%>
        <%--                <img src="./img/j8.jpg">--%>
        <%--            </div>--%>
        <%--            <div class="price">--%>
        <%--                ¥239.00--%>
        <%--            </div>--%>
        <%--            <div class="introduce">--%>
        <%--                我是一行介绍字体--%>
        <%--            </div>--%>
        <%--            <div class="store">--%>
        <%--                贪玩蓝月--%>
        <%--            </div>--%>
        <%--            <div class="detail">--%>
        <%--                <div class="details">月成交<mark>2102笔</mark></div>--%>
        <%--                <div class="details">评价<span>2192</span></div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</div>

<div>
<%--    <p style="font-family: 宋体;font-size: 20px;position: absolute;left: 55%;top:80%;color:palevioletred">tips:点击物品名称可以跳转到详情页面呦</p>--%>
</div>
</body>

</html>