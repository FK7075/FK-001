package com.fk.javaBean;

public class Book {
	public int Bid;
	public String Bname;
	public String Author;
	public String BookType;
	public double Price;
	public int Inventory;
	
	public Book(String bname, String author, String bookType, double price, int inventory) {
		super();
		Bname = bname;
		Author = author;
		BookType = bookType;
		Price = price;
		Inventory = inventory;
	}
	public Book() {}
	
	public int getBid() {
		return Bid;
	}
	public void setBid(int bid) {
		Bid = bid;
	}
	public String getBname() {
		return Bname;
	}
	public void setBname(String bname) {
		Bname = bname;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getBookType() {
		return BookType;
	}
	public void setBookType(String bookType) {
		BookType = bookType;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public int getInventory() {
		return Inventory;
	}
	public void setInventory(int inventory) {
		Inventory = inventory;
	}
	

}
