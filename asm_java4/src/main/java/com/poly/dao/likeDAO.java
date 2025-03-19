package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.poly.util.JpaUtil;

import com.poly.entity.*;

public class likeDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    @Override
    protected void finalize() throws Throwable {
        em.close();

        super.finalize();
    }
    public List<videos> findByUser(String key){
        String jpql = "SELECT o.video FROM like o WHERE o.user.sdt=:sdt";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter("sdt", key);
        List<videos> list = query.getResultList();
        return list;
    }

    public users findById(String sdt) {
        users entity = em.find(users.class, sdt);
        return entity;
    }
    public like remove(String sdt, String maVideo){
        String jpql = "SELECT v FROM like v WHERE v.video.maVideo = ?0 and v.user.sdt=?1";
        TypedQuery<like> query = em.createQuery(jpql, like.class);
        query.setParameter(0, maVideo);
        query.setParameter(1, sdt);
        like entity = query.getSingleResult();
        try {
            em.getTransaction().begin();
            em.remove(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return entity;
    }
    public boolean findOnlyEntity( String sdt, String maVideo){

        String jpql = "SELECT v FROM like v WHERE v.video.maVideo = ?0 and v.user.sdt=?1";
        TypedQuery<like> query = em.createQuery(jpql, like.class);
        query.setParameter(0, maVideo);
        query.setParameter(1, sdt);
        List<like> list =  query.getResultList();

        if(list.size()==0) {
            return false;
        }else {
            return true;
        }

    }

    public like create(like entity) {
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            return null;
        }
        return entity;
    }
}
