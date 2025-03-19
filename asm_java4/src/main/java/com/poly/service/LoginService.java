package com.poly.service;

import java.util.HashMap;
import java.util.Map;

public class LoginService {
    private static Map<String, String> users = new HashMap<>();

    static {
        users.put("admin", "123456");
        users.put("user1", "password123");
    }

    public boolean authenticate(String sdt, String matKhau) {
        if (matKhau == null || matKhau == null || matKhau.isEmpty() || matKhau.isEmpty()) {
            return false;
        }
        return users.containsKey(sdt) && users.get(sdt).equals(matKhau);
    }
}
