package com.py.servlet;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.py.service.GoodsService;
import com.py.service.PriceService;
import com.py.service.impl.GoodsServiceImpl;
import com.py.service.impl.PriceServiceImpl;
import com.py.vo.Goods;

@SuppressWarnings("serial")
public class PriceServlet extends HttpServlet{
	private PriceService priceservice = new PriceServiceImpl();//初始化Service对象
	private String result = null;//声明result
	private boolean flag = false;//声明标识符
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
	if("selectGoodsByPrice".equals(method)){
		float pricefirst = Float.parseFloat(request.getParameter("pricefirst"));
		float pricesecond = Float.parseFloat(request.getParameter("pricesecond"));
		int sortId = Integer.parseInt(request.getParameter("sortId"));
		List<Goods> list= null;
		list = priceservice.selectGoodsByPrice(pricefirst,pricesecond,sortId);
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
		request.getRequestDispatcher("fg-selectSortGoods.jsp").forward(
				request, response);		
	}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	}
