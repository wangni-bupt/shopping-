<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.py.vo.Affiche"%>
<%@ page import="com.py.factory.DAOFactory"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>电子商务网站</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="banner">
		<div id="scrollDiv" class="scrollDiv">
			<div id="scrollBegin" class="scrollBegin">
				<img src="images/banner1.jpg" width="1400" height="300" />
				<img src="images/banner2.jpg" width="1400" height="300" />
				<img src="images/banner3.jpg" width="1400" height="300" />
				<img src="images/banner4.jpg" width="1400" height="300" />
			</div>
			<div id="scrollEnd" class="scrollEnd"></div>
		</div>
	</div>
	<script>
		var speed = 10;
		var scroll_div = document.getElementById("scrollDiv");
		var scroll_begin = document.getElementById("scrollBegin");
		var scroll_end = document.getElementById("scrollEnd");
		scroll_end.innerHTML = scroll_begin.innerHTML;
		function Marquee() {
			if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
				scroll_div.scrollLeft -= scroll_begin.offsetWidth;
			else
				scroll_div.scrollLeft++;
		}
		var MyMar = setInterval(Marquee, speed);
		scroll_div.onmouseover = function() {
			clearInterval(MyMar);
		};
		scroll_div.onmouseout = function() {
			MyMar = setInterval(Marquee, speed);
		};
	</script>
</body>
</html>
