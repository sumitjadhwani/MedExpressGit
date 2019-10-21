<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pms";%>
<%!String user = "sumit";%>
<%!String psw = "Sumit5757";%>
<%
String drug_id = request.getParameter("drug_id");
String cost_price = request.getParameter("cost_price");
String dist_id = request.getParameter("dist_id");
String drug_name = request.getParameter("drug_name");
String location = request.getParameter("location");
/* String tot_stock = request.getParameter("tot_stock"); */
String sell_price = request.getParameter("sell_price");
String packaging = request.getParameter("packaging");
if(drug_id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(drug_id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update drugs set cost_price=?,dist_id=?,drug_name=?,location=?,sell_price=?,packaging=? where drug_id="+drug_id;
ps = con.prepareStatement(sql);
/* ps.setString(1,drug_id); */
ps.setString(1, cost_price);
ps.setString(2, dist_id);
ps.setString(3, drug_name);
ps.setString(4, location);
/* ps.setString(6, tot_stock); */
ps.setString(5, sell_price);
ps.setString(6, packaging);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
%>
	<meta http-equiv="refresh" content="2;url=UpdateMedicine.jsp"/>
<%
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>