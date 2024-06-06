package com.java.jsp.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.jsp.Helper.ConnectionHelper;

@WebServlet("/searchUserForViewingThePassword")
public class VerifyingEmailIdForViewingThePassword {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userPersonalEmailId = request.getParameter("userPersonalEmailId");
//        out.print("Inside the Try Block : =");
       
        PrintWriter out = response.getWriter();
        out.print("The value of the user EMail Id is : "+userPersonalEmailId);
        response.setContentType("text/html");

        Connection connection;
        PreparedStatement pst;
        

        try {
        	out.print("Inside the Try Block : =");
           connection = ConnectionHelper.getConnection();

            String sql = "select * from userlogin where userLoginEmailId = ?";
            out.print("The Value of the sql is : ="+sql);
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, userPersonalEmailId);
//            resultSet = statement.executeQuery();
            pst = connection.prepareStatement(sql);
            pst.setString(1, userPersonalEmailId);
            ResultSet res = pst.executeQuery();
            out.print("Line Number is : 48");
            if (res.next()) {
            	out.print("Inside the if Block of Try :");
            	out.println("<p>User Id: " + res.getInt("userLoginId") + "</p>");
            	out.println("<p>User Email Id : " + res.getString("userLoginEmailId") + "</p>");
            	out.println("<p>User password : " + res.getString("userLoginPassword") + "</p>");
				
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewPasswordTableForSpecificUser.jsp");
                dispatcher.forward(request, response);
            } else {
				
				out.println("<p>No user found with email: " + userPersonalEmailId + "</p>"); 
                RequestDispatcher dispatcher = request.getRequestDispatcher("NoViewPasswordTableFound.jsp");
                dispatcher.forward(request, response);
            } 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error occurred while searching for user.</p>");
        } 
    }

}
