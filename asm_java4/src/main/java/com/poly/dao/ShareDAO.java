package com.poly.dao;

import javax.persistence.EntityManager;

import com.poly.entity.*;
import com.poly.util.JpaUtil;

public class ShareDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    @Override
    protected void finalize() throws Throwable {
        em.close();
        // dong EntityManager khi DAO bi giai phong
        super.finalize();
    }
    public share create(share s) {
        try {
            em.getTransaction().begin();
            em.persist(s);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            return null;
        }
        return s;
    }
}
