package com.py.servlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.py.service.GoodsService;
import com.py.service.impl.GoodsServiceImpl;
import com.py.vo.Goods;

@SuppressWarnings("serial")
public class GoodsServlet extends HttpServlet {
	private GoodsService goodsservice = new GoodsServiceImpl();//初始化Service对象
	private String result = null;//声明result
	private boolean flag = false;//声明标识符
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("selectGoodsBySortId".equals(method)){
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			List<Goods> list= null;
			list = goodsservice.selectGoodsBySortId(sortId);
			int pageNumber = list.size();
			int maxPage = pageNumber;
			float pricefirst=0;
			float pricesecond=10000000;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("pricefirst", String.valueOf(pricefirst));
			request.setAttribute("pricesecond", String.valueOf(pricesecond));
			System.out.println(pricefirst);
			request.setAttribute("sortId", String.valueOf(sortId));
			request.setAttribute("list", list);
			request.getRequestDispatcher("fg-selectSortGoods.jsp").forward(
					request, response);		
		}else if("selectGoodsBySortIdbig".equals(method)){
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			List<Goods> list= null;
			list = goodsservice.selectGoodsBySortIdbig(sortId);
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("sortId", String.valueOf(sortId));
			request.setAttribute("list", list);
			request.getRequestDispatcher("fg-selectSortGoods.jsp").forward(
					request, response);		
		}else if("selectGoodsByHot".equals(method)){
			List<Goods> list= null;
			list = goodsservice.selectGoodsByHot();
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("list", list);
			request.getRequestDispatcher("fg-selectHot.jsp").forward(
					request, response);		
		}
		
