package demo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.sql.*;

/**
 * Created on 2020/12/8.
 *
 * @author Wang Junbo
 */
@WebServlet(name = "demo.login", urlPatterns = "/login2")
public class login extends HttpServlet {


    private Connection conn;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/userinformation?useSSL=false&serverTimezone=UTC";
    private String username = "root";
    private String password = "wjb201900301175.";

    Statement stmt = null;

    public void init() {


        try {
            Class.forName(driver);
            this.conn = DriverManager.getConnection(url, username, password);
            System.out.println("数据库连接成功11111111");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }

    }


//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        System.out.println(username);
//        System.out.println(password);
//        req.setAttribute("name",username);
//
//        try {
//            stmt = conn.createStatement();
//            String sql = "select name from login_user2 where name ='" + username + "' ";
//            ResultSet result = stmt.executeQuery(sql);
//            if (!result.next()) {
//                System.out.println("不存在次用户名");
//            } else {
//                System.out.println("存在此用户名");
//            }
//
//            sql = " select * from login_user2 where name ='" + username + "' ";
//
//
//            result = stmt.executeQuery(sql);
//
//            System.out.println(result.next());
//
//            System.out.println(result.getString(2));
//            if (result.getString(2).equals(password)) {
//                System.out.println("登录");
//                req.getRequestDispatcher("/goods.jsp").forward(req,resp);
//
//
//
//            } else{
//                System.out.println("1登录");
//                RequestDispatcher rd = req.getRequestDispatcher("/LoginFailed.jsp");
//                rd.forward(req, resp);
//                System.out.println("3");
//            }
//
//
//
//            conn.close();
//            result.close();
//        } catch (Exception var7) {
//        }
//
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        ServletContext application=this.getServletContext();
        application.setAttribute("姓名",req.getParameter("username"));
        String name= (String) application.getAttribute("姓名");
        System.out.println(name);
        req.setAttribute("name",username);

        try {
            stmt = conn.createStatement();
            String sql = "insert into login_user2(name,password) values" +
                    "('" + username + "','" + password + "')";
//

            stmt.executeUpdate(sql);
//          sql = "insert into information set 姓名= '"+username+"',性别=' ',学号= ' ',专业= ' ',手机号码= ' ',电子邮箱= ' ',学历= ' ',政治面貌= ' '," +
////                  "特长= ' ',籍贯= ' ',";
//            sql = "insert into information set 姓名= '"+username+"',性别=' ',学号= ' ',专业= ' ',手机号码= ' ',电子邮箱= ' ',学历= ' ',政治面貌= ' '," +
//                    "特长= ' ',籍贯= ' '";
////

//            stmt.executeUpdate(sql);


            conn.close();
            RequestDispatcher rd = req.getRequestDispatcher("/Information.jsp");
            rd.forward(req, resp);

        } catch (Exception var7) {
        }

    }
}
