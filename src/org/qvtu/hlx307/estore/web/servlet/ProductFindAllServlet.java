package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.domain.Product;
import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class ProductFindAllServlet
 */
@WebServlet("/ProductFindAllServlet")
public class ProductFindAllServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //调用service中查询所有方法
        ProductService service = new ProductService();
        try {
            List<Product> pro = service.findAll();
            request.setAttribute("pro", pro);
            List<Product> pro1 = service.findByCode("51");
            request.setAttribute("pro1", pro1);
            List<Product> pro2 = service.findByCode("52");
            request.setAttribute("pro2", pro2);
            List<Product> pro3 = service.findByCode("53");
            request.setAttribute("pro3", pro3);
            User user = (User) request.getSession().getAttribute("user");
            if (user == null || user.getRole().equals("user")) {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/showProducts.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
