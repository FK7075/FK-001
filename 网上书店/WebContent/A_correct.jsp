<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑管理员信息</title>
</head>
<script type="text/javascript">
function Click(){
	alert("提示：此操作会改变其他用户的账号信息，在非紧急情况下不建议使用！")
	if(!(confirm("警告：您正在修改他人账号信息！")))
		return false;
}
</script>
<body>
<%
String Uid=request.getAttribute("id").toString();
String  Password=request.getAttribute("pass").toString();
int Perm=Integer.parseInt(request.getAttribute("ur").toString());
int k=Integer.parseInt(request.getParameter("k"));
String P=request.getParameter("P");
%>
<h2 align="center">修改管理员信息</h2>
<p align="center"><font size="2">提示：该操作用于冻结,修改管理员信息，帮助管理员找回丢失的账号以及及时止损。请勿他用！</font></p>
<form action="OperationServlrt?cl=1&pp=2" name="for1" method="post">
<table border="1" bgcolor="#777" align="center" width="400px">
<tr align="center" bgcolor="#777">
<td>账号</td><td>密码</td><td>权限</td>
</tr>
<tr align="center">
<td><input type="text" name="id" value=<%=Uid %> readonly="readonly"></td>
<td><input type="text" name="pass" id="ps" value=<%=Password %>></td>
<td>
<select name="qx">
<option value="0">冻结该账户
<option value=<%=k %>><%=P %>
</select>
</td>
</tr>
<tr bgcolor="#777" align="center">
<td colspan="3"><input type="submit" value="修改" name="an" onclick="return Click()"></td>
</tr>
</table>
</form>
<p align="center"><a href="GL_a.jsp?pageNow=1">返回</a></p>
</body>
</html>