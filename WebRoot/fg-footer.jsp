<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Link"%>
<%@ page import="com.py.vo.Goods"%>
<%@ page import="com.py.vo.Affiche"%>
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
</head>
<%
	List<Link> linkList = DAOFactory.getLinkDAOInstance().selectLink();
    List<Affiche> afficheList= DAOFactory.getAfficheDAOInstance().selectAffiche();
    List<Goods> hotGoods= DAOFactory.getGoodsDAOInstance().selectGoodsHot();
%>
<body>
	<div id="footer">
		<hr class="hrRed" />
		<div class="iconAd">
			<img src="images/fg_ad.gif" width="960" height="76" />
		</div>
		<div class="link">
			<%
				for(int i=0;i<linkList.size();i++){
				   Link link=(Link)linkList.get(i);
			%>
			<div class="linkName">
				<a href="<%=link.getLinkAddress()%>" class="a4"><%=link.getLinkName()%></a>
			</div>
			<%
				}
			%>
			<div class="clear"></div>
		</div>
		<div class="bgLoginA">
			<a href="background/bg-managerLogin.jsp" class="a5">进入后台</a>
		</div>
		<div class="caution lightgrey font12">
			版权所有：电子商务与快递物流综合信息技术实训平台<br/>
    		Copyright&copy;All Rights Reserved<br/>
   			邮编：100876
		</div>
		<div class="clear"></div>
	</div>

	<div class="affiche">
		<div class="afficheTitle white bold">&nbsp;商城公告</div>
		<div class="afficheMore">
			<a href="AfficheServlet.do?method=selectAffiche&sign=fg">更多&gt;</a>
		</div>
		<div class="clear"></div>
		<%
			if(afficheList.size()==0){
		%>
		<div class="afficheNo">无商城公告信息</div>
		<%
			}else{
		%>
		<ul>
			<%
				for(int i=0;i<afficheList.size();i++){
					Affiche affiche=(Affiche)afficheList.get(i);
			%>
			<li><img src="images/icon_1.gif" width="20" height="20" /> [公告]<a
				href="AfficheServlet.do?method=selectAfficheById&id=<%=affiche.getId()%>&sign=fg"><%=affiche.getAffiche()%></a>
			</li>
			<%
				}}
			%>
		</ul>
	</div >
	
	<div class="hello" >
	<a  href="https://www.bupt.edu.cn/">
	    <img src="images/icon_123.gif" width="250" height="100"/>
	    </a>a>
	</div>
	
	<div class="he">
		<div class="afficheTitle white bold">&nbsp;热门</div>
		<div class="afficheMore">
			<a href="GoodsServlet.do?method=selectGoodsByHot&sign=fg">更多&gt;</a>
		</div>
		<div class="clear"></div>
		<ul>
		<%
		     for(int i=0;i<hotGoods.size();i++)
		     {
		     if(hotGoods.get(i).getNumber()>=0){
		 %>
			<li><img src="images/icon_1.gif" width="20" height="20" /><a href="GoodsServlet.do?method=selectGoodsByGoodsId&goodsId=<%=hotGoods.get(i).getGoodsId() %>&sign=fg"><%=hotGoods.get(i).getBookName()%></a></li>
		<%
		}
		}
		 %>
		</ul>
	</div >
</body>
</html>
