<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 374px;
	height: 417px;
	z-index: 1;
	left: 380px;
	top: 60px;
}
</style>
<%
String password=session.getAttribute("userPass").toString();
%>
<script type="text/javascript">
function click1(){
	var p=<%=password%>
	var a=for1.oldPass.value;
	var b=for1.newPass.value;
	var c=for1.newPass1.value;
	if(a==""||b==""||c==""){
		alert("请完善您的密码信息！");
	}else{
		if(p!=a){
			alert("旧密码输入错误，请核对后输入！");
		}else{
			if(b!=c){
				alert("两次输入的密码不一致，请重新输入！");
			}else{
				document.for1.submit();
			}
		}
	}
}
function click2(){
	for1.oldPass.value="";
	for1.newPass.value="";
	for1.newPass1.value="";
}
</script>
</head>
<%
int Perm=Integer.parseInt(session.getAttribute("Perm").toString());
String h=null;
if(Perm==1){
	h="U_main.jsp";
}
if(Perm==2){
	h="A_main.jsp";
}
%>
<body bgcolor="#777">
<p><a href=<%=h %>>返回主页</a></p>
<div id="apDiv1">
  <h2 align="center">修改密码</h2>
  <form id="form1" name="for1" method="post" action="LoginServlet?fk=4">
<table width="271" height="148" border="0" align="center">
<tr>
<td width="101" align="right" valign="middle">旧密码：</td>
<td width="160"><input type="password" name="oldPass" id="text1" value="" /></td>
</tr>
<tr>
<td align="right">新密码：</td>
<td><input type="password" name="newPass" id="text2" value="" /></td>
</tr>
<tr>
<td align="right">确认密码：</td>
<td><input type="password" name="newPass1" id="text3" value="" /></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" name="button" id="button" value="确定" onclick="return click1()" />
&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" name="button2" id="button2" value="重置" onclick="return click2()"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>