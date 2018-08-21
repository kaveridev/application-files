<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Success</title>
    </head>
    <body>
        <%  String sid=request.getParameter("sid");
            String sname=request.getParameter("sname");
            String saddr=request.getParameter("saddr");
            int id=Integer.parseInt(sid);
           
            try {
                Class.forName("org.postgresql.Driver");
                Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/Student_admin","postgres","wal@gecbh2012"); 
                Statement stat;
                stat=con.createStatement();
                stat.executeUpdate("insert into stud_detail(username,name,admnno,addr) values('S"+sid+"','"+sname+"',"+id+",'"+saddr+"');");
                out.println("Inserted Successfully");
            }catch(Exception e){
                e.printStackTrace();
            
            }
            %>
            <br><a href="option.html"><button>OK</button></a></br>
    </body>
</html>
