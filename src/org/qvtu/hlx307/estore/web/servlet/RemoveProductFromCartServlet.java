package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.domain.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class RemoveProductFromCartServlet
 */
@WebServlet("/RemoveProductFromCartServlet")
public class RemoveProductFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 得到要删除的商品的id
        int id = Integer.parseInt(request.getParameter("id"));
        // 得到购物车，从购物车中将商品删除,
        Map<Product, Integer> cart = (Map<Product, Integer>) request
                .getSession().getAttribute("cart");


        Product p = new Product();
        p.setId(id);

        cart.remove(p);
        //如果购物车中无商品，将购物车删除。
        if (cart.size() == 0) {
            request.getSession().removeAttribute("cart");
        }
        response.sendRedirect(request.getContextPath() + "/showcart.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
