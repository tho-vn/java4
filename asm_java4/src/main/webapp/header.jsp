<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />
<style>
    a{
        text-decoration: none;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

<nav class="navbar bg-primary navbar-expand-lg "  data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://i.imgur.com/75FaYtz.png" alt="Bootstrap" width="50" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/index">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-disabled="true" href="/videoDaXem/index" >My History</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        My Account
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:if test="${empty sessionScope.user.sdt }">
                            <li><a class="dropdown-item" href="/dangNhap">Đăng nhập</a></li>
                            <li><a class="dropdown-item" href="/dangky">Đăng kí</a></li>
                            <li><a class="dropdown-item" href="/dangky">Quên mật khẩu</a></li>
                        </c:if>
                        <c:if test="${!empty sessionScope.user.sdt }">
                            <li><a class="dropdown-item"  href="/capnhataccount">Cập nhật tài khoản</a></li>
                            <li><a class="dropdown-item" href="/changepassword">Đổi mật khẩu</a></li>
                            <li><a class="dropdown-item" href="/dangXuat">Đăng xuất</a></li>
                        </c:if>
                    </ul>
                </li>
                <c:if test="${user.isAdmin() == true}">
                    <li class="nav-item">
                        <a class="nav-link active" href="/views/admin/loginadmin.jsp">Truy Cập Admin</a>
                    </li>
                </c:if>
                <c:if  test="${not empty sessionScope.user}">
                    <li class="nav-item">
                        <a class="user-welcome" style="float: right; margin-top: 10px; margin-right: 20px; color: white;">
                            Chào mừng, ${sessionScope.user.tenND}!
                        </a>
                    </li>
                </c:if>
            </ul>
            <form action="/timKiem" method="post"
                  class="navbar-form formTimKiem"
                  style="padding-top: 8px; position: absolute; right: 190px;">
                <div class="form-group">
                    <input type="text" value="${thongTin }"
                           style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray;"
                           name="thongTin" class="form-control" placeholder="Tìm kiếm"
                           id="textSearch">
                </div>
            </form>
        </div>
    </div>
</nav>
<c:if test="${not empty sessionScope.successMessage}">
    <div id="successMsg" style="text-align: center; margin-top: 10px; color: green;">
            ${sessionScope.successMessage}
    </div>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>