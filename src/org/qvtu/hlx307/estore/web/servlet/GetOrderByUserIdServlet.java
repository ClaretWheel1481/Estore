package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/GetOrderByUserId")
public class GetOrderByUserIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetOrderByUserIdServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        //调用service中查询所有方法
        OrderService service = new OrderService();
        try {
            req.setAttribute("orderList", service.findByUserId(id));
            req.getRequestDispatcher("/orders.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
