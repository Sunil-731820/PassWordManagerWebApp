
<%@page import="com.java.jsp.DAO.UserLoginDAO"%>
<%@page import="com.java.jsp.PasswordEncryptionsAndDecryptions.HashingThePassword"%>
<%@page import="com.java.jsp.Model.UserLogin"%>
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
            background-image: url("images/PasswordHomePages.png");
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

 <nav class="navbar navbar-expand-md navbar-light bg-light">
            <a href="#" class="navbar-brand">
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ml-auto" style="margin-right: 30px;">
                    <a class="dropdown-item" href="UserRegister.jsp">Sign Up</a>
                </div>
            </div>
        </nav>
        <div>
            <h1>
                <b>Password Manager</b>
            </h1>
        </div>
        <!-- Sing in  Form -->
        <form action="UserLogin.jsp" method="post">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="img/signin-image.jpg" alt="sing up image"></figure>
                            <a href="UserRegister.jsp" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in</h2>
                            <form method="get" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="userLoginEmailId"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userLoginEmailId" id="userLoginEmailId" placeholder=" Enter Your Gmail " required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="userLoginPassword"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="userLoginPassword" id="userLoginPassword" placeholder="Enter Your Password" required="required"/>
                                </div>
                                
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log In"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        
        <%
        	if(request.getParameter("userLoginEmailId")!=null && request.getParameter("userLoginPassword")!=null){
        		String userLoginEmailId = request.getParameter("userLoginEmailId").trim();
        		String userLoginPassword = request.getParameter("userLoginPassword").trim();
        		UserLoginDAO dao = new UserLoginDAO();
        		HashingThePassword hashPasword = new HashingThePassword();
        		String HashedPassword = hashPasword.hashPasswordForLoginAttempts(userLoginPassword);
        		int count = dao.adminLogIn(userLoginEmailId, HashedPassword);
        		if(count==1){
        %>
			<jsp:forward page="DashBoard.jsp"/>
			<% 
        		} 
        		else{
        	%>	
        	<jsp:forward page="LoginErrorPage.jsp"/>
        	<% 
        		}
        		%>
        		
        	<%
        	
        	}
        %>
       
</body>
</html>