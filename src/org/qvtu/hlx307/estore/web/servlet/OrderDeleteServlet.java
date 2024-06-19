package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteOrder")
public class OrderDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public OrderDeleteServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        //调用service中查询所有方法
        OrderService service = new OrderService();
        try {
            service.deleteOrder(id);
            resp.sendRedirect("order_delete_success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
