package com.poly.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.Date;
import java.util.List;
@Entity
@Table(name="`videos`")
public class videos {
    @Id
    @Column(name = "maVideo")
    private String maVideo;

    @Column(name = "chuDe")
    private String chuDe;

    @Column(name = "poster")
    private String poster;

    @Column(name = "link")
    private String link;

    @Column(name = "luotXem")
    private int luotXem;

    @Column(name = "theLoai")
    private String theLoai;

    @Column(name = "moTa")
    private String moTa;

    @Column(name = "ngayTao")
    private Date ngayTao;

    @Column(name = "hoatDong")
    private boolean hoatDong;

    @OneToMany(mappedBy = "video")
    List<like> like;
    //List<share> share;
    //@OneToMany(mappedBy = "videos")


    public List<like> getLike() {
        return like;
    }

    public void setLike(List<like> like) {
        this.like = like;
    }

//	public List<share> getShare() {
//		return share;
//	}
//
//	public void setShare(List<share> share) {
//		this.share = share;
//	}

    public String getMaVideo() {
        return maVideo;
    }

    public void setMaVideo(String maVideo) {
        this.maVideo = maVideo;
    }

    public String getChuDe() {
        return chuDe;
    }

    public void setChuDe(String chuDe) {
        this.chuDe = chuDe;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getLuotXem() {
        return luotXem;
    }

    public void setLuotXem(int luotXem) {
        this.luotXem = luotXem;
    }

    public String getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(String theLoai) {
        this.theLoai = theLoai;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public boolean isHoatDong() {
        return hoatDong;
    }

    public void setHoatDong(boolean hoatDong) {
        this.hoatDong = hoatDong;
    }


}
