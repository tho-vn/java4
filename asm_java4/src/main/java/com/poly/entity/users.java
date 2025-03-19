package com.poly.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "nguoiDung")
public class users {
    @Id
    @Column(name = "sdt")
    private String sdt;

    @Column(name = "tenND")
    private String tenND;

    @Column(name = "email")
    private String email;

    @Column(name = "matKhau")
    private String matKhau;

    @Column(name = "admin")
    private boolean admin;

    @Column(name = "gioiTinh")
    private boolean gioiTinh;


    @OneToMany(mappedBy = "user")
    List<com.poly.entity.like> like;

    @OneToMany(mappedBy = "user")
    List<com.poly.entity.xem> xem;
    public List<com.poly.entity.xem> getXem() {
        return xem;
    }

    public void setXem(List<com.poly.entity.xem> xem) {
        this.xem = xem;
    }


    //List<share> share;
    //@OneToMany(mappedBy = "user")


    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getTenND() {
        return tenND;
    }

    public void setTenND(String tenND) {
        this.tenND = tenND;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public List<like> getLike() {
        return like;
    }

    public void setLike(List<like> like) {
        this.like = like;
    }


}
