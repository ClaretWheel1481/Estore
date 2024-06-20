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

        function deleteOrder(id) {
            location.href = "http://localhost:8080/Estore/deleteOrder?id=" + id;
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的订单</title>
</head>
<body>
<%--TODO:订单信息待处理--%>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>

<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>
<c:if test="${empty user}">
    <%--    跳转至index.jsp--%>
    <c:redirect url="error/status_error.jsp"/>
</c:if>
<div style="margin: 50px">
    <table class="table table-bordered table-hover" border="2" align="center">
        <thead>
            <tr>
                <th scope="col">订单ID</th>
                <th scope="col">地址</th>
                <th scope="col">价格</th>
                <th scope="col">下单时间</th>
                <th scope="col">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="o">
            <tr>
                <th scope="row">${o.id}</th>
                <td>${o.receiverinfo}</td>
                <td>${o.money }</td>
                <td>${o.ordertime }</td>
                <td>
                    <a href="javascript:void(0)" onclick="deleteOrder('${o.id}')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
