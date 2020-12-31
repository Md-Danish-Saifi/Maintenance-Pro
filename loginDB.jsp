<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import= "java.sql.Driver" %>
<%@page import= "java.sql.DriverManager" %>
<!DOCTYPE html>
<html>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signDB</title>
    </head>
    <body>

        <%

         String email = request.getParameter("email");
         String pass = request.getParameter("pass");
	

         
         try
         	{
        	 
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farhan","root","L2zylpdt");
        	 
        	 Statement stmt = con.createStatement();
        	 String qry = "select email,pass from user where email='"+email+"' and pass='"+pass+"'";
        	 ResultSet rs = stmt.executeQuery(qry);
        	 
        	 if(rs.next())

        		{			     
			        		 HttpSession ses = request.getSession(true);
			        
			        	     ses.setAttribute("email",email);
		        	   		response.sendRedirect("home.html");
				}
	          
        	 else 
        	 	{
        		   out.println("<script type=\"text/javascript\">");
	  	   		   out.println("alert('wrong username or password');");
	  	   		   out.println("location='index.html';");
	  	   		   out.println("</script>");
        	 	}
        	 
        	 
         	}
         catch (Exception e)
         	{
        	 out.print(e);
         	}
         
         
         
         
         %>

</body>
</html>