<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.fk.javaBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<%
String userName=(String)session.getAttribute("userName");
%>
	<%
		String AD = request.getParameter("AD");
		String ad = request.getParameter("ad");
		if (AD != null) {
	%>
	<script type="text/javascript">
		alert("移除成功");
	</script>
	<%
		}
		if (ad != null) {
	%>
	<script type="text/javascript">
		alert("亲，您似乎没有选中任何商品？！");
	</script>
	<%
		}
	%>
	<h2 align="center">深蓝网上书店——我的购物车</h2>
	<p align="center"><font size="1.4">个人用户：<%=userName %></font></p>
	<%
		Cookie[] bookJL = request.getCookies();//bookJL为Cookie数组
		List<String> IDS = new ArrayList<String>();//IDS是用于存储Cookie中有关书本id的集合
		List<Book> list = new ArrayList<Book>();//list是用于存放所有书本的集合
		BookUtil bu = new BookUtil();
		list = bu.showAll();
		Book[] books = new Book[list.size()];
		list.toArray(books);//将集合中的所有书本放入books数组中
		List<String> AllBid = new ArrayList<String>();
		for (int i = 0; i < books.length; i++) {
			AllBid.add(books[i].getBid() + "");//将所有书本ID加入到集合中
		}
		String[] allBid = new String[AllBid.size()];
		AllBid.toArray(allBid);//将存放所有书本ID的集合转化为数组allBid
		Date time = new Date();
		String Time = time.toString();
		for (int j = 0; j < allBid.length; j++) {
			String CookieName = userName + "_" + allBid[j];
			for (int n = 0; n < bookJL.length; n++) {
				if (bookJL[n].getName().equals(CookieName))//找到客户端中满足条件的Cookie
					IDS.add(bookJL[n].getValue());//将满足条件的Cookie中的值（Bid）加入到IDS集合中
			}
		}
		String[] Book_id = new String[IDS.size()];
		IDS.toArray(Book_id);//得到Cookie中存放的所有满足要求的Bid集合
	%>
	<form action="OperationServlrt?cl=4&Time=<%=Time%>" method="post"
		name="form2">
		<table align="center" border="1">
			<tr align="center" bgcolor="#777">
				<td width="130px">用户名</td>
				<td width="130px">书名</td>
				<td width="250px">当前时间</td>
				<td width="130px">购书数量</td>
				<td width="130px">书本库存量</td>
				<td width="130px">点击移除</td>
				<td width="130px">选择购买</td>
			</tr>
			<%
				for (int i = 0; i < books.length; i++) {//遍历所有图书
					for (int j = 0; j < Book_id.length; j++) {
						int Bid = Integer.parseInt(Book_id[j]);
						if (books[i].getBid() == Bid) {
			%>
			<tr align="center">
				<td><%=userName%></td>
				<td><%=books[i].getBname()%></td>
				<td><%=Time%></td>
				<td>
					<%
						String One = books[i].getBid() + "_" + "1";
									String Tow = books[i].getBid() + "_" + "2";
									String Three = books[i].getBid() + "_" + "3";
									String Four = books[i].getBid() + "_" + "4";
									String Five = books[i].getBid() + "_" + "5";
					%> <select name="SELECT">
						<option value=<%=One%>>1
						<option value=<%=Tow%>>2
						<option value=<%=Three%>>3
						<option value=<%=Four%>>4
						<option value=<%=Five%>>5
				</select>
				</td>
				<td><%=books[i].getInventory() %></td>
				<td><a href="OperationServlrt?cl=3&B=<%=books[i].getBid()%>">移除</a></td>
				<td><input type="checkbox" name="CHECK"
					value=<%=books[i].getBid()%>></td>
			</tr>
			<%
				}
					}
				}
			%>
			<tr align="center" bgcolor="#888">
				<td colspan="7"><input type="submit" value="购买" name="gm"></td>
			</tr>
		</table>
	</form>
	<p align="center">
		<a href="U_main.jsp">返回主页</a>
	</p>

</body>
</html>