<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书本下架</title>
</head>
<body>
<h2 align="center">糟糕，操作失败了</h2>
<%
int pageNow=1; 
request.setAttribute("pageNow",pageNow);
%>
<a href="A_out.jsp?pageNow=1">返回下架</a>
<br><a href="A_main.jsp">返回主页</a>
</body>
</html>