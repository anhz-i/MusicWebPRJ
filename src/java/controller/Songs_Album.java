/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.songs;
import java.util.List;
import model.singers;

/**
 *
 * @author Mai
 */
public class Songs_Album extends HttpServlet {

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
        MyConnect mycon = new MyConnect();
//        mycon.loadSongs();

        String albumId = request.getParameter("albumId");
        int id;
        try {
//            response.getWriter().print(albumId);
            id = Integer.parseInt(albumId);
            List<songs> songsInAlbum = mycon.getSongsInAlbum(id);
            String albumName = mycon.getAlbumById(id).getName();
            request.setAttribute("songsInAlbum", songsInAlbum);
            request.setAttribute("albumName", albumName);
            request.getRequestDispatcher("Views/Songs_Album.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().print(e);
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
