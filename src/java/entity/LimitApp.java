/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Marck
 */
@Entity
public class LimitApp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer count;
    @Temporal(TemporalType.DATE) @Column (unique = true)
    private Date userdate;

    public LimitApp() {
    }

    public LimitApp(Integer count, Date userdate) {
        this.count = count;
        this.userdate = userdate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getUserdate() {
        return userdate;
    }

    public void setUserdate(Date userdate) {
        this.userdate = userdate;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.id);
        hash = 59 * hash + Objects.hashCode(this.count);
        hash = 59 * hash + Objects.hashCode(this.userdate);
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
        final LimitApp other = (LimitApp) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.count, other.count)) {
            return false;
        }
        if (!Objects.equals(this.userdate, other.userdate)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Limit{" + "id=" + id + ", count=" + count + ", userdate=" + userdate.toString() + '}';
    }
    
}
