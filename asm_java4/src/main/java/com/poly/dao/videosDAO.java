package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.poly.entity.*;
import com.poly.util.JpaUtil;


public class videosDAO {
    private EntityManager em = JpaUtil.getEntityManager();
    @Override
    protected void finalize() throws Throwable {
        em.close(); // dong EntityManager khi DAO bi giai phong
        super.finalize();
    }
    public List<videos> findRandomVideos() {
        String jpql = "SELECT v FROM videos v ORDER BY RAND()";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setMaxResults(5);
        List<videos> list = query.getResultList();
        return list;
    }
    public List<videos> findAll(){
        String jpql = "SELECT v FROM videos v ORDER BY v.luotXem desc";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        List<videos> list = query.getResultList();
        return list;
    }
    public List<String> findAllName(){
        String jpql = "SELECT v.chuDe FROM videos v";
        TypedQuery<String> query = em.createQuery(jpql, String.class);
        List<String> list = query.getResultList();
        return list;
    }

    public List<videos> findMusic(){
        String theLoai="âm nhạc";
        String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter("theLoai", theLoai);
        List<videos> list = query.getResultList();
        return list;
    }

    public List<videos> findTrailer(){
        String theLoai="trailer";
        String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter("theLoai", theLoai);
        List<videos> list = query.getResultList();
        return list;
    }

    public List<videos> findCartoon(){
        String theLoai="hoạt hình";
        String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter("theLoai", theLoai);
        List<videos> list = query.getResultList();
        return list;
    }

    public List<videos> findByName(String key ){
        String jpql = "SELECT v FROM videos v WHERE v.chuDe like ?0";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter(0, "%"+key+"%");
        List<videos> list = query.getResultList();
        return list;
    }
    public List<videos> findByNameandTheLoai(String key, String theLoai ){
        String jpql = "SELECT v FROM videos v WHERE v.chuDe like ?0 or v.theLoai like ?1";
        TypedQuery<videos> query = em.createQuery(jpql, videos.class);
        query.setParameter(0, "%"+key+"%");
        query.setParameter(1, "%"+theLoai+"%");
        List<videos> list = query.getResultList();
        return list;
    }
    public videos findById(String id) {
        videos v = em.find(videos.class, id);
        System.out.println(v.getMaVideo());
        return v ;
    }
    public videos create(videos v) {
        try {
            em.getTransaction().begin();

            em.persist(v);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            return null;
        }
        return v;
    }

    public videos update(videos v) {
        try {

            em.getTransaction().begin();
            em.merge(v);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return v;
    }

    public videos remove(String id) {
        videos v = this.findById(id);
        if ( v == null) {
            // Nếu không tìm thấy video, hãy trả về null hoặc ném một ngoại lệ
            return null;
        }
        try {
            em.getTransaction().begin();
            em.remove(v);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            // Hãy ném lại ngoại lệ để có thể xử lý lỗi
            throw new RuntimeException(e);
        }
        return v ;
    }
}

