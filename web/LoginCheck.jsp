<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2020/12/11
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<%
    String username= request.getParameter("username") ;
    String password= request.getParameter("password") ;
    System.out.println(username);
    try {
        Connection conn = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/userinformation?useSSL=false&serverTimezone=UTC";
        String username2 = "root";
        String password2 = "wjb201900301175.";

        Statement stmt = null;
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
            String sql="select * from login_user2 where name='"+username+"' and password='"+ password + "'";
            stmt = conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
                application.setAttribute("姓名",username);
                response.sendRedirect("Information.jsp");
//                 RequestDispatcher rd=request.getRequestDispatcher("Information.jsp");
//                 rd.forward(request,response);
            }else{

                response.sendRedirect("LoginFailed.jsp");
%>
<a href="javascript:history.back()">返回</a>
<%
            }
            // 输出连接信息
            //out.println("数据库连接成功！");
            // 关闭数据库连接
            conn.close();
        }else{
            // 输出连接信息
            System.out.println("数据库连接失败！");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
