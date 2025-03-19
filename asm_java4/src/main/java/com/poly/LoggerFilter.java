//package com.poly;
//
//import java.io.IOException;
//import java.util.Date;
//
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
//
//import com.poly.entity.*;
//
///**
// * Servlet Filter implementation class LoggerFilter
// */
//@WebFilter("/*")
//public class LoggerFilter extends HttpFilter implements Filter {
//
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
//            throws IOException, ServletException {
//        users user = (users) req.getSession().getAttribute("user");
//        String uri = req.getRequestURI();
//        Date time = new Date();
//        // ghi nhén user, uri, time vdo CSDL hoac file
//        chain.doFilter(req, resp);
//    }
//
//}