package com.poly.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class JpaUtil {
    private static EntityManagerFactory factory;

    static public EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            try {
                factory = Persistence.createEntityManagerFactory("WebJava4");
            } catch (Exception e) {
                e.printStackTrace(); // In chi tiết lỗi để bạn có thể gỡ rối
                throw new RuntimeException("Failed to create EntityManagerFactory", e);
            }
        }
        return factory.createEntityManager();
    }
}

