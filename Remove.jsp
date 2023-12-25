<%@page import="java.io.PrintWriter"%>
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
<h1>enter the task name to delete</h1>
Title: <input type="text" name="title"><br>
<input type="submit">
<%! String s="1234"; %>
<%
String title=request.getParameter("title");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","root");
PreparedStatement ps=con.prepareStatement("delete from task where title=?");
ps.setString(1, title);

 
if(ps.executeUpdate()>0)
{
response.setContentType("text/html");
PrintWriter pw=response.getWriter();
pw.print("deleted");
}
else if(ps.executeUpdate()==0){
response.setContentType("text/html");
out.println("task not found");
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