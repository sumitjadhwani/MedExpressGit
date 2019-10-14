<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*,java.io.*,javax.servlet.*"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
  <title>MedExpress</title>
  <meta charset="utf-8">
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
      background-color: #F8F9FB;
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
          <li class="active"><a href="main.jsp">Add Drugs</a></li>
          <li><a href="UpdateMedicine.jsp">Update Drugs</a></li>
          <li><a href="delete1.jsp">Delete Drugs</a></li>
          <li><a href="addemployee.jsp">Manage Employees</a></li>
          <li><a href="#section3">Sales Report</a></li>
        </ul><br>
      </div>
      <br>
      <div class="col-sm-5">
        
        <form action="main.jsp" method="get">
            <h2>Add Drug</h2><br>
        
          <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
            <input id="drug_name" type="text" class="form-control" name="drug_name" placeholder="Drug Name">
          </div>
          <br>
          <div class="input-group">
            <span class="input-group-addon">&nbsp;<i class="fa fa-inr" style="font-size: 21px"></i></span>
            <input id="cost_price" type="number" class="form-control" name="cost_price" placeholder="Cost Price">
          </div>
          <br>
          <div class="input-group">
            <span class="input-group-addon">&nbsp;<i class="fa fa-inr" style="font-size: 21px"></i></span>
            <input id="mrp" type="number" class="form-control" name="mrp" placeholder="MRP">
          </div>
   			<br>  
   			<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
            <input id="dist_id" type="number" class="form-control" name="dist_id" placeholder="Distributer ID">
          </div>
          <br>
          
          <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar" style="font-size: 15px"></i></span>
            <input id="expiry" type="date" class="form-control" name="expiry" placeholder="Expiry">
          </div>
          <br>
 			<div class="input-group">
            <span class="input-group-addon"><i class="fa fa-map-marker" style="font-size: 21px"></i></span>
            <input id="location" type="text" class="form-control" name="location" placeholder="Location">
          </div>
          <br>
           <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
            <input id="packaging" type="text" class="form-control" name="packaging" placeholder="Packaging">
          </div>
          <br>
          
          <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
            <input id="qty" type="number" class="form-control" name="qty" placeholder="Quantity">
          </div>
          <br>
            <center>
                      <div class="form-group">       
                        <button type="submit" class="btn btn-primary" value="submit">Submit</button>
                      </div>
             </center>
          <br>         
        </form>
      </div>
      <div class="col-sm-4">
<%
       try {			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","sumit","Sumit5757");  
			Statement stmt=con.createStatement();  
			
 			String drug_name = request.getParameter("drug_name");
		   	String cost_price = request.getParameter("cost_price");
		   	String qty = request.getParameter("qty");
		   	String sell_price = request.getParameter("mrp");
		   	String location = request.getParameter("location");
		   	String packaging = request.getParameter("packaging");
		   	String expiry = request.getParameter("expiry");
		   	String dist_id = request.getParameter("dist_id");

		    PreparedStatement pstatement = null;
		   	int updateQuery=0;
			String queryString1="update drugs set tot_stock=tot_stock+"+qty+" where drug_name='"+drug_name+"'";
			String queryString2 = "INSERT INTO drugs(cost_price,dist_id,drug_name,location,tot_stock,sell_price,packaging) VALUES (?, ?, ?, ?, ?, ?, ?)";  
			String queryString3="select drug_id from drugs where drug_name='"+drug_name+"'";
			String queryString4= "insert into drug_details (drug_id,expiry,stock) values (?, ?, ?)";
			pstatement = con.prepareStatement(queryString1);
			System.out.println(queryString1);
	    	updateQuery = pstatement.executeUpdate();
	    	if(updateQuery<=0)
	    	{
				System.out.println(queryString2);

				pstatement = con.prepareStatement(queryString2);
				pstatement.setString(1,cost_price);
				pstatement.setString(2,dist_id);
				pstatement.setString(3,drug_name);
				pstatement.setString(4,location);
				pstatement.setString(5,qty);
				pstatement.setString(6,sell_price);
				pstatement.setString(7,packaging);
				System.out.println(queryString2);	
		    	updateQuery = pstatement.executeUpdate();
			}
	 		/* pstatement = con.prepareStatement(queryString3); */
	 		System.out.println(queryString3);
	 		ResultSet rs=stmt.executeQuery(queryString3);
			if(rs.next()){
				pstatement = con.prepareStatement(queryString4);
				pstatement.setString(1,rs.getString(1));
				pstatement.setString(2,expiry);
				pstatement.setString(3,qty);
				
		    	updateQuery = pstatement.executeUpdate();
			}			
				   			   				
		con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
		%>
      </div>
    </div>
  </div>
</body>
</html>