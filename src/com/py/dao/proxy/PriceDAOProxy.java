package com.py.dao.proxy;

import java.util.List;

import com.py.dao.GoodsDAO;
import com.py.dao.PriceDAO;
import com.py.dao.impl.GoodsDAOImpl;
import com.py.dao.impl.PriceDAOImpl;
import com.py.tool.DatabaseConnection;
import com.py.vo.Goods;

public class PriceDAOProxy implements PriceDAO{
	private DatabaseConnection dbc = null;//�������ݿ�������
	private PriceDAO dao = null;//����DAO����
	public PriceDAOProxy()throws Exception{//�ڹ��췽����ʵ�������ӣ�ͬʱʵ����dao����
		this.dbc = new DatabaseConnection();//�������ݿ�
		this.dao = new PriceDAOImpl(this.dbc.getConnection());//ʵ������ʵ������
	}
	@Override
	public List<Goods> selectGoodsByPrice(float pricefirst, float pricesecond,int sortId)
			throws Exception {
		// TODO Auto-generated method stub
		List<Goods> list = null;//���巵�صļ���
		try{
			list = this.dao.selectGoodsByPrice(pricefirst,pricesecond,sortId);//������ʵʵ����
		}catch(Exception e){
			throw e;//���쳣���������ó�����
		}finally{
			this.dbc.close();//�ر����ݿ�����
		}
		return list;
	} 

}
