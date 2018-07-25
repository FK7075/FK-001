<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍管理</title>
</head>
<script type="text/javascript">
<!--
	function Click() {
		if (for1.inven.value == "") {
			alert("库存不可为空！");
			return false;
		}
		if (for1.Price.value == "") {
			alert("价格不可为空");
			return false;
		}
		return true;
	}
	-->
</script>
<body>
	<%
		int Bid = Integer.parseInt(request.getAttribute("Bid").toString());
		String Bname = request.getAttribute("Bname").toString();
		String Author = request.getAttribute("Author").toString();
		String BookType = request.getAttribute("BookType").toString();
		String Price = request.getAttribute("Price").toString();
		String Inventory = request.getAttribute("Inventory").toString();
	%>
	<h2 align="center">书本参数修改</h2>
	<form action="BookDisposeServlet?cl=5&Bid=<%=Bid%>" method="post"
		name="for1">
		<table border="1" align="center">
			<tr bgcolor="#777">
				<td align="center" width="130px">书名</td>
				<td align="center" width="130px">作者</td>
				<td align="center" width="130px">书本类型</td>
				<td align="center">价格</td>
				<td align="center">库存</td>
			</tr>
			<tr>
				<td align="center"><%=Bname%></td>
				<td align="center"><%=Author%></td>
				<td align="center"><%=BookType%></td>
				<td align="center"><input type="text" name="Price"
					value="<%=Price%>"></td>
				<td align="center"><input type="text" name="inven"
					value="<%=Inventory%>"></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="修改" onclick="return Click()">
		</p>
	</form>
	<P align="center">
		<a href="A_main.jsp">返回主页</a>
	</P>
</body>
</html>