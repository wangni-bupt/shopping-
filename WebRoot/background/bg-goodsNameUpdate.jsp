<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Goods"%>
<%@ page import="com.py.vo.Sort"%>
<%@ page import="com.py.factory.DAOFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<title>电子商务网站</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script>
function validate(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
form.elements[i].focus();
return false;
}
}
}
</script>
</head>
<%


    int goodsId = Integer.parseInt(request.getParameter("goodsId"));
	String bookName = request.getParameter("bookName");
	String publisher =request.getParameter("publisher");

%>

<body>
	<jsp:include page="bg-up.jsp" flush="true"></jsp:include>
	<div id="bgMain">
		<jsp:include page="bg-left.jsp" flush="true"></jsp:include>
		<div id="bgRight">
			<div class="bgRightText font30" style="font-family:黑体">修改商品</div>
		<form action="GoodsServlet.do?method=updateGoodsName&goodsId=<%=goodsId%>" method="post" name="goodsForm" onsubmit="return validate(this)">
			<div class="bgRightForm">
				<div class="bgInput">
					<span class="input5Text">商品名字：</span><input class="input5" name="bookName" type="text" value=" "/>
				</div>
				<div class="bgInput">
					<span class="input5Text">出版社：</span><input class="input5" name="publisher" type="text" value=" "/>
				</div>
				<div class="bgInput">
					<input type="image" src="images/save.jpg" style="width:51px; height:20px"/>
				</div>
			</div>
		</form>
			<%
				String result = (String) request.getAttribute("result");
				if (result!=null) {
 			%>
 				<div class="bgRightText font24 red"><%=result %></div>
 			<%
 				}
 			%>	
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="bg-down.jsp" flush="true"></jsp:include>
</body>
</html>