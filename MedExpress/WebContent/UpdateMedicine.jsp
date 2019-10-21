<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
/* String id = request.getParameter("id");
 */
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pms";
String userid = "sumit";
String password = "Sumit5757";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MedExpress</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

  <title>MedExpress</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {
      height: 100vh
    }

    /* Set gray background color and 100% height */
    .sidenav {
/*       background-color: #f1f1f1;
 */      background-color: #F8F9FB;
       
      height: 100%;
    }
  </style>
</head>
<body>
 <div class="container-fluid">
    <div class="row content">
      <div class="col-sm-3 sidenav hidden-xs">
        <h2>MedExpress</h2>
         <ul class="nav nav-pills nav-stacked">
          <li ><a href="main.jsp">Add Drugs</a></li>
          <li class="active"><a href="UpdateMedicine.jsp">Update Drugs</a></li>
          <li><a href="delete1.jsp">Delete Drugs</a></li>
          <li><a href="addemployee.jsp">Manage Employees</a></li>
          <li><a href="#section3">Sales Report</a></li>
        </ul><br>
        </div>
      <br>
	<div class="col-sm-9">
				<div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0">Update Drug</h6>
                  </div>
                  <div class="card-body">                           
            <table class="table table-striped card-text">
                      <thead>
                        <tr>                         
                          <th>Drug ID</th>
                          <th>Cost price</th>
                          <th>Distributer ID</th>
                          <th>Drug Name</th>
                          <th>Location</th>
                          <th>Total stock</th>
                          <th>Selling price</th>
                          <th>Packaging</th>
                          <th>Action</th> 
                        </tr>
                      </thead>
<tbody>
<tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from drugs";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
%>
<td><%=resultSet.getString("drug_id") %></td>
<td><%=resultSet.getString("cost_price") %></td>
<td><%=resultSet.getString("dist_id") %></td>
<td><%=resultSet.getString("drug_name") %></td>
<td><%=resultSet.getString("location") %></td>
<td><%=resultSet.getString("tot_stock") %></td>
<td><%=resultSet.getString("sell_price") %></td>
<td><%=resultSet.getString("packaging") %></td>
<td><a href="UpdateMedicine1.jsp?id=<%=resultSet.getString("drug_id")%>">update</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</tbody>
 </table>
</div>
 </div>
 </div>
  </div>
 </div>
</body>
</html>