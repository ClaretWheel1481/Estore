package org.qvtu.hlx307.estore.web.servlet;

import org.apache.commons.beanutils.BeanUtils;
import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //封装到User
        User user = new User();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        //校验用户名密码数据是否为空为空
        Map<String, String> map = user.validation();
        if (!map.isEmpty()) {
            request.setAttribute("map", map);
            request.getRequestDispatcher("/index.jsp").forward(request,
                    response);
            return;
        }
        //调用service中登录的方法
        UserService service = new UserService();
        try {
            User user1 = service.login(username, password);
            // 登录成功
            // 判断是否勾选了记住用户
            String remember = request.getParameter("remember");
            if ("on".equals(remember)) {
                // 勾选
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                // 如果用户没有勾选记住用户名，将cookie删除。删除cookie，只需要设置maxage=0或-1,注意：要与cookie的path一致.
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            // 自动登录
            String autologin = request.getParameter("autologin");
            if ("on".equals(autologin)) {
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8") + "::" + password);
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8") + "::" + password);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            request.getSession().invalidate();//先销毁session。
            request.getSession().setAttribute("user", user1);
            response.sendRedirect("http://localhost:8080/Estore");

        } catch (javax.security.auth.login.LoginException e) {
            response.sendRedirect("http://localhost:8080/Estore/error/login_error.jsp");
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
