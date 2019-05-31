/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Role;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class RoleFacade extends AbstractFacade<Role> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RoleFacade() {
        super(Role.class);
    }
    
    public Role findRoleByName(String name) {
        Role role = (Role) em.createQuery("SELECT r FROM Role r WHERE r.name=:name")
                .setParameter("name", name)
                .getSingleResult();
        return role;
    }
    public List<Role> findAllExceptAdmin() {
        return em.createQuery("SELECT u FROM Role u WHERE u.name != 'ADMIN'")
                .getResultList();
    }
    
}
