package com.fk.javaBean;

import java.util.ArrayList;
import java.util.List;

public class cs {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Buy> list=new ArrayList<Buy>();
		BuyUtil bookutil=new BuyUtil();
		list=bookutil.showAll();
		System.out.println(list.size());
		Buy[] books=new Buy[list.size()];
		list.toArray(books);
		for(int i=0;i<books.length;i++) {
			System.out.println(books[i].getID()+" "+books[i].getBid()+" "+books[i].getUid()+" "+books[i].getBname()+" "+books[i].getPrice()+" "+books[i].getByTime()+" "+books[i].getByNumber()+" "+books[i].getAmount());
		}
		
	}

}
