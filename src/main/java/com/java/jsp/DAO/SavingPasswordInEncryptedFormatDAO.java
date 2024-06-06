package com.java.jsp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.java.jsp.Helper.ConnectionHelper;
import com.java.jsp.Model.SavingPasswordInEncryptedFormat;

public class SavingPasswordInEncryptedFormatDAO {
	
	Connection connection;
	PreparedStatement pst;
	
	
//	Adding The Password In database in Encrypted format
	public String addThePasswordInEncryptedFormat(SavingPasswordInEncryptedFormat SavingPasswordInEncryptedFormat) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "insert into userLogin(userSavingPassword) values (?)";
		pst = connection.prepareStatement(cmd);
		pst.setString(1, SavingPasswordInEncryptedFormat.getUserSavingPassword());
		pst.executeUpdate();
		return "The Password is Added Successfully";
		
	}



}
