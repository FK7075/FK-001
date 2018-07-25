<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>深蓝网上书店——用户登录</title>
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 747px;
	height: 404px;
	z-index: 1;
	left: 269px;
	top: 72px;
	background-image: url(img/1.jpg);
}
#apDiv2 {
	position: absolute;
	width: 345px;
	height: 217px;
	z-index: 1;
	left: 101px;
	top: 95px;
}
</style>
<script type="text/javascript">
function chick(){
	if(form1.username.value==""){
		window.alert("用户名不能为空！");
	}else{
	if(form1.userpass.value==""){
		window.alert("密码不能为空！");
	}else
		document.form1.submit();
	}
}
function Click1(){
	form1.username.value=="";
	form1.userpass.value=="";
}
</script>
</head>

<body>
<%
String OK=request.getParameter("ok");
if(OK!=null)
{
%>
<script type="text/javascript">window.alert("用户名与密码不匹配");</script>
<%
}
Cookie[] cookies=request.getCookies();
String ID="";
String Pass="";
String cookieName="userID";
String cookiePass="userPass";
String ppt="";
Cookie[] cookiepp=request.getCookies();
if(cookiepp!=null){
	for(int i=0;i<cookiepp.length;i++){
		System.out.println(cookiepp[i].getName()+"  "+cookiepp[i].getValue());
		if(cookiepp[i].getName().equals(cookieName)){
			ID=cookiepp[i].getValue();
			ID=URLDecoder.decode(ID, "UTF-8");
			ppt="checked";
		}
		if(cookiepp[i].getName().equals(cookiePass)){
			Pass=cookiepp[i].getValue();
		}
	}
	System.out.println("ID:"+ID+"    "+"Pass:"+Pass);
}
%>
<div id="apDiv1">
  <div id="apDiv2">
    <form  name="form1" method="post" action="LoginServlet?fk=1">
      <table width="346" height="202" border="0">
        <tr>
          <td colspan="2" align="center" valign="middle"><blockquote>
            <blockquote>
              <blockquote>
                <h2><font face="隶书">用户登录</font></h2>
              </blockquote>
            </blockquote>
          </blockquote></td>
        </tr>
        <tr>
          <td width="121" height="48" align="right" valign="middle">用户名：</td>
          <td width="215">
          <input type="text" name="username" value=<%=ID %>></td>
        </tr>
        <tr>
          <td align="right">密码：</td>
          <td><input type="password" name="userpass" value=<%=Pass %>></td>
        </tr>
        <tr>
       <td height="46" height="10" colspan="2" align="center" valign="middle"><input type="checkbox" name="checkbox" value="1" <%=ppt %>>记住密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="U_Registered.jsp">注册</a></td>
        </tr>
        <tr>
          <td height="46" colspan="2" align="center" valign="middle"><input type="button" name="button" id="button" value="确定" onclick="return chick()">
          <input type="button" name="button2" id="button2" value="重置" onclick="return Click1()"></td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
</html>