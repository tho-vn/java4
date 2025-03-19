<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/header.jsp"%>
<div class="container">
    <div class="row animationTop"
         style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
        <h4>Nhật kí xem: ${count} video</h4>
        <c:forEach var="video" items="${videos}">
            <div class="col-md-3" style="margin-bottom: 20px;">
                <div>

                    <center>
                        <small class="pull-right">
                            <a href="/videoDaXem/boXem/${video.maVideo}">
                                <i class="fa-solid fa-xmark"
                                   style="cursor: pointer;" data-toggle="tooltip"
                                   data-placement="top" title="Xóa video khỏi danh sách đã xem"></i>
                            </a>

                        </small> <a href="/index/${video.maVideo}"> <img
                            src="${video.video.poster}"
                            style="height: auto; width: 95%; border-radius: 10px;" alt="">
                        <div class="tieuDe">
                            <h5
                                    style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Marvel Studios' Phù Thủy Tối Thượng Trong Đa Vũ Trụ Hỗn Loạn | Trailer"
                                    style="text-align: left;">${video.chuDe}</h5>
                        </div>
                    </a>
                        <div class="likeShare">
                            <small style="cursor: pointer;"> Ngày xem: <fmt:formatDate
                                    pattern="dd-MM-yyyy" value="${video.ngayXem}" />
                            </small> &nbsp &nbsp <small class="pull-right" style="cursor: pointer;">
                        </small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
                            <c:set var="string1" value="${video.luotXem}" /> <c:set
                                    var="string2" value="${fn:substring(string1, 0, 3)}" /> <fmt:formatNumber
                                    value="${string2}" pattern="#,###" /> tr &nbsp </small> &nbsp
                        </div>
                    </center>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>
