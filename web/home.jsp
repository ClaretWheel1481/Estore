<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Claret Store</title>
    <link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>

<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>
<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="home/img/carousel1.png" alt="..." onclick="phone('平板')">
            <div class="carousel-caption"></div>
        </div>
        <div class="item">
            <img src="home/img/carousel2.png" alt="..." onclick="phone('手机')">
            <div class="carousel-caption"></div>
        </div>
        <div class="item">
            <img src="home/img/carousel3.png" alt="..." onclick="phone('手机')">
            <div class="carousel-caption"></div>
        </div>
    </div>
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<section class="sec1">
    <a><img src="home/img/homepage1.png" onclick="findProductById('14')"></a>
    <a><img src="home/img/homepage3.png" onclick="findProductById('13')"></a>
    <a><img src="home/img/homepage4.png" onclick="findProductById('9')"></a>
    <a><img src="home/img/homepage2.png" onclick="findProductById('10')"></a>
</section>
<section class="sec2">
    <h3>手机</h3>
    <a href="javascript:void(0)" onclick="phone('手机')">手机</a>
    <div>
        <c:set var="s" value="100"></c:set>
        <c:forEach items="${pro1}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='51' }">
                <div class="product">
                    <img src="/upload/${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>平板</h3>
    <a href="javascript:void(0)" onclick="phone('平板')">平板</a>
    <div>
        <c:forEach items="${pro2}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='52' }">
                <div class="product">
                    <img src="/upload/${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em
                            class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>笔记本</h3>
    <a href="javascript:void(0)" onclick="phone('笔记本')">笔记本</a>
    <div>
        <c:forEach items="${pro3}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='53' }">
                <div class="product">
                    <img src="/upload/${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em
                            class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
<script type="text/javascript">
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
</body>
</html>