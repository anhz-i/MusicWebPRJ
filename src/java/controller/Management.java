/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;

/**
 *
 * @author Mai
 */
@WebServlet(name = "Management", urlPatterns = {"/Management"})
public class Management extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try ( PrintWriter out = response.getWriter()) {
            MyConnect myCon = new MyConnect();
            String type = request.getParameter("type");
            if (type.equals("1")) //chon album management 
            {
                List<albums> albumList = myCon.getAlbumList();
                request.setAttribute("albumList", albumList);
                request.getRequestDispatcher("Views/Admin/Albums/List.jsp").forward(request, response);
            }
            if (type.equals("2")) //chon song management 
            {
                List<songs> songList = myCon.getSongList();
                request.setAttribute("songList", songList);
                request.getRequestDispatcher("Views/Admin/Songs/List.jsp").forward(request, response);
            }
            if (type.equals("3")) //chon singer management 
            {
                List<singers> singerList = myCon.getSingerList();
                request.setAttribute("singerList", singerList);
                request.getRequestDispatcher("Views/Admin/Singers/List.jsp").forward(request, response);
            }

            if (type.equals("4")) //chon user management 
            {
                List<users> userList = myCon.getUserList();
                //                for (users object : userList) {
                //                    out.println(object);
                //                }
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("Views/Admin/Users/List.jsp").forward(request, response);
//                response.sendRedirect("Views/Admin/Users/List.jsp");
            }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
