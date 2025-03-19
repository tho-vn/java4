<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
  <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
    <style>
    body {
      background-color: #e9ecef;
      font-family: Arial, sans-serif;
    }

    .navbar {
      margin-bottom: 20px; /* Space below navbar */
    }

    .login-form {
      border: 2px solid #007bff;
      border-radius: 10px; /* Slightly larger radius for a softer look */
      padding: 30px; /* Increased padding for a more spacious feel */
      margin: 20px auto;
      max-width: 400px;
      background-color: #ffffff; /* White background for the form */
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Soft shadow for depth */
    }

    .login-form h1 {
      margin-bottom: 20px; /* Space below heading */
      color: #007bff; /* Heading color */
    }

    .form-label {
      font-weight: bold; /* Bold labels for better readability */
    }

    .form-control {
      border: 1px solid #ced4da; /* Custom border color */
      border-radius: 5px; /* Rounded corners */
      transition: border-color 0.3s; /* Smooth transition for focus */
    }

    .form-control:focus {
      border-color: #007bff; /* Change border color on focus */
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Focus shadow */
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
      transition: background-color 0.3s; /* Smooth transition */
    }

    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }

    .psw {
      color: #6c757d;
    }

    .footer {
      padding: 20px 0;
    }

    .footer h3 {
      margin-bottom: 15px;
    }

    .footer a {
      color: #ffffff;
    }

    .footer a:hover {
      text-decoration: underline;
    }
    .ip{
      width: 330px;
    }
  </style>
</head>
<body>

<!-- LIST MENU -->
<%@include file="/header.jsp"%>

<!-- LOGIN -->
<h1 class="text-center mt-4">LOGIN</h1>
<form class="login-form" action="dangNhap" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Số điện thoại </label>
    <br>
    <input class="ip" autofocus type="phone" id="sdt"  name="sdt" value="${sdt}" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password </label>
    <br>
    <input class="ip" type="password" id="matKhau" name="matKhau" value="${matKhau}" required>
  </div>
  <small id="error">${message}</small>
  <div class="mb-3 form-check mt-4">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
  </div>
  <div class="d-flex justify-content-between">
    <button type="submit" id="loginBtn" class="btn btn-primary ">Submit</button>
    <br>
    </a> <span class="psw">Chưa có <a href="/dangky" style="color: #F5A425;">tài
                                khoản?</a></span>
  </div>
</form>

<!-- FOOTER -->
<%@include file="/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>