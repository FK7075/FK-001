package com.fk.javaServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fk.javaBean.Book;
import com.fk.javaBean.BookUtil;
import com.fk.javaBean.Buy;
import com.fk.javaBean.BuyUtil;
import com.fk.javaBean.UsersUtil;

/**
 * Servlet implementation class OperationServlrt
 */
@WebServlet("/OperationServlrt")
public class OperationServlrt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OperationServlrt() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cl = Integer.parseInt(request.getParameter("cl"));
		if (cl == 1) {
			String Uid = request.getParameter("id").toString();
			String Password = request.getParameter("pass");
			int Perm = Integer.parseInt(request.getParameter("qx"));
			int pp = Integer.parseInt(request.getParameter("pp"));
			request.setAttribute("pp", pp);
			System.out.println(Uid + "," + Password + "," + Perm);
			UsersUtil uu = new UsersUtil();
			int i = uu.update_U(Uid, Password, Perm);
			if (i == 1) {
				request.getRequestDispatcher("ook.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("errr.jsp").forward(request, response);
			}
		}
		if (cl == 2) {
			HttpSession session = request.getSession();
			String userName = session.getAttribute("userName").toString();
			String[] check = request.getParameterValues("CheckBox");
			if (check == null) {
				request.getRequestDispatcher("U_allBook.jsp?pageNow=1&ad=无选中").forward(request, response);
			} else {
				for (int i = 0; i < check.length; i++) {
					System.out.println(check[i] + "");
					Cookie ttf = new Cookie(userName + "_" + check[i], check[i]);// 以"用户名_书本编号"的形式给Cookie命名
					ttf.setMaxAge(3 * 24 * 60 * 60);
					response.addCookie(ttf);
				}
				request.getRequestDispatcher("U_allBook.jsp?pageNow=1&AD=无选中").forward(request, response);
			}
		}
		if (cl == 3) {
			HttpSession session = request.getSession();
			String userName = session.getAttribute("userName").toString();
			String Bid = request.getParameter("B");
			Cookie th = new Cookie(userName + "_" + Bid, Bid);
			th.setMaxAge(0);
			response.addCookie(th);
			request.getRequestDispatcher("U_shopping.jsp?AD=ok").forward(request, response);
		}
		if (cl == 4) {
			String[] Check = request.getParameterValues("CHECK");
			if (Check == null) {
				request.getRequestDispatcher("U_shopping.jsp?ad=无选中").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				String Time = request.getParameter("Time");
				String[] select = request.getParameterValues("SELECT");
				String[] ok = new String[Check.length];
				for (int i = 0; i < select.length; i++) {
					String t = select[i].substring(0, select[i].length() - 2);
					System.out.println("过滤后：" + t);
					for (int j = 0; j < Check.length; j++) {
						if (Check[j].equals(t))
							ok[j] = select[i].substring(select[i].length() - 1);
					}
				}
				session.setAttribute("Numbers", ok);
				session.setAttribute("Bids", Check);
				session.setAttribute("Time", Time);
				request.getRequestDispatcher("U_checkstand.jsp").forward(request, response);
			}
		}
		if (cl == 5) {
			HttpSession session = request.getSession();
			int S = 1;
			BuyUtil buytuil = new BuyUtil();
			BookUtil bookutil = new BookUtil();
			String Uid = session.getAttribute("userName").toString();
			String[] Bids = (String[]) session.getAttribute("Bids");
			String[] Numbers = (String[]) session.getAttribute("Numbers");
			String Time = session.getAttribute("Time").toString();
			Book[] books = new Book[Bids.length];
			for (int i = 0; i < books.length; i++) {
				int Bid = Integer.parseInt(Bids[i]);
				books[i] = bookutil.bookById(Bid);
			}
			for (int j = 0; j < books.length; j++) {
				String Bid = books[j].getBid() + "";
				String Bname = books[j].getBname();
				int ByNumber = Integer.parseInt(Numbers[j]);
				double Amount = ByNumber * books[j].getPrice();
				double Price = books[j].getPrice();
				Buy buy = new Buy(Uid, Bid, Bname, Price, Time, ByNumber, Amount);
				int i = buytuil.addIndent(buy);
				int o = bookutil.upIn(books[j].getBid(), ByNumber);
				S = S * i * o;
			}
			if (S == 0) {
				request.getRequestDispatcher("k.jsp").forward(request, response);
			} else {
				for (int j = 0; j < books.length; j++) {
					String CookieName = Uid + "_" + books[j].getBid();
					Cookie k = new Cookie(CookieName, CookieName);
					k.setMaxAge(0);
					response.addCookie(k);
				}
				request.getRequestDispatcher("f.jsp").forward(request, response);
			}
		}
		if (cl == 6) {
			String[] Check = request.getParameterValues("Check");
			if (Check == null) {
				request.getRequestDispatcher("A_indent.jsp?fk=ok").forward(request, response);
			} else {
				BuyUtil but = new BuyUtil();
				int S = 1;
				for (int i = 0; i < Check.length; i++) {
					int ID = Integer.parseInt(Check[i]);
					System.out.println(ID);
					int n = but.deletedd(ID);
					S = S * n;
				}
				if (S == 0) {
					request.getRequestDispatcher("c.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("l.jsp").forward(request, response);
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
