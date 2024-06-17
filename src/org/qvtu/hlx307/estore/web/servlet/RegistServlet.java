package org.qvtu.hlx307.estore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.exception.RegistException;
import org.qvtu.hlx307.estore.service.UserService;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        UserService service = new UserService();
        try {
            service.regist(user);
            response.sendRedirect(request.getContextPath()
                    + "/regist_success.jsp");
        } catch (RegistException e) {
            request.setAttribute("regist.message", e.getMessage());
            request.getRequestDispatcher("/error/registuser_error.jsp").forward(request,response);
        }
    }
}
