/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class UserFacade extends AbstractFacade<User> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }

    public User findByLogin(String login) {
        try {
            return (User) em.createQuery("SELECT u FROM User u WHERE u.login = :login")
                    .setParameter("login", login)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    public User findByLoginActive(String login, boolean active){
        try {
            return (User) em.createQuery("SELECT u FROM User u WHERE u.login = :login AND u.active = :active")
                    .setParameter("login", login).setParameter("active", active)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public User findById(String id) {
        try {
            return (User) em.createQuery("SELECT u FROM User u WHERE u.id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<User> findActive(boolean active) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.active = :active")
                    .setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

    }

    public List<User> findAllExceptAdmin() {
        return em.createQuery("SELECT u FROM User u WHERE u.login != 'admin'")
                .getResultList();
    }

    public List<User> findActivedExceptAdmin(boolean active) {
        try {
            return em.createQuery("SELECT b FROM User b WHERE b.active = :active AND b.login !='admin'")
                    .setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

    }

}
