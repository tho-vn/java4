<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Management</title>
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
    <h1 style="text-align: center;margin-top: 20px">Video Management</h1>
</header>
<main class="container">
    <form action="${url}/qlVideo/timKiem" method="post" class="navbar-form ">
        <div class="form-group">
            <input type="text"
                   style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray; background: transparent;"
                   name="thongTin" class="form-control" placeholder="Chủ đề hoặc Thể loại?"
                   id="textSearch">
        </div>
<%--        <button id="btnSearch"--%>
<%--                style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">--%>
<%--            <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--        </button>--%>
    </form>
    ${KqTim} <br>
    <form action="" method="post">
        <c:set var="now" value="<%=new java.util.Date()%>" />
        <div class="mb-3">
            <label for="formFile" class="form-label" >ID Video</label>
            <input class="form-control" type="text" id="maVideo" name="maVideo" value="${ form.maVideo}">
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Poster Image</label>
            <input class="form-control" type="text" id="poster" name="poster" value="${form.poster}"
                   required>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="user" class="form-label">Video Title</label>
                    <input
                            type="text"
                            class="form-control"
                            name="chuDe"
                            id="chuDe"
                            aria-describedby="videotitleHeper" value="${ form.chuDe}" required>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="name" class="form-label">View Count</label>
                    <input
                            type="text"
                            class="form-control"
                            name="luotXem"
                            id="luotXem"
                            aria-describedby="phoneHeper" value="${ form.luotXem}"
                            required>
                </div>
            </div>
        </div>
        <label for="name" class="form-label">Link</label>
        <input
                type="text"
                class="form-control"
                name="link"
                id="link"
                aria-describedby="phoneHeper" value="${ form.link}" required>
        <div class="col">
            Status <br>
            <div class="form-check form-check-inline">
                <input
                        class="form-check-input"
                        type="radio"
                        name="hoatDong"
                        id="hoatDong"
                        value="true"
                        checked="checked"
                ${form.hoatDong?'checked':' '}
                />
                <label class="form-check-label" for="">Active</label>
            </div>
            <div class="form-check form-check-inline">
                <input
                        class="form-check-input"
                        type="radio"
                        name="hoatDong"
                        id="khonghoatDong"
                        value="flase" ${form.hoatDong?'checked':' '}
                />
                <label class="form-check-label" for="">Inactive</label>
            </div>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label mt-4">Chi tiết video</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="moTa" rows="3">${ form.moTa}</textarea>
        </div>
        <div class="row">
            <a href="/index/${form.maVideo}"> <img
                    alt="" src="${poster}" width="50%">
            </a>
        </div>
<%--        <br><br>--%>
<%--        <label for="psw2"><b>Ngày ra mắt</b></label> <input--%>
<%--            class="ip" type="text" name="ngayTao"--%>
<%--            value='<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${now}" />'--%>
<%--            required>--%>
<%--        <br><br>--%>
        <div class="row">
            <div class="col">
                <button formaction="${url}/qlVideo/create" type="submit" id="createBtn" class="btn btn-success">Create</button>
                <button formaction="${url}/qlVideo/update"  type="submit" class="btn btn-secondary">Update</button>
                <button formaction="${url}/qlVideo/delete" type="submit" class="btn btn-danger">Delete</button>
                <button  href="${url}/index" type="submit" class="btn btn-warning">Reset</button>
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
                            <th scope="col">ID</th>
                            <th scope="col">Video Title</th>
                            <th scope="col">Poster</th>
                            <th scope="col">Status</th>
                            <th scope="col">Chỉnh sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="video" items="${videos}">
                        <tr class="">
                            <td>${video.maVideo}</td>
                            <td>${video.chuDe}</td>
                            <td><img alt="" src="${video.poster}"
                                width="50%"></td>
                            <td>${video.hoatDong?'Đang hoạt động':'Ngừng hoạt động'}</td>
                            <td><a class="btn btn-warning" href="${url}/qlVideo/edit/${video.maVideo}">Edit</a></td>
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