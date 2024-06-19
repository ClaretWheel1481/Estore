package org.qvtu.hlx307.estore.web.servlet;

import org.qvtu.hlx307.estore.domain.NodeDate;
import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.service.NodeDateService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        NodeDateService service = new NodeDateService();
        try {
            List<NodeDate> onelevel = service.getCName(1);
            request.getSession().setAttribute("onelevel", onelevel);
            User user = (User) request.getSession().getAttribute("user");
            if (user == null || user.getRole().equals("user")) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
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
