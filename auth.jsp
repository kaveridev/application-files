<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page language="java" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication</title>
    </head>
    <body>
        <%  String user=request.getParameter("user");
            String pass=request.getParameter("pass");
           
            try {
                Class.forName("org.postgresql.Driver");
            } catch(Exception e) {
                e.printStackTrace();
            }
                Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/Student_admin","postgres","wal@gecbh2012"); 
                Statement stat;
                ResultSet rs;
                String query;
                int c=0;
                try{
                stat=con.createStatement();
                query="Select username,password from admin where username='"+user+"'and password='"+pass+"';";
                rs=stat.executeQuery(query);
                while(rs.next()){
                    c++;
                }
                if(c==0){
                    response.sendRedirect("a_fail.jsp");
                    return;
                }
                else{
                    response.sendRedirect("option.html");
                    return;
                }
            }catch(Exception e){
                e.printStackTrace();
            
            }
            %>
    </body>
</html>
