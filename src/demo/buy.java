package demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created on 2021/1/3.
 *
 * @author Wang Junbo
 */
@WebServlet(name = "buy",urlPatterns = "/buy")
public class buy extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/userinformation?useSSL=false&serverTimezone=UTC";
        String username2 = "root";
        String password2 = "wjb201900301175.";
        Statement stmt = null;
        String sql;
        ResultSet rs=null;
        String s1,s2,s3,s4,s5;
        request.setCharacterEncoding("utf-8");
        String username= request.getParameter("username");
        String goodsname=request.getParameter("goodsname");

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

            try {
                stmt = conn.createStatement();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


            sql="DELETE FROM shoppingmall WHERE goodsname='"+goodsname+"'";
            try {
                stmt.executeUpdate(sql);
                stmt.close();
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.getRequestDispatcher( "/ShoppingMall.jsp").forward(request,response);
//
        }else{
        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
