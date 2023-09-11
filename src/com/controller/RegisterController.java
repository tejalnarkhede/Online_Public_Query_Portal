package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RegisterDao;
import com.model.Registration;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In RegisterController");
		int i=0;
		//int regNo=Integer.parseInt(request.getParameter("regid"));
		String regFName=request.getParameter("fname");
		String regSName=request.getParameter("sname");
		String mobno=request.getParameter("mobno");
		int age=Integer.parseInt(request.getParameter("age"));
		String topic=request.getParameter("topic");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		

		Registration r=new Registration();
		//r.setRegid(regNo);
		r.setFname(regFName);
		r.setSname(regSName);
		r.setMobno(mobno);
		r.setAge(age);
		r.setTopic(topic);
		r.setAcc_username(uname);
		r.setAcc_password(pass);
		
		//System.out.println(regNo+regFName+regSName+mobno+uname+pass+amount);

		RegisterDao rd=new RegisterDao();
		i=rd.saveData(r);
		System.out.println("i="+i);
		if(i>0){
			response.sendRedirect("Login_Page.jsp");
		}
		else{
			response.sendRedirect("Error.html");
			//System.out.println("Insertion Failed!");
		}		
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
}

}
