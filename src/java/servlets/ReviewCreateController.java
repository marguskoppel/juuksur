/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Appointment;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.SecurityLogic;
import session.AppointmentFacade;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "ReviewCreateController", urlPatterns = {
    "/reviewcreate",})
public class ReviewCreateController extends HttpServlet {

    @EJB
    AppointmentFacade appointmentFacade;

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
        if (regUser == null) {
            request.setAttribute("info2", "Войдите или зарегистрируйтесь!");
            request.getRequestDispatcher(PageReturner.getPage("index"))
                    .forward(request, response);
            return;
        }
        if (sl.isRole(regUser, "ADMIN")) {
            String app_idR = request.getParameter("app_id");
            Appointment appReview = appointmentFacade.find(new Long(app_idR));
            request.setAttribute("appReview", appReview);

            request.getRequestDispatcher(PageReturner.getPage("reviewcreate_admin"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "USER")) {
            String app_idR = request.getParameter("app_id");
            Appointment appReview = appointmentFacade.find(new Long(app_idR));
            request.setAttribute("appReview", appReview);

            request.getRequestDispatcher(PageReturner.getPage("reviewcreate_user"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "MASTER")) {
            String app_idR = request.getParameter("app_id");
            Appointment appReview = appointmentFacade.find(new Long(app_idR));
            request.setAttribute("appReview", appReview);

            request.getRequestDispatcher(PageReturner.getPage("reviewcreate_master"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "WORKER")) {
            String app_idR = request.getParameter("app_id");
            Appointment appReview = appointmentFacade.find(new Long(app_idR));
            request.setAttribute("appReview", appReview);

            request.getRequestDispatcher(PageReturner.getPage("reviewcreate_worker"))
                    .forward(request, response);
            return;

        } else {
            request.setAttribute("info2", "Войдите в систему!");
            request.getRequestDispatcher(PageReturner.getPage("index"))
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
