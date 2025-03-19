<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
  <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
</head>
<body>
<!-- MENU -->
<nav class="navbar bg-primary navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-rocontls="mainNav" aria-expanded="false">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" style="font-weight: bold;font-size: 25px" href="#">ADMINISTRATOR TOOL</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/index">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/qlVideo/index">Video</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/qlusers/index">User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Report</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


<!-- CHỈNH SỬA USER -->
<header>
  <h1 style="text-align: center;margin-top: 20px">User Management</h1>
</header>
<main class="container">
  <form action="${pageContext.request.contextPath}/qlusers/find" method="post" class="navbar-form ">
    <div class="form-group">
      <input type="text"
             style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray; background: transparent;"
             name="thongTin" class="form-control" placeholder="Nhập số điện thoại"
             id="textSearch">
    </div>
<%--    <button id="btnSearch"--%>
<%--            style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">--%>
<%--      <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--    </button>--%>
  </form>
  ${KqTim} <br>
  <form method="post" >
    <div class="row">
      <div class="col-6">
        <div class="mb-3">
          <label for="user" class="form-label">Email</label>
          <input
                  type="text"
                  class="form-control"
                  name="email"
                  id="email"
                  aria-describedby="emailHeper" value="${form.email}" required>
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="name" class="form-label">Password</label>
          <input
                  type="text"
                  class="form-control"
                  name="matKhau"
                  id="password"
                  aria-describedby="passwordHeper"  value="${form.matKhau}">
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-6">
        <div class="mb-3">
          <label for="user" class="form-label">Full Name</label>
          <input
                  type="text"
                  class="form-control"
                  name="tenND"
                  id="fullName"
                  aria-describedby="fullNameHeper"
                  value="${form.tenND}" required>
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="name" class="form-label">Số điện thoại</label>
          <input
                  type="text"
                  class="form-control"
                  name="sdt"
                  id="phone"
                  aria-describedby="phoneHeper" value="${form.sdt}" required
                  >
        </div>
      </div>
    </div>
    <div class="col">
      Role <br>
      <div class="form-check form-check-inline">
        <input
                class="form-check-input"
                type="radio"
                name="admin"
                id="admin"
                value="true" ${form.admin?' ': 'checked'}
        />
        <label class="form-check-label" for="">Admin</label>
      </div>
      <div class="form-check form-check-inline">
        <input
                class="form-check-input"
                type="radio"
                name="admin"
                id="user"
                value="flase" ${form.admin?' ': 'checked'}
        />
        <label class="form-check-label" for="">User</label>
      </div>
    </div>
    <br>
    <br> ${message}
    <br>
    <div class="row">
      <div class="col">
        <button formaction="${url}/qlusers/create" type="submit" class="btn btn-success">Create</button>
        <button formaction="${url}/qlusers/update" type="submit" class="btn btn-secondary">Update</button>
        <button formaction="${url}/qlusers/delete" type="submit" class="btn btn-danger">Delete</button>
        <button formaction="${url}/qlusers/index" type="submit" class="btn btn-warning">Reset</button>
      </div>
    </div>
    </form>
    <br>
    <div class="row">
      <div class="col">
        <div class="table-responsive">
          <table class="table table-primary">
            <thead>
            <tr>
              <th scope="col">Email</th>
              <th scope="col">Full Name</th>
              <th scope="col">Số điện thoại</th>
              <th scope="col">Quyền hạn</th>
              <th scope="col">Chỉnh sửa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
            <tr class="">
              <td>${user.email}</td>
              <td>${user.tenND}</td>
              <td>${user.sdt}</td>
              <td>${user.admin?'Quản trị viên':'Người dùng'}</td>
              <td><a href="/qlusers/edit/${user.sdt}" class="btn btn-warning">Edit</a></td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </form>
</main>


<!-- FOOTER -->
<footer class="footer bg-primary text-light">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mt-4">
        <h3>Về chúng tôi</h3>
        <p class="text-dark">Công ty của tôi là một công ty công nghệ chuyên về
          phát triển và cung cấp các giải pháp video trực tuyến.
          Chúng tôi cung cấp các dịch vụ như lưu trữ video, phát
          video trực tuyến, và phân tích dữ liệu video. Chúng tôi
          cũng cung cấp các công cụ để giúp các doanh nghiệp và tổ
          chức tạo ra nội dung video chất lượng cao và chia sẻ nó với khán giả của họ.</p>
      </div>
      <div class="col-md-4  mt-4">
        <h3>Liên kết</h3>
        <ul class="list-unstyled">
          <li><a style="text-decoration: none;" href="#" class="text-dark">Trang chủ</a></li>
          <li><a style="text-decoration: none;" href="#" class="text-dark">Thể loại</a></li>
          <li><a style="text-decoration: none;" href="#" class="text-dark">My account</a></li>
        </ul>
      </div>
      <div class="col-md-4  mt-4">
        <h3>Theo dõi chúng tôi</h3>
        <ul class="list-inline">
          <li class="list-inline-item"><a style="text-decoration: none;"class="text-dark">Email : Nhutho2005@gmail.com</a></li>
          <li class="list-inline-item"><a style="text-decoration: none;" class="text-dark">Email : Nhutho2005@gmail.com</a></li>  
          <li class="list-inline-item"><a style="text-decoration: none;"class="text-dark">Email : Nhutho2005@gmail.com</a></li>
        </ul>
      </div>
    </div>
    <hr class="bg-secondary">
    <p class="text-light text-center"> @2024 Võ Như Thọ. All rights reserved.</p>
  </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>