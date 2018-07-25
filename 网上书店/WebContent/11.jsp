<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">深蓝网上书店——我的购物车</h2>
<%
String Bname=request.getParameter("Bname").toString();
String Author=request.getParameter("Author").toString();
String BookType=request.getParameter("BookType").toString();
double Price=Double.parseDouble(request.getParameter("Price"));
int Inventory=Integer.parseInt(request.getParameter("Inventory"));

%>
<table align="center" border="1">
<tr bgcolor="#777">
<td align="center">书名</td><td align="center">作者</td>
<td align="center">书本类型</td><td align="center">价格</td><td align="center">库存</td>
<td>当前时间</td><td>购买数量</td>
</tr>
<tr>
<td align="center"><%=Bname %></td>
<td align="center"><%=Author %></td>
<td align="center"><%=BookType %></td>
<td align="center"><%=Price %></td>
<td align="center"><%=Inventory %></td>
<td align="center"><%=new Date(session.getCreationTime()) %></td>
<td align="center"><input type="text" name="number"></td>
</tr>
</table>
</body>
</html>