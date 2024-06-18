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
    <title>你没有登录</title>
</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    <i class="fa fa-warning"></i>
                    出错啦！
                </h1>
                <h2>
                    <i class="fa fa-warning"></i>
                    你还没有登录！
                </h2>
                <a href="../index.jsp" style="font-size: 28px">>回到首页</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
