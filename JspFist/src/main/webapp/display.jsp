<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped ">
		<tr>
			<th>id</th>
			<th>full_name</th>
			<th>user_name</th>
			<th>email</th>
			<th>phone_number</th>
			<th>password</th>
			<th>Action</th>
		</tr>
	<%
	Class.forName("org.postgresql.Driver");	
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jspDB", "postgres", "2001!@#Qaz") ;
	System.out.println("Db connected") ;
	String selectQuery  = "SELECT * FROM users" ;
	PreparedStatement ps = con.prepareStatement(selectQuery) ;
	ResultSet	r1 =ps.executeQuery();
	
		while(r1.next()){
	
		
	%>
		
			
			
		<tr>
			<td><%out.println(r1.getInt(1)) ; %></td>
			<td><% out.println(r1.getString(2)) ; %></td>
			<td><% out.println(r1.getString(3)) ; %></td>
			<td><% out.println(r1.getString(4)) ; %></td>
			<td><% out.println(r1.getString(5)) ; %></td>
			<td><% out.println(r1.getString(6)) ; %></td>
			<td>
			<a href="edit.jsp?x=<%=r1.getInt(1) %>" class="btn btn-primary">Edit</a> 
			  
			<a href="delete.jsp?x=<%=r1.getInt(1) %>" class="btn btn-danger">delete</a>
			</td>
		</tr>
	<% 		
		}
	
	%>
	</table>
</body>
</html>