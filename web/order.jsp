<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单信息</title>
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>

<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>

<section class="order">
    <div class="head">订单</div>
    <div class="title">
        <ul>
            <li>商品名称</li>
            <li>单价</li>
            <li>数量</li>
            <li>总价</li>
        </ul>
        </ul>
    </div>

    <c:set value="0" var="money"></c:set>
    <form action="${pageContext.request.contextPath}/AddOrderServlet" method="post">
        <ul class="order-content">
            <c:forEach items="${cart}" var="c">
                <input type="hidden" name="money" value="${c.key.price*c.value}">
                <input type="hidden" name="user_id" value="${user.id}">
                <ul>
                    <li>
                        <img src="/upload/${c.key.imgurl}">
                    </li>
                    <li>
                        <div class="order-details">${c.key.description}</div>
                    </li>
                    <li><span class="price">${c.key.price }</span></li>
                    <li><span class="order-count">${c.value}</span></li>
                </ul>
                <c:set value="${money+c.key.price*c.value}" var="money"></c:set>
            </c:forEach>
            <div class="order-sum">${money}</div>
        </ul>
        <div class="order-foot">
            <ul>
                <li>
                    <input class="order-adress" name="receiverinfo" aria-label="送货地址" placeholder="送货地址" type="text" oninput="checkInput()">
                </li>
                <li><button id="submit-btn" type="submit" class="sum-btn" disabled>生成订单</button></li>
            </ul>
        </div>
    </form>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>

<script type="text/javascript">
    function phone(obj) {
        location.href = "${pageContext.request.contextPath}/FindCategoryServlet?name=" + encodeURIComponent(encodeURIComponent(obj));
    }
</script>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
<script type="text/javascript">
    function checkInput() {
        const input = document.querySelector('.order-adress');
        const submitBtn = document.getElementById('submit-btn');

        if (input.value.trim() === '') {
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    }
</script>
</body>
</html>