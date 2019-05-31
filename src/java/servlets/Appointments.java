/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Role;
import entity.User;
import entity.UserRoles;
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
import session.RoleFacade;
import session.UserRolesFacade;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "Appointments", urlPatterns = {"/appointments"})
public class Appointments extends HttpServlet {

    @EJB
    AppointmentFacade appointmentFacade;
    @EJB
    UserRolesFacade userRolesFacade;
    @EJB
    RoleFacade RoleFacade;

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
            request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                    .forward(request, response);
            return;
        }
        if (sl.isRole(regUser, "ADMIN")) {
            Role worker = RoleFacade.findRoleByName("WORKER");
            List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);
            
            request.setAttribute("listWorkers", listWorkers);
            request.setAttribute("appointmentsNotDoneActive", appointmentFacade.findActiveNotFinished(false, true));
            request.setAttribute("appointmentsDone", appointmentFacade.findFinished(true));
            request.setAttribute("appointmentsNotDone", appointmentFacade.findFinished(false));
            request.setAttribute("appointmentsNotActive", appointmentFacade.findActive(false));
            request.setAttribute("appointmentsNotFinishedActiveNotWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, false));
            request.setAttribute("appointmentsNotFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, true));
            request.setAttribute("appointmentsFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(true, true, true));
            request.getRequestDispatcher(PageReturner.getPage("appointments_admin"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "MASTER")) {
            Role worker = RoleFacade.findRoleByName("WORKER");
            List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);
            
            request.setAttribute("listWorkers", listWorkers);
            request.setAttribute("appointmentsDone", appointmentFacade.findFinished(true));
            request.setAttribute("appointmentsNotDoneActive", appointmentFacade.findActiveNotFinished(false, true));
            request.setAttribute("appointmentsNotActive", appointmentFacade.findActive(false));
            request.setAttribute("appointmentsNotDone", appointmentFacade.findFinished(false));
            request.setAttribute("appointmentsNotFinishedActiveNotWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, false));
            request.setAttribute("appointmentsNotFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, true));
            request.setAttribute("appointmentsFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(true, true, true));
            request.getRequestDispatcher(PageReturner.getPage("appointments_master"))
                    .forward(request, response);
            return;

        } else {

            request.setAttribute("info2", "Войдите в систему!");
            request.getRequestDispatcher(PageReturner.getPage("loginpage"))
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
