package com.poly.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.*;
import com.poly.entity.*;

@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public changepassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        users user = (users) req.getSession().getAttribute("user");
        req.setAttribute("sdt", user.getSdt());
        req.getRequestDispatcher("/views/user/changepassword.jsp").forward(req, resp);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        users user = (users) req.getSession().getAttribute("user");
        try {
            usersDAO dao = new usersDAO();
            if (req.getParameter("matKhauCu") != null && req.getParameter("matKhau") != null
                    && req.getParameter("matKhau2") != null) {
                if (user.getMatKhau().equals(req.getParameter("matKhauCu")) == false) {
                    req.setAttribute("message", "Mật khẩu cũ không chính xác!");
                } else if (!req.getParameter("matKhau").equals(req.getParameter("matKhau2"))) {
                    req.setAttribute("message", "Mật khẩu xác nhận không chính xác!");
                } else if (req.getParameter("matKhauCu").equals(req.getParameter("matKhau"))) {
                    req.setAttribute("message", "Mật khẩu mới trùng mật khẩu cũ!");
                } else {
                    user.setMatKhau(req.getParameter("matKhau"));
                    dao.update(user);
                    req.setAttribute("message", "Đổi mật khẩu thành công!");
                }
            }

        } catch (Exception e) {
            req.setAttribute("message", "đổi mật khẩu thất bại!");
        }
        req.getRequestDispatcher("/views/user/changepassword.jsp").forward(req, resp);
    }
}
