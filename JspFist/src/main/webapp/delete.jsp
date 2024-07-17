<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>delete </h1>
	<% 
		int x =Integer.parseInt( request.getParameter("x")) ; 
		
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/jspDB" , "postgres" , "2001!@#Qaz") ;
		String deleteQuery = "DELETE FROM users WHERE id = "+x+" " ;
		PreparedStatement ps = con.prepareCall(deleteQuery) ;
		ps.executeUpdate() ;
		response.sendRedirect("display.jsp") ;
		
	%>
</body>
</html>