<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.fk.javaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍管理</title>
</head>
<script type="text/javascript">
function Click(Ps){
	var pass=prompt("请输入管理员密码：");
	if(pass==null)
		 return false;
	if(!(pass==Ps)){
		alert("密码不正确，无法完成该操作！");
	    return false;
	}else{
		if(!confirm("您确定下架这本书吗？"))
			return false;
	}
}
function Click1(Ps){
	var pass=prompt("请输入管理员密码：");
	if(pass==null)
		 return false;
	if(!(pass==Ps)){
		alert("密码不正确，无法完成该操作！");
	    return false;
	}
}
</script>
<body>
<%
request.setCharacterEncoding("utf-8");
int pageNow;
Object t=request.getAttribute("pageNow");
if(t==null){
    pageNow=Integer.parseInt(request.getParameter("pageNow"));
}else{
	pageNow=Integer.parseInt(t.toString());
}
List<Book> list=new ArrayList<Book>();
BookUtil bu=new BookUtil();
list=bu.fenyeShow(pageNow,5);
Book[] books=new Book[list.size()];
list.toArray(books);
for(int i=0;i<books.length;i++){
%>
<% 	
}
%>
<h2 align="center">深蓝网上书店管理系统——书籍管理</h2>
<table align="center" border=1 width="700px">
<tr bgcolor="#777">
<td align="center">书名</td><td align="center">作者</td>
<td align="center">书本类型</td><td align="center">价格</td><td align="center">库存</td>
<td colspan="2" align="center">书本操作</td>
</tr>
<%
String Ps=session.getAttribute("userPass").toString();
for(int i=0;i<books.length;i++){
	String color;
	if(i%2!=0)
		color="#777";
	else
		color="";
%>
<tr bgcolor=<%=color %>>
<td align="center"><%=books[i].getBname() %></td><td align="center"><%=books[i].getAuthor() %></td>
<td align="center"><%=books[i].getBookType() %></td><td align="center"><%=books[i].getPrice() %></td><td align="center"><%=books[i].getInventory() %></td>
<td align="center" width="100px"><a href="BookDisposeServlet?cl=3&Bid=<%=books[i].getBid() %>" onclick="return Click(<%=Ps%>)">下架</a></td>
<td align="center"><a href="BookDisposeServlet?cl=4&ll=1&Bid=<%=books[i].getBid()%>&Bname=<%=books[i].getBname()%>&Author=<%=books[i].getAuthor()%>
&BookType=<%=books[i].getBookType()%>&Price=<%=books[i].getPrice()%>&Inventory=<%=books[i].getInventory()%>" onclick="return Click1(<%=Ps%>)">修改书本参数</a></td>
</tr>
<%
}
%>
</table>
<p align="center"><font size="1">共<%=bu.recordNumber() %>页&nbsp;&nbsp;当前页码：<%=pageNow %></font></p>
<p align="center">
<%
if(pageNow!=1){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=0&cl=2&pp=1">[上一页]</a>
<%
}
for(int i=1;i<=bu.recordNumber();i++){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=<%=i%>&cl=2&pp=1"><%=i %></a>
<%
}
if(pageNow!=bu.recordNumber()){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=-1&cl=2&pp=1">[下一页]</a>
<%
}
%>
</p>
<P align="center"><a href="A_main.jsp">返回主页</a></P>
</body>
</html>