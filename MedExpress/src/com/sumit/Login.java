package com.sumit;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;


public class Login extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		  	String userid = req.getParameter("name");    
		    String pwd = req.getParameter("pass");
			
		    HttpSession s=req.getSession();
			s.setAttribute("e_name",userid); 
		 
		    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","sumit", "Sumit5757");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("select * from employee where emp_usename='" + userid + "' and emp_pass='" + pwd + "'");
		    if (rs.next()) {
			/*
			 * 
			 * session.setAttribute("userid", userid);
			 */		        //out.println("welcome " + userid);
		        //out.println("<a href='logout.jsp'>Log out</a>");
		        res.sendRedirect("index.jsp");
		    }
		    else {
		    	res.sendRedirect("login.jsp");
		    }
		    rs.close();
		    con.close();
		    } catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  		
	}
}
