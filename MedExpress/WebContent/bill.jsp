<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <style>
            tr td
            {
                padding-bottom:5px;  
            }
            td,th
            {
                padding-left:20px;   
            }
            .col-md-4
            {
                padding:2px;
            }
      </style>
    </head>
    <body>
        <%
             String [] iname=(String[])session.getAttribute("iname");
             String [] iprice=(String[])session.getAttribute("iprice");
             String [] iqty=(String[])session.getAttribute("iqty");
             String [] itot=(String[])session.getAttribute("itot");
             int bill_no=(Integer)session.getAttribute("bill_no");
             String cust_name=request.getParameter("cust_name");
             String iname1="";
             String iprice1="";
             String iqty1="";
             String itot1="";
             
             System.out.println(iname.length);
             for(int a=0;a<iname.length;a++)
             {
                  iname1+=iname[a];
                  iprice1+=iprice[a];
                  iqty1+=iqty[a];
                  itot1+=itot[a];
             }
            String [] in=iname1.split(",");
            String [] ip=iprice1.split(",");
            String [] iq=iqty1.split(",");
            String [] it=itot1.split(",");
             
       %><br><br><br><br>
 <center>
    <div class="container">
                <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="col-md-4">MedExpress Pharmacy</div>
                        <div class="col-md-4"><%=new Date()%></div>
                       <div class="col-md-4">Customer Name: <%=cust_name %> </div>
                        
                    </div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <th>Bill No.</th>
                                <th>Item Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        <%
                        Float total=0.0f;
                             for(int i=0;i<in.length;i++)
                             {
                                 
                                  %>
                                <tr>
                                <td><%=bill_no%></td>
                                <td><%=in[i]%></td>
                                <td><%=ip[i]%></td>
                                <td><%=iq[i]%></td>
                                <td><%=it[i]%></td>
                               </tr>
                                  <%
                                  total+=Float.parseFloat(it[i]);
                             }
                        %>
                        <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                 <td>Amount</td>
                                <td><%=total-total*0.18%></td>  
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>GST(18%)</td>
                                <td><%=total*0.18%></td>  
                            </tr>
                          <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Total</td>
                                <td><%=total%></td>    
                            </tr>
                                
                        </table>
                    </div> 
                    <div class="card-footer">
                        <p class="pull pull-right">Thank you.Visit Again.</p>
                        &nbsp;&nbsp; <input type="submit" class="btn btn-primary" onclick="window.location.href='index.jsp';" value="Order More" />
                    &nbsp;&nbsp; <input type="submit" class="btn btn-primary" onclick="myFunction()" value="Print Bill" />
                        
                    </div>
                </div>
                </div>
        </div>
 </center>
 <script>
function myFunction() {
  window.print();
}
</script>
    </body>
</html>