		else if("selectGoodsBySortIdsmall".equals(method)){
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			List<Goods> list= null;
			list = goodsservice.selectGoodsBySortIdsmall(sortId);
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("sortId", String.valueOf(sortId));
			request.setAttribute("list", list);
			request.getRequestDispatcher("fg-selectSortGoods.jsp").forward(
					request, response);		
		}
		else if("selectGoodsByMark".equals(method)){
			int mark = Integer.parseInt(request.getParameter("mark"));
			List<Goods> list = null;
			list = goodsservice.selectGoodsByMark(mark);
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("list", list);
			if (mark == 1) {
				request.getRequestDispatcher("fg-selectFreeGoods.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("fg-selectNowGoods.jsp").forward(
						request, response);
			}
		}
		else if("selectByKeywords".equals(method)){
			String keywords = request.getParameter("keywords");
			List<Goods> list = null;
			list = goodsservice.selectByKeywords(keywords);
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 6 == 0)
				maxPage = maxPage / 6;
			else {
				maxPage = maxPage / 6 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("list", list);
			request.setAttribute("keywords", keywords);
			request.getRequestDispatcher("fg-selectKeywords.jsp").forward(
					request, response);
		}
		else if("selectGoods".equals(method)){
			List<Goods> list = null;
			list = goodsservice.selectGoods();
			int pageNumber = list.size();
			int maxPage = pageNumber;
			String number = request.getParameter("i");
			if (maxPage % 10 == 0)
				maxPage = maxPage / 10;
			else {
				maxPage = maxPage / 10 + 1;
			}
			if (number == null) {
				number = "0";
			}
			request.setAttribute("number", String.valueOf(number));
			request.setAttribute("maxPage", String.valueOf(maxPage));
			request.setAttribute("pageNumber", String.valueOf(pageNumber));
			request.setAttribute("list", list);
			request.getRequestDispatcher("background/bg-goodsSelect.jsp")
			.forward(request, response);
		}
		else if("selectGoodsByGoodsId".equals(method)){
			String sign = request.getParameter("sign");
			int goodsId = Integer.parseInt(request.getParameter("goodsId"));
			Goods goods =null;
			goods = goodsservice.selectGoodsByGoodsId(goodsId);
			request.setAttribute("goods", goods);
			if (sign.equals("fg")) {
				request.getRequestDispatcher("fg-goodsSelectOne.jsp").forward(
						request, response);
			} else if (sign.equals("bg")) {
				request.getRequestDispatcher(
						"background/bg-goodsDetailSelect.jsp").forward(request,
						response);
			}
		}
		else if("deleteGoodsByGoodsId".equals(method)){
			int goodsId = Integer.parseInt(request.getParameter("goodsId"));
			flag = goodsservice.deleteGoodsByGoodsId(goodsId);
			result = goodsservice.getResult();
			if(flag){
				response.sendRedirect("GoodsServlet.do?method=selectGoods");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher(
						"GoodsServlet.do?method=selectGoods").forward(
						request, response);
			}
		}
		else if("insertGoods".equals(method)){
			Goods goods = new Goods();
			goods.setBookName(request.getParameter("bookName"));
			goods.setSortId(Integer.valueOf(request.getParameter("sortId")));
			goods.setIntroduce(request.getParameter("introduce"));
			goods.setPublisher(request.getParameter("publisher"));
			goods.setPublishdate(request.getParameter("publishdate"));
			goods.setNowprice(Float.valueOf(request.getParameter("nowprice")));
			goods.setFreeprice(Float.valueOf(request.getParameter("freeprice")));
			goods.setPicture(request.getParameter("picture"));
			flag = goodsservice.insertGoods(goods);
			result = goodsservice.getResult();
			if(flag){
				response.sendRedirect("GoodsServlet.do?method=selectGoods");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher(
						"background/bg-goodsInsert.jsp").forward(
						request, response);
			}
		}
		else if("updateGoodsPrice".equals(method)){
			Goods goods = new Goods();
			goods.setGoodsId(Integer.valueOf(request.getParameter("goodsId")));
			goods.setNowprice(Float.valueOf(request.getParameter("nowprice")));
			goods.setFreeprice(Float.valueOf(request.getParameter("freeprice")));
			goods.setMark(Integer.valueOf(request.getParameter("mark")));
			flag = goodsservice.updateGoodsPrice(goods);
			result = goodsservice.getResult();
			if(flag){
				response.sendRedirect("GoodsServlet.do?method=selectGoods");
			}else{
				request.setAttribute("result", "修改失败");
				request.getRequestDispatcher(
						"background/bg-goodsPriceManager.jsp?goodsId="
								+ goods.getGoodsId() + "&nowprice=" + goods.getNowprice()
								+ "&freeprice=" + goods.getFreeprice() + "&mark="
								+ goods.getMark()).forward(request, response);
			}
		}
		else if("updateGoodsName".equals(method)){
			Goods goods = new Goods();
			goods.setGoodsId(Integer.valueOf(request.getParameter("goodsId")));
			goods.setBookName(request.getParameter("bookName"));
			goods.setPublisher(request.getParameter("publisher"));
			flag = goodsservice.updateGoodsName(goods);
			result = goodsservice.getResult();
			if(flag){
				response.sendRedirect("GoodsServlet.do?method=selectGoods");
			}else{
				request.setAttribute("result", "修改失败");
				request.getRequestDispatcher(
						"background/bg-goodsNameUpdate.jsp?goodsId="
								+ goods.getGoodsId() + "&bookName" + goods.getBookName()
								+ "&publisher=" + goods.getPublisher()).forward(request, response);
			}
		}
		else if("selectGoodsFirst".equals(method)){
			Goods goods = new Goods();
			int goodsId=Integer.valueOf(request.getParameter("goodsId"));
			flag = goodsservice.updateFirst(goodsId);
			result = goodsservice.getResult();
			if(flag){
				response.sendRedirect("GoodsServlet.do?method=selectGoods");
			}else{
				request.setAttribute("result", "置顶失败");
				request.getRequestDispatcher(
						"background/bg-goodsSelect.jsp?goodsId="
								+ goods.getGoodsId()).forward(request, response);
			}
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

}
