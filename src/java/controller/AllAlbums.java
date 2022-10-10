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
import java.util.List;
import model.albums;

/**
 *
 * @author Mai
 */
public class AllAlbums extends HttpServlet {
   


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    MyConnect mycon;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          
MyConnect myCon = new MyConnect();
        List<albums> allAlbumList = myCon.getAlbumList();
        int page, npp = 16;
        int size = allAlbumList.size();
        int np = ((size % npp == 0) ? (size / npp) : (size / npp + 1));
        String raw_page = request.getParameter("page");
        if (raw_page == null) {
            page = 1;
        } else {
            page = Integer.parseInt(raw_page);
            if (page > np) {
                page = np;
            }
            if (page < 1) {
                page = 1;
            }
        }
        int start, end;

        start = (page - 1) * npp;
        end = Math.min(start + npp, size);
        List<albums> albumList = myCon.getAlbumListByPage(allAlbumList, start, end);
//        PrintWriter out = response.getWriter();
//        out.println("np="+np);
//        out.println("; npp="+npp);
//        out.println("; page="+page);
//        out.println("; start="+start);
//        out.println("; end="+end);
        request.setAttribute("albumList", albumList);
        request.setAttribute("np", np);
        request.setAttribute("page", page);
        request.getRequestDispatcher("Views/AllAlbums.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
