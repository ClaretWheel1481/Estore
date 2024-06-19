package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.domain.PageBean;
import org.qvtu.hlx307.estore.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ProductFindByPageServlet
 */
@WebServlet("/ProductFindByPageServlet")
public class ProductFindByPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置默认访问第一页
        int pageNum = 1;

        String _pageNum = request.getParameter("pageNum");
        if (_pageNum != null) {
            pageNum = Integer.parseInt(_pageNum);
        }

        //规定每页显示条数
        int currentPage = 12;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }

        //调用service中查询操作
        ProductService service = new ProductService();

        PageBean pb = service.findByPage(pageNum, currentPage);

        request.setAttribute("pb", pb);

        request.getRequestDispatcher("/home.jsp").forward(
                request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
