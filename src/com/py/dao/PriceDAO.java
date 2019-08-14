package com.py.dao;

import java.util.List;

import com.py.vo.Goods;

public interface PriceDAO {

	public List<Goods> selectGoodsByPrice(float pricefirst,float pricesecond,int sortId)throws Exception;
}
