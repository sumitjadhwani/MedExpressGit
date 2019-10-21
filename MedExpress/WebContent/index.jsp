<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*,java.io.*,javax.servlet.*"%> 
<%-- <%session.invalidate();%>
 --%>
 <% String emp_name=(String) session.getAttribute("e_name");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Order</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
        <style>
           
            tr td
            {
                padding-bottom:5px;  
            }
            td,th
            {
                padding:7px;   
            }
            .col-md-4
            {
                padding:2px;
            }
            #country
            {
                width:180px;
            }
        </style>     
    </head>
    <body>
        <br><br>
        <div class="text-center"><h3>MedExpress Pharmacy</h3></div>
        <br>
<%--         <% emp_name = (String) s.getAttribute("emp_name"); %>
 --%>       
 		<center><tr><td>Employee Name :  </td><td><input type="text" name="emp_name" id="emp_name" value=<%=emp_name%> disabled/></td></tr></center> <br>        
       <center><tr><td>Customer Name :  </td><td><input type="text" name="cust_name" id="cust_name" value="default" required/></td></tr></center> <br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <form id="myDorm">
                        <table class="table table-bordered ">
 <% try {			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","sumit","Sumit5757");  
			Statement stmt=con.createStatement();  
			
			ResultSet rs=stmt.executeQuery("select drug_name from drugs"); %>
 	<select class="form-control" id="sel1" name='drug_name' onchange="showdetails(this.value)">
       <option value="none">Select Drug</option> 
      <% 
		 while(rs.next())
	     {
		%>
        <option><%= rs.getString(1)%></option>
          <% 
	      }
		%>
      </select>
      <br>
       <%   rs.close();	
  		con.close();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
	%>    					
                            <tr><td>Drug Id</td><td><input type="text" name="drug_id" id="drug_id" disabled/></td></tr>
                            <tr><td>Drug Name</td><td><input type="text" name="name" id="name" disabled/></td></tr>
                            <tr><td>Location</td><td><input type="text" name="location" id="location" disabled/></td></tr>
                            <tr><td>Price</td><td><input type="text" name="price" id="price" disabled/></td></tr>
                            <tr><td>Packaging</td><td><input type="text" name="pkg" id="pkg" disabled/></td></tr>                            
<!--                         <tr><td>Expiry</td><td><input type="text" name="expiry" id="expiry" readonly=""/></td></tr>                           
 -->                             <tr><td>Stock</td><td><input type="text" name="stock" id="stock" disabled/></td></tr>                           
                            <tr><td>Quantity</td><td><input type="number" name="qty" id="qty" oninput="validate(this.value)" required/></td></tr>
                            <tr><td>Total</td><td><input type="text" name="tot" id="tot" readonly=""/></td></tr>
                            <tr><td><input type="reset" name="clean" id="clean" VALUE="Clean" class="btn btn-info" /></td><td><input type="button" name="add" id="add" value="ADD"  onclick="addorder()" class="btn btn-primary"/></td></tr>
                        </table>
                    </form>
                </div>               
                <div class="col-sm-5">
                    <table class="table table-bordered" id="od_table">
                        <thead>
                            <tr>
                                <th>SR</th>
                                <th>Drug Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>                         
                        </tbody>
                        <tfoot>
                          <tr><td></td><td></td><td></td><td>Amount</td><td id="amt"></td></tr>                        
                            <tr><td></td><td></td><td></td><td>GST(18%)</td><td id="gst"></td></tr>                      
                          <tr><td></td><td></td><td></td><td>Total</td><td id="total" name="total"></td></tr>
                           <tr><td></td><td></td><td></td><td><input type="reset" name="clean" id="clean" VALUE="Clear"  onClick="window.location.reload();" class="btn btn-info" /></td><td><input type="button" name="addorder" id="addorder" value="ADD"  onclick="order()" class="btn btn-primary"/></td></tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div> 


<script>
var xmlHttp;
function showdetails(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
}
else if(window.ActiveXObject){
         xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
}
var url="retrieve.jsp";
url +="?name=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange(){  
     if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {  
    
	var x=xmlHttp.responseText;
    x=x.replace(/(\r\n|\n|\r)/gm, "").trim();
    var res = x.split(" ");
    document.getElementById("drug_id").value=res[0];
    document.getElementById("name").value=res[3];
    document.getElementById("location").value=res[4];
    document.getElementById("stock").value=res[5];
 	document.getElementById("price").value=res[7];
    document.getElementById("qty").value=1;
	document.getElementById("tot").value=1*res[7];
	var pack=res[8].concat(" ",res[9]," ",res[10]);
	document.getElementById("pkg").value=pack; 
     }   
 }
  function validate(qty){
	var stock=parseFloat(document.getElementById("stock").value,10);
	var price=parseFloat(document.getElementById("price").value,10);
	 if(qty<=0){
		 window.alert("Quantity can't be Negative or Zero");
		 document.getElementById("qty").value=1;
		 document.getElementById("tot").value=1*price; 
	} 
	if(qty>stock)
		 {
		 window.alert("Quantity can't be greater stock.");
		 document.getElementById("qty").value=stock;
		 document.getElementById("tot").value=stock*price;
		 }
	} 
  
    $(document).ready(function() {
        $("#od_table tfoot").hide();
    });

       $(document).ready(function(){
         $("#qty").on("keyup",function(){
             var price=parseFloat($("#price").val());
             var qty=parseFloat($("#qty").val());
             var res=price*qty;
             $("#tot").val(res);
         });
         
     });
      
    var iname=[];
    var iprice=[];
    var iqty=[];
    var itotal=[];
    var idrug_id=[];
    var total=0;
    var count=0;  
 function addorder()
    {
    $(document).ready(function(){
   
    $("#add").click(function(){
       var id=$("#drug_id").val();
      
 var name=$("#name").val(); //drug_name
       
       var price=$("#price").val();//price
       var qty=$("#qty").val(); //qty
       var tot=$("#tot").val();       
       if(id==="" || name==="" || price==="" || qty==="")
       {
           //alert("First add the quantity.");
           return false;
       }
       else
       {
    	idrug_id.push(id);
 	   iname.push(name);
       iprice.push(price);
       iqty.push(qty);
       itotal.push(tot);
       count++;
       var res=parseFloat(price)*parseFloat(qty);
       total+=res;
       var gst=total*0.18;
       var markup="<tr><td>"+count+"</td><td>"+name+"</td><td>"+price+"</td><td>"+qty+"</td><td>"+res+"</td></tr>";
       
       $("#od_table tbody").append(markup);
       
       $("#od_table tfoot").show();
       $("#amt").html(total-gst);
       $("#gst").html(gst);
       $("#total").html(total);
        $("#myDorm").trigger("reset");     
      }
       
    });

    });  
    } 

 $(document).on('keyup',function(evt) 
  		{
  		    if (evt.keyCode === 13)
  		    {
  		         $(document).ready(function()
  		      {
  		       var id=$("#drug_id").val();
  		       var name=$("#name").val(); //itemname
  		       var price=$("#price").val();//price
  		       var qty=$("#qty").val(); //qty
  		       var tot=$("#tot").val(); 
  		       if(id==="" || name==="" || price==="" || qty==="")
  		       {
  		           alert("First add the quantitiy");
  		        return false;
  		       }
  		       else
  		       {
   		       idrug_id.push(id);
 		       iname.push(name);
  		       iprice.push(price);
  		       iqty.push(qty);
  		       itotal.push(tot);    
  		       count++;
  		       var res=parseFloat(price)*parseFloat(qty);
  		       total+=res;
  		       var gst=total*0.18;

  		       var markup="<tr><td>"+count+"</td><td>"+name+"</td><td>"+price+"</td><td>"+qty+"</td><td>"+res+"</td></tr>";
  		       
  		       $("#od_table tbody").append(markup);  
  		       $("#od_table tfoot").show();
  		     $("#amt").html(total-gst);
  	       $("#gst").html(gst);
  		       $("#total").html(total);
  		       $("#myDorm").trigger("reset");     
  		      }
  		    });
  		    }
  		});
 
