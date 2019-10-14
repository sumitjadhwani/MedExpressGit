
<%@page import="java.util.ArrayList"%>
<%@page import="db.DB"%>
<%@page import="java.sql.*,java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br><br>
        <%!
             Connection con,conn;
             Statement st,st1;
             ResultSet rs;
        %>
        <%
             String [] iname=request.getParameterValues("iname");
      	 	 String [] idrug=request.getParameterValues("idrug_id");
             String [] iprice=request.getParameterValues("iprice");
             String [] iqty=request.getParameterValues("iqty");
             String [] itot=request.getParameterValues("tot");
             String cust_name=request.getParameter("cust_name");
             String emp_name=request.getParameter("emp_name");
             String total_amt=request.getParameter("itotal_amt");
          
             System.out.println(emp_name);
             System.out.println(cust_name); 
             System.out.println(total_amt); 

             
             session.setAttribute("iname",iname);
             session.setAttribute("iprice",iprice);
             session.setAttribute("iqty",iqty);
             session.setAttribute("itot",itot);
             //session.setAttribute("bill_no",bill_no);
             
             String iname1="";
             String iprice1="";
             String iqty1="";
             String itot1="";
             String idrug1="";
             
             for(int a=0;a<iname.length;a++)
             {
                  iname1+=iname[a];
                  iprice1+=iprice[a];
                  iqty1+=iqty[a];
                  itot1+=itot[a];
                  idrug1=idrug[a];
             }
            
            String [] in=iname1.split(",");
            String [] ip=iprice1.split(",");
            String [] iq=iqty1.split(",");
            String [] it=itot1.split(",");
            String [] id=idrug1.split(",");

                         
            int bill_no=0;
            int employee_id=0;
            
            conn = DB.getConnection();
            st1 = conn.createStatement();
            rs=st1.executeQuery("select * from sales_details order by sale_id desc limit 0,1");

            if(rs.next())
            {
                bill_no=rs.getInt(4)+1;
                session.setAttribute("bill_no",bill_no);
            }
            else{
                bill_no=1;
                session.setAttribute("bill_no",bill_no);
            }
			rs=st1.executeQuery("select emp_id from employee where emp_usename='"+emp_name+"'");
			if(rs.next())
            {
                employee_id=rs.getInt(1);
            }
 			
            con = DB.getConnection();
            st = con.createStatement();
            int i=0;
            for(i=0;i<in.length;i++)
            {
            	/*             mysql> insert into sales_details (drug_id,emp_id,cust_name,sale_id,price,qty,amt) values(2,1,'kabra',1,200,1,200);
            	 */
                 st.executeUpdate("INSERT INTO `sales_details`(`sale_id`, `price`, `qty`, `amt`,`cust_name`, `emp_id`,`drug_id`) VALUES ("+bill_no+","+ip[i]+","+iq[i]+","+it[i]+",'"+cust_name+"','"+employee_id+"',"+id[i]+")");            
            }
/*             mysql> insert into sales_transaction(sale_id,cust_name,tot_amt,tot_qty) values (1,"kabra" ,400,2);
 */
 			st.executeUpdate("INSERT INTO `sales_transaction`(`sale_id`,`cust_name`, `tot_amt`,`tot_qty`) VALUES ("+bill_no+",'"+cust_name+"',"+total_amt+","+i+")");            
           
            response.sendRedirect("bill.jsp?cust_name="+cust_name);
            %>
    </body>
</html>
