/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Appointment;
import entity.Review;
import entity.User;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Marck
 */
@Stateless
public class AppointmentFacade extends AbstractFacade<Appointment> {

    @PersistenceContext(unitName = "juuksurPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AppointmentFacade() {
        super(Appointment.class);
    }
    
    public boolean uniqueAppointment(Appointment appointment) {
        try {
            List<Appointment> appointments = em.createQuery("SELECT u FROM Appointment u WHERE u.user=:user AND u.userdate=:userdate AND u.service=:service")
                .setParameter("userdate", appointment.getUserdate())
                .setParameter("user", appointment.getUser())
                .setParameter("service", appointment.getService())
                .getResultList();
            if(appointments.isEmpty()) {
                return true;
            }
            else {
                return false;
            }
        } catch (Exception ex) {
            Logger.getLogger(AppointmentFacade.class.getName()).log(Level.SEVERE, "Ошибка запроса", ex);
            return true;
        }
    }
    public List<Appointment> findFinished(boolean status){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.status = :status")
                    .setParameter("status", status)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    
    }
    public List<Appointment> findActive(boolean active){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.active = :active")
                    .setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    
    }
    
    public List<Appointment> findWorkerOn(boolean workerOn){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.workerOn = :workerOn")
                    .setParameter("workerOn", workerOn)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }
    public List<Appointment> findActFinishedWorkerOn(boolean status, boolean active, boolean workerOn){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.status = :status AND u.active = :active AND u.workerOn = :workerOn")
                    .setParameter("status", status).setParameter("active", active).setParameter("workerOn", workerOn)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        
    }
    public List<Appointment> findActiveNotFinished (boolean status, boolean active){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.status = :status AND u.active = :active")
                    .setParameter("status", status).setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Appointment> findByUser(User user){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.user = :user")
                    .setParameter("user", user)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    public List<Appointment> findByUserActive(User user, boolean status){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.user = :user AND u.status = :status")
                    .setParameter("user", user).setParameter("status", status)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Appointment> findByWorkerActive(User worker, boolean status){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.worker = :worker AND u.status = :status")
                    .setParameter("worker", worker).setParameter("status", status)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    public List<Appointment> findByDate(Date appdate){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.appdate = :appdate")
                    .setParameter("appdate", appdate)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    public List<Appointment> findByWorkerActiveFinished(User worker, boolean status, boolean active){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.worker = :worker AND u.status = :status AND u.active = :active")
                    .setParameter("worker", worker).setParameter("status", status).setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    public List<Appointment> findByWorkerActiveFinishednoReview(User worker, boolean status, boolean active){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.worker = :worker AND u.status = :status AND u.active = :active AND u.review IS NULL")
                    .setParameter("worker", worker).setParameter("status", status).setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    public List<Appointment> findByWorkerActiveFinishedReview(User worker, boolean status, boolean active){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE u.worker = :worker AND u.status = :status AND u.active = :active AND u.review IS NOT NULL")
                    .setParameter("worker", worker).setParameter("status", status).setParameter("active", active)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
     public List<Appointment> findAcitveFinished(boolean active, boolean status){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE  u.active = :active AND u.status = :status")
                    .setParameter("active", active).setParameter("status", status)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
     
     public List<Appointment> findByRange(Date fromDate, Date toDate){
        try {
            return em.createQuery("SELECT u FROM Appointment u WHERE  u.userdate > :fromDate AND u.userdate < :toDate AND u.active = TRUE AND u.status = TRUE")
                    .setParameter("fromDate", fromDate).setParameter("toDate", toDate)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
