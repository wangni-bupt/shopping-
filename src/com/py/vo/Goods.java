package com.py.vo;

public class Goods {
	private int goodsId;
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", sortId=" + sortId
				+ ", BookName=" + BookName + ", introduce=" + introduce
				+ ", publisher=" + publisher + ", publishdate=" + publishdate
				+ ", nowprice=" + nowprice + ", freeprice=" + freeprice
				+ ", picture=" + picture + ", nowname=" + nowname + ", nowchu="
				+ nowchu + ", mark=" + mark + "]";
	}
	private int sortId;
	private String BookName;
	private String introduce;
	private String publisher;
	private String publishdate;
	private float nowprice;
	private float freeprice;
	private String picture;
	private String nowname;
	private String nowchu;
	private int mark;
	private int number;
	private int first;
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getSortId() {
		return sortId;
	}
	public void setSortId(int sortId) {
		this.sortId = sortId;
	}
	public String getBookName() {
		return BookName;
	}
	public String getNowName() {
		return nowname;
	}
	public String getNowChu() {
		return nowchu;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public void setNowName(String bookName) {
		nowname = nowname;
	}
	public void setNowChu(String bookName) {
		nowchu = nowchu;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(String publishdate) {
		this.publishdate = publishdate;
	}
	public float getNowprice() {
		return nowprice;
	}
	public void setNowprice(float nowprice) {
		this.nowprice = nowprice;
	}
	public float getFreeprice() {
		return freeprice;
	}
	public void setFreeprice(float freeprice) {
		this.freeprice = freeprice;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	
}
