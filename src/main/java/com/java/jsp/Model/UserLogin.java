package com.java.jsp.Model;

public class UserLogin {
	
	private int userLoginId;
	private String userLoginEmailId;
	private String userLoginPassword;
	
	
	public int getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(int userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getUserLoginEmailId() {
		return userLoginEmailId;
	}
	public void setUserLoginEmailId(String userLoginEmailId) {
		this.userLoginEmailId = userLoginEmailId;
	}
	public String getUserLoginPassword() {
		return userLoginPassword;
	}
	public void setUserLoginPassword(String userLoginPassword) {
		this.userLoginPassword = userLoginPassword;
	}
	@Override
	public String toString() {
		return "UserLogin [userLoginId=" + userLoginId + ", userLoginEmailId=" + userLoginEmailId
				+ ", userLoginPassword=" + userLoginPassword + "]";
	}
	
	

}
