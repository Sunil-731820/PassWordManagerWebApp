package com.java.jsp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.jsp.Helper.ConnectionHelper;
import com.java.jsp.Model.UserLogin;

public class UserLoginDAO {
	
	Connection connection;
	PreparedStatement pst;
	
	
//	This is Registering The user id 
	public String registerUser(UserLogin userLogin) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "insert into userLogin(userLoginId,userLoginEmailId,userLoginPassword) values (?,?,?)";
		pst = connection.prepareStatement(cmd);
		System.out.println("The value of the get user id is :"+ userLogin.getUserLoginId());
		System.out.println("The value of the get user EMail id is :"+userLogin.getUserLoginEmailId());
		System.out.println("The value of the get user password is :"+userLogin.getUserLoginPassword());
		pst.setInt(1,userLogin.getUserLoginId());
		pst.setString(2, userLogin.getUserLoginEmailId());
		pst.setString(3, userLogin.getUserLoginPassword());
		pst.executeUpdate();
		return "User is Added Successfully !";
	}
	
//	This method is automatically generating The Dorctor Id using the database 
	public int generateUserId() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select max(userLoginId)+1 ano from userLogin ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int id = res.getInt("ano");
		return id;
	}
	
//	This is the Login methods 
	public int UserLogIn(String userLoginEmailId , String userLoginPassword) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select count(*) cnt from userLogin where userLoginEmailId=? and userLoginPassword=?";
		pst = connection.prepareStatement(cmd);
		pst.setString(1, userLoginEmailId);
		pst.setString(2, userLoginPassword);
		ResultSet res = pst.executeQuery();
		res.next();
		int count = res.getInt("cnt");
		return count;
	}
	
////	Searching The Data using email id : 
//	
//	public void searchUserEmailbyEmailId(String userLoginEmailId) throws ClassNotFoundException, SQLException {
//		
//		connection = ConnectionHelper.getConnection();
//		String cmd = "select *from userLogin where userLoginEmailId=?";
//		pst = connection.prepareStatement(cmd);
//		pst.setString(1, userLoginEmailId);
//		int res = pst.executeUpdate();
//		res
//	}

}
