package com.sumit;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		  	String name = req.getParameter("name");    
		    String pass = req.getParameter("pass");
		    System.out.println(name);
		    System.out.println(pass);
		   if(name.equals("admin") && pass.equals("admin123"))res.sendRedirect("main.jsp");
		   else	res.sendRedirect("admin.jsp");
		   }
}
