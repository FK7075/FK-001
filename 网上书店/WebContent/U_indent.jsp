<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.fk.javaBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<%
String userName=(String)session.getAttribute("userName");
%>
	<h2 align="center">深蓝网上书店——我的历史订单</h2>
	<p align="center"><font size="1.4">个人用户：<%=userName %></font></p>
	<%
		String Uid = session.getAttribute("userName").toString();
		List<Buy> list = new ArrayList<Buy>();
		BuyUtil byut = new BuyUtil();
		list = byut.showPart(Uid);
		Buy[] bus = new Buy[list.size()];
		list.toArray(bus);
	%>
	<table align="center" border="1">
		<tr align="center" bgcolor="#777">
			<td width="100px">订单号</td>
			<td width="100px">用户</td>
			<td width="100px">书本编号</td>
			<td>购买时间</td>
			<td width="100px">书名</td>
			<td width="100px">书本单价</td>
			<td width="100px">购买数量</td>
			<td width="100px">合计</td>
		</tr>
		<%
		for(int i=0;i<bus.length;i++){
			String color;
			if (i % 2 != 0)
				color = "#777";
			else
				color = "";
		
		%>
		<tr align="center" bgcolor=<%=color %>>
			<td><%=bus[i].getID() %></td>
			<td><%=bus[i].getUid() %></td>
			<td><%=bus[i].getBid() %></td>
			<td><%=bus[i].getByTime() %></td>
			<td><%=bus[i].getBname() %></td>
			<td><%=bus[i].getPrice() %></td>
			<td><%=bus[i].getByNumber() %></td>
			<td><%=bus[i].getAmount() %>元</td>
		</tr>
		<%
		}
		%>
	</table>
	<p align="center">
		<a href="U_main.jsp">返回主页</a>
	</p>

</body>
</html>