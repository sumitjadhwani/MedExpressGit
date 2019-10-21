<!DOCTYPE html>
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
    .row.content {
      height: 100vh
    }
    .sidenav {
     background-color: #F8F9FB;       
      height: 100%;
    }
  </style>
</head>
 <body >
  <div class="container-fluid">
    <div class="row content">
      <div class="col-sm-3 sidenav hidden-xs">
        <h2>MedExpress</h2>
         <ul class="nav nav-pills nav-stacked">
          <li ><a href="main.jsp">Add Drugs</a></li>
          <li><a href="UpdateMedicine.jsp">Update Drugs</a></li>
          <li><a href="delete1.jsp">Delete Drugs</a></li>
          <li class="active"><a href="addemployee.jsp">Manage Employees</a></li>
          <li><a href="#section3">Sales Report</a></li>
        </ul><br>
        </div>
      <br>

	<div class="col-sm-9">
 <!-- Basic Form-->
              <div class= "col-md-, col-xs-, col-lg-9">
                <div class="card">
                  <div class="card-header">
                    <h3 class="h6 text-uppercase mb-0">Add Employee</h3>
                  </div>
                  <div class="card-body">                             
               <form method="post" action="addemployee1.jsp" autocomplete="off"  >
                      <div class="form-group">
                        <label class="form-control-label text-uppercase" style="font-size:15px" >Employee ID</label>
                        <input type="text" placeholder="eg.1000" class="form-control" name="emp_id">
                      </div><br>
                      <div class="form-group">       
                        <label class="form-control-label text-uppercase" style="font-size:15px">Employee Name</label>
                        <input type="text" placeholder="eg:John  wick" class="form-control" name="emp_name">
                      </div>
                      <br>
                      <div class="form-group">       
                        <label class="form-control-label text-uppercase" style="font-size:15px">Employee Mobile no</label>
                        <input type="number" placeholder="eg:8888888888" class="form-control" name="emp_mob">
                      </div>
                      <br>
                      <div class="form-group">       
                        <label class="form-control-label text-uppercase" style="font-size:15px">Employee Salary</label>
                        <input type="number" placeholder="eg:20,000" class="form-control" name="emp_salary">
                      </div>
                      <br>
                      <div class="form-group">       
                        <label class="form-control-label text-uppercase" style="font-size:15px">Employee username</label>
                        <input type="text" placeholder="eg:emp@1" class="form-control" name="emp_username">
                      </div>
                      <br>
                      <div class="form-group">       
                        <label class="form-control-label text-uppercase" style="font-size:15px">Employee Password</label>
                        <input type="text"  class="form-control" name="emp_pass">
                      </div>
                      <br>
                      <center>
                      <div class="form-group">       
                        <button type="submit" class="btn btn-primary" value="submit">Submit</button>
                      </div>
                      </center>
                    </form>
                                       
                    
                  </div>
                </div>
              </div>
                 </div>
                </div>
              </div>
</body>
              
</html>