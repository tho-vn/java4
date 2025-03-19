<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
  <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
  <style>

    .login-form {
      border: 2px solid #007bff;
      border-radius: 5px;
      padding: 20px;
      margin: 20px auto;
      max-width: 400px;
      background-color: #f8f9fa;
    }
  </style>
</head>
<body>

<!-- LIST MENU -->
<%@include file="/header.jsp"%>

<!-- REGISTER -->
<h1 class="text-center mt-4">REGISTER</h1>
<form class="login-form" action="dangky" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
    <input type="phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"value="${form.sdt}"
           name="sdt" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="matKhau"
           value="${form.matKhau}" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Xác Nhận Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="matKhau2" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Họ và tên</label>
    <input type="text" class="form-control" id="exampleInputPassword1" value="${form.tenND}" placeholder="Enter Fullname"
           name="tenND" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Email</label>
    <input type="email" class="form-control" value="${form.email}" name="email"
           required>
  </div>
<%--  <div class="col">--%>
<%--    Role <br>--%>
<%--    <div class="form-check form-check-inline">--%>
<%--      <input--%>
<%--              class="form-check-input"--%>
<%--              type="radio"--%>
<%--              name="role"--%>
<%--              id="admin"--%>
<%--              value="true"--%>
<%--      />--%>
<%--      <label class="form-check-label" for="">Admin</label>--%>
<%--    </div>--%>
<%--    <div class="form-check form-check-inline">--%>
<%--      <input--%>
<%--              class="form-check-input"--%>
<%--              type="radio"--%>
<%--              name="role"--%>
<%--              id="user"--%>
<%--              value="flase"--%>
<%--      />--%>
<%--      <label class="form-check-label" for="">User</label>--%>
<%--    </div>--%>
<%--  </div>--%>
  <div class="col">
    Role <br>
    <div class="form-check form-check-inline">
      <input
              class="form-check-input"
              type="radio"
              name="gioiTinh"
              id="male"
              value="true"
      ${form.gioiTinh?'checked':' '}
      />
      <label class="form-check-label" for="">Nam</label>
    </div>
    <div class="form-check form-check-inline">
      <input
              class="form-check-input"
              type="radio"
              name="gioiTinh"
              id="female"
              value="flase"
      ${form.gioiTinh?'checked':' '}
      />
      <label class="form-check-label" for="">Nữ</label>
    </div>
  </div>
  <div id="loitaotk">${message1}</div>

  <button type="submit" id="registerBtn"  class="btn btn-primary mt-3 " >Submit</button>
  <br>
  </a> <span class="psw">Đã có <a href="/dangNhap" style="color: #F5A425;">tài
								khoản?</a></span>
</form>
<!-- FOOTER -->
<%@include file="/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>