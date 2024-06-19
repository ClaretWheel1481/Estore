<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript">
        function selectCk(main) {
            var flag = main.checked;
            var delCks = document.getElementsByName("delCk");
            for (var i = 0; i < delCks.length; i++) {
                delCks[i].checked = flag;
            }
        }

        function changeCount(id, count, pnum) {
            //需要将count转换成数字
            count = parseInt(count);
            //控制边界
            if (count <= 0) {
                //删除
                var flag = window.confirm("要删除商品吗?");
                if (flag) {
                    count = 0;
                } else {
                    count = 1;
                }
            } else if (count >= pnum) {
                alert("最大购物数量" + pnum);
                count = pnum;
            }

            location.href = "${pageContext.request.contextPath}/ChangeCountServlet?id="
                + id + "&count=" + count;
        };

        function numberText(e) {
            var keyCode;
            if (e && e.preventDefault) {
                //判断是firefox浏览器
                keyCode = e.which;
            } else {
                //ie浏览器
                keyCode = window.event.keyCode;
            }
            //alert(keyCode);
            //0-9之间的键码值是48-57
            if (!(keyCode >= 48 && keyCode <= 57 || keyCode == 8)) {
                //阻止事件的默认行为
                if (e && e.preventDefault) {
                    // e对象存在，preventDefault方法存在 ---- 火狐浏览器
                    e.preventDefault();
                } else {
                    // 不支持e对象，或者没有preventDefault方法 ---- IE
                    window.event.returnValue = false;
                }

            }
        };

        function removeProduct(id) {
            var flag = window.confirm("要删除商品码?");
            if (flag) {
                location.href = "${pageContext.request.contextPath}/RemoveProductFromCartServlet?id=" + id;
            }
        }

        function delP() {
            var param = ""; //它是用于拼接参数.
            var delCks = document.getElementsByName("delCk");
            for (var i = 0; i < delCks.length; i++) {
                if (delCks[i].checked == true) {
                    param += "id=" + delCks[i].value + "&";
                }
            }
            if (param != "") {
                param = param.substring(0, param.length - 1);
                location.href = "${pageContext.request.contextPath}/RemoveSelectProductFromCartServlet?" + param;
            }
        };

        function createOrder() {
            location.href = "order.jsp";
        }

        function tocart() {
            location.href = "http://localhost:8080/Estore/showcart.jsp";
        }

        function phone(obj) {
            location.href = "${pageContext.request.contextPath}/FindCategoryServlet?name=" + encodeURIComponent(encodeURIComponent(obj));
        }
    </script>
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">

</head>
<body>
<%--导航栏--%>
<jsp:include page="header.jsp"></jsp:include>

<!--登录注册-->
<jsp:include page="login.jsp"></jsp:include>
<c:if test="${ empty cart }">
    <div style="align-items: center; display: flex; justify-content: center;">
        <div style="align-items: center; display: flex; justify-content: center;">
            <div style="margin-top: 300px"></div>
            <span>
                <p style="font-size: 22px">购物车空空如也</p>
                <p style="font-size: 22px">快去购物吧</p>
                <a href="home.jsp" style="font-size: 28px">>去购物</a>
            </span>
            <div style="margin-top: 300px"></div>

        </div>
    </div>
</c:if>

<c:if test="${not empty cart}">
    <section class="Carts">
        <div class="head">待结算商品</div>
        <div class="title">
            <ul>
                <li>
                    <div class="Checkbox">
                        <input type="checkbox" id="all-select" value="on" onclick="selectCk(this)"/>
                        <label for="all-select"></label>
                    </div>
                    全选
                </li>
                <li>商品信息</li>
                <li>型号</li>
                <li>单价</li>
                <li>数量</li>
                <li>总金额</li>
                <li>操作</li>
            </ul>
        </div>
        <ul class="carts-content">

            <c:set var="totalMoney" value="0"/>
            <c:set var="totalCount" value="0"/>

            <c:forEach items="${cart}" var="c">
                <%int num = (int) (Math.random() * 10000);%>
                <ul>
                    <li>
                        <div class="Checkbox">
                            <input type="checkbox" id="<%=num %>" name="delCk" value="${c.key.id}"/>
                            <label for="<%=num %>"></label>
                        </div>
                    </li>
                    <li>
                        <img src="/upload/${c.key.imgurl}">
                        <div class="carts-details">${c.key.description}</div>
                    </li>
                    <li>
                        <ul class="carts-type">
                            <li><span>颜色</span><a>${c.key.color}</a></li>
                            <li><span>内存</span><a>512G</a></li>
                            <li><span>版本</span><a>全网通</a></li>
                            <li><span>销售地区</span><a>中国</a></li>
                        </ul>
                    </li>
                    <li><span class="price">${ c.key.price }</span></li>
                    <li>
                        <div class="count-box">
                            <input class="min" name="" type="button" value="-"
                                   onclick="changeCount('${c.key.id}','${c.value-1}')"/>
                            <input class="text-box" name="" type="text" value="${c.value}"
                                   onblur="changeCount('${c.key.id}',this.value,'${c.key.pnum}')"
                                   onkeydown="numberText(event)"/>
                            <input class="add" name="" type="button" value="+"
                                   onclick="changeCount('${c.key.id}','${c.value+1}','${c.key.pnum}')"/>
                        </div>
                    </li>
                    <li><span class="price">${totalMoney+c.key.price*c.value}</span></li>
                    <li><a href="javascript:void(0)" onclick="removeProduct('${c.key.id}')">删除</a></li>
                </ul>
                <c:set var="totalMoney" value="${totalMoney+c.key.price*c.value}"/>
                <c:set var="totalCount" value="${totalCount+c.value}"/>
            </c:forEach>
        </ul>
        <div class="carts-foot">
            <ul>
                <li>
                    <div class="Checkbox">
                        <input type="checkbox" id="all-select-1" value="on" href="javascript:void(0)"
                               onclick="selectCk(this)"/>
                        <label for="all-select-1"></label>
                    </div>
                    全选
                </li>
                <li><a onclick="delP();">删除</a></li>
                <li>&nbsp;</li>
                <li>已选商品<span class="count">${totalCount}</span>件</li>
                <li>合计：<span class="price">${totalMoney}</span></li>
                <li><a class="sum" onclick="createOrder()">结算</a></li>
            </ul>
        </div>
    </section>
</c:if>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>