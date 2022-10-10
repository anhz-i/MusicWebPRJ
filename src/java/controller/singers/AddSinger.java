/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.singers;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.singers;

/**
 *
 * @author Mai
 */
@WebServlet(name = "AddSinger", urlPatterns = {"/AddSinger"})
public class AddSinger extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSinger</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSinger at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Admin/Singers/Add.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        MyConnect myCon = new MyConnect();
        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String imgUrl = request.getParameter("imgUrl");
        String describe = request.getParameter("describe");
        String raw_gender = request.getParameter("gender");
        String raw_date = request.getParameter("dob");
        int id = Integer.parseInt(raw_id);
        boolean gender = (raw_gender.equals("1"));
        Date date = Date.valueOf(raw_date);

//        out.print(s);
        String err;
        if (myCon.getSingerById(id) != null) {
            err = "Id has already existed";
            request.setAttribute("err", err);
            singers s = new singers(id, name, imgUrl, describe, gender, date);
            request.setAttribute("infor", s);
            request.getRequestDispatcher("Views/Admin/Singers/Add.jsp").forward(request, response);
        } else {
            singers s = new singers(id, name, imgUrl, describe, gender, date);
            myCon.addSinger(s);
//            PrintWriter out = response.getWriter();
//            out.print(n);
            response.sendRedirect("Management?type=3");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
