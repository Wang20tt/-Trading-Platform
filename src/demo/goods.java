package demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import java.io.IOException;
import java.sql.*;

/**
 * Created on 2021/1/3.
 *
 * @author Wang Junbo
 */
@WebServlet(name = "goods",urlPatterns = "/goods")
public class goods extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Connection conn = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/userinformation?useSSL=false&serverTimezone=UTC";
        String username2 = "root";
        String password2 = "wjb201900301175.";
        Statement stmt = null;
        String sql;
        ResultSet rs=null;
        String s1 = null,s2 = null,s3 = null,s4 = null,s5=null;
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
            sql="select * from shoppingmall where name='"+username+"' and goodsname='"+goodsname+"'";
            try {
                stmt = conn.createStatement();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                rs=stmt.executeQuery(sql);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                if(rs.next()){
                    try {
                        s1=rs.getString(1);
                        s2=rs.getString(2);
                        s3=rs.getString(3);
                        s4=rs.getString(4);
                        s5=rs.getString(5);
                        request.setAttribute("name",s1);
                        request.setAttribute("price",s2);
                        request.setAttribute("goodsname",s3);
                        request.setAttribute("img",s4); request.setAttribute("comment",s5);
                        request.getRequestDispatcher( "/goods.jsp").forward(request,response);

                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }





                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            sql="DELETE FROM shoppingmall WHERE name='"+username+"' and goodsname='"+goodsname+"'";
            try {
                stmt.executeUpdate(sql);
                sql = "insert into usergoods(name,price,goodsname,img,comment,yourname) values" +
                        "('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + request.getParameter("yourname") + "')";
//

                stmt.executeUpdate(sql);
                stmt.close();
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        }else{
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
