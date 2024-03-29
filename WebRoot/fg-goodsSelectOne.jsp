<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Goods"%>
<%@ page import="com.py.vo.Sort"%>
<%@ page import="com.py.vo.Member"%>
<%@ page import="com.py.vo.Leavewords"%>
<%@ page import="com.py.factory.DAOFactory"%>
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
<script>
function validate(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
form.elements[i].focus();
return false;
}
}
return true;
}
</script>
</head>
<%
	Goods goods = (Goods) request.getAttribute("goods");
	String sortName = DAOFactory.getSortDAOInstance().selectSortBySortId(goods.getSortId()).getSortName();
%>
<body>
	<jsp:include page="fg-header.jsp" flush="true" />
	<jsp:include page="fg-nav.jsp" flush="true" />
	<div id="main">
		<div class="iconOne"></div>
		<hr />
		<br />
		<form name="cartForm" method="post" action="CartServlet.do?method=cartAdd">
			<div class="goodsThree">
				<div class="goodsThreeImg">
					<a href="GoodsServlet.do?method=selectGoodsByGoodsId&goodsId=<%=goods.getGoodsId()%>&sign=fg">
						<img src="<%=goods.getPicture()%>" width="140" height="200" /> </a>
				</div>
				<div class="goodsThreeTextare1">
					<input type="hidden" name="goodsId" value="<%=goods.getGoodsId()%>" />
					<p>
						商品编号：<%=goods.getGoodsId()%></p>
					<p>
						商品名称：<%=goods.getBookName()%></p>
					<p>
						商品类别：<%=sortName%></p>
					<p>
						出版社：<%=goods.getPublisher()%></p>
					<p>
						出版日期：<%=goods.getPublishdate()%></p>
					<p>
					              销售量：<%=goods.getNumber() %>
					</p>
					<%
						if (goods.getMark()==1) {
					%>
					<p class="blue">
						现价：￥<%=goods.getFreeprice()%>元
					</p>
					<input type="hidden" name="price" value="<%=goods.getFreeprice()%>" />
					<%
						} else {
					%>
					<p class="red">
						现价：￥<%=goods.getNowprice()%>元
					</p>
					<input type="hidden" name="price" value="<%=goods.getNowprice()%>" />
					<%
						}
					%>
					<%
						if (session.getAttribute("member")!= null){
					%>
					<input type="image" src="images/icon_cart.gif"
						class="inputNoBorder" />
					<%
						} else {
					%>
					<p>
						<a href="fg-memberLogin.jsp" class="a6">登录后才能购买</a>
					</p>
					<%
						}
					%>
				</div>
				<div class="goodsThreeTextare2">
					简介：<%=goods.getIntroduce()%></div>
			</div>
		</form>
		<div class="iconLeavewords"></div>
		<hr />
		<div class="leavewords">
			<div class="account">评论人</div>
			<div class="title">标题</div>
			<div class="content">内容</div>
			<div class="creaTime">评论时间</div>
			<hr />
			<%
				List<Leavewords>leavewordsList = DAOFactory.getLeavewordsDAOInstance().selectLeavewordsByGoodsId(goods.getGoodsId());
			%>
			<%
				if(leavewordsList.size()==0){
			%>
			<div class="leavewordsNo">本商品暂无评论</div>
			<%
				}else{
						for(int i=0;i<leavewordsList.size();i++){
			              			Leavewords leavewords=(Leavewords)leavewordsList.get(i);
			%>
			<div class="account"><%=leavewords.getAccount()%></div>
			<div class="title"><%=leavewords.getTitle()%></div>
			<div class="content"><%=leavewords.getContent()%></div>
			<div class="creaTime"><%=leavewords.getCreaTime().toString().substring(0,19)%></div>
			<hr />
			<%
				}
					}
			%>
			<%
				Member member = null;
				 	if(session.getAttribute("member")!=null){
				 		member = (Member)session.getAttribute("member");
				 		if(DAOFactory.getLeavewordsDAOInstance().selectLeavewords(goods.getGoodsId(), member.getAccount())!=null){
			%>
			<div class="leavewordsOn">您已评论过该商品</div>
			<%
				}else{
			%>
			
			<form name="leavewordsForm" method="post"
					action="LeavewordsServlet.do?method=insertLeavewords"
					onsubmit="return validate(this)">
			<div class="fgForm">
				<div class="fgInput">
					<input type="hidden" name="goodsId"
								value="<%=goods.getGoodsId()%>" /> <input type="hidden"
								name="account" value="<%=member.getAccount()%>" />
					<span class="input3Text">标题</span><input class="input3"
						name="title" type="text" />
				</div>
				<div class="fgInput">
					<textarea class="textarea1" name="content"></textarea>
				</div>
				<div class="fgInput">
					<input type="image" 
								src="images/save.jpg" style="width:51px; height:20px" />
				</div>
			</div>
			</form>				
				<%
					}
					 	}else{
				%>
				<div class="leavewordsOn">
					<a href="fg-memberLogin.jsp" class="a6">登录后才可评价该商品</a>
				</div>
				<%
					}
				%>			
		</div>
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
