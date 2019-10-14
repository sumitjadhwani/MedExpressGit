<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from drugs where drug_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
 <head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bubbly - Boootstrap 4 Admin template by Bootstrapious.com</title>
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
<!--     <link rel="stylesheet" href="css/custom.css"> -->
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

  <title>MedExpress</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

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
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
</head>
 <body>
<div class="container-fluid">
    <div class="row content">
      <div class="col-sm-3 sidenav hidden-xs">
        <h2>MedExpress</h2>
        <ul class="nav nav-pills nav-stacked">
          <li><a href="main.jsp">Add Drugs</a></li>
          <li class="active"><a href="Update.jsp">Update Drugs</a></li>
          <li><a href="delete1.jsp">Delete Drugs</a></li>
          <li><a href="#section3">Manage Employees</a></li>
          <li><a href="#section3">Sales Report</a></li>
        </ul><br>
      </div>
      <br>
	<div class="col-sm-9">
		<div class="card">
                  <div class="card-header">
                    <h3 class="h6 text-uppercase mb-0">Update Drug</h3>
                  </div>
                  <div class="card-body">
                    <form class="form-horizontal" method="post" action="update-process.jsp" >
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label" style="font-size:15px">Drug ID</label>
                        <div class="col-md-9">
                          <input type="number" class="form-control" name="drug_id" value="<%=resultSet.getString("drug_id") %>" readonly>
                        </div>
                      </div>
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Cost price</label>
                        <div class="col-md-9">
                          <input type="number" class="form-control"  name="cost_price" value="<%=resultSet.getString("cost_price") %>" readonly><small class="form-text text-muted ml-3"></small>
                        </div>
                      </div>
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label "style="font-size:15px">Distributer ID</label>
                        <div class="col-md-9">
                          <input type="number"  name="dist_id" class="form-control" value="<%=resultSet.getString("dist_id") %>" readonly>
                        </div>
                      </div>
                     
                     <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Drug name</label>
                        <div class="col-md-9">
                         <input type="text"  name="drug_name" class="form-control" value="<%=resultSet.getString("drug_name") %>" readonly>
                        </div>
                      </div>
                      
                      
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Location</label>
                        <div class="col-md-9">
                          <input type="text"  name="location" class="form-control" value="<%=resultSet.getString("location") %>">
                        </div>
                      </div>
                      
                      
                    <%--   <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Total Stock</label>
                        <div class="col-md-9">
                          <input type="number"  name="tot_stock" class="form-control" value="<%=resultSet.getString("tot_stock") %>">
                        </div>
                      </div> --%>
                              
                     <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Selling Price</label>
                        <div class="col-md-9">
                          <input type="number"  name="sell_price" class="form-control" value="<%=resultSet.getString("sell_price") %>">
                        </div>
                      </div>
                      
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label"style="font-size:15px">Packaging details</label>
                        <div class="col-md-9">
                          <input type="text"  name="packaging" class="form-control" value="<%=resultSet.getString("packaging") %>">
                        </div>
                      </div>
                       <br>
						<center>
                        <div class="form-group">       
                        <button type="submit" class="btn btn-primary" value="submit">Submit</button>
                      </div>
                        </center>
                        </form>
                        </div>
                             
                        
                                                
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>
 

<%-- <form method="post" action="update-process.jsp">
<input type="hidden" name="drug_id" value="<%=resultSet.getString("drug_id") %>">
<input type="text" name="drug_id" value="<%=resultSet.getString("drug_id") %>">
<br>
Drug ID:<br>
<input type="number" name="drug_id" value="<%=resultSet.getString("drug_id") %>">
<br>
Drug name:<br>
<input type="text" name="drug_name" value="<%=resultSet.getString("drug_name") %>">
<br>
Batch ID:<br>
<input type="number" name="batch_id" value="<%=resultSet.getString("batch_id") %>">
<br>
Location:<br>
<input type="text" name="location" value="<%=resultSet.getString("location") %>">
<br><br>
<input type="submit" value="submit">
</form> --%>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
</div>
</div>
</body>
</html>