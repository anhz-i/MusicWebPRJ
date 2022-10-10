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
@WebServlet(name = "AddSong", urlPatterns = {"/AddSong"})
public class AddSong extends HttpServlet {

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
        request.getRequestDispatcher("Views/Admin/Songs/Add.jsp").forward(request, response);
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
        String songUrl = request.getParameter("songUrl");
        String raw_pubYear = request.getParameter("pubYear");
        String authorName = request.getParameter("authorName");
        String lyrics = request.getParameter("lyrics");
        String raw_albumId = request.getParameter("albumId");
        int id = Integer.parseInt(raw_id);

        int albumId;
        if (raw_albumId.equals("None")) {
            albumId = -1;
        } else {
            albumId = Integer.parseInt(raw_albumId);
        }

        int pubYear;
        if (raw_pubYear.equals("")) {
            pubYear = -1;
        } else {
            pubYear = Integer.parseInt(raw_pubYear);
        }
        String err;
        if (myCon.getSongById(id) != null) {
            err = "Id has already existed";
            songs s = new songs(id, name, songUrl, pubYear, authorName, lyrics, albumId); //luu lai thong tin ng dung da nhap de ko phai nhap lai
            request.setAttribute("err", err);
            request.setAttribute("infor", s);
            List<albums> albumList = myCon.getAlbumList();
            request.setAttribute("albumList", albumList);
            request.getRequestDispatcher("Views/Admin/Songs/Add.jsp").forward(request, response);
        } else {
            songs s = new songs(id, name, songUrl, pubYear, authorName, lyrics, albumId);
            myCon.addSong(s);
//            PrintWriter out = response.getWriter();
//            out.print(n);
            response.sendRedirect("Management?type=2");
        }

        /*
        Id: <input type="number" name="id" required /> <br/>
            Name: <input type="name" name="name" required /> <br/>
            Song Url: </br>
            <input type="file" name="songUrl"/ accept="audio/*"> <br/>
            Public Year: <input type="number" max="<%=curYear%>" min="0" name="pubYear"/> <br/>
            Author Name: <input type="name" name="authorName"  /> <br/>
            Lyrics: </br> <textarea type="text"  name="lyrics" value = "Not Updated Yet"></textarea> <br/>
            Album ID: <select name="albumId">
         */
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
