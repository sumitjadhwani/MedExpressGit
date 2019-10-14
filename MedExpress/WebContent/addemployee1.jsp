<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String emp_id = request.getParameter("emp_id");
String emp_name = request.getParameter("emp_name");
String emp_mob = request.getParameter("emp_mob");
String emp_salary = request.getParameter("emp_salary");
String emp_username = request.getParameter("emp_username");
String emp_pass = request.getParameter("emp_pass");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms", "sumit", "Sumit5757");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into employee values('"+emp_id+"','"+emp_name+"','"+emp_mob+"','"+emp_salary+"','"+emp_username+"','"+emp_pass+"')");

	if(i>0)
	{
		out.println("Data is successfully inserted!");
		%>
		<meta http-equiv="refresh" content="3;url=addemployee.jsp"/>
		<%
	}
	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>