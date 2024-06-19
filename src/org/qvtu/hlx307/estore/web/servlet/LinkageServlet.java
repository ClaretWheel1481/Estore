package org.qvtu.hlx307.estore.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.qvtu.hlx307.estore.service.NodeDateService;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class LinkageServlet
 */
@WebServlet("/LinkageServlet")
public class LinkageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String code = request.getParameter("levelcode");
        NodeDateService service = new NodeDateService();
        if (code != null && !code.isEmpty()) {// 有变量就要进行空判断
            try {
                List<HashMap<String, Object>>  name = service.getNextName(code);
                request.getSession().setAttribute("c3name", name);
                String aString = JSONArray.fromObject(name).toString();
                out.print(aString);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            out.print("fail");
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
