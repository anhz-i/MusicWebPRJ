/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.singers;

import dal.MyConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.albums;
import model.singers;
import model.songs;

/**
 *
 * @author Mai
 */
@WebServlet(name = "UpdateSinger", urlPatterns = {"/UpdateSinger"})
public class UpdateSinger extends HttpServlet {

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
        MyConnect myCon = new MyConnect();
//        List<singer> albumList = myCon.getAlbumList();
//        request.setAttribute("albumList", albumList);
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        String value = request.getParameter("value");
        if (value.equals("0")) {
            singers s = myCon.getSingerById(id);
            request.setAttribute("singer", s);
            request.getRequestDispatcher("Views/Admin/Singers/Update.jsp").forward(request, response);
        }
        if (value.equals("1")) {
            myCon.deleteSinger(id);
            response.sendRedirect("Management?type=3");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        MyConnect myCon = new MyConnect();
        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String imgUrl = request.getParameter("imgUrl");
        String describe = request.getParameter("describe");
        String raw_gender = request.getParameter("gender");
        String raw_date = request.getParameter("dob");
        int id = Integer.parseInt(raw_id);
        boolean gender = (raw_gender.equals("1"));
        if (imgUrl.equals("")) {
            imgUrl = request.getParameter("imgUrl1");
        }
        Date date = null;
        if (!raw_date.equals("")) {
            date = Date.valueOf(raw_date);
        }

        singers s = new singers(id, name, imgUrl, describe, gender, date);
//        out.print(s);
        myCon.updateSinger(s);
        response.sendRedirect("Management?type=3");
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
