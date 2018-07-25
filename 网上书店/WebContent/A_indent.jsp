<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.fk.javaBean.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
</head>
<script type="text/javascript">
function Click(){
	if(!confirm("您要删除选中订单吗？"))
		   return false;
}
</script>
<body>
<%
String fk=request.getParameter("fk");
if(fk!=null){
%>
<script type="text/javascript">
alert("请选择要删除的订单！");
</script>
<%
}
String userName=(String)session.getAttribute("userName");
%>
	<h2 align="center">深蓝网上书店管理系统——订单管理</h2>
	<p align="center"><font size="1.4">管理员：<%=userName %></font></p>
	<%
		String Uid = session.getAttribute("userName").toString();
		List<Buy> list = new ArrayList<Buy>();
		BuyUtil byut = new BuyUtil();
		list = byut.showAll();
		Buy[] bus = new Buy[list.size()];
		list.toArray(bus);
	%>
	<form action="OperationServlrt?cl=6" method="post" name="gor">
	<table align="center" border="1">
		<tr align="center" bgcolor="#777">
			<td width="60px">订单号</td>
			<td width="100px">用户</td>
			<td width="100px">书本编号</td>
			<td>购买时间</td>
			<td width="120px">书名</td>
			<td width="100px">书本单价</td>
			<td width="60px">购买数量</td>
			<td width="60px">合计</td>
			<td width="60px">删除</td>
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
			<td><input type="checkbox" name="Check" value=<%=bus[i].getID() %>></td>
		</tr>
		<%
		}
		%>
		<tr align="center">
		<td colspan="9"><input type="submit" name="bu" value="删除选中" onclick="return Click()"></td>
		</tr>
	</table>
	</form>
	<P align="center">
		<a href="A_main.jsp">返回主页</a>
	</P>
</body>
</html>