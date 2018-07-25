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
int m=Integer.parseInt(request.getParameter("op"));
%>
<h2 align="center">糟糕，修改失败了</h2>
<%
int pageNow=1; 
request.setAttribute("pageNow",pageNow);
if(m==1){
%>
<a href="A_out.jsp?pageNow=1">返回下架</a>
<%
}
if(m==2){
%>
<a href="GL_a.jsp?pageNow=1">返回</a>
<%
}
if(m==3){
%>
<a href="GL_u.jsp?pageNow=1">返回</a>
<%
}
%>
<br><a href="A_main.jsp">返回主页</a>
</body>
</html>