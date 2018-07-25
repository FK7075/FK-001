<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深蓝网上书店管理系统</title>
<link href="main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String userName = (String) session.getAttribute("userName");
	%>
	<div class="apDiv1">
		<div class="apDiv2">
			<h1 align="center">
				<font face="隶书">深蓝网上书店管理系统</font>
			</h1>
			<p align="center">
				<font size="2">管理员：<%=userName%></font>
			</p>
		</div>
		<div class="apDiv3">
			<a href="A_Delete.jsp">账户管理</a>
		</div>
		<div class="apDiv4">
			<a href="A_out.jsp?pageNow=1">书籍管理</a>
		</div>
		<div class="apDiv5">
			<a href="ChangePass.jsp">修改登录密码</a>
		</div>
		<div class="apDiv6">
			<a href="A_on.jsp">新书上架</a>
		</div>
		<div class="apDiv7">
			<a href="A_indent.jsp">订单管理</a>
		</div>
		<div class="apDiv8">
			<a href="Login.jsp">退出登录</a>
		</div>
	</div>
</body>
</html>