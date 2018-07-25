package com.fk.javaServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fk.javaBean.Book;
import com.fk.javaBean.BookUtil;

/**
 * Servlet implementation class BookDisposeServlet
 */
@WebServlet("/BookDisposeServlet")
public class BookDisposeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDisposeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//cl的值决定Servlet的具体操作
		int cl=Integer.parseInt(request.getParameter("cl"));
		if(cl==1) {//添加图书
			String Bname=request.getParameter("Bname").toString();
			String Author=request.getParameter("Author").toString();
			String BookType=request.getParameter("BookType").toString();
			double Price=Double.parseDouble(request.getParameter("Price"));
			int Inventory=Integer.parseInt(request.getParameter("Inventory"));
			Book book=new Book(Bname,Author,BookType,Price,Inventory);
			int n=0;
			BookUtil bu=new BookUtil();
			n=bu.addBook(book);
			if(n==1) {//添加成功
				 request.getRequestDispatcher("ok2.jsp").forward(request,response);
			}else {//添加失败
				 request.getRequestDispatcher("err1.jsp?xinxi=1").forward(request,response);
			}
		}
		if(cl==2) {//分页操作
			int pageNow1=Integer.parseInt(request.getParameter("pageNow"));
			int CL=Integer.parseInt(request.getParameter("CL"));
			int pp=Integer.parseInt(request.getParameter("pp"));
			switch (CL) {
			case 0:
				pageNow1=pageNow1-1;
				break;
			case -1:
				pageNow1=pageNow1+1;
				break;
			default:
				pageNow1=CL;
				break;
			}
			request.setAttribute("pageNow", pageNow1);
			if(pp==1) {//pp的值决定操作后跳转的页面
				request.getRequestDispatcher("A_out.jsp").forward(request, response);
			}
			if(pp==2) {
				request.getRequestDispatcher("U_allBook.jsp").forward(request, response);
			}
			if(pp==3) {
				request.getRequestDispatcher("GL_u.jsp").forward(request, response);
			}
			if(pp==4) {
				request.getRequestDispatcher("GL_a.jsp").forward(request, response);
			}
			
		}
		if(cl==3) {//删除图书（下架）
			BookUtil bu=new BookUtil();
			int Bid=Integer.parseInt(request.getParameter("Bid"));
			int n=bu.deleteById(Bid);
			if(n==1) {
				request.getRequestDispatcher("ok_3.jsp?op=1").forward(request, response);
			}
			if(n==0) {
				request.getRequestDispatcher("err_2.jap?op=1").forward(request, response);
			}
		}
		if(cl==4) {//为修改书本参数做数据准备
	 	String Bid=request.getParameter("Bid");
	 	String Bname=request.getParameter("Bname");
	 	String Author=request.getParameter("Author");
	 	String BookType=request.getParameter("BookType");
	 	String Price=request.getParameter("Price");
	 	String Inventory=request.getParameter("Inventory");
	 	int ll=Integer.parseInt(request.getParameter("ll"));
	 	request.setAttribute("Bid", Bid);
	 	request.setAttribute("Bname",Bname);
	 	request.setAttribute("Author", Author);
	 	request.setAttribute("BookType", BookType);
	 	request.setAttribute("Price", Price);
	 	request.setAttribute("Inventory", Inventory);
	 	if(ll==1)
	 	   request.getRequestDispatcher("A_inventory.jsp").forward(request, response);
	 	if(ll==2)
	 		request.getRequestDispatcher("11.jsp").forward(request, response);
		}
		if(cl==5) {//修改书本参数（价格和库存）
			int Bid=Integer.parseInt(request.getParameter("Bid"));
			double Price=Double.parseDouble(request.getParameter("Price"));
			int Inventory=Integer.parseInt(request.getParameter("inven")); 
			BookUtil bu=new BookUtil();
			int n=bu.updatePrAndInven(Bid, Price, Inventory);
			if(n==0) {
				request.getRequestDispatcher("err_3.jsp").forward(request, response);
			}
			if(n==1) {
				request.getRequestDispatcher("ok_4.jsp").forward(request, response);
			}
		}
		if(cl==6) {
			System.out.println("eeee");
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


