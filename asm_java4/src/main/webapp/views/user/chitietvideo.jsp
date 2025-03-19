<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi tiết</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>
<style>
  .video-container {
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  .video-title {
    font-weight: bold;
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
  }

  .video-container span {
    font-size: 12px;
    color: #666;
    margin-bottom: 10px;
  }

  .video-container span:nth-child(2) {
    font-weight: bold;
    color: #333;
  }

  .video-container .like-share-buttons {
    margin-top: 20px;
  }

  .video-container .like-share-buttons button {
    margin-right: 10px;
  }

  .video-container .moTa {
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .like-share-buttons {
    margin-top: 10px;
  }
  .poster {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #ccc;
  }

  .poster img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 10px;
  }

  .poster .ml-5 {
    margin-left: 20px;
  }

  .poster p {
    font-weight: bold;
    font-size: 12px;
    margin-bottom: 0;
  }
</style>
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
<h1 class="text-center mt-4">CHI TIẾT VIDEO</h1>
<div class="container" data-section="section1">
  <div class="row">
    <div class="col-md-8">
      <div class="video-container">
        <div class="text-center" >
          <iframe width="600" height="315"
                  src="${video.link}?rel=0&autoplay=1"
                  title="YouTube video player" frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen></iframe>
        </div>
        <h2 style="font-size: 25px;color: #007bff " class="video-title">${ video.chuDe}</h2>
        <span class="moTa" style="font-size: 20px" class="mb-2"><b>Chi tiết phim:</b> ${ video.moTa}</span>
        <br>
        <span style="font-size: 20px" class="mb-2"><b>Thể loại :</b> ${video.theLoai}</span>
        <br> <b>Lượt xem:</b>
        <fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
        <br>
        <div class="like-share-buttons">
          <button href="/chiTiet/yeuThich/${video.maVideo}" class="btn btn-success">Like</button>
          <a target="_blank" href="/chiaSeMail/${video.maVideo}">
            <label style="cursor: pointer;"> <i
                    class="fa-light fa-share"
                    style="font-size: 20px; cursor: pointer;"></i> Share
            </label>
          </a>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="sidebar">
        <c:forEach var="video" items="${randomVideos}">
          <div class="poster row align-items-center">
            <div class="col-md-4">
              <a style="text-decoration: none" href="/index/${video.maVideo}">
                <img src="${video.poster}" class="img-fluid" style="width: 100px; height: 100px;">
              </a>
            </div>
            <div class="col-md-8">
              <a style="text-decoration: none" href="/index/${video.maVideo}">
                <p style="font-weight: bold;font-size: 15px;">${video.chuDe}</p>
              </a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
<!-- FOOTER -->
<%@include file="/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>