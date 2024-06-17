package org.qvtu.hlx307.estore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import org.qvtu.hlx307.estore.domain.Order;
import org.qvtu.hlx307.estore.exception.addOrderException;
import org.qvtu.hlx307.estore.service.OrderService;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order order = new Order();
        try {
            BeanUtils.populate(order, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        OrderService service = new OrderService();
        try {
            service.addOrder(order);
            response.sendRedirect(request.getContextPath() + "/order_success.jsp");
        } catch (addOrderException e) {
            request.setAttribute("addOrder.message", e.getMessage());
            request.getRequestDispatcher("/error/addOrder_error.jsp").forward(request, response);
        }
    }
}
