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
@WebServlet(name = "UpdateAlbum", urlPatterns = {"/UpdateAlbum"})
public class UpdateAlbum extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MyConnect myCon = new MyConnect();
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        String value = request.getParameter("value");
        if (value.equals("0")) {
            albums al = myCon.getAlbumById(id);
            request.setAttribute("al", al);
            request.getRequestDispatcher("Views/Admin/Albums/Update.jsp").forward(request, response);
        } else {
            myCon.deleteAlbum(id);
            response.sendRedirect("Management?type=1");
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
        MyConnect myCon = new MyConnect();
        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        String imgUrl = request.getParameter("imgUrl");
        if(imgUrl.equals(""))
            imgUrl = request.getParameter("imgUrl1");
        int id = Integer.parseInt(raw_id);
        albums al = new albums(id, name, imgUrl, describe);
        myCon.updateAlbum(al);
        response.sendRedirect("Management?type=1");

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
