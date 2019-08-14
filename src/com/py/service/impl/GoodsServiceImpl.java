package com.py.service.impl;

import java.util.List;

import com.py.factory.DAOFactory;
import com.py.service.GoodsService;
import com.py.vo.Goods;

public class GoodsServiceImpl implements GoodsService {
	private String result = null;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	/*
	 * �������ID������Ʒ
	 */
	
	public boolean updateFirst(int goodsId) {
		boolean flag = false;
		try {
			flag = DAOFactory.getGoodsDAOInstance().updateFirst(goodsId);
			if (flag) {
				this.setResult("�ö��ɹ���");
			} else {
				this.setResult("�ö�ʧ�ܣ�");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<Goods> selectGoodsBySortId(int sortId) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoodsBySortId(sortId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Goods> selectGoodsByHot() {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoodsHot();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Goods> selectGoodsBySortIdsmall(int sortId) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoodsBySortIdsmall(sortId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Goods> selectGoodsBySortIdbig(int sortId) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoodsBySortIdbig(sortId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * �����ؼ۱�ʶ������Ʒ
	 */
	public List<Goods> selectGoodsByMark(int mark) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoodsByMark(mark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * ���ݹؼ���������Ʒ
	 */
	public List<Goods> selectByKeywords(String keywords) {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectKeywords(keywords);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * ������Ʒ
	 */
	public List<Goods> selectGoods() {
		List<Goods> list = null;
		try {
			list = DAOFactory.getGoodsDAOInstance().selectGoods();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * ������ƷID������Ʒ
	 */
	public Goods selectGoodsByGoodsId(int goodsId) {
		Goods goods = null;
		try {
			goods = DAOFactory.getGoodsDAOInstance().selectGoodsByGoodsId(
					goodsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goods;
	}

	/*
	 * ������ƷIDɾ����Ʒ
	 */
	public boolean deleteGoodsByGoodsId(int goodsId) {
		boolean flag = false;
		try {
			if (DAOFactory.getOrderDetailDAOInstance()
					.selectOrderDetailByGoodsId(goodsId).size() != 0) {
				this.setResult("�ж����д��ڸ���Ʒ��");
			} else {
				flag = DAOFactory.getGoodsDAOInstance().deleteGoodsByGoodsId(
						goodsId);
				if (flag) {
					this.setResult("ɾ���ɹ���");// ɾ���ɹ�
				} else {
					this.setResult("����Ʒ�����ڣ�ɾ��ʧ�ܣ�");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/*
	 * ������Ʒ
	 */
	public boolean insertGoods(Goods goods) {
		boolean flag = false;
		if (goods.getBookName() != null && goods.getSortId() != 0
				&& goods.getIntroduce() != null && goods.getPublisher() != null
				&& goods.getPublishdate() != null && goods.getNowprice() != 0
				&& goods.getFreeprice() != 0 && goods.getPicture() != null) {
			try {
				flag = DAOFactory.getGoodsDAOInstance().insertGoods(goods);
				if (flag) {
					this.setResult("���ӳɹ���");// ���ӳɹ�
				} else {
					this.setResult("����ʧ�ܣ�");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("������Ϊ�գ�");
		}
		return flag;
	}

	/*
	 * �޸���Ʒ�۸�
	 */
	public boolean updateGoodsPrice(Goods goods) {
		boolean flag = false;
		if (goods.getGoodsId() != 0 && goods.getNowprice() != 0
				&& goods.getFreeprice() != 0
				&& (goods.getMark() == 0 || goods.getMark() == 1)) {
			try {
				flag = DAOFactory.getGoodsDAOInstance().updateGoodsPrice(goods);
				if (flag) {
					this.setResult("�޸ĳɹ���");// �޸ĳɹ�
				} else {
					this.setResult("�޸�ʧ�ܣ�");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("������Ϊ�գ�");
		}
		return flag;
	}
	
	public boolean updateGoodsName(Goods goods) {
		boolean flag = false;
		if (goods.getGoodsId() != 0 ) {
			try {
				flag = DAOFactory.getGoodsDAOInstance().updateGoodsName(goods);
				if (flag) {
					this.setResult("�޸ĳɹ���");// �޸ĳɹ�
				} else {
					this.setResult("�޸�ʧ�ܣ�");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("������Ϊ�գ�");
		}
		return flag;
	}


}
