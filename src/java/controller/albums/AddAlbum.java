/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.albums;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.albums;

/**
 *
 * @author Mai
 */
@WebServlet(name = "AddAlbum", urlPatterns = {"/AddAlbum"})
public class AddAlbum extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Admin/Albums/Add.jsp").forward(request, response);
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
        MyConnect myCon = new MyConnect();
        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String imgUrl = request.getParameter("imgUrl");
        String describe = request.getParameter("describe");
        int id = Integer.parseInt(raw_id);
        String err;
        if (myCon.getAlbumById(id) != null) {
            err = "Id has already existed";
            request.setAttribute("err", err);
            albums al = new albums(id, name, imgUrl, describe); //luu lai thong tin nguoi dung da nhap de ko bat ng dung nhap lai
            request.setAttribute("infor", al);
            request.getRequestDispatcher("Views/Admin/Albums/Add.jsp").forward(request, response);
        } else {
            albums al = new albums(id, name, imgUrl, describe);
            myCon.addAlbum(al);
//            PrintWriter out = response.getWriter();
//            out.print(n);
            response.sendRedirect("Management?type=1");
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
