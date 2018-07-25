<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int pp=Integer.parseInt(request.getAttribute("pp").toString());
%>
<h2 align="center">操作成功</h2>
<p align="center">注意：此操作改变了原有账号的相关信息（密码和登录权限），请管理员尽快通知账户的持有者，以免造成不必要的损失！</p>
<%
if(pp==2){
%>
<p align="center"><a href="GL_a.jsp?pageNow=1">返回</a></p>
<%
}
%>
<%
if(pp==1){
%>
<p align="center"><a href="GL_u.jsp?pageNow=1">返回</a></p>
<%
}
%>
</body>
</html>