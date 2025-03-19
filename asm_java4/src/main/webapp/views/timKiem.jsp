
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<html>
<head>
    <title>Tìm kiếm video</title>
</head>
<style>
    ul li {
        list-style: none;
        padding: 0;
        margin: 0;

    }
    ul li a:hover {
        text-decoration: underline;
    }
    .tieuDe h5 {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: left;
        overflow: hidden;
        height: 75px;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>
<body>
<%@include file="/header.jsp"%>

<div class=" main-banner animationTop delay-02" id="top"
     data-section="section1">
    <div style="height: 100px;" class="video-container"></div>
</div>
<div class="container" style="width: 70%">
    Đã tìm thấy: ${message} video.
    <br> <br>
    <c:forEach var="video" items="${videoTimKiem}">
        <a style="text-decoration: none" href="/index/${video.maVideo}">
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-md-4 col-sm-4">
                    <img src="${video.poster }"
                         style="width: 100%; border-radius: 10px;" alt="">
                </div>
                <div class="col-md-8 col-sm-8">
                    <ul style="padding-left: 0; line-height: 25px;">
                        <li style="padding-left: 0;"><h4 style="color: black">${video.chuDe }</h4></li>
                        <li><small>${video.luotXem} lượt xem | Thể loại:
                                ${video.theLoai} </small></li>
                        <li><small> </small></li>
                        <li><small>Ngày ra mắt: ${video.ngayTao}</small></li>
                        <div class="tieuDe">
                            <h5
                                    style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                                    data-toggle="tooltip" data-placement="top"
                                    title="Ấn vào link để biết thêm thông tin chi tiết" style="text-align: left;">
                                    ${video.moTa}</h5>
                        </div>
                    </ul>
                </div>
            </div>
        </a>
    <hr>
    </c:forEach>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>
