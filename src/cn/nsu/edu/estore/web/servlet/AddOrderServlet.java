package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.nsu.edu.estore.domain.Order;
import cn.nsu.edu.estore.exception.addOrderException;
import cn.nsu.edu.estore.service.OrderService;

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
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (addOrderException e) {
            request.setAttribute("addOrder.message", e.getMessage());
            request.getRequestDispatcher("/error/addOrder_error.jsp").forward(request, response);
        }
    }
}
