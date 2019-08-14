package com.py.dao;

import java.util.List;
import com.py.vo.Goods;

public interface GoodsDAO {
	/*
	 * ��ѯ������Ʒ
	 */
	public List<Goods> selectGoods()throws Exception;
	public List<Goods> selectGoodsHot() throws Exception;
	public List<Goods> selectGoodsFirst() throws Exception;
	/*
	 * ����Ʒ��Ų�ѯ��Ʒ
	 */
	public Goods selectGoodsByGoodsId(int goodsId)throws Exception;
	/*
	 * ������Ų�ѯ��Ʒ
	 */
	public List<Goods> selectGoodsBySortId(int sortId)throws Exception;
	/*
	 * ���ؼ۱�ʶ��ѯ��Ʒ
	 */
	public List<Goods> selectGoodsByMark(int mark)throws Exception;
	public boolean updateFirst(int goodsId)throws Exception;
	/*
	 * ���ؼ��ֲ�ѯ��Ʒ
	 */
	public List<Goods> selectKeywords(String keywords)throws Exception;
	/*
	 * ������Ʒ
	 */
	public boolean insertGoods(Goods goods)throws Exception;
	/*
	 * ɾ����Ʒ
	 */
	public boolean deleteGoodsByGoodsId(int goodsId)throws Exception;
	/*
	 * �޸���Ʒ�۸���Ϣ
	 */
	public boolean updateGoodsPrice(Goods goods)throws Exception;
	public boolean updateGoodsName(Goods goods)throws Exception;
	public List<Goods> selectGoodsBySortIdbig(int sortId) throws Exception;
	public List<Goods> selectGoodsBySortIdsmall(int sortId) throws Exception;
}
