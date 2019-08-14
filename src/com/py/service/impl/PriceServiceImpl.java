package com.py.service.impl;

import java.util.List;


import com.py.factory.DAOFactory;
import com.py.service.PriceService;
import com.py.vo.Goods;

public class PriceServiceImpl implements PriceService{
	private String result = null;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Goods> selectGoodsByPrice(float pricefirst,float pricesecond,int sortId) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getPriceDAOInstance().selectGoodsByPrice(pricefirst,pricesecond,sortId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
