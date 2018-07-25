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
request.setCharacterEncoding("UTF-8");
int xinxi=Integer.parseInt(request.getParameter("xinxi"));
String t=null;
if(xinxi==1){
	t="添加失败";
}
if(xinxi==2){
	t="修改密码失败";
}
%>
<h2 align="center"><%=t %></h2>
<p><a href="A_main.jsp">返回主页</a></p>
<p><a href="A_on.jsp">继续添加</a></p>
</body>
</html>