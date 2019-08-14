package com.py.dao.proxy;

import java.util.List;

import com.py.dao.GoodsDAO;
import com.py.dao.PriceDAO;
import com.py.dao.impl.GoodsDAOImpl;
import com.py.dao.impl.PriceDAOImpl;
import com.py.tool.DatabaseConnection;
import com.py.vo.Goods;

public class PriceDAOProxy implements PriceDAO{
	private DatabaseConnection dbc = null;//定义数据库连接类
	private PriceDAO dao = null;//声明DAO对象
	public PriceDAOProxy()throws Exception{//在构造方法中实例化连接，同时实例化dao对象
		this.dbc = new DatabaseConnection();//连接数据库
		this.dao = new PriceDAOImpl(this.dbc.getConnection());//实例化真实主题类
	}
	@Override
	public List<Goods> selectGoodsByPrice(float pricefirst, float pricesecond,int sortId)
			throws Exception {
		// TODO Auto-generated method stub
		List<Goods> list = null;//定义返回的集合
		try{
			list = this.dao.selectGoodsByPrice(pricefirst,pricesecond,sortId);//调用真实实现类
		}catch(Exception e){
			throw e;//将异常交给被调用出处理
		}finally{
			this.dbc.close();//关闭数据库连接
		}
		return list;
	} 

}
