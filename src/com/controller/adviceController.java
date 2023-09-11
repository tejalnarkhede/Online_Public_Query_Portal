package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MyConnection;
import com.dao.postDao;
import com.model.Advice;
import com.model.Post;

/**
 * Servlet implementation class adviceController
 */
@WebServlet("/adviceController")
public class adviceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adviceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 final Connection con;
			System.out.println("In adviceController");
			int i=0;
			String fName1=request.getParameter("fname1");
			String sName1=request.getParameter("sname1");
			int q_id=Integer.parseInt(request.getParameter("qid"));
			String advice=request.getParameter("advice");
			
			Advice a=new Advice();
			//Post p=new Post();
			a.setFname1(fName1);
			a.setSname1(sName1);
			a.setQid(q_id);
			a.setAdvice(advice);
			
			long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis);  
			//System.out.println(date);  
			a.setDate(date);
			
			
			System.out.println(fName1+" "+sName1+" "+q_id+" "+advice+" "+date);

			postDao pd=new postDao();
			i=pd.saveData1(a);
			System.out.println("i="+i);
			if(i>0){
				String str="Select *from advice;";
				con=MyConnection.getConnection();
				
					HttpSession session=request.getSession();
					session.setAttribute("data", a);
					response.sendRedirect("Status1.jsp");	
				 
				PrintWriter out=response.getWriter();
				out.println("<h1>"+"Advised by="+fName1+" "+sName1+"</h1>");	
				out.println("<h1>"+"Advice="+advice+"</h1>");	
				out.println("<h1>"+"Advised On : ="+date+"</h1>");
				
			}
			else{
				response.sendRedirect("Error.html");
				//System.out.println("Insertion Failed!");
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
