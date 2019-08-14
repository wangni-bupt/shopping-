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
	 * 根据类别ID搜索商品
	 */
	
	public boolean updateFirst(int goodsId) {
		boolean flag = false;
		try {
			flag = DAOFactory.getGoodsDAOInstance().updateFirst(goodsId);
			if (flag) {
				this.setResult("置顶成功！");
			} else {
				this.setResult("置顶失败！");
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
	 * 根据特价标识搜索商品
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
	 * 根据关键字搜索商品
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
	 * 搜索商品
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
	 * 根据商品ID搜索商品
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
	 * 根据商品ID删除商品
	 */
	public boolean deleteGoodsByGoodsId(int goodsId) {
		boolean flag = false;
		try {
			if (DAOFactory.getOrderDetailDAOInstance()
					.selectOrderDetailByGoodsId(goodsId).size() != 0) {
				this.setResult("有订单中存在该商品！");
			} else {
				flag = DAOFactory.getGoodsDAOInstance().deleteGoodsByGoodsId(
						goodsId);
				if (flag) {
					this.setResult("删除成功！");// 删除成功
				} else {
					this.setResult("该商品不存在，删除失败！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/*
	 * 增加商品
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
					this.setResult("增加成功！");// 增加成功
				} else {
					this.setResult("增加失败！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("表单不能为空！");
		}
		return flag;
	}

	/*
	 * 修改商品价格
	 */
	public boolean updateGoodsPrice(Goods goods) {
		boolean flag = false;
		if (goods.getGoodsId() != 0 && goods.getNowprice() != 0
				&& goods.getFreeprice() != 0
				&& (goods.getMark() == 0 || goods.getMark() == 1)) {
			try {
				flag = DAOFactory.getGoodsDAOInstance().updateGoodsPrice(goods);
				if (flag) {
					this.setResult("修改成功！");// 修改成功
				} else {
					this.setResult("修改失败！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("表单不能为空！");
		}
		return flag;
	}
	
	public boolean updateGoodsName(Goods goods) {
		boolean flag = false;
		if (goods.getGoodsId() != 0 ) {
			try {
				flag = DAOFactory.getGoodsDAOInstance().updateGoodsName(goods);
				if (flag) {
					this.setResult("修改成功！");// 修改成功
				} else {
					this.setResult("修改失败！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.setResult("表单不能为空！");
		}
		return flag;
	}


}
