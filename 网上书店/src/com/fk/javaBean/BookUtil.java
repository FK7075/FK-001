package com.fk.javaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookUtil {
	List<Book> list=new ArrayList<Book>();
	String sql;
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;
	public int Record=0;//表中总记录数
//	public int pageNow=0;//当前页面数
//	public int pageNumber=0;//页面总数
//	public int pageRecord=5;//每页记录数
	int n=0;
	/**
	 *  查询数据库中所有的图书，返回一个Book的集合
	 * @return
	 */
	public List<Book> showAll(){
		conn=JDBCDao.getConn();
		sql="select * from books";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			System.out.println(rs.getMetaData().getColumnCount());
			while(rs.next()) {
				Book book=new Book();
				for(int i=1;i<=rs.getMetaData().getColumnCount();i++) {
					book.setBid(rs.getInt("Bid"));
					book.setBname(rs.getString("Bname"));
					book.setAuthor(rs.getString("Author"));
					book.setBookType(rs.getString("BookType"));
					book.setPrice(rs.getDouble("Price"));
					book.setInventory(rs.getInt("Inventory"));
				}
				list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return list;
	}
	/**
	 * 添加一本新书
	 * @param book
	 * @return
	 */
	public int addBook(Book book) {
		conn=JDBCDao.getConn();
		int i=0;
		sql="insert into books(Bname,Author,BookType,Price,Inventory) values(?,?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, book.getBname());
			pst.setString(2, book.getAuthor());
			pst.setString(3, book.getBookType());
			pst.setDouble(4, book.getPrice());
			pst.setInt(5, book.getInventory());
			i=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return i;
	}
	/**
	 * 返回分页显示的总页数
	 * @return
	 */
	public int recordNumber() {
		conn=JDBCDao.getConn();
		sql="select count(*) from books";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				int o=rs.getInt(1);
				if(o%5==0) {
					n=o/5;
				}
				if(o%5!=0) {
					n=(o/5)+1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return n;
	}
	/**
	 * 分页显示Books表中的内容
	 * @param pageNow
	 * @return
	 */
	public List<Book> fenyeShow(int pageNow,int pageSize ){
		conn=JDBCDao.getConn();
		sql="select * from books order by Bid limit "+(pageNow-1)*pageSize+","+pageSize;
		//sql="select * from books limit (?-1)*5,5";
		try {
			pst=conn.prepareStatement(sql);
		//	pst.setInt(1, pageNow);
			rs=pst.executeQuery();
			while(rs.next()) {
			Book book=new Book();
			book.setBid(rs.getInt("Bid"));
			book.setBname(rs.getString("Bname"));
			book.setAuthor(rs.getString("Author"));
			book.setBookType(rs.getString("BookType"));
			book.setPrice(rs.getDouble("Price"));
			book.setInventory(rs.getInt("Inventory"));
			list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return list;
	}
	/**
	 * 根据书本编号删除该书，返回受影响的行数
	 */
	public int deleteById(int Bid) {
		conn=JDBCDao.getConn();
		sql="delete from books where Bid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, Bid);
			n=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return n;
	}
	/**
	 * 修改书本参数，价格和库存
	 * @param Bid
	 * @param Price
	 * @param Inventory
	 * @return
	 */
	public int updatePrAndInven(int Bid,double Price,int Inventory) {
		conn=JDBCDao.getConn();
		sql="update books set Price=?,Inventory=? where Bid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setDouble(1, Price);
			pst.setInt(2, Inventory);
			pst.setInt(3,Bid);
			n=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		
		return n;
	}
	public Book bookById(int Bid) {
		Book book=new Book();
		conn=JDBCDao.getConn();
		sql="select * from books where Bid="+Bid;
		try {
			pst=conn.prepareStatement(sql);
//			pst.setInt(1, Bid);
			rs=pst.executeQuery();
			while(rs.next()) {
			book.setBid(rs.getInt("Bid"));
			book.setBname(rs.getString("Bname"));
			book.setAuthor(rs.getString("Author"));
			book.setBookType(rs.getString("BookType"));
			book.setPrice(rs.getDouble("Price"));
			book.setInventory(rs.getInt("Inventory"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return book;
	}
	public int upIn(int Bid,int p) {
		int i=0;
		conn=JDBCDao.getConn();
		sql="update books set Inventory=Inventory-? where Bid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, p);
			pst.setInt(2, Bid);
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
