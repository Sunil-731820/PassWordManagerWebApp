<%@page import="com.java.jsp.Servlet.SearchUserServlet"%>
<%@page import="com.java.jsp.Model.SavingPasswordInEncryptedFormat"%>
<%@page import="com.java.jsp.PasswordEncryptionsAndDecryptions.HashingThePassword"%>
<%@page import="com.java.jsp.DAO.SavingPasswordInEncryptedFormatDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        
        <script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/register.css" type="text/css" />
         <style type="text/css">
        body {
            background-image: url("img/BackgrounImages.jpg");
            background-color: #cccccc;
        }
        .img-rounded {
            height: 100%;
            width: 100%;
        }
        h1 {
            color: white;
            text-align: center;
        }
    </style>
    


</head>
<body>

<%
	 SavingPasswordInEncryptedFormatDAO dao = new SavingPasswordInEncryptedFormatDAO();
	HashingThePassword hashPaswordDao = new HashingThePassword();
	
			
 
%>

 <h2 align="center"> Password Manager App </h2>
 <form action="AddPassword.jsp" method="post">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container"> 
                    <div class="signup-content"> 
                        <div class="signup-form">
                            <h2 class="form-title">Your Password Will Saved In Encrypted Format.. </h2>
                            <form class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="userPersonalEmailId"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="userSavingPassword" id="userSavingPassword" placeholder="Enter Your Personal Password" required="required"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Add Password"/>
                                </div>
                               
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                            <h2><a href="UserRegister.jsp" class="signup-image-link">If Already Sign Up Want to add Security Question? Add Security Questions</a></h2>
                        </div>
                    </div>
                </div>
            </section>
        </form>
       
        <%
        	
         String userSavingPassword = request.getParameter("userSavingPassword");
         if(userSavingPassword !=null && !userSavingPassword.isEmpty()){
        	SavingPasswordInEncryptedFormat savedPassword = new SavingPasswordInEncryptedFormat();
        	String hashedPassword = hashPaswordDao.hashPasswordForLoginAttempts(userSavingPassword);
        	savedPassword.setUserSavingPassword(hashedPassword);
        	dao.addThePasswordInEncryptedFormat(savedPassword);
        	 %>
        	 
        	 <jsp:forward page="PasswordAddedSuccessfully.jsp"/>
		<%          }
         %> 
         
         
         
        
       
      



</body>
</html>