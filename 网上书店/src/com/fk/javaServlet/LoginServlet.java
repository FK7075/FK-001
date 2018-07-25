package com.fk.javaServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fk.javaBean.Users;
import com.fk.javaBean.UsersUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		int fk=Integer.parseInt(request.getParameter("fk"));
		if(fk==1) {//用于用户登录，判断有户名是否合法，
		String Uid=request.getParameter("username");
		String Password=request.getParameter("userpass");
		String isChick=request.getParameter("checkbox");
		String id=java.net.URLEncoder.encode(Uid, "utf-8");
		Cookie userIDcookie= new Cookie("userID",id);
		Cookie userpasscookie=new Cookie("userPass",Password);
		if(isChick!=null) {
			userIDcookie.setMaxAge(7*24*60*60);
			userpasscookie.setMaxAge(7*24*60*60);
		}else {
			userIDcookie.setMaxAge(0);
			userpasscookie.setMaxAge(0);
		}
		response.addCookie(userIDcookie);
		response.addCookie(userpasscookie);
		UsersUtil ut=new UsersUtil();
		Users u=new Users();
		u=ut.selectByIDPass(Uid, Password);
		if(u==null) {
			 request.getRequestDispatcher("Login.jsp?ok=ok").forward(request,response);
		}else {
			//将用户名和密码存入session备用
			 request.getSession().setAttribute("userName",u.getUid());
			 request.getSession().setAttribute("userPass",u.getPassword());
			 request.getSession().setAttribute("Perm", u.getPerm());
//			 根据权限判断用户身份，从而进入不同子系统
			if(u.getPerm()==1)
			     request.getRequestDispatcher("U_main.jsp").forward(request,response);
			if(u.getPerm()==2)
				 request.getRequestDispatcher("A_main.jsp").forward(request,response);
			if(u.getPerm()==0||u.getPerm()==-1) {
				request.getRequestDispatcher("404.jsp").forward(request,response);
			}
		}
	}
		if(fk==2) {//用于普通用户注册时的用户名验证
			String Uid=request.getParameter("text3");
			String Password=request.getParameter("text4");
			UsersUtil us=new UsersUtil();
			if(us.isNuptial(Uid)) {
				request.getRequestDispatcher("U_Registered.jsp?cz=on").forward(request, response);
			}else {
				us.addUser(Uid, Password);
				request.getRequestDispatcher("OK_1.jsp?xinxi=1").forward(request, response);
			}

		}
		if(fk==3) {//用于管理员注册时的用户名验证
			String Uid=request.getParameter("text3");
			String Password=request.getParameter("text4");
			UsersUtil us=new UsersUtil();
			if(us.isNuptial(Uid)) {
				request.getRequestDispatcher("A_Add.jsp?cz=on").forward(request, response);
			}else {
				us.addAdmin(Uid, Password);
				request.getRequestDispatcher("OK_1.jsp?xinxi=2").forward(request, response);
			}
		}
		if(fk==4) {//修改登录密码
			HttpSession session=request.getSession();
			String Uid=session.getAttribute("userName").toString();
			String password=request.getParameter("newPass").toString();
			UsersUtil us=new UsersUtil();
			int n=us.updatePass(Uid, password);
			if(n==0) {
				request.getRequestDispatcher("err1.jsp?xinxi=2").forward(request, response);
			}
			if(n==1){
				request.getRequestDispatcher("OK_1.jsp?xinxi=3").forward(request, response);
			}
		}
		if(fk==5) {
			int p=Integer.parseInt(request.getParameter("p"));
			String Uid=request.getParameter("xx").toString();
			UsersUtil uu=new UsersUtil();
			int i=uu.deleteUsrse(Uid);
			if(i==1) {
				if(p==2)
				     request.getRequestDispatcher("ok_3.jsp?op=2").forward(request, response);
				else
					 request.getRequestDispatcher("ok_3.jsp?op=3").forward(request, response);
			}
			else {
				if(p==2)
				    request.getRequestDispatcher("err3.jsp?op=2").forward(request, response);
				else
					request.getRequestDispatcher("err3.jsp?op=3").forward(request, response);
			}
		}
		if(fk==6) {
			String Uid=request.getParameter("Ui");
			String Upass=request.getParameter("Up");
			int Ur=Integer.parseInt(request.getParameter("Ur"));
			int k=Integer.parseInt(request.getParameter("k"));
			request.setAttribute("id", Uid);
			request.setAttribute("pass", Upass);
			request.setAttribute("ur", Ur);
			if(k==1) {
				request.getRequestDispatcher("A_correct.jsp?k=2&P=恢复管理员权限").forward(request, response);
			}
			if(k==2) {
				request.getRequestDispatcher("U_correct.jsp?k=1&P=恢复用户权限").forward(request, response);
			}
		}
	}
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
