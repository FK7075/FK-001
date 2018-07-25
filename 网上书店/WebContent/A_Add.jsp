<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加管理员</title>
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 374px;
	height: 417px;
	z-index: 1;
	left: 380px;
	top: 60px;
	background-image: url(img/1.jpg);
}
</style>
<script type="text/javascript">
function Click1(){
if(form2.text3.value==""||form2.text4.value==""||form2.text5.value=="")
	window.alert("请务必完成信息的填写！");
else
	if(form2.text4.value==form2.text5.value)
		document.form2.submit();
	else
		window.alert("两次输入的密码不一致！");
}
function Click2(){
	form2.text3.value="";
	form2.text4.value="";
	form2.text5.value="";
}
</script>
</head>

<body>
<%
String cz=request.getParameter("cz");//如果cz有值代表有户名已存在
if(cz!=null){
%>
<script type="text/javascript">window.alert("管理员已存在，请重新输入！")</script>
<%
}
%>
<div id="apDiv1">
<br><a href="A_main.jsp">返回主页</a>
  <p><a href="Login.jsp">返回登录</a></p>
  <h2 align="center">添加管理员</h2>
  <form id="form2" name="form2" method="post" action="LoginServlet?fk=3">
<table width="271" height="148" border="0" align="center">
<tr>
<td width="101" align="right" valign="middle">用户名：</td>
<td width="160"><input type="text" name="text3" id="textfield" /></td>
</tr>
<tr>
<td align="right">密码：</td>
<td><input type="password" name="text4" id="textfield2" /></td>
</tr>
<tr>
<td align="right">确认密码：</td>
<td><input type="password" name="text5" id="textfield3" /></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" name="button" id="button" value="确定" onclick="return Click1()"/>
&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" name="button2" id="button2" value="重置" onclick="return Click2()"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>