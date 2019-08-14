<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.py.vo.Member"%>
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
if(!/^[a-z0-9]+$/.test(form.account.value)){
alert("请输入有数字和小写字母组成的用户名");
return false;
}
return true;
}
</script>
</head>

<body>
	<jsp:include page="fg-header.jsp" flush="true" />
	<jsp:include page="fg-nav.jsp" flush="true" />
	<div id="main">
		<div class="iconLogin"></div>
		<hr />
		<div class="fgText">
			<font class="red">用户登录</font>
		</div>
		<form name="memberForm" method="post"
			action="MemberServlet.do?method=selectMemberLogin"
			onsubmit="return validate(this)">
			<div class="fgForm">
				<div class="fgInput">
					<span class="input3Text">用户名：</span><input class="input3"
						name="account" type="text" />
				</div>
				<div class="fgInput">
					<span class="input3Text">密码：</span><input
						class="input3" name="password" type="password" />
				</div>
				<div class="fgInput">
					<input type="image" src="images/icon_login_01.gif"
						style="width:240px; height:30px;" /><br />
				</div>
				<div class="fgInput">
					<a href="fg-memberRegister.jsp" class="inputA1">注册账号</a>
				</div>
			</div>
		</form>		
	</div>
	<jsp:include page="fg-footer.jsp" flush="true" />
	<%
		String result = (String) request.getAttribute("result");
		if (result!=null) {	
 	%>
 		<script>alert('<%=result%>');</script>		
 	<%
 		}
  	 %>
</body>
</html>
