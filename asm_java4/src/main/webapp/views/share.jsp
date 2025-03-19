<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    .ip[type=text], .ip[type=password], .ip[type=date] {
      width: 100%;
      padding: 8px 20px;
      margin: 8px 0;
      border: 1px solid #ccc;
      box-sizing: border-box;
      background: transparent;
      border-radius: 10px 0 10px 0;
    }

    .lgin {
      background-color: #04AA6D;
      color: white;
      padding: 8px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
      transition: .3s;
      border-radius: 10px 0 10px 0;
    }

    .lgin:hover {
      background: burlywood;
    }

    .lgin2 {
      background-color: #007ACC;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
      transition: .3s;
    }

    .lgin2:hover {
      background: burlywood;
    }

    .cancelbtn {
      width: auto;
      padding: 7px 18px;
      background-color: #f44336;
      border: none;
      color: white;
      border-radius: 10px 0 10px 0;
    }

    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
    }

    img.avatar {
      width: 40%;
      border-radius: 50%;
    }

    span.psw {
      float: right;
      padding-top: 16px;
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
      span.psw {
        display: block;
        float: none;
      }
      .cancelbtn {
        width: 100%;
      }
    }
    </style>
</head>
<body  action="chiaSeMail">
<%@include file="/header.jsp"%>
<div class="video-overlay header-text">
  <center>
    <div style="height: 40px;" class="video-container"></div>
    <div class="row container" style="text-align: left;">
      <center>
        <h3>CHIA SẺ VIDEO QUA GMAIL</h3>
      </center>
      <div class="col-md-4">
        <form method="post">
        <div class="row">
          <label for="uname"><b>Link video</b></label> <input class="ip"
                                                              type="text" disabled name="link" value="${link}" required>
          <label for="psw"><b> Email của bạn </b></label> <input class="ip"
                                                                 type="text" disabled name="email" value="${email}" required>
          <label for="psw"><b> Mật khẩu Email </b></label> <input
                class="ip" type="password" placeholder="Mật khẩu email?"
                name="matKhau" value="${matKhau }" required>
          <label for="psw"><b> Email người nhận </b></label> <input
                class="ip" type="text" placeholder="Email người nhận?"
                name="emailNhan" required>
        </div>
        <center>
          <small>${message}</small>
          <button class="lgin" type="submit">Chia sẻ</button>
        </center>


        <a href="/index">
          <button  type="button" class="cancelbtn">Trang chủ</button>
        </a>

        </form>
      </div>
      <div class="col-md-8" style="padding-top: 30px">
        <img src="${video.poster}" alt="" style="border-radius: 10px" width="50%">
        <h3 >${video.chuDe}</h3>
      </div>
    </div>
  </center>
  <%@include file="/footer.jsp"%>
</div>
</body>
</html>
