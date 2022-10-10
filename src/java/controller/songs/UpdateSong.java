/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.songs;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.albums;
import model.songs;

/**
 *
 * @author Mai
 */
@WebServlet(name = "UpdateSong", urlPatterns = {"/UpdateSong"})
public class UpdateSong extends HttpServlet {

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
        MyConnect myCon = new MyConnect();
        List<albums> albumList = myCon.getAlbumList();
        request.setAttribute("albumList", albumList);
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        String value = request.getParameter("value");
        if (value.equals("0")) {
            songs s = myCon.getSongById(id);
            request.setAttribute("song", s);
            request.getRequestDispatcher("Views/Admin/Songs/Update.jsp").forward(request, response);
        }
        if (value.equals("1")) {
            myCon.deleteSong(id);
            response.sendRedirect("Management?type=2");
        }
//        if (value.equals("2")) {
//            songs s = myCon.getSongById(id);
//            request.setAttribute("song", s);
//            request.getRequestDispatcher("Views/Admin/Songs/Detail.jsp").forward(request, response);
//        }
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
        String url = request.getParameter("songUrl");
        String raw_year = request.getParameter("pubYear");
        String authorName = request.getParameter("authorName");
        String lyrics = request.getParameter("lyrics");
        String albumId = request.getParameter("albumId");
        if (url.equals("")) {
            url = request.getParameter("songUrl_rep");
        }
        PrintWriter out = response.getWriter();
//        out.println("id = "+raw_id);
//        out.println("name = "+name);
//        
//        out.println("url = "+url);
//        out.println("year = "+raw_year);
//        out.println("auName = "+authorName);
//        out.println("lyrics = "+lyrics);
//        out.println("alId = "+albumId);

        int id = Integer.parseInt(raw_id);
        int year = Integer.parseInt(raw_year);
        int alId;
        if (albumId.equals("None")) {
            alId = -1;
        } else {
            alId = Integer.parseInt(albumId);
        }
        songs s = new songs(id, name, url, year, authorName, lyrics, alId);
//        out.print(s);
        myCon.updateSong(s);
        response.sendRedirect("Management?type=2");
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
