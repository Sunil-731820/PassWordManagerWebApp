package com.java.jsp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.jsp.Patient;
import com.java.jsp.Helper.ConnectionHelper;
import com.java.jsp.Model.SecurityQuestions;


public class SecurityQuestionsDAO {
	Connection connection;
	PreparedStatement pst;

	
//	This method is automatically generating The Dorctor Id using the database 
	public int generateSecurityQuestionsId() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select max(securityId)+1 ano from SecurityQuestionsForRestoringPassword ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int id = res.getInt("ano");
		return id;
	}
	
	public String addSecurityQuestions(SecurityQuestions securityQuestions) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "insert into SecurityQuestionsForRestoringPassword(usernickName,userIdol,userSubject,userFavoriteColor,userChildHoodSchool,userBelongingCity,userPersonalEmailId) values(?,?,?,?,?,?,?)";
		pst = connection.prepareStatement(cmd);
		pst.setString(1,securityQuestions.getUsernickName());
		pst.setString(2, securityQuestions.getUserIdol());
		pst.setString(3, securityQuestions.getUserSubject());
		pst.setString(4, securityQuestions.getUserFavoriteColor());
		pst.setString(5, securityQuestions.getUserChildHoodSchool());
		pst.setString(6, securityQuestions.getUserBelongingCity());
		pst.setString(7, securityQuestions.getUserPersonalEmailId());
		pst.executeUpdate();
		return "Security Questions is Added Successfully";
		
	}
	
	


}
