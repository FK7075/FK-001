<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.fk.javaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
		if(!confirm("您确定要删除该用户吗？"))
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
String Ps=session.getAttribute("userPass").toString();
int pageNow;
Object t=request.getAttribute("pageNow");
if(t==null){
pageNow=Integer.parseInt(request.getParameter("pageNow"));
}
else{
pageNow=Integer.parseInt(t.toString());
}
List<Users> list=new ArrayList<Users>();
UsersUtil ut=new UsersUtil();
list=ut.fenyeShow(pageNow, 4, 1,-1);
Users[] users=new Users[list.size()];
list.toArray( users);
%>
<h2 align="center">深蓝网上书店管理系统——普通用户管理</h2>
<p align="center"><font size="2">提示：权限1代表正常用户权限，权限-1代表该用户账号被冻结（点击“编辑”按钮将修改用户信息，请谨慎使用！）</font></p>
<table align="center" border="1" width="600px">
<tr bgcolor="#777"  align="center">
<td>用户名</td><td>密码</td><td>权限</td><td colspan="2" align="center">账号操作</td>
</tr>
<%
for(int i=0;i<users.length;i++){
	String color;
	if(i%2!=0)
		color="#777";
	else
		color="";
%>
<tr bgcolor=<%=color %>>
<td align="center"><%=users[i].getUid() %></td>
<td align="center">*******</td>
<td align="center"><%=users[i].getPerm() %></td>
<td align="center"><a href="LoginServlet?xx=<%=users[i].getUid() %>&fk=5&p=<%=users[i].getPerm() %>" onclick="return Click(<%=Ps%>)">删除</a></td>
<td align="center"><a href="LoginServlet?fk=6&k=2&Ui=<%=users[i].getUid() %>&Up=<%=users[i].getPassword() %>&Ur=<%=users[i].getPerm() %>" onclick="return Click1(<%=Ps%>)">编辑</a></td>
<tr>
<%
}
%>
</table>
<p align="center"><font size="1">共<%=ut.fenyeNumber(1,-1) %>页&nbsp;&nbsp;当前页码：<%=pageNow %></font></p>
<p align="center">
<%
if(pageNow!=1){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=0&cl=2&pp=3">[上一页]</a>
<%
}
for(int i=1;i<=ut.fenyeNumber(1,-1);i++){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=<%=i%>&cl=2&pp=3"><%=i %></a>
<%
}
if(pageNow!=ut.fenyeNumber(1,-1)){
%>
<a href="BookDisposeServlet?pageNow=<%=pageNow%>&CL=-1&cl=2&pp=3">[下一页]</a>
<%
}
%>
</p>
<P align="center"><a href="A_main.jsp">返回主页</a></P>
</body>
</html>