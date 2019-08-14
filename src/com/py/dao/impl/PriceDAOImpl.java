package com.py.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.py.dao.PriceDAO;
import com.py.vo.Goods;

public class PriceDAOImpl implements PriceDAO{

	private Connection conn = null;// 定义数据库连接对象
	private PreparedStatement ps = null;// 定义数据库操作对象
	public PriceDAOImpl(Connection conn) {// 设置数据库连接
		this.conn = conn;
	}
	@Override
	public List<Goods> selectGoodsByPrice(float pricefirst, float pricesecond,int sortId)
			throws Exception {
		// TODO Auto-generated method stub
		List<Goods> list = new ArrayList<Goods>();
		String sql = "SELECT * FROM tb_goods WHERE sortId=? ORDER BY goodsId DESC";
		this.ps = this.conn.prepareStatement(sql);
		this.ps.setInt(1, sortId);
		ResultSet rs = this.ps.executeQuery();
		Goods goods = null;
		while(rs.next()){
			goods = new Goods();
			goods.setGoodsId(rs.getInt(1));
			goods.setSortId(rs.getInt(2));
			goods.setBookName(rs.getString(3));
			goods.setIntroduce(rs.getString(4));
			goods.setPublisher(rs.getString(5));
			goods.setPublishdate(rs.getString(6));
			goods.setNowprice(rs.getFloat(7));
			goods.setFreeprice(rs.getFloat(8));
			goods.setPicture(rs.getString(9));
			goods.setMark(rs.getInt(10));	
			if(goods.getFreeprice()>=pricefirst&&goods.getFreeprice()<=pricesecond)
			list.add(goods);
		}
		this.ps.close();
		return list;
	}
}
