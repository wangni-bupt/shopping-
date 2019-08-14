package com.py.service;

import java.util.List;

import com.py.vo.Goods;

public interface GoodsService {
	/*
	 * ����result��getter��setter����
	 */
	public String getResult();
	public void setResult(String result);
	/*
	 * �������ID������Ʒ
	 */
	public List<Goods> selectGoodsBySortId(int sortId);
	public List<Goods> selectGoodsBySortIdsmall(int sortId);
	public List<Goods> selectGoodsBySortIdbig(int sortId);
	/*
	 * �����ؼ۱�ʶ������Ʒ
	 */
	public List<Goods> selectGoodsByMark(int mark);
	public boolean updateFirst(int goodsId);
	/*
	 * ���ݹؼ���������Ʒ
	 */
	public List<Goods> selectByKeywords(String keywords);
	/*
	 * ������Ʒ
	 */
	public List<Goods> selectGoods();
	public List<Goods> selectGoodsByHot();
	/*
	 * ������ƷID������Ʒ
	 */
	public Goods selectGoodsByGoodsId(int goodsId);
	/*
	 * ������ƷIDɾ����Ʒ
	 */
	public boolean deleteGoodsByGoodsId(int goodsId);
	/*
	 * ������Ʒ
	 */
	public boolean insertGoods(Goods goods);
	/*
	 * �޸���Ʒ�۸�
	 */
	public boolean updateGoodsPrice(Goods goods);
	
	public boolean updateGoodsName(Goods goods);
}
