<%@page import="com.java.jsp.Model.UserLogin"%>
<%@page import="com.java.jsp.PasswordEncryptionsAndDecryptions.HashingThePassword"%>
<%@page import="com.java.jsp.DAO.UserLoginDAO"%>
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
	UserLoginDAO dao = new UserLoginDAO();
	HashingThePassword hashPassword = new HashingThePassword();
	int userLoginId = dao.generateUserId();

%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
            <a href="#" class="navbar-brand"> 
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ml-auto" style="margin-right: 30px;">
                    <a class="dropdown-item" href="HomePage.jsp">Home</a>                    
                </div>
            </div>
        </nav> 
        <div>
            <h1>
                <b>Welcome To password manager</b>
            </h1>
        </div>
        <form action="UserRegister.jsp" method="post">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container"> 
                    <div class="signup-content"> 
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                    <label for="userLoginId"><i class="zmdi zmdi-email"></i></label>
                                    <input type="userLoginId" name="userLoginId" id="userLoginId" value="<%=userLoginId%>" />
                                </div>
                                <div class="form-group">
                                    <label for="userLoginEmailId"><i class="zmdi zmdi-email"></i></label>
                                    <input type="userLoginEmailId" name="userLoginEmailId" id="userLoginEmailId" placeholder="Your Email" required="required" min="5"/>
                                </div>
                                <div class="form-group">
                                    <label for="userLoginPassword"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="userLoginPassword" id="userLoginPassword" placeholder="Your Password Please " required="required"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                            <h2><a href="UserLogin.jsp" class="signup-image-link">Log In</a></h2>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <%
        String userLoginEmailId = request.getParameter("userLoginEmailId");
        String userLoginPassword = request.getParameter("userLoginPassword");
      
        if(request.getParameter("userLoginEmailId")!=null && request.getParameter("userLoginPassword")!=null){
        	
        	UserLogin userLogin = new UserLogin();
        	/* trying To do hashing for Password  */
        	String passWord = request.getParameter("userLoginPassword");
        	  // Hash the password
            String hashedPassword = hashPassword.hashingThepassword(passWord);
        	userLogin.setUserLoginEmailId(request.getParameter("userLoginEmailId"));
        	/* admin.setPassword(request.getParameter("password")); */
        	userLogin.setUserLoginPassword(hashedPassword);
        	/* out.print("The Username from admin is : ="+admin.getUsername());
        	out.println("The password is from admin is : ="+admin.getPassword()); */
        	
        	dao.registerUser(userLogin);
        	 %>
        	 <jsp:forward page="SecurityPage.jsp"/>
        	 
        	<% 
        }
        %>
       


</form>

</body>
</html>
