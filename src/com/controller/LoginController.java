package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.model.Login;
import com.model.Registration;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In Login Controller");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("psw");
		Login lobj=new Login();
		lobj.setUsername(uname);
		lobj.setPassword(pass);
		RegisterDao rd=new RegisterDao();
		boolean b=rd.ValidateUser(lobj);				
		if(b) {
		Registration r=rd.DisplayUser(uname);
			HttpSession session = request.getSession(true);
			session.setAttribute("UserObj",r);
			session.setAttribute("msg", "you login successfully");
			request.getRequestDispatcher("ind.html").forward(request, response);
		}
		else{
			response.sendRedirect("Error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
