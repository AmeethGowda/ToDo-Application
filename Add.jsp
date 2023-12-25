<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="">
Title: <input type="text" name="title"><br>
Description: <input type="text" name="description"><br>
Status: <input type="text" name="status"><br>
TargetDate: <input type="date" name="tdate"><br>
<input type="submit">
<%
String title=request.getParameter("title");
String description=request.getParameter("description");
String status=request.getParameter("status");
String tdate=request.getParameter("tdate");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","root");
PreparedStatement ps=con.prepareStatement("insert into task values(?,?,?,?)");
ps.setString(1, title);
ps.setString(2, description);
ps.setString(3, status);
ps.setString(4, tdate);

int i=ps.executeUpdate();
System.out.println(i);
if(i==1)
{
	response.setContentType("text/html");
	PrintWriter pw=response.getWriter();
	pw.print("added");
}
}
catch(Exception e)
{
	e.printStackTrace();
}


%>
</form>
</body>
</html>