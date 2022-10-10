/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MyConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.users;

/**
 *
 * @author Mai
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int count = 0;
        String role = "";
        String username="";
        Cookie[] cookieList = request.getCookies();
        if (cookieList != null) {
            for (Cookie cookie : cookieList) {
                if (cookie.getName().equals("username")) {
                    count++;
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("pass")) {
                    count++;
                }
                if (cookie.getName().equals("role")) {
                    role = cookie.getValue();
                }
            }
        }
        if (count != 2) //ko luu username va pass 
        {
            request.getRequestDispatcher("Views/Guest/LoginForm.jsp").forward(request, response);
        } else {
            MyConnect myCon = new MyConnect();
            users u = myCon.getUserByUName(username);
            response.getWriter().print(u);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", u);
            if (role.equals("0")) //neu la tai khoan admin
            {
                response.sendRedirect("Views/Admin/AdminArea.jsp");
            } else //neu la user
            {

//                        response.getWriter().print("roi vao day");
//                response.getWriter().print(request.getSession().getAttribute("loginUser"));

                response.sendRedirect("Home");
            }
        }
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
        MyConnect mycon = new MyConnect();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
//      cookie ko nhan cac ki tu nay:     [ ] ( ) = , " / ? @ : ; 
        users u = mycon.getUserByUName_PW(username, password);
        String err;
        if (u == null) {
            err = "Ivalid userName or Password!";
            request.setAttribute("error", err);
            request.getRequestDispatcher("Views/Guest/LoginForm.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", u);
            if (remember != null) {
                Cookie uCook = new Cookie("username", username);
                Cookie pCook = new Cookie("pass", password);
                Cookie rCook = new Cookie("role", u.getRole() + "");
                uCook.setMaxAge(24 * 60 * 60); //luu trong 1 ngay
                pCook.setMaxAge(24 * 60 * 60); //luu trong 1 ngay
                rCook.setMaxAge(24 * 60 * 60); //luu trong 1 ngay
                response.addCookie(uCook);
                response.addCookie(pCook);
                response.addCookie(rCook);
            }

            if (u.getRole() != 0) {
                response.sendRedirect("Home");
            } else {
                response.sendRedirect("Views/Admin/AdminArea.jsp");
            }
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
