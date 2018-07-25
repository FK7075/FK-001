package com.fk.javaBean;

public class Buy {
public int ID;
public String Uid;
public String Bid;
public String Bname;
public double Price;
public String ByTime;
public int ByNumber;
public double Amount;

public Buy() {}
public Buy(String uid, String bid, String bname, double price, String byTime, int byNumber, double amount) {
	super();
	Uid = uid;
	Bid = bid;
	Bname = bname;
	Price = price;
	ByTime = byTime;
	ByNumber = byNumber;
	Amount = amount;
}
public double getPrice() {
	return Price;
}
public void setPrice(double price) {
	Price = price;
}
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getUid() {
	return Uid;
}
public void setUid(String uid) {
	Uid = uid;
}
public String getBid() {
	return Bid;
}
public void setBid(String bid) {
	Bid = bid;
}
public String getBname() {
	return Bname;
}
public void setBname(String bname) {
	Bname = bname;
}
public String getByTime() {
	return ByTime;
}
public void setByTime(String byTime) {
	ByTime = byTime;
}
public int getByNumber() {
	return ByNumber;
}
public void setByNumber(int byNumber) {
	ByNumber = byNumber;
}
public double getAmount() {
	return Amount;
}
public void setAmount(double amount) {
	Amount = amount;
}

}
