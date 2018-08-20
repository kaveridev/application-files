<%-- 
    Document   : result
    Created on : Feb 16, 2018, 9:27:39 AM
    Author     : admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Success</title>
    </head>
    <body>
        <%  
            String id=request.getParameter("id");
            String sname=request.getParameter("sname");
            String addr=request.getParameter("addr");
            Connection con;
            Statement st;
   
            try{
                String connectionURL = "jdbc:postgresql://localhost:5432/Student_admin";
                Class.forName("org.postgresql.Driver");
                con =DriverManager.getConnection(connectionURL,"postgres","wal@gecbh2012");
                st=con.createStatement();
                st.executeUpdate("update stud_detail set name='"+sname+"',addr='"+addr+"' where username='"+id+"';");
                out.println("Updated Successfully");
            }catch(Exception e){
                out.println("something went wrong");
            }
         %>
         <a href="option.html"><button>OK</button></a>
    </body>
</html>

