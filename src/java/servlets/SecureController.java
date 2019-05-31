/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Appointment;
import entity.LimitApp;
import entity.Review;
import entity.Role;
import entity.Service;
import entity.User;
import entity.UserRoles;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import session.LimitAppFacade;
import session.ReviewFacade;
import session.RoleFacade;
import session.ServiceFacade;
import session.UserFacade;
import session.UserRolesFacade;
import util.EncriptPass;
import util.PageReturner;

/**
 *
 * @author Marck
 */
@WebServlet(name = "SecureController", urlPatterns = {
    "/loginpage",
    "/login",
    "/logout",
    "/register",
    "/registration",
    "/editu",
    "/addNewAppointment",
    "/changeAppointment",
    "/editappointment",
    "/doneappointment",
    "/finishAppointment",
    "/createReview",
    "/addnewlimit",
    "/editlimit",
    "/changeLimit",
    "/stat",
    
})
public class SecureController extends HttpServlet {

    @EJB
    RoleFacade roleFacade;
    @EJB
    UserFacade userFacade;
    @EJB
    UserRolesFacade userRolesFacade;
    @EJB
    ServiceFacade serviceFacade;
    //@EJB
    //CategoryFacade categoryFacade;
    @EJB
    AppointmentFacade appointmentFacade;
    @EJB
    ReviewFacade reviewFacade;
    @EJB
    LimitAppFacade limitAppFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF8");
        HttpSession session = request.getSession(false);
        User regUser = null;
        if (session != null) {
            try {
                regUser = (User) session.getAttribute("regUser");
            } catch (Exception e) {
                regUser = null;
            }
        }
        EncriptPass ep = new EncriptPass();
        String salts = "";
        SecurityLogic sl = new SecurityLogic();
        String path = request.getServletPath();

        switch (path) {
            case "/login":
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                regUser = userFacade.findByLoginActive(login, true);
                if (regUser == null) {
                    request.setAttribute("info2", "Такой логин или пароль не существует! Попробуйте еще раз! В ином случае Ваш аккаунт деактивирован. Обратитесь к администратору!");
                    request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                            .forward(request, response);
                    break;
                }

                salts = regUser.getSalts();
                String encriptPass = ep.setEncriptPass(password, salts);
                if (password == null) {
                    throw new Error("Возникла ошибка, обратитесь к разработчику!");
                }
                if (encriptPass.equals(regUser.getPassword())) {
                    session = request.getSession(true);
                    session.setAttribute("regUser", regUser);
                    request.setAttribute("info", "Привет " + regUser.getName()
                            + "! Вы вошли в систему.");
                    

                    request.getRequestDispatcher("index")
                            .forward(request, response);
                    break;
                }
                request.setAttribute("info2", "Такой логин или пароль не существует! Попробуйте еще раз!");
                request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                        .forward(request, response);
                break;

            case "/loginpage":
                request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                        .forward(request, response);
                break;

            case "/logout":
                if (session != null) {
                    session.invalidate();
                    request.setAttribute("info", "Вы вышли из системы");
                }
                request.getRequestDispatcher(PageReturner.getPage("index"))
                        .forward(request, response);
                break;

            case "/registration":
                request.getRequestDispatcher(PageReturner.getPage("registration"))
                        .forward(request, response);
                break;

            case "/register":
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                login = request.getParameter("login");
                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");
                if (!password1.equals(password2)) {
                    request.setAttribute("info2", "Пароли не совпадают! Попробуйте еще раз.");
                    request.setAttribute("name", name);
                    request.setAttribute("surname", surname);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);
                    request.setAttribute("login", login);
                    request.getRequestDispatcher(PageReturner.getPage("registration"))
                            .forward(request, response);
                    break;
                }
                if (userFacade.findByLogin(login) != null) {
                    request.setAttribute("info2", "Пользователь под таким логином уже зарегистрирован. Выберите другой!");
                    request.setAttribute("name", name);
                    request.setAttribute("surname", surname);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);

