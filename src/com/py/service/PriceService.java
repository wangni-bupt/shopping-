package com.py.service;

import java.util.List;

import com.py.vo.Goods;

public interface PriceService {
	public List<Goods> selectGoodsByPrice(float pricefirst,float pricesecond,int sortId);

}
