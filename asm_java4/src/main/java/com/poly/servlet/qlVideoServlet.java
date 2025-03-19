package com.poly.servlet;


import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.Part;
import java.io.File;

import com.poly.dao.videosDAO;
import com.poly.entity.*;

@MultipartConfig
@WebServlet({ "/qlVideo/index","/qlVideo/upload", "/qlVideo/edit/*", "/qlVideo/create", "/qlVideo/update", "/qlVideo/delete","/qlVideo/timKiem" })
public class qlVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public qlVideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        users user = (users) req.getSession().getAttribute("user");
        req.setAttribute("date", new Date());
        if(user==null) {
            resp.sendRedirect("/dangNhap");
            return;
        }
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String strDate = formatter.format(date);
        Date date2 = null;
        try {
            date2 = formatter.parse(strDate);
        } catch (ParseException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        req.setAttribute("ngayTao", strDate);
        videosDAO dao = new videosDAO();
        videos v = new videos();
        req.setAttribute("message", "");
        req.setAttribute("form", v);
        String uri = req.getRequestURI();
        if (uri.contains("create")) {
            try {
                BeanUtils.populate(v, req.getParameterMap());
                v.setNgayTao(new Date());
                dao.create(v);
                req.setAttribute("message", "Thêm thành công!");
                req.setAttribute("form", new videos());
                req.setAttribute("videos", dao.findAll());
            } catch (IllegalAccessException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else if (uri.contains("update")) {
//            try {
//                BeanUtils.populate(v, req.getParameterMap());
//                System.out.println("update ok");
//                System.out.println("Test: " + v);
//                dao.update(v);
//                req.setAttribute("message", "Cập nhật thành công");
//            } catch (Exception e) {
//                System.out.println(e);
//                e.printStackTrace();
//
//            }
//            req.setAttribute("videos", dao.findAll());
            System.out.println("create 66");
            this.update(req, resp);

        }else if (uri.contains("timKiem")) {
            try {
                req.setAttribute("thongTinn", req.getParameter("thongTin"));
                req.setAttribute("theLoai", req.getParameter("theLoai"));
                req.setAttribute("videos", dao.findByNameandTheLoai(req.getParameter("thongTin"), req.getParameter("theLoai")));
            } catch (Exception e) {

            }
        }
        else if (uri.contains("delete")) {
            try {
                String id = req.getParameter("maVideo");
                dao.remove(id);
                req.setAttribute("message", "Xóa thành công");
            } catch (Exception c) {
                req.setAttribute("message", "Xóa thất bại");

            }
            req.setAttribute("videos", dao.findAll());

        } else if (uri.contains("edit")) {
            String id = uri.substring(uri.lastIndexOf("/") + 1);
            System.out.println(id+" Đây là id");
            v = dao.findById(id);
            req.setAttribute("form", v);
            req.setAttribute("date", v.getNgayTao());
            req.setAttribute("poster", v.getPoster());
            req.setAttribute("videos", dao.findAll());
        }
        if(req.getParameter("thongTin")==null) {
            req.setAttribute("videos", dao.findAll());
        }

        req.getRequestDispatcher("/views/admin/qlVideo.jsp").forward(req, resp);
    }
    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            videos v = new videos();
            videosDAO dao = new videosDAO();
            BeanUtils.populate(v, req.getParameterMap());
            dao.update(v);
            req.setAttribute("message", "Đã cập nhật video thanh công!");
            req.setAttribute("form", v);
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
