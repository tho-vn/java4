package com.poly.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "share", uniqueConstraints = { @UniqueConstraint(columnNames = { "maVideo", "sdt" }) })
public class share {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long maShare;

    @Column(name = "emails")
    private String email;

    @ManyToOne
    @JoinColumn(name = "sdt")
    users user;
    @ManyToOne
    @JoinColumn(name = "maVideo")
    videos video;
    @Temporal(TemporalType.DATE)
    Date ngayShare = new Date();

    public Long getMaShare() {
        return maShare;
    }

    public void setMaShare(Long maShare) {
        this.maShare = maShare;
    }

    public String getEmails() {
        return email;
    }

    public void setEmails(String email) {
        this.email = email;
    }

    public users getUser() {
        return user;
    }

    public void setUser(users user) {
        this.user = user;
    }

    public videos getVideo() {
        return video;
    }

    public void setVideo(videos video) {
        this.video = video;
    }

    public Date getNgayShare() {
        return ngayShare;
    }

    public void setNgayShare(Date ngayShare) {
        this.ngayShare = ngayShare;
    }

}

