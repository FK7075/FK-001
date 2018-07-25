<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深蓝网上书店</title>
<link href="main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String userName = (String) session.getAttribute("userName");
	%>
	<div class="apDiv1">
		<div class="apDiv2">
			<h1 align="center">
				<font face="隶书">欢迎光临深蓝网上书店</font>
			</h1>
			<p align="center">
				<font size="2">个人用户：<%=userName%></font>
			</p>
		</div>
		<div class="apDiv3">
			<a href="U_indent.jsp">历史订单</a>
		</div>
		<div class="apDiv4">
			<a href="ChangePass.jsp">修改密码</a>
		</div>
		<div class="apDiv5"><a href="U_shopping.jsp">购物车</a></div>
		<div class="apDiv6">
			<a href="U_allBook.jsp?pageNow=1">本店精品</a>
		</div>
		<div class="apDiv7">
			<a href="Login.jsp">退出登录</a>
		</div>
	</div>
</body>
</html>