/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.LimitApp;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class LimitAppFacade extends AbstractFacade<LimitApp> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LimitAppFacade() {
        super(LimitApp.class);
    }
    public LimitApp findByDate(Date userdate){
        try {
            return(LimitApp) em.createQuery("SELECT u FROM LimitApp u WHERE u.userdate = :userdate")
                    .setParameter("userdate", userdate)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
}
