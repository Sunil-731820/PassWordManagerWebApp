package com.java.jsp.Model;

public class SecurityQuestions {
	
	private int securityId;
	private String usernickName;
	private String userIdol;
	private String userSubject;
	private String userFavoriteColor;
	private String userChildHoodSchool;
	private String userBelongingCity;
	private String userPersonalEmailId;
	
	public int getSecurityId() {
		return securityId;
	}
	public void setSecurityId(int securityId) {
		this.securityId = securityId;
	}
	public String getUsernickName() {
		return usernickName;
	}
	public void setUsernickName(String usernickName) {
		this.usernickName = usernickName;
	}
	public String getUserIdol() {
		return userIdol;
	}
	public void setUserIdol(String userIdol) {
		this.userIdol = userIdol;
	}
	public String getUserSubject() {
		return userSubject;
	}
	public void setUserSubject(String userSubject) {
		this.userSubject = userSubject;
	}
	public String getUserFavoriteColor() {
		return userFavoriteColor;
	}
	public void setUserFavoriteColor(String userFavoriteColor) {
		this.userFavoriteColor = userFavoriteColor;
	}
	public String getUserChildHoodSchool() {
		return userChildHoodSchool;
	}
	public void setUserChildHoodSchool(String userChildHoodSchool) {
		this.userChildHoodSchool = userChildHoodSchool;
	}
	public String getUserBelongingCity() {
		return userBelongingCity;
	}
	public void setUserBelongingCity(String userBelongingCity) {
		this.userBelongingCity = userBelongingCity;
	}
	public String getUserPersonalEmailId() {
		return userPersonalEmailId;
	}
	public void setUserPersonalEmailId(String userPersonalEmailId) {
		this.userPersonalEmailId = userPersonalEmailId;
	}
	@Override
	public String toString() {
		return "SecurityQuestions [securityId=" + securityId + ", usernickName=" + usernickName + ", userIdol="
				+ userIdol + ", userSubject=" + userSubject + ", userFavoriteColor=" + userFavoriteColor
				+ ", userChildHoodSchool=" + userChildHoodSchool + ", userBelongingCity=" + userBelongingCity
				+ ", userPersonalEmailId=" + userPersonalEmailId + "]";
	}
	
	

}
