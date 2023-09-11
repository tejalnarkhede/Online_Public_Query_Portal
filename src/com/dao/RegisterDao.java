package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.model.Advice;
import com.model.Login;
import com.model.Post;
import com.model.Registration;

public class RegisterDao {
	static Connection con;

	public int saveData(Registration reg){
		con=MyConnection.getConnection();
		System.out.println("con="+con);
		PreparedStatement ps=null;
		int i=0;
		try {
			System.out.println("PrepareStatement in savedata..");
			ps=con.prepareStatement("Insert into Registration1 values(REGSEQ.NEXTVAL,?,?,?,?,?,?,?)");
			ps.setString(1,reg.getFname());
			ps.setString(2,reg.getSname());
			ps.setString(3,reg.getMobno());
			ps.setInt(4, reg.getAge());
			ps.setString(5,reg.getTopic());
			ps.setString(6, reg.getAcc_username());
			ps.setString(7,reg.getAcc_password());
			i=ps.executeUpdate();
			System.out.println("RegisterDao i="+i);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public boolean ValidateUser(Login l){
		boolean b=false;
		PreparedStatement ps=null;
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from Registration1 where acc_uname=? and acc_password=?");
			ps.setString(1,l.getUsername());
			ps.setString(2,l.getPassword());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}
	

	public Advice DisplayAdvice(String id){
	//boolean b=false;
	PreparedStatement ps=null;
	Advice adv=new Advice();
	con=MyConnection.getConnection();
	try {
		ps=con.prepareStatement("select advice from advice where qid=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			adv.setAdvice(rs.getString(1));						
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return adv;		
}

	public Registration DisplayUser(String user_name){
	
		PreparedStatement ps=null;
		Registration reg=new Registration();
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from Registration1 where acc_uname=?");
			ps.setString(1,user_name);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				System.out.println("Info="+rs.getInt(1)+rs.getString(2)+rs.getString(3)+rs.getString(4));
				reg.setFname(rs.getString(2));
				reg.setSname(rs.getString(3));
				reg.setMobno(rs.getString(4));
				reg.setAge(rs.getInt(5));
				reg.setTopic(rs.getString(6));
				reg.setAcc_username(rs.getString(7));
				reg.setAcc_password(rs.getString(8));						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reg;		
	}
	
	public Post DisplayQuery(String fn,String sn){
		
		PreparedStatement ps=null;
		Post po=new Post();
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from post1 where fname=fn and sname=sn;");
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
				po.setDate(rs.getDate(5));						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;		
	}

	/*public static int delete(User u){  
	    int status=0;
	    con=MyConnect
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from register where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	} */ 
/*	public boolean ValidateUser1(Changepass cp){
		boolean b=false;
		PreparedStatement ps=null;
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from registration where acc_username=? and acc_password=?");
			ps.setString(1,cp.getUsername());
			ps.setString(2,cp.getOldpass());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	} */

/*	public int ChangePassword(Changepass cp){
		con=MyConnection.getConnection();
		System.out.println("Hello i m change password..");
		PreparedStatement ps=null;
		int i=0;		
		try {
			ps=con.prepareStatement("update Registration set acc_password=? where acc_username=?");			
			ps.setString(1, cp.getNewpass());
			ps.setString(2, cp.getUsername());
			i=ps.executeUpdate();
			System.out.println("change pass i="+i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	} */

/*	public int save_Mob_Rec_Data(Mob_Recharge mb){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;
		try {
			ps=con.prepareStatement("Insert into Recharge values(?,?,?,?,?,?,?)");
			ps.setDouble(1,mb.getTransaction_Id());
			ps.setString(2,mb.getMobno());
			ps.setDate(3,mb.getDate());
			ps.setDouble(4,mb.getAmount());
			ps.setDouble(5,mb.getTot_amount());
			ps.setDouble(6,mb.getRem_balance());
			ps.setString(7, mb.getAcc_username());
			i=ps.executeUpdate();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	} */
	public int Update_Amount_after_transaction(String uname,double a){
		con=MyConnection.getConnection();
		PreparedStatement ps=null;
		int i=0;		
		try {
			ps=con.prepareStatement("update Registration set amount=? where acc_username=?");			
			ps.setDouble(1, a);
			ps.setString(2, uname);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return i;
	}
	/*public List<Mob_Recharge> DisplayAllTransactions(String user_name){
		List<Mob_Recharge> ls=null;
		String str="SELECT * FROM Recharge where acc_username='"+user_name+"'";
		con=MyConnection.getConnection();
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery(str);
			ls=new LinkedList<Mob_Recharge>();
			while(rs.next()){
				Mob_Recharge mb=new Mob_Recharge();
				mb.setTransaction_Id(rs.getDouble(1));
				mb.setMobno(rs.getString(2));
				mb.setDate(rs.getDate(3));				
				mb.setAmount(rs.getDouble(4));
				mb.setTot_amount(rs.getDouble(5));
				mb.setRem_balance(rs.getDouble(6));
				mb.setAcc_username(rs.getString(7));
				ls.add(mb);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;		
	} */
}
