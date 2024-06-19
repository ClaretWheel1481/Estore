<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        function addProductToCart(id){
            location.href="${pageContext.request.contextPath}/AddProductToCartServlet?id="+id;
        }

        function change() {
            document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time=" + new Date().getTime();
        }

        function findProductById(id) {
            location.href = "http://localhost:8080/Estore/ProductFindByIdServlet?id=" + id;
        }

        function phone(obj) {
            location.href = "${pageContext.request.contextPath}/FindCategoryServlet?name=" + encodeURIComponent(encodeURIComponent(obj));
        }

        function tocart() {
            location.href = "http://localhost:8080/Estore/showcart.jsp";
        }
    </script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <title>${pro.description}</title>
</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>
<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>
<c:if test="${empty user}">
<%--    跳转至index.jsp--%>
    <c:redirect url="error/status_error.jsp"/>
</c:if>
<section class="w">
<div class="product-img">
    <div class="handle">
        <div class="thumb">
            <ul>
                <li class="n-hover">
                    <img src="/upload/${ pro.imgurl }">
                </li>
            </ul>
        </div>
        <a class="arrow up i-icon"></a>
        <a class="arrow down i-icon"></a>
    </div>
    <div class="view">
        <img src="/upload/${ pro.imgurl }">
    </div>
</div>
<div class="product-details">
    <h1>${pro.description}</h1>
    <p class="re"><span>产品编号：</span><span>QVTU22103307</span></p>
    <p class="price" data-price="3649">
        <span>价格</span>
        <span class="price">${ pro.price }</span>
    </p>
    <ul class="details">
        <li><span>颜色</span><a class="u-check n-check">${ pro.color }</a></li>
        <li><span>内存</span><a class="u-check n-check">512G</a></li>
        <li><span>版本</span><a class="u-check n-check">全网通</a></li>
        <li><span>销售地区</span><a class="u-check n-check">中国</a></li>
        <li><span>购买数量：</span>
            <div class="count-box">
                    <input class="min" name="" type="button" value="-"/>
                    <input class="text-box" name="" type="text" value="1"/>
                    <input class="add" name="" type="button" value="+"/>
                </div>
        </li>
    </ul>
    <%--判断user.username是否为空显示不同组件--%>
    <c:if test="${not empty user}">
        <div class="action">
            <a class="addCar" onclick="addProductToCart('${pro.id}')"><i></i>加入购物车</a>
        </div>
    </c:if>
</div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>
