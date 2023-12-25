<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","root");
PreparedStatement ps=con.prepareStatement("select * from task");
ResultSet rs=ps.executeQuery();
while(rs.next())
{   response.setContentType("text/html");
	out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
	
	out.println("<br>");
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>