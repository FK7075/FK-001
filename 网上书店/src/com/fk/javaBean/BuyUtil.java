package com.fk.javaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BuyUtil {
	String sql;
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;
	List<Buy> list=new ArrayList<Buy>();
	/*
	 * 
	 * 添加一条记录到订单表
	 */
public int addIndent(Buy buy) {
	int i=0;
	conn=JDBCDao.getConn();
	sql="insert into buy(Uid,Bid,Bname,BuyTime,BuyNumber,Amount,Price) values(?,?,?,?,?,?,?)";
	try {
		pst=conn.prepareStatement(sql);
		pst.setString(1, buy.getUid());
		pst.setString(2, buy.getBid());
		pst.setString(3, buy.getBname());
		pst.setString(4, buy.getByTime());
		pst.setInt(5, buy.getByNumber());
		pst.setDouble(6, buy.getAmount());
		pst.setDouble(7, buy.getPrice());
		i=pst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCDao.shutDown(rs, pst, conn);
	}
	return i;
}
public List<Buy> showPart(String Uid){
	conn=JDBCDao.getConn();
	sql="select * from buy where Uid=?";
	try {
		pst=conn.prepareStatement(sql);
		pst.setString(1, Uid);
		rs=pst.executeQuery();
		while(rs.next()) {
			Buy buy=new Buy();
			buy.setID(rs.getInt("ID"));
			buy.setBid(rs.getString("Bid"));
			buy.setUid(rs.getString("Uid"));
			buy.setBname(rs.getString("Bname"));
			buy.setPrice(rs.getDouble("Price"));
			buy.setByTime(rs.getString("BuyTime"));
			buy.setByNumber(rs.getInt("BuyNumber"));
			buy.setAmount(rs.getDouble("Amount"));
			list.add(buy);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCDao.shutDown(rs, pst, conn);
	}
	return list;
}
public List<Buy> showAll(){
	conn=JDBCDao.getConn();
	sql="select * from buy";
	try {
		pst=conn.prepareStatement(sql);
		rs=pst.executeQuery();
		while(rs.next()) {
			Buy buy=new Buy();
			buy.setID(rs.getInt("ID"));
			buy.setBid(rs.getString("Bid"));
			buy.setUid(rs.getString("Uid"));
			buy.setBname(rs.getString("Bname"));
			buy.setPrice(rs.getDouble("Price"));
			buy.setByTime(rs.getString("BuyTime"));
			buy.setByNumber(rs.getInt("BuyNumber"));
			buy.setAmount(rs.getDouble("Amount"));
			list.add(buy);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCDao.shutDown(rs, pst, conn);
	}
	return list;
}
public int deletedd(int ID) {
	int i=0;
	conn=JDBCDao.getConn();
	sql="delete from buy where ID=?";
	try {
		pst=conn.prepareStatement(sql);
		pst.setInt(1, ID);
		i=pst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCDao.shutDown(rs, pst, conn);
	}
	return i;
}
}