                    request.getRequestDispatcher(PageReturner.getPage("registration"))
                            .forward(request, response);
                    break;
                }
                ep = new EncriptPass();
                salts = ep.createSalts();
                encriptPass = ep.setEncriptPass(password1, salts);
                if (password1 == null) {
                    throw new Error("Возникла ошибка, обратитесь к разработчику!");
                }
                User user = new User(name, surname, email, phone, login, encriptPass, salts, true);
                userFacade.create(user);
                Role userRole = roleFacade.findRoleByName("USER");
                UserRoles ur = new UserRoles();
                ur.setUser(user);
                ur.setRole(userRole);
                userRolesFacade.create(ur);
                request.setAttribute("info", "Вы зарегитсрировались. Можете войти в систему");

                request.setAttribute("user", user);
                request.getRequestDispatcher(PageReturner.getPage("loginpage"))
                        .forward(request, response);
                break;

            case "/contact":
                request.getRequestDispatcher("contact").forward(request, response);
                break;

            case "/services":
                List<Service> services = serviceFacade.findActived(true);

                request.setAttribute("services", services);
                request.getRequestDispatcher("services").forward(request, response);
                break;

            case "/userinfo":
                String useri = request.getParameter("useri");
                User userinfo = userFacade.find(new Long(useri));
                request.setAttribute("userinfo", userinfo);

                List<Appointment> userAppInfonotfinished = appointmentFacade.findByUserActive(regUser, false);
                request.setAttribute("userAppInfonotfinished", userAppInfonotfinished);

                List<Appointment> userAppInfofinished = appointmentFacade.findByUserActive(regUser, true);
                request.setAttribute("userAppInfofinished", userAppInfofinished);

                request.getRequestDispatcher("userinfo").forward(request, response);
                break;

            case "/userinfoedit":
                String eu = request.getParameter("eu");

                User editUser = userFacade.find(new Long(eu));
                request.setAttribute("editUser", editUser);

                request.getRequestDispatcher("userinfoedit").forward(request, response);

            case "/editu":
                String euId = request.getParameter("euId");
                User userEdit = userFacade.find(new Long(euId));
                request.setAttribute("userEdit", userEdit);
                String password01 = request.getParameter("password01");
                ep = new EncriptPass();
                salts = regUser.getSalts();
                encriptPass = ep.setEncriptPass(password01, salts);
                regUser.setName(request.getParameter("name"));
                regUser.setSurname(request.getParameter("surname"));
                regUser.setPhone(request.getParameter("phone"));
                regUser.setEmail(request.getParameter("email"));
                regUser.setPassword(encriptPass);

                userFacade.edit(regUser);
                request.setAttribute("info", "Операция прошла успешно!");
                request.getRequestDispatcher("index").forward(request, response);
                break;

            case "/addappointment":
                services = serviceFacade.findActived(true);
                request.setAttribute("services", services);
                request.getRequestDispatcher("addappointment").forward(request, response);
                break;

            case "/addNewAppointment":
                if (regUser == null) {
                    request.setAttribute("info2", "Для доступа к этой странице, пожалуйста, войдите в систему!");
                    request.getRequestDispatcher("loginpage").forward(request, response);
                }
                String date = request.getParameter("userdate");
                String[] partsDate = date.split("-");
                String year = partsDate[0];
                String month = partsDate[1];
                String day = partsDate[2];

                String time = request.getParameter("usertime");
                String[] partsTime = time.split(":");
                String hour = partsTime[0];
                String minutes = partsTime[1];

                DateFormat newDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
                Date dateAppointment = newDateFormat.parse(day + "-" + month + "-" + year + " " + hour + ":" + minutes);

                DateFormat newDateFormat3 = new SimpleDateFormat("dd-MM-yyyy");
                Date dateApp3 = newDateFormat3.parse(day + "-" + month + "-" + year);
                
                Date currentDate = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                formatter.format(currentDate);

                String serviceId = request.getParameter("selectService");
                Service service = serviceFacade.find(new Long(serviceId));

                //Appointment newAppointment = new Appointment(regUser, dateAppointment, false, true, false, service);
                Appointment newAppointment = new Appointment(regUser, dateAppointment, false, true, false, service, dateApp3);
                List<Appointment> checkDate = appointmentFacade.findByDate(dateApp3);
                int size = checkDate.size();
                LimitApp checkDate2 = limitAppFacade.findByDate(dateApp3);

                boolean unique = appointmentFacade.uniqueAppointment(newAppointment);
                //if(checkDate2 == null){
                // appointmentFacade.create(newAppointment);
                // request.setAttribute("info", "Вы успешно записались к мастеру!");
                // }
                if (unique && (checkDate2 == null || size < checkDate2.getCount()) && dateAppointment.after(currentDate)) {
                    appointmentFacade.create(newAppointment);
                    request.setAttribute("info", "Вы успешно записались к мастеру!");
                } else {

                    request.setAttribute("info2", "Что-то пошло не так! Вы уже записаны к мастеру либо лимит записей на этот день исчерпан либо Вы хотите записаться на прошедшую дату!");
                    request.setAttribute("serivces", serviceFacade.findActived(true));
                    request.getRequestDispatcher("addappointment").forward(request, response);
                }
                request.setAttribute("serivces", serviceFacade.findActived(true));
                request.getRequestDispatcher("addappointment").forward(request, response);
                break;

            case "/appointments":
                Role worker = roleFacade.findRoleByName("WORKER");
                List<UserRoles> listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                

                request.setAttribute("appointmentsNotFinishedActiveNotWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, false));
                request.setAttribute("appointmentsNotFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, true));
                request.setAttribute("appointmentsFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(true, true, true));
                request.setAttribute("appointmentsDone", appointmentFacade.findFinished(true));
                request.setAttribute("appointmentsNotDone", appointmentFacade.findFinished(false));
                request.getRequestDispatcher("appointments")
                        .forward(request, response);
                break;

            case "/editappointment":
                String app_id = request.getParameter("app_id");
                Appointment appointmentEdit = appointmentFacade.find(new Long(app_id));
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                request.setAttribute("services", serviceFacade.findActived(true));
                request.setAttribute("appointmentEdit", appointmentEdit);
                request.getRequestDispatcher("appointmentedit").forward(request, response);
                break;
            case "/changeAppointment":
                String id_app = request.getParameter("app_id");
                Appointment changeAppointment = appointmentFacade.find(new Long(id_app));

                String workerId = request.getParameter("workerSetToApp");
                User workerApp = userFacade.find(new Long(workerId));
                changeAppointment.setWorker(workerApp);
                changeAppointment.setWorkerOn(true);
                appointmentFacade.edit(changeAppointment);
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                request.setAttribute("info", "Работник назначен!");

                request.setAttribute("appointmentsNotFinishedActiveNotWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, false));
                request.setAttribute("appointmentsNotFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, true));
                request.setAttribute("appointmentsFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(true, true, true));
                request.setAttribute("appointmentsDone", appointmentFacade.findFinished(true));
                request.setAttribute("appointmentsNotDone", appointmentFacade.findFinished(false));
                request.getRequestDispatcher("appointments")
                        .forward(request, response);
                break;

            case "/doneappointment":
                String appDone_id = request.getParameter("app_id");
                Appointment appointmentDone = appointmentFacade.find(new Long(appDone_id));
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);
                request.setAttribute("services", serviceFacade.findActived(true));
                request.setAttribute("appointmentDone", appointmentDone);
                request.getRequestDispatcher("appointmentdone").forward(request, response);
                break;

            case "/finishAppointment":
                String id_appDone = request.getParameter("id_app");
                Appointment finishAppointment = appointmentFacade.find(new Long(id_appDone));

                finishAppointment.setStatus(true);
                appointmentFacade.edit(finishAppointment);
                worker = roleFacade.findRoleByName("WORKER");
                listWorkers = userRolesFacade.findByRole(worker);
                request.setAttribute("listWorkers", listWorkers);

                request.setAttribute("appointmentsNotFinishedActiveNotWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, false));
                request.setAttribute("appointmentsNotFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(false, true, true));
                request.setAttribute("appointmentsFinishedActiveWorkerOn", appointmentFacade.findActFinishedWorkerOn(true, true, true));
                request.setAttribute("appointmentsDone", appointmentFacade.findFinished(true));
                request.setAttribute("appointmentsNotDone", appointmentFacade.findFinished(false));
                request.getRequestDispatcher("appointments")
                        .forward(request, response);
                break;

            case "/reviewcreate":
                String app_idR = request.getParameter("app_id");
                Appointment appReview = appointmentFacade.find(new Long(app_idR));
                request.setAttribute("appReview", appReview);
                request.getRequestDispatcher("reviewcreate")
                        .forward(request, response);
                break;
            case "/createReview":
                String text = request.getParameter("text");
                String count = request.getParameter("count");
                Double countDouble = new Double(count);
                Integer count2 = countDouble.intValue();

                Review review = new Review(count2, text);
                reviewFacade.create(review);
                String app_idReview = request.getParameter("app_id");
                Appointment reviewAppointment = appointmentFacade.find(new Long(app_idReview));
                reviewAppointment.setReview(review);

                appointmentFacade.edit(reviewAppointment);
                request.getRequestDispatcher("index")
                        .forward(request, response);

                break;

            case "/limits":
                List<LimitApp> limitApps = limitAppFacade.findAll();
                request.setAttribute("limitApps", limitApps);
                request.getRequestDispatcher("limits")
                        .forward(request, response);
                break;
            case "/addnewlimit":
                String limitCountStr = request.getParameter("newlimit");
                int limitCount = Integer.parseInt(limitCountStr);
                String limitDate = request.getParameter("limit_date");
                String[] partsDate2 = limitDate.split("-");
                String yearLimit = partsDate2[0];
                String monthLimit = partsDate2[1];
                String dayLimit = partsDate2[2];
                DateFormat newDateFormat2 = new SimpleDateFormat("dd-MM-yyyy");
                Date dateAppointment2 = newDateFormat2.parse(dayLimit + "-" + monthLimit + "-" + yearLimit);
                if (limitAppFacade.findByDate(dateAppointment2) != null) {
                    request.setAttribute("info2", "На эту дату уже постален лимит!");
                    request.getRequestDispatcher("limits")
                            .forward(request, response);
                    break;
                }
                LimitApp limit = new LimitApp(limitCount, dateAppointment2);
                limitAppFacade.create(limit);
                request.setAttribute("info", "Лимит добавлен!");
                request.setAttribute("limit", limit);
                request.getRequestDispatcher("limits")
                        .forward(request, response);

                break;

            case "/editlimit":
                String limitApp_id = request.getParameter("limit_id");
                LimitApp limitedit = limitAppFacade.find(new Long(limitApp_id));
                request.setAttribute("limitedit", limitedit);
                request.getRequestDispatcher("limitedit")
                        .forward(request, response);
                break;
            case "/changeLimit":
                String id_limit = request.getParameter("id_limit");

                //String limit_userdate = request.getParameter("limit_userdate");
                //String[] partsDateLimit = limit_userdate.split("-");
                //String limitYear = partsDateLimit[0];
                //String limitMonth = partsDateLimit[1];
                //String limitDay = partsDateLimit[2];
                //DateFormat newDateFormatLimit = new SimpleDateFormat("dd-MM-yyyy");
                //Date NewDateLimit = newDateFormatLimit.parse(limitDay + "-" + limitMonth + "-" + limitYear);
                String limit_count = request.getParameter("limit_count");

                LimitApp changeLimitApp = limitAppFacade.find(new Long(id_limit));
                changeLimitApp.setCount(Integer.parseInt(limit_count));
                //changeLimitApp.setUserdate(NewDateLimit);
                limitAppFacade.edit(changeLimitApp);
                request.setAttribute("info", "Лимит изменен!");
                request.setAttribute("limitApps", limitAppFacade.findAll());
                request.getRequestDispatcher("limits")
                        .forward(request, response);

                break;
                
            case "/statistics":
                
                request.getRequestDispatcher("statistics").forward(request, response);
                break;
                
            case "/showStatistics":
                
                request.getRequestDispatcher("statistics").forward(request, response);
                break;
                
             case "/stat":
                String idWorker = request.getParameter("worker_id");
                workerApp = userFacade.find(new Long(idWorker));
                List<Appointment> workerStats = appointmentFacade.findByWorkerActiveFinished(workerApp, true, true);
                Integer workerStatsnr = workerStats.size();
                List<Appointment> workerStatsnoReview = appointmentFacade.findByWorkerActiveFinishednoReview(workerApp, true, true);
                Integer workerStatsnrnoReview = workerStatsnoReview.size();
                List<Appointment> workerStatsReview =  appointmentFacade.findByWorkerActiveFinishedReview(workerApp, true, true);
                
                request.setAttribute("workerApp", workerApp);
                request.setAttribute("workerStatsReview", workerStatsReview);
                request.setAttribute("workerStatsnrnoReview", workerStatsnrnoReview);
                request.setAttribute("workerStatsnr", workerStatsnr);
                request.setAttribute("workerStats", workerStats);
                
                request.getRequestDispatcher("statworker").forward(request, response);
                
                break;

            default:
                request.setAttribute("info", "Такой страницы не существует!");
                request.getRequestDispatcher(PageReturner.getPage("index")).forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SecureController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SecureController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
