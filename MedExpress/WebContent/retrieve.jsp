<%@ page import="java.sql.*"%>   
<%  
String s=request.getParameter("name");   
 try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","sumit","Sumit5757");  
PreparedStatement ps=con.prepareStatement("select * from drugs where drug_name='"+s+"'");  
/* ps.setString(1,"s");  
 */
 ResultSet rs=ps.executeQuery();  
 while(rs.next()){  /* System.out.print("<td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td>");
 */
out.print(""+rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+"  "+rs.getString(7)+" "+rs.getString(8)+" ");  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}
%>  
