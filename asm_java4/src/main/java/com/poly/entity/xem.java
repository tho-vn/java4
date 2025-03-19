package com.poly.entity;

import java.util.Date;

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
@Table(name="xem",
        uniqueConstraints =
                {
                        @UniqueConstraint(columnNames = { "maVideo", "sdt" })
                })
public class xem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long maXem;
    @ManyToOne @JoinColumn(name = "sdt")
    users user;
    @ManyToOne @JoinColumn(name = "maVideo")
    videos video;
    @Temporal(TemporalType.DATE)
    Date ngayXem = new Date();
    public Long getMaXem() {
        return maXem;
    }
    public void setMaXem(Long maXem) {
        this.maXem = maXem;
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
    public Date getNgayXem() {
        return ngayXem;
    }
    public void setNgayXem(Date ngayXem) {
        this.ngayXem = ngayXem;
    }

}

