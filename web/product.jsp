<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>产品</title>
    <link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
    <script type="text/javascript" src="CategoryJS/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="CategoryJS/onloada.js"></script>
    <script type="text/javascript">
        function phone(obj) {
            location.href = "${pageContext.request.contextPath}/FindCategoryServlet?name=" + encodeURIComponent(encodeURIComponent(obj));
        }

        function change() {
            document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
                + new Date().getTime();
        }

        function findProductById(id) {
            location.href = "http://localhost:8080/Estore/ProductFindByIdServlet?id=" + id;
        }

        function showck(obj) {
            location.href = "http://localhost:8080/Estore/ProductFindByPageCodeServlet?code=" + obj;
        }
    </script>
</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>

<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>

<section class="page">
    <aside id="aside" class="panel-group aside-menu">
        <h3 class="type">${c1name }</h3>
        <c:forEach items="${c2name}" var="p" varStatus="vs">
            <dl class="panel panel-default">
                <dt data-toggle="collapse" data-target=".${vs.index}" aria-expanded="true" data-parent="#aside"
                    onclick="selsct(${p.code},${vs.index})">
                    <i></i><span class="collapse-btn">${p.name }</span>
                </dt>
                <div class="${vs.index} collapse" id="${vs.index}">

                </div>
            </dl>
        </c:forEach>
    </aside>

    <div class="content">
        <c:forEach items="${pb1.pro}" var="p" varStatus="vs">
            <div class="product">
                <img src="/upload/${p.imgurl}" onclick="findProductById('${p.id}')">
                <span class="brand">${p.name}</span>
                <span class="title">${p.description}</span>
                <span class="price">${p.price}</span>
                <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em
                        class="fast-buy"></em></a>
            </div>
        </c:forEach>
    </div>
    <ul class="pagination">
        <li>
            <a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=1&currentPage=${pb1.currentPage}">首页</a>
        </li>
        <li><c:if test="${pb1.pageNum==1}"><a>上一页</a></c:if></li>
        <li><c:if test="${pb1.pageNum!=1}"><a
                href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum-1}&currentPage=${pb1.currentPage}">上一页</a></c:if>
        </li>
        <c:if test="${pb1.pageNum==pb1.totalPage}">
            <li><a>下一页</a></li>
            <li><a>尾页</a></li>
        </c:if>
        <li><c:if test="${pb1.pageNum!=pb1.totalPage}">
            <a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum+1 }&currentPage=${pb1.currentPage}">下一页</a>
            <a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.totalPage }&currentPage=${pb1.currentPage}">尾页</a>
        </c:if></li>
    </ul>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>