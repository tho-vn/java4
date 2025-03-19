package com.poly.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.*;
import com.poly.entity.*;
@WebServlet({"/videoDaXem/index", "/videoDaXem/boXem/*"})
public class VideoHistoryServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;


    public VideoHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        users user = (users) request.getSession().getAttribute("user");
        if(user==null) {
            response.sendRedirect("/dangNhap");
            return;
        }
        String uri = request.getRequestURI();
        xemDAO dao = new xemDAO();

        if (uri.contains("boXem")) {
            String maVideo = uri.substring(uri.lastIndexOf("/") + 1);
            dao.remove(user.getSdt(),maVideo);

        }
        request.setAttribute("videos",dao.findByUser(user.getSdt()));
        request.setAttribute("count",dao.findByUser(user.getSdt()).size());
        request.getRequestDispatcher("/views/user/videoDaXem.jsp").forward(request, response);
    }

}
