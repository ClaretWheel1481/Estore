package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.domain.Product;
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
 * Servlet implementation class ProductmmServlet
 */
@WebServlet("/ProductSimpleServlet")
public class ProductSimpleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码
        request.setCharacterEncoding("utf-8");
        //得到请求参数
        String field = request.getParameter("field"); // 字段名称
        String msg = request.getParameter("msg"); // 字段值
        //调用service查询操作
        ProductService service = new ProductService();
        try {
            List<Product> pro = service.simpleSelect(field, msg);
            request.setAttribute("pro", pro);
            request.getRequestDispatcher("/showProducts.jsp").forward(request,
                    response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
