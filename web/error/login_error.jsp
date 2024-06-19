<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="../home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="../home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="../home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="../home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="../home/JS/main.js"></script>
    <link rel="stylesheet" type="text/css" href="../home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../home/CSS/main.css">
    <title>登录失败</title>
</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>
<div style="align-items: center; display: flex; justify-content: center;">
    <div style="align-items: center; display: flex; justify-content: center;">
        <div style="margin-top: 300px"></div>
        <span>
                <p style="font-size: 22px">出错啦！</p>
                <p style="font-size: 22px">登陆错误！</p>
                <a href="../index.jsp" style="font-size: 28px">>回到首页</a>
            </span>
        <div style="margin-top: 300px"></div>
    </div>
</div>
</body>
</html>
