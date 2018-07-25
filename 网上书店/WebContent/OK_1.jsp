<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int xinxi=Integer.parseInt(request.getParameter("xinxi"));
String t=null;
if(xinxi==1){
	t="恭喜您，注册成功";
}
if(xinxi==2){
	t="恭喜您，添加管理员成功";
}
if(xinxi==3){
	t="恭喜您，修改密码成功";
}
%>
<h2 align="center"><%=t %></h2>
<p align="center">请您务必保管好您的账号密码，为了您的账户安全请勿将密码告诉他人<br>
祝您购物愉快^_^</p>
<p align="center"><a href ="Login.jsp">返回登录</a></p>
<%
if(xinxi==2){
%>
<p align="center"><a href="A_main.jsp">返回主页</a></p>
<%
}
%>
</body>
</html>