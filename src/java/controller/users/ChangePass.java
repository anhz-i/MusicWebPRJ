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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.users;

/**
 *
 * @author Mai
 */
@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {

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
            out.println("<title>Servlet ChangePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
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
//            MyConnect myCon = new MyConnect();
//            users u = (users)request.getSession().getAttribute("loginUser");
        request.getRequestDispatcher("Views/User/ChangePass.jsp").forward(request, response);
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
        String pass = request.getParameter("pass");
        String newPass = request.getParameter("newPass");
        String reNewPass = request.getParameter("reNewPass");
        HttpSession ses = request.getSession();
        String err = null;

        users u = (users) ses.getAttribute("loginUser");
//        if(u!=null){
//        response.getWriter().print(u.getPass());
        if (!(u.getPass().equals(pass))) {
            err = "Old password is incorrect!";

        } else if (!newPass.equals(reNewPass)) {
            err = " Re-New-Password is invalid!";
        } else {
            err = "Change password successful!";
            MyConnect myCon = new MyConnect();
            myCon.changePass(u.getUserName(),newPass);
            u.setPass(newPass);
            ses.setAttribute("loginUser", u);
            Cookie[] cookieList = request.getCookies();
            if (cookieList != null) {
                for (Cookie cookie : cookieList) {
                    if (cookie.getName().equals("username")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                    if (cookie.getName().equals("pass")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                    if (cookie.getName().equals("role")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }

            }

        }
        request.setAttribute("err", err);
        request.getRequestDispatcher("Views/User/ChangePass.jsp").forward(request, response);

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
