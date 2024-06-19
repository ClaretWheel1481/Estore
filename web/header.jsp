<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function(){
        const username = document.getElementById("username");
        if(username) { // 确保元素存在
            username.value = window.decodeURIComponent("${cookie.remember.value}", "utf-8");
        }
    });

    function tocart() {
        location.href = "http://localhost:8080/Estore/showcart.jsp";
    }

    function toHome() {
        location.href = "http://localhost:8080/Estore/";
    }

    function toOrders() {
        location.href = "http://localhost:8080/Estore/orders.jsp";
    }
</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<header>
    <nav class="navbar navbar-inverse" role="navigation">
        <img src="home/img/logo.png" class="logo" href="javascript:void(0)" onclick="toHome()"/>
        <a href="javascript:void(0)" onclick="toHome()">首页</a>
        <a href="javascript:void(0)" onclick="phone('手机')">手机</a>
        <a href="javascript:void(0)" onclick="phone('平板')">平板</a>
        <a href="javascript:void(0)" onclick="phone('笔记本')">笔记本</a>
        <c:if test="${not empty user}">
            <a href="javascript:void(0)" onclick="toOrders()">我的订单</a>
        </c:if>
        <i class="carts" onclick="tocart()"></i>
        <span>
            <c:if test="${ not empty user }">
                <h4 class="user">${user.username}</h4>
                <a class="logout" href="${pageContext.request.contextPath}/LoginOutServlet">退出</a>
            </c:if>
			<c:if test="${ empty user }">
                <h4 class="login" data-toggle="modal" data-target="#log-wrapper">登录</h4>
                <h4 class="signup" data-toggle="modal" data-target="#log-wrapper">注册</h4>
            </c:if>
		</span>
    </nav>
</header>
</html>
