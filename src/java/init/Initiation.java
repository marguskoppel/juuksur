/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package init;

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
import session.RoleFacade;
import session.UserFacade;
import session.UserRolesFacade;
import util.EncriptPass;

@WebServlet(loadOnStartup = 1, name = "Initiation", urlPatterns = {"/Initiation"})
public class Initiation extends HttpServlet {

    @EJB
    RoleFacade roleFacade;
    @EJB
    UserFacade userFacade;
    @EJB
    UserRolesFacade userRolesFacade;

    @Override
    public void init() throws ServletException {
        List<User> listUser = userFacade.findAll();
        if (listUser.isEmpty()) {
            EncriptPass ep = new EncriptPass();
            String salts = ep.createSalts();

            //Create Admin
            String encriptPass = ep.setEncriptPass("123456", salts);
            User userAdmin = new User("Admin", "", "", "", "admin", encriptPass, salts, true);
            userFacade.create(userAdmin);

            //Creating roles, adding roles to admin
            Role role = new Role();
            role.setName("ADMIN");
            roleFacade.create(role);
            UserRoles ur = new UserRoles();
            ur.setUser(userAdmin);
            ur.setRole(role);
            userRolesFacade.create(ur);

            role.setName("MASTER");
            roleFacade.create(role);
            //ur.setUser(userAdmin);
            //ur.setRole(role);
            //userRolesFacade.create(ur);

            role.setName("USER");
            roleFacade.create(role);
            //ur.setUser(userAdmin);
            //ur.setRole(role);
           //userRolesFacade.create(ur);

            role.setName("WORKER");
            roleFacade.create(role);

        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
