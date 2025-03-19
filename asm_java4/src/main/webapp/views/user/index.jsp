<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>
<body>
<!-- LIST MENU -->
<%@include file="/header.jsp"%>

<!-- CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://designercomvn.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2017/07/26020212/poster-phim-hanh-dong.jpg" class="d-block w-100" style="width: 500px; height: 400px;">
        </div>
        <div class="carousel-item">
            <img src="https://image.baophapluat.vn/w840/Uploaded/2024/hfobhvwbucqaow/2022_06_15/nha-thiet-ke-poster-phim-le-791655133447-5792.jpg" class="d-block w-100" style="width: 500px; height: 400px;">
        </div>
        <div class="carousel-item">
            <img src="https://i.ytimg.com/vi/Y9Md1LU491w/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDnMEpSWy6rjegYzurjVTlHWW_mZg" class="d-block w-100" style="width: 500px; height: 400px;">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- TỔNG HỢP PHIM -->
<h1 class="text-center mt-4">TỔNG HỢP PHIM</h1>
<div class="container mt-4">
    <div class="row flex-wrap justify-content-center">
        <c:forEach var="video" items="${videos}">
            <div class="col-12 col-sm-6 col-lg-3 p-1 flex-grow-1">
                <div class="card" style="height: 380px;">
                    <a href="/index/${video.maVideo}">
                        <img  src="${video.poster}" class="card-img" style="width: 100%; border-radius: 5px 5px 0px 0px;height: 260px" alt="...">
                        <div class="card-body">
                            <h5 data-toggle="tooltip" data-placement="top" class="card-title" title="${video.chuDe}>${video.chuDe}</h5>
                    <p style="font-size: 14px;"></p>
                            <a style="font-size: 14px;text-decoration: none">${video.chuDe}</a>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

<%@include file="/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