$(document).on('keyup',function(evt) {
    if (evt.keyCode === 27)
    {
       $("#myDorm").trigger("reset");
       var rowCount = $("#od_table td").closest("tr").length;
       //alert(rowCount);
       if(rowCount===1)
       {
           alert("Cart is empty.First add the items in the cart.");
           return false;
       }
       else
       {
    	    var iemp_name=$("#emp_name").val(); 
    		var icust_name=$("#cust_name").val(); 
    		var itotal_amt=total; 
		if(iemp_name!=null && itotal_amt!=" " && icust_name!=null)   		
          window.location.href="addOrder.jsp?iname="+iname+"&iprice="+iprice+"&iqty="+iqty+"&tot="+itotal+"&idrug_id="+idrug_id+"&emp_name="+iemp_name+"&cust_name="+icust_name+"&itotal_amt="+itotal_amt;     
       } 
    }
}); 
  
 function order()
 {
  $("#addorder").click(function(){
	  $("#myDorm").trigger("reset");
      var rowCount = $("#od_table td").closest("tr").length;
      //alert(rowCount);
      if(rowCount===1)
      {
          alert("Cart is empty.First add the items in the cart.");
          return false;
      }
      else
      {
  	   var iemp_name=$("#emp_name").val(); 
		var icust_name=$("#cust_name").val(); 
		var itotal_amt=total;  
		if(iemp_name!=null && itotal_amt!=" " && icust_name!=null)   		
         window.location.href="addOrder.jsp?iname="+iname+"&iprice="+iprice+"&iqty="+iqty+"&tot="+itotal+"&idrug_id="+idrug_id+"&emp_name="+iemp_name+"&cust_name="+icust_name+"&itotal_amt="+itotal_amt;
      }     
  });
  }   

</script>    
</body>
</html>



