<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            color: #ffffff;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;

        }
        .welcome-header {
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="navbar bg-primary navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" style="font-weight: bold; font-size: 25px" href="#">ADMINISTRATOR TOOL</a>
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
                    <a class="nav-link active" href="/qlusers/index">User </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <div class="content">
        <h1 class="welcome-header">Chào Mừng Bạn Đến Với Trang Quản Trị</h1>
    </div>
<img src="https://baobihoanggia.com/wp-content/uploads/2023/09/logo-fpt-polytechnic-2.jpg" width="100%">
</div>
<br><br><br>
<%@include file="/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>