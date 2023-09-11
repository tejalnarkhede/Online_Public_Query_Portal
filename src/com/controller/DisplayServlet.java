package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.dao.RegisterDao;
import com.model.Advice;
import com.model.Registration;

/**
 * Servlet implementation class DisplayServlet
 */
@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String username_op;
	
	public DisplayServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		List<Advice> ad=null;
		
		String qid=request.getParameter("qid");
		try{
			String str=request.getParameter("operation");
			String username_op=request.getParameter("acc_uname");
			System.out.println("Operation="+str);
			System.out.println("username_op="+username_op);
			
			if(str.equals("viewprofile")){
				RegisterDao rd=new RegisterDao();
				Registration r=rd.DisplayUser(username_op);
				request.setAttribute("Current_User_Obj",r);
				request.getRequestDispatcher("Display_User_Info.jsp").forward(request, response);
			}
			RegisterDao rd;
			if(str.equals("giveadvice"))
			{
				rd=new RegisterDao();
				Advice a1=rd.DisplayAdvice(qid);
				request.setAttribute("Current_Advice",a1);
				request.getRequestDispatcher("Status.jsp").forward(request, response);
			}
			
			if(str.equals("register"))
			{
				
				request.getRequestDispatcher("Register.jsp").forward(request, response);
			}
			
			if(str.equals("login")){
				request.getRequestDispatcher("Login_Page.jsp").forward(request, response);
			}
			
			if(str.equals("post"))
			{
				request.getRequestDispatcher("Post.jsp").forward(request, response);
			}
			
			if(str.equals("search"))
			{
				request.getRequestDispatcher("Search.jsp").forward(request, response);
			}
		}
		catch(Exception e){
			response.sendRedirect("Error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
