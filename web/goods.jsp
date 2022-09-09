<%--
  Created by IntelliJ IDEA.
  User: 北城以北海未眠
  Date: 2021/1/2
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" %>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", -1);
    %>

    <meta http-equiv="pragma" content="no-cache">
    　　
    <meta http-equiv="cache-control" content="no-cache">
    　　
    <meta http-equiv="expires" content="0">
    <meta charset="UTF-8">
    <title>product card</title>
    <script type="text/javascript">



        function x() {

            alert("购买成功！")
            window.location.href = "ShoppingMall.jsp";
        }
    </script>
    <!--图标库-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--核心样式-->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<div id="container">

    <div class="product-details">

            <h1> ${goodsname}</h1>

            <span class="hint-star star">
			<i class="fa fa-star" aria-hidden="true"></i>
			<i class="fa fa-star" aria-hidden="true"></i>
			<i class="fa fa-star" aria-hidden="true"></i>
			<i class="fa fa-star" aria-hidden="true"></i>
			<i class="fa fa-star-o" aria-hidden="true"></i>
		</span>

            <p class="information">

                卖家 ${name}
                <br>
                <img src="images/${img}" style="width: 150px;height: 150px">

            </p>

            <div class="control">
                <%--            <form method="post" action="buy">--%>
                <button type="submit" class="btn" onclick="x()">
                    <span class="price"> ¥${price}</span>
                    <span class="shopping-cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                    <span class="buy">立即购买</span>

                </button>

            </div>

    </div>

    <div class="product-image">
        <img src="img/p.jpg" alt="">
        <div class="info">
            ${comment}

            <!--			<h2>商品介绍</h2>-->
            <!--			<ul>-->
            <!--				<li><strong>参数1 : </strong>值1</li>-->
            <!--				<li><strong>参数2 : </strong>值2</li>-->
            <!--				<li><strong>参数3: </strong>值3</li>-->
            <!--				<li><strong>参数4: </strong>Eco-Friendly</li>-->
            <!--			</ul>-->
        </div>
    </div>

</div>


</body>
</html>
