<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Member"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>电子商务网站</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
Member member=(Member)request.getAttribute("member");
%>
<body>
	<jsp:include page="fg-header.jsp" flush="true" />
	<jsp:include page="fg-nav.jsp" flush="true" />
	<div id="bgMain">
		<div id="bgRight">
			<div class="fgText font30" style="font-family:黑体">会员信息</div>
			<div class="afficheTable">
				<table class="tableBorder" style="width:50%;">
						<tr style="height:40px">
							<td style="width:50%; background-color:#CCC">会员账号</td><td style="width:50%"><%=member.getAccount()%></td>
						</tr>
						<tr style="height:40px">
							<td style="background-color:#CCC">会员姓名</td><td><%=member.getReallyName()%></td>
						</tr>
						<tr style="height:40px">
							<td style="background-color:#CCC">会员邮箱</td><td><%=member.getEmail()%></td>						
						</tr>
						<tr style="height:40px">
							<td style="background-color:#CCC">联系方式</td><td><%=member.getTel()%></td>						
						</tr>
						<tr style="height:40px">
							<td style="background-color:#CCC">身份证号</td><td><%=member.getIdCard()%></td>						
						</tr>						
				</table>
				<div class="fgText font30" style="font-family:黑体">
				<a href="javascript:history.back();">返回</a></div>
			</div>	
		</div>
		<div class="clear"></div>
	</div>
<jsp:include page="fg-footer.jsp" flush="true" />
</body>
</html>

