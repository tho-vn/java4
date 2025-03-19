<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 12/12/2024
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật thông tin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }

        .caption {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin: auto;
        }

        h3 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        .ip {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .ip:focus {
            border-color: #66afe9;
            outline: none;
        }

        .lgin, .cancelbtn {
            background-color: #5cb85c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .lgin:hover, .cancelbtn:hover {
            background-color: #4cae4c;
        }

        .cancelbtn {
            background-color: #d9534f;
        }

        .cancelbtn:hover {
            background-color: #c9302c;
        }

        .psw {
            display: block;
            margin-top: 15px;
            text-align: center;
        }

        .psw a {
            color: #F5A425;
            text-decoration: none;
        }

        .psw a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@include file="/header.jsp"%>
<div class="caption" style="text-align: left;width: 60%;">
    <form action="capnhataccount" method="post" s>
        <div class="row">
            <center>
                <h3>THÔNG TIN TÀI KHOẢN </h3>

            </center>
            <hr>
            <label ><b>Số điện thọai</b></label>
            <input readonly="true" class="ip" type="text" placeholder="Số điện thoại?" name="sdt" required value="${user.sdt}">
            <label ><b>Họ tên</b></label> <br>
            <input class="ip" type="text" placeholder="Họ tên" name="tenND" required value="${user.tenND}">
            <label ><b>Email</b></label>
            <input class="ip" type="email" placeholder="Email" name="email" required value="${user.email}">
            <label ><b>Giới tính</b></label> <br> <br>

            <input  type="hidden" name="matKhau" value="${form.matKhau}" required>
            <input  type="hidden" name="admin" value="${form.admin}" required>

            <label> <input ${user.gioiTinh?'checked':' '}  type="radio" name="gioiTinh" id="input" value="true" > Nam
            </label> &nbsp &nbsp &nbsp &nbsp
            <label> <input ${user.gioiTinh?' ': 'checked'} type="radio" name="gioiTinh"  id="input" value="false"> Nữ
            </label>
        </div>
        <center>
            <a href="/index">
                <button type="button" class="cancelbtn">Trang chủ</button>
            </a> &nbsp <button class="lgin" type="submit">Submit</button>
            <br>
            ${message}
        </center>
        <br>  <span class="psw">Đổi <a href="/changepassword" style="color: #F5A425;">mật khẩu?</a></span>
    </form>
</div>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>
