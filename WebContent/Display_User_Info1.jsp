
<%@ page import="com.model.Registration"%>
<%@ page import="com.dao.RegisterDao"%>
<%@ page import="com.model.Post"%>
<%@ page import="com.model.Advice"%>
<%@ page import="com.dao.MyConnection"%>
<%@ page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Information</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  width:100%;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
#t01 tr:nth-child(even) {
  background-color: #eee;
}
#t01 tr:nth-child(odd) {
 background-color: #fff;
}
#t01 th {
  background-color: black;
  color: white;
}
</style>
</head>
<body style="background-image: url('images//Login.jpg');">
<script type="text/javascript">
	<div class="boxed" id="FullLogin">
			<div>
				<h2>PERSONAL INFORMATION</h2>
			</div>
		
			<div class="container">
	<%!Registration reg;%>
	<%!Post po; %>
	<%!Advice ad; %>
	<%!List<Advice> ls_ad;%> 
	<%
	
				if (!session.isNew()) {

					Registration currentUser = (Registration) (session.getAttribute("UserObj"));
					session.setAttribute("Usernm", currentUser.getAcc_username());
					session.setAttribute("UserObj", currentUser);
				
					
					final Connection con;
					con=MyConnection.getConnection();
					
					String fn=currentUser.getFname();
					String sn=currentUser.getSname();
					PreparedStatement ps=null;
					 po=new Post();
					try {
						ps=con.prepareStatement("select * from post1 where fname=? and sname=?");
						ps.setString(1,fn);
						ps.setString(2,sn);
						System.out.println("fn="+fn);
						System.out.println("sn="+sn);
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
							System.out.println("PostInfo="+rs.getInt(1)+rs.getString(2)+rs.getString(3)+rs.getString(4));
							po.setId(rs.getInt(1));
							po.setFname(rs.getString(2));
							po.setSname(rs.getString(3));
							po.setQuery(rs.getString(4));
							po.setStatus(rs.getString(5));
							po.setDate(rs.getDate(6));					
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					int qid=po.getId();
					
					try {
						ls_ad=new LinkedList<Advice>();
						ps=con.prepareStatement("select * from advice where qid=?");
						ps.setInt(1,qid);
						System.out.println("qid="+qid);
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
							ad=new Advice();
							System.out.println("adviceInfo="+rs.getInt(1)+rs.getString(2)+rs.getString(3)+rs.getString(4)+rs.getString(5));
							ad.setId(rs.getInt(1));
							ad.setFname1(rs.getString(2));
							ad.setSname1(rs.getString(3));
							ad.setQid(rs.getInt(4));
							ad.setAdvice(rs.getString(5));
							ad.setDate(rs.getDate(6));
							ls_ad.add(ad);
						}
						for(Advice ad:ls_ad)
						{
							System.out.println("Advices="+ad.getAdvice());
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
			%>
			
			
	<table border=1 width=50% height=20% id="t01">
	
		<tr style="text-align: center">
			<td><b>First Name</b></td>
			<td><%=currentUser.getFname()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Last Name</b></td>
			<td><%=currentUser.getSname()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Mobile Number</b></td>
			<td><%=currentUser.getMobno()%></td>
		</tr>
		
		<tr style="text-align: center">
			<td><b>Age</b></td>
			<td><%=currentUser.getAge()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Interested Topic</b></td>
			<td><%=currentUser.getTopic()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>User name</b></td>
			<td><%=currentUser.getAcc_username()%></td>
		</tr>
		
		
	</table>
	<%
				}
				else
				{
					response.sendRedirect("Error.jsp");
				}
	%>
	
	
			<br><br>
			<div>
				<h2>YOUR RECENT QUERY INFORMATION</h2>
			</div>
			<div class="container">

	<table border=1 width=50% height=20% id="t01">
	
		<tr style="text-align: center">
			<td><b>Query ID</b></td>
			<td><%=po.getId()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Posted Query</b></td>
			<td><%=po.getQuery()%></td>
		</tr>
		<tr style="text-align: center">
			<td><b>Query Status</b></td>
			<td><%=po.getStatus()%></td>
		</tr>
		
		<tr style="text-align: center">
			<td><b>Query Posted Date</b></td>
			<td><%=po.getDate()%></td>
		</tr>

		
	</table>
		<br><br>
		<div>
				<h2>Advices On your Query</h2>
			</div>
			<div class="container">

	<table border=1 width=90% height=20% id="t01">
			<tr style="text-align: center">
					<td><b>Adviced By</b></td>
					<td><b>Advice</b></td>
					<td><b>Query Status</b></td>
					<td><b>Advice Posted Date</b></td>
				</tr>
				<%
					for (Advice adv : ls_ad) 
					{
				%>				
				<tr style="text-align: center">
					<td><%=adv.getFname1()+" "+adv.getSname1()%></td>
					<td><%=adv.getAdvice()%></td>
					<td>Executed</td>
					<td><%=adv.getDate()%></td>
		
				</tr>
				<%
					}
				%>
			</table>
			</div>
			</div>
			
</body>
</html>