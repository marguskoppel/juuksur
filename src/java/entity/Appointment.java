/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Marck
 */
@Entity
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private User user;
    @Temporal(TemporalType.TIMESTAMP)
    private Date userdate;
    @OneToOne
    private Service service;
    @OneToOne
    private User worker;
    @OneToOne
    private Review review;
    private boolean status; //завершен или нет
    private boolean active; // активный или неактивный(удаленный)
    private boolean workerOn; //назначен работник или нет
    @Temporal(TemporalType.DATE)
    private Date appdate;

    public Appointment() {
    }

    public Appointment(User user, Date userdate, Service service, User worker, Review review, boolean status, boolean active, boolean workerOn, Date appdate) {
        this.user = user;
        this.userdate = userdate;
        this.service = service;
        this.worker = worker;
        this.review = review;
        this.status = status;
        this.active = active;
        this.workerOn = workerOn;
        this.appdate = appdate;
    }

    public Appointment(User user, Date userdate, User worker, Review review, boolean status, boolean active, boolean workerOn, Service service) {
        this.user = user;
        this.userdate = userdate;
        this.worker = worker;
        this.review = review;
        this.status = status;
        this.active = active;
        this.workerOn = workerOn;
        this.service = service;
    }

    public Appointment(User user, Date userdate, boolean status, boolean active, boolean workerOn, Service service) {
        this.user = user;
        this.userdate = userdate;
        this.status = status;
        this.active = active;
        this.workerOn = workerOn;
        this.service = service;
    }

    public Appointment(User user, Date userdate,  boolean status, boolean active, boolean workerOn, Service service, Date appdate) {
        this.user = user;
        this.userdate = userdate;
        this.status = status;
        this.active = active;
        this.workerOn = workerOn;
        this.service = service;
        this.appdate = appdate;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.id);
        hash = 67 * hash + Objects.hashCode(this.user);
        hash = 67 * hash + Objects.hashCode(this.userdate);
        hash = 67 * hash + Objects.hashCode(this.service);
        hash = 67 * hash + Objects.hashCode(this.worker);
        hash = 67 * hash + Objects.hashCode(this.review);
        hash = 67 * hash + (this.status ? 1 : 0);
        hash = 67 * hash + (this.active ? 1 : 0);
        hash = 67 * hash + (this.workerOn ? 1 : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Appointment other = (Appointment) obj;
        if (this.status != other.status) {
            return false;
        }
        if (this.active != other.active) {
            return false;
        }
        if (this.workerOn != other.workerOn) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        if (!Objects.equals(this.userdate, other.userdate)) {
            return false;
        }
        if (!Objects.equals(this.service, other.service)) {
            return false;
        }
        if (!Objects.equals(this.worker, other.worker)) {
            return false;
        }
        if (!Objects.equals(this.review, other.review)) {
            return false;
        }
        return true;
    }

    
    

    

    @Override
    public String toString() {
        return "Appointment{" + "id=" + id + ", user=" + user + ", userdate=" + userdate.toString() + ", service=" + service.getName() + ", worker=" + worker + ", review=" + review + ", status=" + status + ", active=" + active + ", workerOn=" + workerOn + ", appdate=" + appdate +'}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getUserdate() {
        return userdate;
    }

    public void setUserdate(Date userdate) {
        this.userdate = userdate;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public User getWorker() {
        return worker;
    }

    public void setWorker(User worker) {
        this.worker = worker;
    }

    public Review getReview() {
        return review;
    }

    public void setReview(Review review) {
        this.review = review;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isWorkerOn() {
        return workerOn;
    }

    public void setWorkerOn(boolean workerOn) {
        this.workerOn = workerOn;
    }

    public Date getAppdate() {
        return appdate;
    }

    public void setAppdate(Date appdate) {
        this.appdate = appdate;
    }

    
    
}
