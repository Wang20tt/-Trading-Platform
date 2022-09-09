package dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Session;
import javafx.application.Application;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";

    // 上传配置-单位字节
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 20;  // 20MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 100; // 100MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 100; // 100MB

    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // 1.判断是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须写有:enctype=multipart/form-data");
            writer.flush();
            return;
        }

        //2.开始配置上传参数-创建fileItem工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);

        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        //创建文件上传核心组件
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大上传文件的阈值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        upload.setHeaderEncoding("UTF-8");

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = "F:\\大二上\\web实验五\\web\\images";


        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String fileName = null;
        try {

            // 解析请求的内容提取文件数据
            List<FileItem> formItems = upload.parseRequest(request);

            //遍历Items
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                          fileName = new File(item.getName()).getName();
                        //获取文件保存在服务器的路径
                        String filePath = uploadPath + File.separator + fileName;
                        System.out.println(fileName);

                        //这个路径已经包含了图片名称，放到file对象中保存。
                        File storeFile = new File(filePath);

                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);

                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message",
                                "文件上传成功!"
                                        + "<br>存于："+filePath);
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }


        String username= request.getParameter("username");

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
                System.out.println(username);
                System.out.println(request.getParameter("price"));
                System.out.println(request.getParameter("goodsname"));
                System.out.println(fileName);
                String sql = "INSERT INTO shoppingmall(name, price, goodsname,img,comment)"
                        + " VALUES ('"+username+"','"+request.getParameter("price")+"','"+
                        request.getParameter("goodsname")+"','"+fileName+"','"+request.getParameter("comment")+"')";



                stmt = conn.createStatement();
                stmt.executeUpdate(sql);



//                    response.sendRedirect("Information.jsp");
//                 RequestDispatcher rd=request.getRequestDispatcher("Information.jsp");
//                 rd.forward(request,response);


//                    response.sendRedirect("LoginFailed.jsp");

                 // 输出连接信息
                //out.println("数据库连接成功！");
                // 关闭数据库连接
                conn.close();
                stmt.close();
            }else{
                // 输出连接信息
                System.out.println("数据库连接失败！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/message.jsp").forward(
                request, response);
    }
    public static void main(String[] args) {
    }
}
