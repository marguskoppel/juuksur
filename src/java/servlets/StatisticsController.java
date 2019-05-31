/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Appointment;
import entity.Role;
import entity.Service;
import entity.User;
import entity.UserRoles;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Date;
import java.util.HashMap;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
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
import session.ServiceFacade;
import session.UserFacade;
import session.UserRolesFacade;
import util.DateUtils;
import util.PageReturner;
import util.SortUtils;

/**
 *
 * @author Marck
 */
@WebServlet(name = "StatisticsController", urlPatterns
        = {"/statistics", })
public class StatisticsController extends HttpServlet {

    @EJB
    RoleFacade roleFacade;
    @EJB
    UserFacade userFacade;
    @EJB
    ServiceFacade serviceFacade;
    @EJB
    UserRolesFacade userRolesFacade;
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
            request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                    .forward(request, response);
            return;
        }
        if (sl.isRole(regUser, "ADMIN")) {
            Role worker = roleFacade.findRoleByName("WORKER");
            List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);

            List<Service> listServices = serviceFacade.findAll();

            List<Appointment> listAppointments = appointmentFacade.findAcitveFinished(true, true);

            String timeRange = request.getParameter("timeRange");
            if (timeRange != null) {
                String fromDay = request.getParameter("fromDay");
                String fromMonth = request.getParameter("fromMonth");
                String fromYear = request.getParameter("fromYear");
                String toDay = request.getParameter("toDay");
                String toMonth = request.getParameter("toMonth");
                String toYear = request.getParameter("toYear");
                LocalDate fromLd = LocalDate.of(
                        new Integer(fromYear),
                        new Integer(fromMonth),
                        new Integer(fromDay)
                );
                LocalDate toLd = LocalDate.of(
                        new Integer(toYear),
                        new Integer(toMonth),
                        new Integer(toDay)
                );
                Date fromDate = DateUtils.getStartOfDay(DateUtils.asDate(fromLd));
                Date toDate = DateUtils.getStartOfDay(DateUtils.asDate(toLd));
                List<Appointment> listAppointmentsRange = appointmentFacade.findByRange(fromDate, toDate);
                request.setAttribute("listAppointmentsRange", listAppointmentsRange);
                request.setAttribute("fromDay", fromDay);
                request.setAttribute("fromMonth", fromMonth);
                request.setAttribute("fromYear", fromYear);
                request.setAttribute("toDay", toDay);
                request.setAttribute("toMonth", toMonth);
                request.setAttribute("toYear", toYear);
            }
            List<Service> arrayListServices = new ArrayList<>();
            int count = 0;
            Map<Service, Integer> mapServiceRate = new HashMap<>();
            for (int i = 0; i < listAppointments.size(); i++) {
                Appointment appointment = listAppointments.get(i);
                if (!arrayListServices.contains(appointment.getService())) {
                    arrayListServices.add(appointment.getService());
                    mapServiceRate.put(appointment.getService(), 1);
                } else {
                    mapServiceRate.merge(appointment.getService(), 1, Integer::sum);
                }
            }
            Map<Service, Integer> sortedMapServicesRate = SortUtils.sortMapReverseByValue(mapServiceRate);
            request.setAttribute("sortedMapServicesRate", sortedMapServicesRate);

            request.setAttribute("listAppointments", listAppointments);
            request.setAttribute("listServices", listServices);
            request.setAttribute("listWorkers", listWorkers);
            request.getRequestDispatcher(PageReturner.getPage("statistics_admin"))
                    .forward(request, response);
            return;

        } else if (sl.isRole(regUser, "MASTER")) {
            Role worker = roleFacade.findRoleByName("WORKER");
            List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);

            List<Service> listServices = serviceFacade.findAll();

            List<Appointment> listAppointments = appointmentFacade.findAcitveFinished(true, true);

            String timeRange = request.getParameter("timeRange");
            if (timeRange != null) {
                String fromDay = request.getParameter("fromDay");
                String fromMonth = request.getParameter("fromMonth");
                String fromYear = request.getParameter("fromYear");
                String toDay = request.getParameter("toDay");
                String toMonth = request.getParameter("toMonth");
                String toYear = request.getParameter("toYear");
                LocalDate fromLd = LocalDate.of(
                        new Integer(fromYear),
                        new Integer(fromMonth),
                        new Integer(fromDay)
                );
                LocalDate toLd = LocalDate.of(
                        new Integer(toYear),
                        new Integer(toMonth),
                        new Integer(toDay)
                );
                Date fromDate = DateUtils.getStartOfDay(DateUtils.asDate(fromLd));
                Date toDate = DateUtils.getStartOfDay(DateUtils.asDate(toLd));
                listAppointments = appointmentFacade.findByRange(fromDate, toDate);
                request.setAttribute("listAppointments", listAppointments);
                request.setAttribute("fromDay", fromDay);
                request.setAttribute("fromMonth", fromMonth);
                request.setAttribute("fromYear", fromYear);
                request.setAttribute("toDay", toDay);
                request.setAttribute("toMonth", toMonth);
                request.setAttribute("toYear", toYear);
            }
            List<Service> arrayListServices = new ArrayList<>();
            int count = 0;
            Map<Service, Integer> mapServiceRate = new HashMap<>();
            for (int i = 0; i < listAppointments.size(); i++) {
                Appointment appointment = listAppointments.get(i);
                if (!arrayListServices.contains(appointment.getService())) {
                    arrayListServices.add(appointment.getService());
                    mapServiceRate.put(appointment.getService(), 1);
                } else {
                    mapServiceRate.merge(appointment.getService(), 1, Integer::sum);
                }
            }
            Map<Service, Integer> sortedMapServicesRate = SortUtils.sortMapReverseByValue(mapServiceRate);
            request.setAttribute("sortedMapServicesRate", sortedMapServicesRate);

            request.setAttribute("listAppointments", listAppointments);
            request.setAttribute("listServices", listServices);
            request.setAttribute("listWorkers", listWorkers);
            request.getRequestDispatcher(PageReturner.getPage("statistics_master"))
                    .forward(request, response);
            return;

        } else {

            request.setAttribute("info2", "У Вас нет прав для просмотра этой страницы. Войдите в систему!");
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
