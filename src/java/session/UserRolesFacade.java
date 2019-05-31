/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Role;
import entity.User;
import entity.UserRoles;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class UserRolesFacade extends AbstractFacade<UserRoles> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserRolesFacade() {
        super(UserRoles.class);
    }
    public List<UserRoles> findByUser(User user) {
        return em.createQuery("SELECT ur FROM UserRoles ur WHERE ur.user = :user")
                .setParameter("user", user)
                .getResultList();
    }

    public UserRoles findByUserRole(User user, Role role) {
        try {
            return (UserRoles) em.createQuery("SELECT ur FROM UserRoles ur WHERE ur.user = :user AND ur.role = :role")
                    .setParameter("user", user).setParameter("role", role)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }

    }

    public List<UserRoles> findByRole(Role role) {
        try {
            return em.createQuery("SELECT ur FROM UserRoles ur WHERE ur.role = :role")
                    .setParameter("role", role)
                .getResultList();
        } catch (Exception e) {
            return null;
        }

    }
}
