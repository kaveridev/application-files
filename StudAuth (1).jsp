<%-- 
    Document   : StudAuth
    Created on : 9 Feb, 2018, 12:10:32 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication</title>
    </head>
    <body>
         <% String user=request.getParameter("user");
            String pass=request.getParameter("pass");
           
            try {
                Class.forName("org.postgresql.Driver");
            }catch(Exception e) {
                e.printStackTrace();
            }
            Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/Student_admin","postgres","wal@gecbh2012"); 
            Statement stat,stat1;
            ResultSet rs,rs1;
            String query;
            try{
                stat=con.createStatement();
                query="Select username,password from student where username='"+user+"'and password='"+pass+"';";
                rs=stat.executeQuery(query);
                
                if(!rs.next()){
                    response.sendRedirect("a_fail.jsp");
                    return;
                }
                else{
                    try{
                        stat1=con.createStatement();
                        rs1=stat.executeQuery("Select admnno,name,addr from stud_detail where username='"+user+"';");
                        if(rs1.next()){
                            String admn=rs1.getString(1);
                            out.println("Admission No:"+admn);
                            String name=rs1.getString(2);
                            out.println("Name:"+name);
                            String addr=rs1.getString(3);
                            out.println("Address:"+addr);
                        }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            %>
            <br><a href="index.html"><button>Logout</button></a></br>
    </body>
</html>
