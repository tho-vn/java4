<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change password</title>
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
            max-width: 500px;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<!-- LIST MENU -->
<%@include file="/header.jsp"%>

<!-- CHANGE PASSWORD -->
<h1 class="text-center mt-4">CHANGE PASSWORD</h1>
<form class="login-form" action="changepassword" method="post">
    <div class="row">
        <div class="col-md-6"><div class="mb-3">
            <label for="exampleInputEmail" class="form-label">Số điện thoại</label>
            <input type="phone" class="form-control" id="exampleInputEmail1" name="sdt" value="${user.sdt}">
        </div>
        </div>
        <div class="col-md-6"><div class="mb-3">
            <label for="oldpassword" class="form-label">Old password</label>
            <input type="password" class="form-control" id="oldpassword" name="matKhauCu">
        </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6"><div class="mb-3">
            <label for="newpassword" class="form-label">New password</label>
            <input type="password" class="form-control" name="matKhau" aria-describedby="emailHelp">
        </div>
        </div>
        <div class="col-md-6"><div class="mb-3">
            <label for="confirmpassword" class="form-label">Confirm password</label>
            <input type="password" class="form-control" name="matKhau2">
        </div>
        </div>
    </div>
    ${message}
    <br>
    <button type="submit" class="btn btn-warning">Submit</button>
</form>

<!-- FOOTER -->
<%@include file="/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>