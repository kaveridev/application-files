<%-- 
    Document   : d_success
    Created on : 7 Mar, 2018, 11:47:59 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Success</title>
    </head>
    <body>
        <%  
            String sid=request.getParameter("sid");
           
            try {
                Class.forName("org.postgresql.Driver");
                Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/Student_admin","postgres","wal@gecbh2012"); 
                Statement stat;
                stat=con.createStatement();
                stat.executeUpdate("delete from stud_detail where username='"+sid+"';");
                out.println("Deleted Successfully");
            }catch(Exception e){
                e.printStackTrace();
            
            }
        %>
        <a href="option.html"><button>OK</button></a>
    </body>
</html>
