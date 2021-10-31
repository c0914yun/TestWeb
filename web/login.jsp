<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/4
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String username="";
    String password="";
    Cookie[] arrCookie=request.getCookies();
    if(arrCookie!=null){
        for (Cookie ck : arrCookie) {
            if(ck.getName().equals("UserName")){
                     username= URLDecoder.decode(ck.getValue(), "utf-8");
            }
            if(ck.getName().equals("PassWord")){
                password = URLDecoder.decode(ck.getValue(), "utf-8");
                break;
            }
        }
    }
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="styles.css">
    <script type="text/javascript">
           /*点击图片改变验证码*/
           function reloadCode(){
               checkcode.src="servlet/validateCode?id="+(new Date()).getTime();
           }
    </script>
</head>
<body>
<div class="wrapper">
    <div class="form">
        <form name="loginForm" action="dologin" method="post">
            <table>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="txtUsername"
                        value="<%=username%>" class="input" placeholder="请输入用户名admin"/>

                    </td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="txtPassword"
                        value="<%=password%>" class="input" placeholder="请输入密码123"/>

                    </td>
                </tr>
                <tr>
                    <td>验证码：</td>
                    <td><input name="txtCheckCode" type="text" id="txtCheckCode"
                         placeholder="请输入验证码" class="captcha_input">
                         <a href="javascript:reloadCode();">
                             <img src="servlet/validateCode" id="checkcode"/>
                         </a></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="checkbox" name="isUseCookie"
                       checked="checked"/>十天内记住我的登录状态</td>
                </tr>
                <tr>
                    <td colspan="2" text-align="center"><input type="submit"
                    value="登录" class="input login"/>
                    </td>
                </tr>
            </table>

        </form>
<div class="divider">
    ——————<span>第三方登录</span>—————

</div>
        <!-- 页底开始 -->
        <footer>
            <p>Copyright 2017@Paranoidyang</p>
        </footer>
    </div>
    <!-- 页底结束 -->
</div>
</body>
</html>
