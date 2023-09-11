package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.model.Advice;
import com.model.Post;


public class postDao {
	static Connection con;

	public int saveData(Post pos){
		con=MyConnection.getConnection();
		System.out.println("con in postDao="+con);
		PreparedStatement ps=null;
		int i=0;
		
		try {
			System.out.println("PrepareStatement in savedata..");
			ps=con.prepareStatement("Insert into Post1 values(POSTSEQ.NEXTVAL,?,?,?,?,?)");
			ps.setString(1,pos.getFname());
			ps.setString(2,pos.getSname());
			ps.setString(3,pos.getQuery());
			ps.setString(4,pos.getStatus());
			ps.setDate(5, pos.getDate());
			i=ps.executeUpdate();
			System.out.println("postDao i="+i);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int saveData1(Advice adv){
		con=MyConnection.getConnection();
		
		PreparedStatement ps=null;
		int i=0;
		
		try {
			System.out.println("PrepareStatement in savedata1..");
			ps=con.prepareStatement("Insert into advice values(ADVICESEQ.NEXTVAL,?,?,?,?,?)");
			
			ps.setString(1,adv.getFname1());
			ps.setString(2,adv.getSname1());
			ps.setInt(3,adv.getQid());
			ps.setString(4,adv.getAdvice());
			ps.setDate(5, adv.getDate());
			i=ps.executeUpdate();
			System.out.println("postDao1 i="+i);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public void Display_post_adv() throws SQLException{
		
		con=MyConnection.getConnection();
		Statement stmt=con.createStatement();
		String query="select fname,sname,query,fname,sname,advice from post1 INNER JOIN advice on advice.id=post1.id";
		ResultSet rs=stmt.executeQuery(query);
		
		
	}
	
	
	
}


