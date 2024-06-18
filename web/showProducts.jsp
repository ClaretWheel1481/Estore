<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<head>
    <title>后台管理</title>
    <script type="text/javascript">
        function del(id) {
            var flag = window.confirm("确认删除吗");
            if (flag) {
                //确认删除
                location.href = "${pageContext.request.contextPath}/ProductDelByIdServlet?id=" + id;
            }
        };
        function sel() {
            var msg = document.getElementById("msg").value;
            if (msg == null || msg === "")
                alert("请输入你要查询的内容！");
            document.getElementById("s").submit();
        }
    </script>
</head>

<body>
<a href="home.jsp">返回首页</a>
<c:if test="${empty pro}">
    无商品信息<br>
    <a href="${pageContext.request.contextPath}/CategoryServlet">添加</a>
</c:if>

<c:if test="${not empty pro}">
    <div align="center" class="form-group">
        <form action="${pageContext.request.contextPath}/ProductSimpleServlet" method="get" id="s">
            <span style="width: 30%;display: inline-flex">
                <select name="field">
                    <option disabled="disabled">请选择查询条件</option>
                    <option value="name">按商品品牌</option>
                    <option value="description">按商品名称</option>
                </select>
                <input class="form-control" type="text" name="msg" id="msg">
            </span>
            <input type="button" value="查询" onclick="sel()">
        </form>
    </div>
    <br>
    <table class="table" border="1" align="center" width="85%">
        <tr>
            <td>
                <a href="${pageContext.request.contextPath}/CategoryServlet">添加</a>
            </td>
        </tr>
        <tr>
            <td>商品编号</td>
            <td>商品品牌</td>
            <td>商品价格</td>
            <td>商品数量</td>
            <td>商品分类</td>
            <td>商品颜色</td>
            <td>商品图片</td>
            <td>商品名称</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${pro}" var="p">
            <tr>
                <td>${p.id }</td>
                <td>${p.name}</td>
                <td>${p.price }</td>
                <td>${p.pnum }</td>
                <td>${p.c3code }</td>
                <td>${p.color }</td>
                <td height="300" width="300">
                    <img alt="图片不存在或已删除" src="/upload/${p.imgurl}" width="300" height="300">
                </td>
                <td>${p.description }</td>
                <td>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}">编辑</a>
                    &nbsp;<a href="javascript:void(0)" onclick="del('${p.id}')">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>