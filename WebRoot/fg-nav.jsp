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
</head>
<body>
<div id="nav">
  <div class="navLeft"></div>
  <div class="navCenter">
    <ul>
      <li><a href="index.jsp" class="a2">首页</a></li>
      <li><a href="GoodsServlet.do?method=selectGoodsByMark&mark=0" class="a2">新品上架</a></li>
      <li><a href="GoodsServlet.do?method=selectGoodsByMark&mark=1" class="a2">特价商品</a></li>
      <li><a href="MemberServlet.do?method=checkLogin&sign=order" class="a2">查看订单</a></li>
      <li><a href="MemberServlet.do?method=checkLogin&sign=cart" class="a2">购物车</a></li>
      <li><a href="MemberServlet.do?method=checkLogin&sign=member" class="a2">会员修改</a></li>
      <li class="nobg"><a href="fg-connect.jsp" class="a2">联系我们</a></li>
    </ul>
  </div>
  <div class="navRight">
  </div>
  <div class="clear"></div>
</div>
</body>
</html>
