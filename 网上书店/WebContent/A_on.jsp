<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新书上架</title>
<script type="text/javascript">
function Click1(){
var a=document.getElementById("text1").value;
var b=document.getElementById("text2").value;
var c=document.getElementById("text3").value;
var d=document.getElementById("text4").value;
var e=document.getElementById("text5").value;
if(a==""||b==""||c==""||d==""||e=="")
	alert("请完善所需要添加书籍的信息");
else
	document.form1.submit();
}
function Click2(){
form1.Bname.value="";
form1.Author.value="";
form1.BookType.value="";
form1.Price.value="";
form1.Inventory.value="";
}
</script>
</head>
<body>
<h2 align="center">请输入书本信息
</h2>
<form id="form1" name="form1" method="post" action="BookDisposeServlet?cl=1">
  <table width="287" border="0" align="center">
    <tr>
      <th align="right" scope="row">书名：</th>
      <td><input type="text" name="Bname" id="text1" value=""/></td>
    </tr>
    <tr>
      <th align="right" scope="row">作者：</th>
      <td><input type="text" name="Author" id="text2" value=""/></td>
    </tr>
    <tr>
      <th align="right" scope="row">书本类型：</th>
      <td><input type="text" name="BookType" id="text3" value=""/></td>
    </tr>
    <tr>
      <th align="right" scope="row">书本价格：</th>
      <td><input type="text" name="Price" id="text4" value=""/></td>
    </tr>
    <tr>
      <th align="right" scope="row">库存量：</th>
      <td><input type="text" name="Inventory" id="text5" value=""/></td>
    </tr>
  </table>
  <p align="center">
    <input type="button" name="button" id="button" value="提交" onclick="return Click1()"/>
    <input type="button" name="button2" id="button2" value="重置" onclick="return Click2()"/>
  </p>
</form>
</body>
<P align="center"><a href="A_main.jsp">返回主页</a></P>
</html>