<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<form>
<h1>enter the details to update</h1>
Title: <input type="text" name="title"><br>
Description: <input type="text" name="description"><br>
Status: <input type="text" name="status"><br>
Tdate: <input type="date" name="tdate"><br>
<input type="submit">
<input type="reset">
</form>
<% 
String title=request.getParameter("title");
String description=request.getParameter("description");
String status=request.getParameter("status");
String tdate=request.getParameter("tdate");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","root");
	PreparedStatement ps=con.prepareStatement("update task set description=?, status=?, tdate=? where title=?");
	ps.setString(4, title);
	ps.setString(1, description);
	ps.setString(2, status);
	ps.setString(3, tdate);
	 if(ps.executeUpdate()==1)
	 {
		 response.setContentType("text/html");
		 out.print("task updated");
	 }
	 
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>