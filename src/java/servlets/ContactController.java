/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.SecurityLogic;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "ContactController", urlPatterns = {""
    + "/contact",})
public class ContactController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF8");
        HttpSession session = request.getSession(false);
        SecurityLogic sl = new SecurityLogic();
        User regUser = null;
        if (session != null) {
            try {
                regUser = (User) session.getAttribute("regUser");
            } catch (Exception e) {
                regUser = null;
            }
        }

        if (sl.isRole(regUser, "ADMIN")) {

            request.getRequestDispatcher(PageReturner.getPage("contact_admin"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "USER")) {

            request.getRequestDispatcher(PageReturner.getPage("contact_user"))
                    .forward(request, response);
            return;
            
            } else if (sl.isRole(regUser, "MASTER")) {

            request.getRequestDispatcher(PageReturner.getPage("contact_master"))
                    .forward(request, response);
            return;
            
            } else if (sl.isRole(regUser, "WORKER")) {

            request.getRequestDispatcher(PageReturner.getPage("contact_worker"))
                    .forward(request, response);
            return;

        } else {
            
            request.getRequestDispatcher(PageReturner.getPage("contact"))
                    .forward(request, response);
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
