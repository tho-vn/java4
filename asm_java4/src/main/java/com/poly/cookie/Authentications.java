//package com.poly.cookie;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.poly.entity.*;
//
//@WebFilter({ "/admin/*", "/qlNDung/*", "/qlVideo/*", "/ThongKe/*" })
//public class Authentications extends HttpFilter implements Filter {
//    private static final long serialVersionUID = 1L;
//
//    public Authentications() {
//        super();
//    }
//
//    public void destroy() {
//
//    }
//
//    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        String uri = request.getRequestURI();
//        users user = (users) request.getSession().getAttribute("user");
//        String error = "";
//        if (user == null) {
//            request.setAttribute("message", "Vui lòng đăng nhập!");
//            response.sendRedirect("/dangNhap");
//            return;
//        } else if ((user.isAdmin() == false) && uri.contains("/qlVideo/")) {
//            error = response.encodeURL("Vui lòng đăng nhập với vai trò admin");
//
//        }
//        if ((user.isAdmin() == false) && uri.contains("/qlNDung/")) {
//            error = response.encodeURL("Vui lòng đăng nhập với vai trò admin");
//        }
//        if ((user.isAdmin() == false) && uri.contains("/qlVideo/")) {
//            error = response.encodeURL("Vui lòng đăng nhập với vai trò admin");
//        }
//        if ((user.isAdmin() == false) && uri.contains("/ThongKe/")) {
//            error = response.encodeURL("Vui lòng đăng nhập với vai trò admin");
//        }
//        if (!error.isEmpty()) {
//            response.sendRedirect("");
//        } else {
//            chain.doFilter(request, response);
//        }
//
//    }
//
//    public void init(FilterConfig fConfig) throws ServletException {
//        // TODO Auto-generated method stub
//    }
//
//}
