<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.fk.javaBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深蓝网上书店</title>
</head>
<body>
<%
String userName=(String)session.getAttribute("userName");
%>
	<%
		String ad = request.getParameter("ad");
		String AD = request.getParameter("AD");
		if (ad != null) {
	%>
	<script type="text/javascript">
		alert("亲，您似乎没有选中任何书本！");
	</script>
	<%
		}
		if (AD != null) {
	%>
	<script type="text/javascript">
		alert("亲，您选中的书本已成功加入到购物车！");
	</script>
	<%
		}
	%>
	<h2 align="center">深蓝网上书店欢迎您--本店精品</h2>
	<p align="center"><font size="1.4">个人用户：<%=userName %></font></p>
	<%
		request.setCharacterEncoding("utf-8");
		int pageNow;
		Object t = request.getAttribute("pageNow");
		if (t == null) {
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		} else {
			pageNow = Integer.parseInt(t.toString());
		}
		List<Book> list = new ArrayList<Book>();
		BookUtil bu = new BookUtil();
		list = bu.fenyeShow(pageNow, 5);
		Book[] books = new Book[list.size()];
		list.toArray(books);
		for (int i = 0; i < books.length; i++) {
	%>
	<%
		}
	%>
	<form action="OperationServlrt?cl=2&pageNow=<%=pageNow%>"
		method="post" name="form1">
		<table align="center" border=1 width="700px">
			<tr bgcolor="#777">
				<td align="center">书名</td>
				<td align="center">作者</td>
				<td align="center">书本类型</td>
				<td align="center">价格</td>
				<td align="center">库存</td>
				<td align="center">书籍介绍</td>
				<td align="center">加入购物车</td>
			</tr>
			<%
				for (int i = 0; i < books.length; i++) {
					String color;
					if (i % 2 != 0)
						color = "#777";
					else
						color = "";
			%>
			<tr bgcolor=<%=color%>>
				<td align="center"><%=books[i].getBname()%></td>
				<td align="center"><%=books[i].getAuthor()%></td>
				<td align="center"><%=books[i].getBookType()%></td>
				<td align="center"><%=books[i].getPrice()%></td>
				<td align="center"><%=books[i].getInventory()%></td>
				<td align="center"><a href="">查看</a></td>
				<td align="center"><input type="checkbox" name="CheckBox"
					value=<%=books[i].getBid()%>></td>
			</tr>
			<%
				}
			%>
			<tr align="center">
				<td colspan="7"><input type="submit" value="添加到购物车"></td>
			</tr>
		</table>
	</form>
	<p align="center">
		<font size="1">共<%=bu.recordNumber()%>页&nbsp;&nbsp;当前页码：<%=pageNow%></font>
	</p>
	<p align="center">
		<%
			if (pageNow != 1) {
		%>
		<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=0&cl=2&pp=2">[上一页]</a>
		<%
			}
			for (int i = 1; i <= bu.recordNumber(); i++) {
		%>
		<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=<%=i%>&cl=2&pp=2"><%=i%></a>
		<%
			}
			if (pageNow != bu.recordNumber()) {
		%>
		<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=-1&cl=2&pp=2">[下一页]</a>
		<%
			}
		%>
	</p>
	<P align="center">
		<a href="U_shopping.jsp">我的购物车</a>
	</P>
	<P align="center">
		<a href="U_main.jsp">返回主页</a>
	</P>
</body>
</html>