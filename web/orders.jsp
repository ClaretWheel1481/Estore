<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
    <script type="text/javascript">
        function phone(obj) {
            location.href = "${pageContext.request.contextPath}/FindCategoryServlet?name=" + encodeURIComponent(encodeURIComponent(obj));
        }

        function tocart() {
            location.href = "http://localhost:8080/Estore/showcart.jsp";
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单信息</title>
</head>
<body>
<%--TODO:订单信息待处理--%>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>

<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>
<table class="table" border="2" align="center">
    <tr>
        <td>图片</td>
        <td>品牌</td>
        <td>数量</td>
        <td>颜色</td>
        <td>名称</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${pro}" var="p">
        <tr>
            <td height="300" width="300">
                <img alt="图片不存在或已删除" src="/upload/${p.imgurl}" width="300" height="300">
            </td>
            <td>${p.name}</td>
            <td>${p.description }</td>
            <td>${p.pnum }</td>
            <td>${p.color }</td>
            <td>${p.price }</td>
            <td>
                <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}">编辑</a>
                &nbsp;<a href="javascript:void(0)" onclick="del('${p.id}')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
