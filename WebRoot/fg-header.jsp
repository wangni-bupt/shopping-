<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Member"%>
<%@ page import="com.py.vo.Goods"%>
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
	function quit() {
		if (confirm("没有要买的东西了吗？")) {
			window.location.href = "MemberServlet.do?method=logoutMember";
		}
	}
</script>
</head>
<%
    List<Goods> FirstGoods= DAOFactory.getGoodsDAOInstance().selectGoodsFirst();
 %>
<body>
    	<div class="navRight1">
    	<font size="5" color="red"><a>置顶</a></font>
    	<%
    	    
    	    for(int i=0;i<FirstGoods.size();i++){
    	    Goods good=FirstGoods.get(i);
    	 %>
    	 <ul>
    	 <li><font size="4" color="white"><a href="GoodsServlet.do?method=selectGoodsByGoodsId&goodsId=<%=good.getGoodsId()%>&sign=fg"><%=good.getBookName() %></a></font></li>
    	 </ul>

        <%
        }
         %>
    </div>
	<div id="header">
		<div class="logo">
			<a href="index.jsp"><img src="images/logo.gif" width="135"
				height="55" />
			</a>
		</div>
		</div>
		<form name="form" method="post"
			action="GoodsServlet.do?method=selectByKeywords">
			<div class="search">
				<input type="text" class="input1" name="keywords"/> <input type="image"
					src="images/icon_search.gif" class="input2" />
			</div>
		</form>
		<%
			if (session.getAttribute("member") == null) {
		%>
		<div class="login">
			<a href="fg-memberLogin.jsp" class="a1">登录</a>
		</div>
		<%
			} else {
				Member member = (Member) session.getAttribute("member");
		%>
		<div class="login">
		<a href="MemberServlet.do?method=MemberCentre&account=<%=member.getAccount() %>">
			<font class="red"><%=member.getAccount()%>，欢迎回来</font>&nbsp;&nbsp;</a>
			<a	href="javascript:quit()">退出</a>
		
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
