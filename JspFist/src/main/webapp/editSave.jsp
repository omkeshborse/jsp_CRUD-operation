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
	<%
		Class.forName("org.postgresql.Driver") ;
		String connectionString = "jdbc:postgresql://localhost:5432/jspDB";
		String user = "postgres" ; 
		String DBpassword = "2001!@#Qaz" ;
		Connection con =DriverManager.getConnection(connectionString , user, DBpassword) ;
		System.out.println("Db Connected") ;
		int id = Integer.parseInt(request.getParameter("id")) ;
		
		String fullname , username , email , phone_number , password, confirmPass ; 
		fullname= request.getParameter("name") ;
		username= request.getParameter("username") ;
		email= request.getParameter("email") ;
		phone_number= request.getParameter("phone") ;
		password= request.getParameter("password") ;
		confirmPass= request.getParameter("confirmPass") ;
		System.out.println(password.equals(confirmPass)) ;
		if(password.equals(confirmPass)){
			
		String updateQuery = "UPDATE users SET fullname = '"+fullname+"' , phone_number = '"+phone_number+"' , password = '"+password+"' WHERE  id = "+id+" ";

		PreparedStatement ps = con.prepareStatement(updateQuery) ;
		
		ps.executeUpdate() ;
		System.out.println("Data updated successfully") ;	
		out.println("<script>") ;
		out.println("alert('data updated successfully')") ;
		out.println("window.location.href='display.jsp'") ;
		out.println("</script>") ;
		// response.sendRedirect("display.jsp") ;
		}else{
			out.println("<script>") ;
			out.println("alert('password  and cofirmPassword not same')") ;
			out.println("window.location.href='display.jsp'") ;
			out.println("</script>") ;
			
			// response.sendRedirect("display.jsp") ;
		}
 	%>
</body>
</html>