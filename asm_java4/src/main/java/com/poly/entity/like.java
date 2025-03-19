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
@Table(name="[like]",
        uniqueConstraints =
                {
                        @UniqueConstraint(columnNames = { "maVideo", "sdt" })
                })
public class like {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long maLike;
    @ManyToOne @JoinColumn(name = "sdt")
    users user;
    @ManyToOne @JoinColumn(name = "maVideo")
    videos video;
    @Temporal(TemporalType.DATE)
    Date ngayLike = new Date();
    public Long getMaLike() {
        return maLike;
    }
    public void setMaLike(Long maLike) {
        this.maLike = maLike;
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
    public Date getNgayLike() {
        return ngayLike;
    }
    public void setNgayLike(Date ngayLike) {
        this.ngayLike = ngayLike;
    }


}
