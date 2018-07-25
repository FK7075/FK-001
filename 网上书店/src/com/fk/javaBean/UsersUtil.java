package com.fk.javaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersUtil {
	public Connection conn=null;
	public PreparedStatement pst=null;
	public ResultSet rs=null;
	public String sql;
	public boolean p;
	public Users user;
	public int i=0;
	public List<Users> list=new ArrayList<Users>();
	/**
	 * �ж��û����Ƿ�Ϸ�������һ��Users���͵Ķ���
	 * @param Uid
	 * @param Password
	 * @return
	 */
	public Users selectByIDPass(String Uid,String Password) {
			conn=JDBCDao.getConn();
			sql="select * from users where Uid=? and Password=?";
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, Uid);
				pst.setString(2, Password);
				rs=pst.executeQuery();
				if(rs.next()) {
				user=new Users();
				user.setUid(rs.getString("Uid"));
				user.setPassword(rs.getString("Password"));
				user.setPerm(rs.getInt("Perm"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return user;
	}
	/**
	 * �ж��û����Ƿ���ڣ�����һ������ֵ
	 * @param Uid
	 * @return
	 */
	public boolean isNuptial(String Uid) {
		conn=JDBCDao.getConn();
		sql="select * from users where Uid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, Uid);
			rs=pst.executeQuery();
			p=rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return p;
	}
	/*
	 * ���һ���µ��û�
	 */
	public void addUser(String Uid,String Password) {
		conn=JDBCDao.getConn();
		sql="insert into users(Uid,Password,Perm) values(?,?,1)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, Uid);
			pst.setString(2, Password);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
	}
	/**
	 * ���һ������Ա
	 * @param Uid
	 * @param Password
	 */
	public void addAdmin(String Uid,String Password) {
		conn=JDBCDao.getConn();
		sql="insert into users(Uid,Password,Perm) values(?,?,2)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, Uid);
			pst.setString(2, Password);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
	}
	/**
	 * �޸ĵ�¼���룬������Ӱ�������
	 * @param Uid
	 * @param password
	 * @return
	 */
	public int updatePass(String Uid,String password) {
		conn=JDBCDao.getConn();
		sql="update users set Password=? where Uid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, Uid);
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
	 * �����û�Ȩ�ޣ�������ͨ�û�/������Ա�ķ�ҳҳ��
	 * @return
	 */
	public int fenyeNumber(int Perm,int P) {
		int n=0;
		conn=JDBCDao.getConn();
		sql="select count(*) from users where Perm=? or Perm=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, Perm);
			pst.setInt(2, P);
			rs=pst.executeQuery();
			while(rs.next()) {
				int o=rs.getInt(1);
				if(o%4==0) {
					n=o/4;
				}else {
					n=(o/4)+1;
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
	 * ��ҳ��ʾpageNowҳ�������û�������Ȩ��Perm���ֹ���Ա����ͨ�û�����ͨ�û���1������Ա��2����pageSizeΪÿҳ�ļ�¼��
	 * @param pageNow
	 * @param pageSize
	 * @param Perm
	 * @return
	 */
	public List<Users> fenyeShow(int pageNow,int pageSize,int Perm,int P){
		conn=JDBCDao.getConn();
		sql="select * from users  where Perm=? or Perm=? limit ?,?"; 
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, Perm);
			pst.setInt(2, P);
			pst.setInt(3, (pageNow-1)*pageSize);
			pst.setInt(4, pageSize);
			rs=pst.executeQuery();
			while(rs.next()) {
				Users user=new Users();
				user.setUid(rs.getString("Uid"));
				user.setPassword(rs.getString("Password"));
				user.setPerm(rs.getInt("Perm"));
				list.add(user);
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
	 * ɾ��һ���û�
	 * @param Uid
	 * @return
	 */
	public int deleteUsrse(String Uid) {
		conn=JDBCDao.getConn();
		sql="delete from users where Uid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, Uid);
			i=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCDao.shutDown(rs, pst, conn);
		}
		return i;
	}
	public int update_U(String Uid,String Password,int Perm) {
		conn=JDBCDao.getConn();
		sql="update users set Password=?,Perm=? where Uid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, Password);
			pst.setInt(2, Perm);
			pst.setString(3, Uid);
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
