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
		String fullname , username , email , phone_number , password, confirmPass ; 
		fullname= request.getParameter("name") ;
		username= request.getParameter("username") ;
		email= request.getParameter("email") ;
		phone_number= request.getParameter("phone") ;
		password= request.getParameter("password") ;
		confirmPass= request.getParameter("confirmPass") ;
			
		Class.forName("org.postgresql.Driver");	
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jspDB", "postgres", "2001!@#Qaz") ;
		System.out.println("Db connected") ;
		
		PreparedStatement ps_already_present =con.prepareStatement("select * from users where username='"+username+"'") ;
		ResultSet r1 = ps_already_present.executeQuery();
		
		if(r1.next()){
			System.out.println("Username already exists");
		}else {
			String insertQuery = "INSERT INTO users (fullname , username , email ,phone_number, password) VALUES ('"+fullname+"','"+username+"','"+email+"' , "+phone_number+" , '"+password+"' ) " ;

			PreparedStatement ps = con.prepareStatement(insertQuery);
            if (password.equals(confirmPass)) {

                ps.executeUpdate();
                System.out.println("data inserted into register table");
                System.out.println(" '" + username + "' register successfully ");
            } else {
                System.out.println("Passwords do not match");
            }
		}
		
		out.println("<script>") ;
		out.println("window.alert('user register successfuly')") ;
		out.println("window.location.href='display.jsp'") ;
		out.println("</script>") ;
		
	%>
</body>
</html>