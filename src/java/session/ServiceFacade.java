/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Service;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class ServiceFacade extends AbstractFacade<Service> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServiceFacade() {
        super(Service.class);
    }
    public Service findById(String id) {
        try {
            return (Service) em.createQuery("SELECT p FROM Service p WHERE p.id = :id")
                .setParameter("id", id)
                .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    

    public List<Service> findActived(boolean active) {
        try {
            return em.createQuery("SELECT b FROM Service b WHERE b.active = :active")
                .setParameter("active", active)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }
    
}
