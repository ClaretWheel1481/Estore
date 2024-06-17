<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
      
 
	<ul class="order-content">		
	
        <ul>
            <li>
                <img src="/upload/${sessionScope.pro.imgurl}">
            </li>
            <li><div class="order-details">${sessionScope.pro.description}</div></li>
            <li><span class="price">${sessionScope.pro.price}</span></li>
            <li><span class="order-count">1</span></li>
        </ul>
      	<c:set value="${sessionScope.pro.price}" var="money"></c:set>

            <div class="order-sum">${sessionScope.pro.price}</div>
        </ul>
        <div class="order-foot">
            <ul>
                <li><div class="order-adress">
                    <input aria-label="送货地址" placeholder="送货地址" type="text">
                </div></li>
                <li><a class="sum-btn"	href="${pageContext.request.contextPath}/AddOrderServlet">生成订单</a></li>
            </ul>
        </div>
    </section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>

	<script type="text/javascript">
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}
	</script>
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>




</body>
</html>