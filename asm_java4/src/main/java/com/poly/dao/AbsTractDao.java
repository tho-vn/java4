//package com.poly.dao;
//
//import javax.persistence.EntityManager;
//import com.poly.util.JpaUtil;
//
//import java.util.List;
//
//public class AbsTractDao<T> {
//    public static final EntityManager entityManager = JpaUtil.getEntityManager();
//
//    @Override
//    protected void finalize() throws Throwable {
//        entityManager.close();
//        super.finalize();
//    }
//    public T findById(Class<T> clazz , Integer id){
//        return entityManager.find(clazz, id);
//    }
//    public List<T> findAll(Class<T> clazz){
//
//    }
//}
