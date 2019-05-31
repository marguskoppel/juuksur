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
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.SecurityLogic;
import session.AppointmentFacade;
import session.ServiceFacade;
import session.UserFacade;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "UserinfoController", urlPatterns = {
    "/userinfo",})
public class UserinfoController extends HttpServlet {

    @EJB
    UserFacade userFacade;
    
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
            request.setAttribute("info", "Войдите или зарегистрируйтесь!");
            request.getRequestDispatcher(PageReturner.getPage("index"))
                    .forward(request, response);
            return;
        }
        if (sl.isRole(regUser, "ADMIN")) {
            String useri = request.getParameter("useri");
            User userinfo = userFacade.find(new Long(useri));
            request.setAttribute("userinfo", userinfo);
            List<Appointment> userAppInfonotfinished = appointmentFacade.findByUserActive(userinfo, false);
            request.setAttribute("userAppInfonotfinished", userAppInfonotfinished);

            List<Appointment> userAppInfofinished = appointmentFacade.findByUserActive(userinfo, true);
            request.setAttribute("userAppInfofinished", userAppInfofinished);
            request.getRequestDispatcher(PageReturner.getPage("userinfo_admin"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "USER")) {
            String useri = request.getParameter("useri");
            User userinfo = userFacade.find(new Long(useri));
            request.setAttribute("userinfo", userinfo);
            List<Appointment> userAppInfonotfinished = appointmentFacade.findByUserActive(userinfo, false);
            request.setAttribute("userAppInfonotfinished", userAppInfonotfinished);

            List<Appointment> userAppInfofinished = appointmentFacade.findByUserActive(userinfo, true);
            request.setAttribute("userAppInfofinished", userAppInfofinished);
            

            request.getRequestDispatcher(PageReturner.getPage("userinfo_user"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "MASTER")) {
            String useri = request.getParameter("useri");
            User userinfo = userFacade.find(new Long(useri));
            request.setAttribute("userinfo", userinfo);
            List<Appointment> userAppInfonotfinished = appointmentFacade.findByUserActive(userinfo, false);
            request.setAttribute("userAppInfonotfinished", userAppInfonotfinished);

            List<Appointment> userAppInfofinished = appointmentFacade.findByUserActive(userinfo, true);
            request.setAttribute("userAppInfofinished", userAppInfofinished);

            request.getRequestDispatcher(PageReturner.getPage("userinfo_master"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "WORKER")) {
            String useri = request.getParameter("useri");
            User userinfo = userFacade.find(new Long(useri));
            
            request.setAttribute("userinfo", userinfo);
            List<Appointment> userAppInfonotfinished = appointmentFacade.findByWorkerActive(userinfo, false);
            request.setAttribute("userAppInfonotfinished", userAppInfonotfinished);

            List<Appointment> userAppInfofinished = appointmentFacade.findByWorkerActive(userinfo, true);
            request.setAttribute("userAppInfofinished", userAppInfofinished);

            request.getRequestDispatcher(PageReturner.getPage("userinfo_worker"))
                    .forward(request, response);
            return;

        } else {
            request.setAttribute("info", "Войдите в систему!");
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
