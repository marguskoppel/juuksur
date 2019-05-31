/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

//import entity.Category;
import entity.Appointment;
import entity.Role;
import entity.Service;
import entity.User;
import entity.UserRoles;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.SecurityLogic;
import session.AppointmentFacade;
//import session.CategoryFacade;
import session.RoleFacade;
import session.ServiceFacade;
import session.UserFacade;
import session.UserRolesFacade;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "AdminController", urlPatterns = {
    "/addservices",
    "/addcategory",
    "/addnewservice",
    "/editcategory",
    "/changeCategory",
    "/editservice",
    "/changeService",
    "/cat_serv_notactive",
    "/deletecategory",
    "/delcategory",
    "/deleteservice",
    "/delservice",
    "/activatecategory",
    "/actcategory",
    "/activateservice",
    "/actservice",
    "/roles",
    "/setRole",
    "/users",
    "/edituser",
    "/changeUser",
    "/deleteuser",
    "/deluser",
    "/user_notactive",
    "/activateuser",
    "/actuser",
    "/deleteappointment",
    "/delappointment",
    "/appointment_notactive",
    "/activateappointment",
    "/actappointment",
    
    

})
public class AdminController extends HttpServlet {

    @EJB
    AppointmentFacade appointmentFacade;
    @EJB
    ServiceFacade serviceFacade;
    @EJB
    UserFacade userFacade;
    @EJB
    RoleFacade roleFacade;
    @EJB
    UserRolesFacade userRolesFacade;

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
            request.setAttribute("info2", "У вас нет прав доступа к ресурсу");
            request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                    .forward(request, response);
            return;
        }
        if (!sl.isRole(regUser, "ADMIN")) {
            request.setAttribute("info2", "У вас нет прав доступа к ресурсу");
            request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                    .forward(request, response);
            return;
        }

        String path = request.getServletPath();

        switch (path) {
            case "/addservices":

                //request.setAttribute("categories", categoryFacade.findActiveCat(true));
                request.setAttribute("services", serviceFacade.findActived(true));
                request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                break;

            case "/addnewservice":
                try {
                    String name = request.getParameter("newservice");
                    String price = request.getParameter("price");

                    Service newService = new Service(name, new Double(price), true);
                    serviceFacade.create(newService);
                    
                    request.setAttribute("info", "Услуга добавлена!");
                    request.setAttribute("services", serviceFacade.findActived(true));
                } catch (Exception e) {
                    request.setAttribute("info2", "Такая услуга уже добавлена!");
                    request.setAttribute("services", serviceFacade.findActived(true));
                    request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                }
                request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                break;

            case "/editservice":
                String idServ = request.getParameter("serv_id");
                String nameServ = request.getParameter("name");
                String priceServ = request.getParameter("price");

                Service editService = serviceFacade.find(new Long(idServ));
                request.setAttribute("editService", editService);

                request.setAttribute("services", serviceFacade.findActived(true));
                request.getRequestDispatcher(PageReturner.getPage("editservice")).forward(request, response);
                break;
            case "/changeService":
                String id_serv = request.getParameter("serv_id");
                String name_serv = request.getParameter("name");
                String price_serv = request.getParameter("price");

                Service changeService = serviceFacade.find(new Long(id_serv));
                changeService.setName(name_serv);
                changeService.setPrice(new Double(price_serv));

                serviceFacade.edit(changeService);

                request.setAttribute("services", serviceFacade.findActived(true));

                request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                break;

            case "/cat_serv_notactive":
                request.setAttribute("services", serviceFacade.findActived(false));

                request.getRequestDispatcher(PageReturner.getPage("cat_serv_notactive")).forward(request, response);
                break;

            case "/deleteservice":
                String idServDel = request.getParameter("serv_id");
                Service delService = serviceFacade.find(new Long(idServDel));
                request.setAttribute("delService", delService);

                request.setAttribute("services", serviceFacade.findAll());

                request.getRequestDispatcher(PageReturner.getPage("deleteservice")).forward(request, response);
                break;
            case "/delservice":
                String idServDelete = request.getParameter("idServDelete");

                Service servDelete = serviceFacade.find(new Long(idServDelete));
                servDelete.setActive(false);
                serviceFacade.edit(servDelete);

                request.setAttribute("services", serviceFacade.findActived(true));

                request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                break;

            case "/activateservice":
                String idServAct = request.getParameter("serv_id");
                Service actService = serviceFacade.find(new Long(idServAct));
                request.setAttribute("actService", actService);

                request.setAttribute("services", serviceFacade.findAll());

                request.getRequestDispatcher(PageReturner.getPage("activateservice")).forward(request, response);
                break;
            case "/actservice":
                String idServActivate = request.getParameter("idServActivate");
                Service activateService = serviceFacade.find(new Long(idServActivate));
                activateService.setActive(true);
                serviceFacade.edit(activateService);

                request.setAttribute("services", serviceFacade.findActived(true));

                request.getRequestDispatcher(PageReturner.getPage("addservices")).forward(request, response);
                break;

            case "/roles":
                Map<User, String> mapUsers = new HashMap<>();
                List<User> listUsers = userFacade.findAllExceptAdmin();
                int n = listUsers.size();
                for (int i = 0; i < n; i++) {
                    mapUsers.put(listUsers.get(i), sl.getRole2(listUsers.get(i)));
                }
                List<Role> listRoles = roleFacade.findAllExceptAdmin();

                request.setAttribute("mapUsers", mapUsers);
                request.setAttribute("listRoles", listRoles);
                request.setAttribute("listUsers", listUsers);
                request.getRequestDispatcher(PageReturner.getPage("roles"))
                        .forward(request, response);
                break;

            case "/users":
                
                Role worker = roleFacade.findRoleByName("WORKER");
                List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                
                Role master = roleFacade.findRoleByName("MASTER");
                List<UserRoles> listMasters = userRolesFacade.findByRole(master);
                request.setAttribute("listMasters", listMasters);
                
                Role user2 = roleFacade.findRoleByName("USER");
                List<UserRoles> listUsers2 = userRolesFacade.findByRole(user2);
                request.setAttribute("listUsers2", listUsers2);

                request.setAttribute("users", userFacade.findActivedExceptAdmin(true));
                request.getRequestDispatcher(PageReturner.getPage("users"))
                        .forward(request, response);
                break;
            case "/edituser":
                String idUser = request.getParameter("user_id");

                User editUser = userFacade.find(new Long(idUser));
                request.setAttribute("editUser", editUser);
                
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                
                master = roleFacade.findRoleByName("MASTER");
                listMasters = userRolesFacade.findByRole(master);
                request.setAttribute("listMasters", listMasters);
                
                user2 = roleFacade.findRoleByName("USER");
                listUsers2 = userRolesFacade.findByRole(user2);
                request.setAttribute("listUsers2", listUsers2);
                request.setAttribute("users", userFacade.findActivedExceptAdmin(true));
                request.getRequestDispatcher(PageReturner.getPage("edituser")).forward(request, response);
                break;

            case "/changeUser":
                String id_user = request.getParameter("user_id");
                String name_user = request.getParameter("name");
                String surname_user = request.getParameter("surname");
                String phone_user = request.getParameter("phone");
                String email_user = request.getParameter("email");

                User changeUser = userFacade.find(new Long(id_user));
                changeUser.setName(name_user);
                changeUser.setSurname(surname_user);
                changeUser.setPhone(phone_user);
                changeUser.setEmail(email_user);

                userFacade.edit(changeUser);
                
                
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                
                master = roleFacade.findRoleByName("MASTER");
                listMasters = userRolesFacade.findByRole(master);
                request.setAttribute("listMasters", listMasters);
                
                user2 = roleFacade.findRoleByName("USER");
                listUsers2 = userRolesFacade.findByRole(user2);
                request.setAttribute("listUsers2", listUsers2);
                request.setAttribute("users", userFacade.findActivedExceptAdmin(true));
                request.setAttribute("info", "Данные обновлены удачно!");
                request.getRequestDispatcher(PageReturner.getPage("users")).forward(request, response);
                break;

            case "/deleteuser":
                String idUserDel = request.getParameter("user_id");
                User delUser = userFacade.find(new Long(idUserDel));
                request.setAttribute("delUser", delUser);
                request.getRequestDispatcher(PageReturner.getPage("deleteuser")).forward(request, response);
                break;

            case "/deluser":
                String idUserDelete = request.getParameter("user_id");

                User userDelete = userFacade.find(new Long(idUserDelete));
                userDelete.setActive(false);
                userFacade.edit(userDelete);
                
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                
                master = roleFacade.findRoleByName("MASTER");
                listMasters = userRolesFacade.findByRole(master);
                request.setAttribute("listMasters", listMasters);
                
                user2 = roleFacade.findRoleByName("USER");
                listUsers2 = userRolesFacade.findByRole(user2);
                request.setAttribute("listUsers2", listUsers2);
                request.setAttribute("users", userFacade.findActivedExceptAdmin(true));
                request.setAttribute("info", "Аккаунт деактивирован удачно!");
                request.getRequestDispatcher(PageReturner.getPage("users")).forward(request, response);
                break;

            case "/user_notactive":
                request.setAttribute("users", userFacade.findActive(false));

                request.getRequestDispatcher(PageReturner.getPage("user_notactive")).forward(request, response);
                break;

            case "/activateuser":
                String idUserAct = request.getParameter("user_id");
                User actUser = userFacade.find(new Long(idUserAct));
                request.setAttribute("actUser", actUser);

                request.setAttribute("users", userFacade.findAll());
                request.setAttribute("services", serviceFacade.findAll());

                request.getRequestDispatcher(PageReturner.getPage("activateuser")).forward(request, response);
                break;

            case "/actuser":
                String idUserActivate = request.getParameter("idUserActivate");
                User activateUser = userFacade.find(new Long(idUserActivate));
                activateUser.setActive(true);
                userFacade.edit(activateUser);
                
                
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                
                master = roleFacade.findRoleByName("MASTER");
                listMasters = userRolesFacade.findByRole(master);
                request.setAttribute("listMasters", listMasters);
                
                user2 = roleFacade.findRoleByName("USER");
                listUsers2 = userRolesFacade.findByRole(user2);
                request.setAttribute("listUsers2", listUsers2);
                request.setAttribute("users", userFacade.findActivedExceptAdmin(true));
                
                request.setAttribute("info", "Аккаунт активирован удачно!");
                request.getRequestDispatcher(PageReturner.getPage("users")).forward(request, response);
                break;

            case "/setRole":
                String setRoleButton = request.getParameter("setRoleButton");
                //String delRoleButton = request.getParameter("delRoleButton");
                String usersId = request.getParameter("userSetRole");
                String rolesId = request.getParameter("roleSetToUser");
                User userForRoleSet = userFacade.find(new Long(usersId));
                Role roleForUserSet = roleFacade.find(new Long(rolesId));
                UserRoles ur = new UserRoles(userForRoleSet, roleForUserSet);
                //userRolesFacade.create(ur);
                if (setRoleButton != null) {
                    //sl.addRoleToUser(ur);
                    sl.deleteRoleToUser(ur.getUser());
                    userRolesFacade.create(ur);
                }
                //if (delRoleButton != null) {
                 //   sl.deleteRoleToUser(ur.getUser());
               // }
                mapUsers = new HashMap<>();
                listUsers = userFacade.findAllExceptAdmin();
                int m = listUsers.size();
                for (int i = 0; i < m; i++) {
                    mapUsers.put(listUsers.get(i), sl.getRole2(listUsers.get(i)));
                }
                listRoles = roleFacade.findAllExceptAdmin();
                request.setAttribute("info", "Роль назначена!");
                request.setAttribute("mapUsers", mapUsers);
                request.setAttribute("listRoles", listRoles);
                request.setAttribute("listUsers", listUsers);
                request.getRequestDispatcher(PageReturner.getPage("roles"))
                        .forward(request, response);
                break;

            case "/deleteappointment":
                String idAppDel = request.getParameter("app_id");
                Appointment delAppointment = appointmentFacade.find(new Long(idAppDel));
                request.setAttribute("delAppointment", delAppointment);
                request.getRequestDispatcher(PageReturner.getPage("deleteappointment")).forward(request, response);
                break;

            case "/delappointment":
                String idAppointmentDelete = request.getParameter("app_id");

                Appointment appointmentDelete = appointmentFacade.find(new Long(idAppointmentDelete));
                appointmentDelete.setActive(false);
                appointmentFacade.edit(appointmentDelete);

                request.getRequestDispatcher("appointments").forward(request, response);
                break;

            case "/appointment_notactive":
                
                request.setAttribute("appointmentsNotActive", appointmentFacade.findActive(false));

                request.getRequestDispatcher(PageReturner.getPage("appointment_notactive")).forward(request, response);
                break;
                
            case "/activateappointment":
                String idAppointmentAct = request.getParameter("app_id");
                Appointment actAppointment = appointmentFacade.find(new Long(idAppointmentAct));
                request.setAttribute("actAppointment", actAppointment);

                

                request.getRequestDispatcher(PageReturner.getPage("activateappointment")).forward(request, response);
                break;
            case "/actappointment":
                String idAppointmentActivate = request.getParameter("idAppointmentActivate");
                Appointment activateAppointment = appointmentFacade.find(new Long(idAppointmentActivate));
                activateAppointment.setActive(true);
                appointmentFacade.edit(activateAppointment);

                
            
                

                request.getRequestDispatcher("appointments").forward(request, response);
                break;
                
            

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
