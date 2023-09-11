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
<title>See Your Status</title>
</head>
<body>
<style>
tr.spaceUnder>td
{
	padding-bottom:1em;
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
	 <%
		try{
			
			Class.forName("oracle.jdbc.OracleDriver").newInstance();
			//serverhost = localhost, port=3306, username=root, password=123
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			Statement statement = con.createStatement();
			String sql ="SELECT *FROM post1 ORDER BY id";
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next())
			{
				do
				{
	%>
		
			<table align="center" width="600px">
				
				<tr class="spaceUnder">
				<hr>
					<td><label><b><i>Posted By :<%=rs.getString("fname")+" "+rs.getString("sname")%></i></b></label></td>
					<td><label><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Posted On :<%=rs.getDate("dt")%></i></b></label></td>
				</tr>	
				<br>
				<tr>
					<td><label><b>&nbsp;&nbsp;&nbsp;Query ID: </b></label></td>
					<td><b>&nbsp;&nbsp;&nbsp;<%=rs.getString("id")%></b></td>
				</tr>
				<br>
				<tr style="border spacing:20px">
					<td><label><b>&nbsp;&nbsp;&nbsp;Query:</b></label></td>
					<td><b>&nbsp;&nbsp;&nbsp;<%=rs.getString("query")%></b></td>
				</tr>
				<br>
				<tr>
					<td><label><b>&nbsp;&nbsp;&nbsp;Query status: </b></label></td>
					<td><b>&nbsp;&nbsp;&nbsp;<%=rs.getString("status")%></b></td>
				</tr>
				</table>
			<br>
			<center><a href="advice.jsp">Give Your Advice</a></center>
			<br><br>
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