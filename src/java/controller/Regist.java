/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MyConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.users;

/**
 *
 * @author Mai
 */
public class Regist extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("infor");
        request.getRequestDispatcher("Views/Guest/RegistForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname_raw = request.getParameter("fname");
        String lname_raw = request.getParameter("lname");
        String gender_raw = request.getParameter("gender");
        String email_raw = request.getParameter("email");
        String phone_raw = request.getParameter("phone");
        String address_raw = request.getParameter("address");
        String imgUrl = request.getParameter("imgUrl");
        String username_raw = request.getParameter("username"); //check duplicated
        String password_raw = request.getParameter("password");
        String repassword_raw = request.getParameter("repassword");

        MyConnect mycon = new MyConnect();
        users u = mycon.getUserByUName(username_raw);
        byte role = 1;
        boolean gender = (gender_raw.equals("1"));
        users newUser = new users(username_raw, fname_raw, lname_raw, gender, email_raw, phone_raw, address_raw, imgUrl, password_raw, role, false);
        if (u != null || !password_raw.equals(repassword_raw)) {
            HttpSession session = request.getSession();
            session.setAttribute("infor", newUser);

            if (u != null) {
                setErr(request, response, "Username already exists!");
            } else {
                setErr(request, response, "Repassword is invalid!");
            }
        } else {
            mycon.addUser(newUser);
            response.sendRedirect("ActiveUser");
        }
    }

    public void setErr(HttpServletRequest request, HttpServletResponse response, String error) throws ServletException, IOException {
        request.setAttribute("error", error);
        request.getRequestDispatcher("Views/Guest/RegistForm.jsp").forward(request, response);
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
