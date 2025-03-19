package com.poly.servlet;


import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.dao.*;
import com.poly.entity.*;

@WebServlet({ "/index/*", "/yeuThich/*"})
public class ChiTietServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChiTietServlet() {
        super();
    }
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        users user = (users) request.getSession().getAttribute("user");
        String id = uri.substring(uri.lastIndexOf("/") + 1);
        likeDAO likeDao = new likeDAO();
        videosDAO videoDao = new videosDAO();
        videos entity = new videos();
        request.setAttribute("randomVideos", videoDao.findRandomVideos());
        request.setAttribute("video", videoDao.findById(id));
        request.setAttribute("videos", videoDao.findAll());
        HttpSession session = request.getSession();
        session.setAttribute("trangTruoc", null);
        boolean check;
        if (uri.contains("index")) {
            if (user != null) {
                //tăng views
                entity = videoDao.findById(id);
                int luotXem = entity.getLuotXem()+1;
                entity.setLuotXem(luotXem);
                videoDao.update(entity);
                check = likeDao.findOnlyEntity(user.getSdt(), id);
                //hiện like hay không like
                if (check == true) {
                    request.setAttribute("heart", "red");
                } else {
                    request.setAttribute("heart", "");
                }
                //thêm vào video đã xem
                Date d = new Date();
                xemDAO xemDao = new xemDAO();
                xem xemEntity = new xem();
                //check nếu đã có trong danh sách đã xem thì update ngày xem
                check = xemDao.findOnlyEntity(user.getSdt(), id);
                xemEntity.setNgayXem(d);
                xemEntity.setUser(user);
                xemEntity.setVideo(videoDao.findById(id));
                if(check) {
                    xemDao.update(user.getSdt(), id);
                }else {
                    xemDao.create(xemEntity);
                }

            }
        } else if (uri.contains("yeuThich")) {
            if (user == null) {
                session.setAttribute("trangTruoc", request.getRequestURI());
                response.sendRedirect("/dangNhap");
                return;
            } else {
                check = likeDao.findOnlyEntity(user.getSdt(), id);
                if (check == true) {
                    likeDao.remove(user.getSdt(), id);
                    request.setAttribute("heart", "");

                } else {
                    Date d = new Date();
                    like likeEntity = new like();
                    likeEntity.setNgayLike(d);
                    likeEntity.setUser(user);
                    likeEntity.setVideo(videoDao.findById(id));
                    likeDao.create(likeEntity);
                    request.setAttribute("heart", "red");
                }

            }

        }
        request.getRequestDispatcher("/views/user/chitietvideo.jsp").forward(request, response);
    }
}
