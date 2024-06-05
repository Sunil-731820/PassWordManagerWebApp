<%@page import="com.java.jsp.Model.SecurityQuestions"%>
<%@page import="com.java.jsp.DAO.SecurityQuestionsDAO"%>
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
 SecurityQuestionsDAO dao = new SecurityQuestionsDAO();
int securityId = dao.generateSecurityQuestionsId();
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
                <b>Password Manager App</b>
            </h1>
        </div>
        <form action="addpatient.jsp" method="post">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container"> 
                    <div class="signup-content"> 
                        <div class="signup-form">
                            <h2 class="form-title">Add Security Questions </h2>
                            <form class="register-form" id="register-form">
                             <div class="form-group">
                                    <label for="securityId"><i class="zmdi zmdi-email"></i></label>
                                    <input type="number" name="securityId" id="securityId" value="<%=securityId%>" />
                                </div>
                                <div class="form-group">
                                    <label for="usernickName"><i class="zmdi zmdi-email"></i></label>
                                    <input type="text" name="usernickName" id="usernickName" placeholder="Enter Your User Nick Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <label for="userIdol"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="userIdol" id="userIdol" placeholder="Enter Your Idol" required="required"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="userSubject"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="userSubject" id="userSubject" placeholder="Enter User Favorite Subject " required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="userFavoriteColor"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="city" id="userFavoriteColor" placeholder="Enter User Favorite Color " required="required"/>
                                </div>
                               
                                 <div class="form-group">
                                    <label for="userChildHoodSchool"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="email" id="userChildHoodSchool" placeholder="Enter Your User Childhood School " required="required"/>
                                </div>
                               
                                <div class="form-group">
                                    <label for="userBelongingCity"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="age" id="userBelongingCity" placeholder="Enter Your User Belonging City" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="userPersonalEmailId"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="address" id="userPersonalEmailId" placeholder="Enter Your Personal Email Id" required="required"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Add Security Questions"/>
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
        if(request.getParameter("securityId")!=null && request.getParameter("usernickName")!=null){
        	SecurityQuestions security = new SecurityQuestions();
        	security.setId(Integer.parseInt(request.getParameter("id")));
        	security.setFname(request.getParameter("fname"));
        	security.setLname(request.getParameter("lname"));
        	security.setGender(request.getParameter("gender"));
        	security.setMobile(request.getParameter("mobile"));
        	security.setCity(request.getParameter("city"));
        	security.setEmail(request.getParameter("email"));
        	security.setAge(request.getParameter("age"));
        	dao.addSecurityQuestions(security);
        %>
        
        <% 
        }
        %>




</body>
</html>