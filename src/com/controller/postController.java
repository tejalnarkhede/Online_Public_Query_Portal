package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MyConnection;
import com.dao.postDao;
import com.model.Post;



/**
 * Servlet implementation class postController
 */
@WebServlet("/postController")
public class postController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		 final Connection con;
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("In postController");
		int i=0;
		String fName=request.getParameter("fname");
		String sName=request.getParameter("sname");
		String query=request.getParameter("query");
		String status=request.getParameter("status");
		
		Post p=new Post();
		
		p.setFname(fName);
		p.setSname(sName);
		p.setQuery(query);
		p.setStatus(status);
		
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);  
		//System.out.println(date);  
		p.setDate(date);
		
		
		System.out.println(fName+sName+query+status);

		postDao pd=new postDao();
		i=pd.saveData(p);
		System.out.println("i="+i);
		if(i>0){
			String str="Select *from post1";
			con=MyConnection.getConnection();
			
				HttpSession session=request.getSession();
				session.setAttribute("data", p);
				response.sendRedirect("Status.jsp");	
			 
			PrintWriter out=response.getWriter();
			out.println("<h1>"+"FullName="+fName+" "+sName+"</h1>");	
			out.println("<h1>"+"Query="+query+"</h1>");	
			out.println("<h1>"+"Status="+status+"</h1>");
			
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
