<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fk.javaBean.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收银台</title>
</head>
<script type="text/javascript">
function Click(HJ){
	if(!confirm("共计"+HJ+"元，您确定要购买吗？"))
	   return false;
}
</script>
<body>
	<%
		String userName = session.getAttribute("userName").toString();
		String[] Numbers = (String[]) session.getAttribute("Numbers");
		String[] Bids = (String[]) session.getAttribute("Bids");
		String Time = session.getAttribute("Time").toString();
		Book[] books = new Book[Bids.length];
		BookUtil but = new BookUtil();
		for (int i = 0; i < books.length; i++) {
			int Bid = Integer.parseInt(Bids[i]);
			books[i] = but.bookById(Bid);
		}
	%>
	<h2 align="center">深蓝网上书店——收银台</h2>
	<p align="center"><font size="1.4">个人用户：<%=userName %></font></p>
	<form action="OperationServlrt?cl=5" method="post" name="for3">
		<table align="center" border="1">
			<tr align="center" bgcolor="#777">
				<td width="130px">用户名</td>
				<td width="150px">书名</td>
				<td width="250px">购买时间</td>
				<td width="130px">单价</td>
				<td width="130px">购书数量</td>
				<td width="130px">小计</td>
			</tr>
			<%
				double S = 0;
				for (int j = 0; j < books.length; j++) {
					int n = Integer.parseInt(Numbers[j]);
					double XJ = n * books[j].getPrice();
					S=S+XJ;
			%>
			<tr align="center">
				<td><%=userName%></td>
				<td><%=books[j].getBname()%></td>
				<td><%=Time%></td>
				<td><%=books[j].getPrice()%></td>
				<td><%=Numbers[j]%></td>
				<td><%=XJ %></td>
			</tr>
			<%
				}
			%>
			<tr align="center" bgcolor="#777">
			<td colspan="6">合计：<%=S %></td>
			</tr>
		</table>
		<p align="center"><input type="submit" value="确认购买" onclick="return Click(<%=S%>)"></p>
	</form>
	<p align="center">
		<a href="U_main.jsp">返回主页</a>
	</p>

</body>
</html>