package com.py.service;

import java.util.List;

import com.py.vo.Goods;

public interface GoodsService {
	/*
	 * 设置result的getter与setter方法
	 */
	public String getResult();
	public void setResult(String result);
	/*
	 * 根据类别ID搜索商品
	 */
	public List<Goods> selectGoodsBySortId(int sortId);
	public List<Goods> selectGoodsBySortIdsmall(int sortId);
	public List<Goods> selectGoodsBySortIdbig(int sortId);
	/*
	 * 根据特价标识搜索商品
	 */
	public List<Goods> selectGoodsByMark(int mark);
	public boolean updateFirst(int goodsId);
	/*
	 * 根据关键字搜索商品
	 */
	public List<Goods> selectByKeywords(String keywords);
	/*
	 * 搜索商品
	 */
	public List<Goods> selectGoods();
	public List<Goods> selectGoodsByHot();
	/*
	 * 根据商品ID搜索商品
	 */
	public Goods selectGoodsByGoodsId(int goodsId);
	/*
	 * 根据商品ID删除商品
	 */
	public boolean deleteGoodsByGoodsId(int goodsId);
	/*
	 * 增加商品
	 */
	public boolean insertGoods(Goods goods);
	/*
	 * 修改商品价格
	 */
	public boolean updateGoodsPrice(Goods goods);
	
	public boolean updateGoodsName(Goods goods);
}
