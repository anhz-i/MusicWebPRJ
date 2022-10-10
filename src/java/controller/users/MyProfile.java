/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.users;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.users;

/**
 *
 * @author Mai
 */
@WebServlet(name = "MyProfile", urlPatterns = {"/MyProfile"})
public class MyProfile extends HttpServlet {

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
            out.println("<title>Servlet MyProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyProfile at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        users u = (users) session.getAttribute("loginUser");
        request.setAttribute("user", u);
        request.getRequestDispatcher("Views/User/MyProfile.jsp").forward(request, response);
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
//        processRequest(request, response);
        String fname_raw = request.getParameter("fname");
        String lname_raw = request.getParameter("lname");
        String gender_raw = request.getParameter("gender");
        String email_raw = request.getParameter("email");
        String phone_raw = request.getParameter("phone");
        String address_raw = request.getParameter("address");
        String imgUrl = request.getParameter("imgUrl");
        String username_raw = request.getParameter("username"); 
        String password_raw = request.getParameter("pass"); 

        if (imgUrl.equals("")) {
            imgUrl = request.getParameter("imgUrl1");
        }
        MyConnect mycon = new MyConnect();
        boolean gender = (gender_raw.equals("1"));
        users u = new users(username_raw, fname_raw, lname_raw, gender, email_raw, phone_raw, address_raw, imgUrl, password_raw, (byte) 1, true);
        mycon.updateUser(u);
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", u);
        response.sendRedirect("Home");
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
