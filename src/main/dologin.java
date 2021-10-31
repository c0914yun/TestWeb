package main;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dologin extends HttpServlet {
    public dologin(){
        super();
    }
    public void destroy(){
        super.destroy();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        Connection ct;
        PreparedStatement ps;
        ResultSet rs;
        //加载驱动
        String driver="com.mysql.cj.jdbc.Driver";
        //url
        String url="jdbc:mysql://localhost:3306/login";
        //数据库用户名
        String user="test";
        //数据库密码
        String password="123";
        //输入的用户名和密码
        String txtUsername;
        String txtPassword;
        //数据库储存的用户名和密码
        String myuserword;
        String mypwd;
        //接受数据
        txtUsername=request.getParameter("txtUsername");
        txtPassword=request.getParameter("txtPassword");
        //验证码检测
        String txtCheckCode=request.getParameter("txtCheckCode");//获取输入框中输入的验证码
        String CheckCode=request.getSession().getAttribute("randCheckCode").toString();//获取验证码真实的值
        boolean judgeCheckCode=txtCheckCode.equals(CheckCode);//比对输入的验证码跟真实的验证码是否一致
        //如果验证码正确，就连接数据库，比对用户名和密码
        if (judgeCheckCode){
            System.out.println("验证码正确");
            System.out.println("正在连接数据库....");
           /* try {
                //加载驱动程序
                Class.forName(driver);
            }*/
        }



    }
}
