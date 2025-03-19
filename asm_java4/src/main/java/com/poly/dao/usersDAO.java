package com.poly.dao;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entity.*;
import com.poly.util.JpaUtil;

public class usersDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    @Override
    protected void finalize() throws Throwable {
        em.close();
        // dong EntityManager khi DAO bi giai phong
        super.finalize();
    }
    public List<users> findAll(){
        String jpql = "SELECT obj FROM users obj";
        TypedQuery<users> query = em.createQuery(jpql, users.class);
        List<users> list = query.getResultList();
        return list;
    }
    public boolean findEmail(String email){
        String jpql = "SELECT obj FROM users obj where obj.email=:email";
        TypedQuery<users> query = em.createQuery(jpql, users.class);
        query.setParameter("email", email);
        List<users> list = query.getResultList();
        if(list.size()==0) {
            return false;
        }else {
            return true;
        }
    }
    public users findBySdt(String sdt) {
        users u = em.find(users.class, sdt);

        return u;
    }

    public long getTotalUser() {
        String jpql = "SELECT count(obj.sdt) FROM users obj";
        TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
        return query.getSingleResult();
    }
    public users create(users u) {
        try {
            em.getTransaction().begin();
            em.persist(u);
            System.out.println("Creating user: " + u);
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
        return u;
    }
    public users update(users u) {
        try {
            em.getTransaction().begin();
            em.merge(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return u;
    }
    public users remove(String id) {
        users u = this.findBySdt(id);
        try {
            em.getTransaction().begin();
            em.remove(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return u;
    }

}
