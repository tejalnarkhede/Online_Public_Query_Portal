<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.Post"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>See Comments On Your Queries</title>
</head>
<link rel="stylesheet" type="text/css" href="css//status1_css.css">
<body>
<style>
tr.spaceUnder>td
{
	padding-bottom:1em;
}
tr.spaceUnder1>td
{
	padding-bottom:3em;
}
</style>

<%!  Post p=null; %>  <!--declaration tag-->
<%--
			<%							
	if(!session.isNew())
	{
		Object o=session.getAttribute("data");
		System.out.println("Object o="+o);
		p=(Post)o;
		System.out.println("Object p="+p);
		session.invalidate();
		out.println(p.getFname()+"&nbsp&nbsp"+p.getQuery()+"&nbsp&nbsp"+p.getStatus());
	%>
	 --%> 
	 <center><label style="font-size:25px;"><b>If you want to search the query <a href="#">click here</a></b></label></center>
	 <br>
	 <hr>
	 <br>
	 <%
		try{
			
			Class.forName("oracle.jdbc.OracleDriver").newInstance();
			//serverhost = localhost, port=3306, username=root, password=123
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			Statement statement = con.createStatement();
			String sql ="select fname,sname,id,query,DT,fname1,sname1,advice,DT1 from post1 INNER JOIN advice on advice.qid=post1.id";
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next())
			{
				do
				{
	%>
			
			<table style="width : 100%;">
				
				<tr class="spaceUnder">
				
					<td><label><b><i>Posted By :<%=rs.getString("fname")+" "+rs.getString("sname")%></i></b></label></td>
					<td><label><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Posted On :<%=rs.getDate("dt")%></i></b></label></td>
				</tr>	
				
				<tr>
					<td><label><b>&nbsp;&nbsp;&nbsp;Query ID: </b></label></td>
					<td><b>&nbsp;&nbsp;&nbsp;<%=rs.getString("id")%></b></td>
				</tr>
				<br>
				<tr class="spaceUnder1" style="border spacing:20px">
					<td><label><b>&nbsp;&nbsp;&nbsp;Query:</b></label></td>
					<td><b>&nbsp;&nbsp;&nbsp;<%=rs.getString("query")%></b></td>
				</tr>
				
				
				
				<tr style="border spacing:50px">
				
					<td><label><b><i>Advised by :<%=rs.getString("fname1")+" "+rs.getString("sname1")%></i> </b></label></td>
					<td><label><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Advised On :<%=rs.getDate("dt1")%></i></b></label></td>
				</tr>
			
				
					<!--  <td><label><b>&nbsp;&nbsp;&nbsp;Advice: </b></label></td> -->
 					<td style:"width=100%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("advice")%></b></td>
				
				
				</table>
			
			<br>
			<!--  <center><a href="advice.jsp">Give Your Advice</a></center> -->
		
		<% 
		}while(rs.next());
		%>
		
		
		<%
		}
		con.close();
		} 
				
		catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
						
			</div>
</body>
</html>