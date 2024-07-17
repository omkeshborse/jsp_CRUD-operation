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
	<h1>edit </h1>
	<% 
		int x =Integer.parseInt( request.getParameter("x")) ; 
		// out.println(x) ;
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/jspDB" , "postgres" , "2001!@#Qaz") ;
		String getInformation = "SELECT * FROM users WHERE id = "+x+" ;" ;
		PreparedStatement ps = con.prepareStatement(getInformation) ;
		ResultSet r1 =	ps.executeQuery() ;
		int id =0 ;
		String fullname = "" ,username = "", email=""  ,phone_number ="",password = "" ,cofirmPassword ="";
		
		while(r1.next()){
			id = r1.getInt(1) ;
			fullname = r1.getString(2) ;
			username =r1.getString(3) ;
			email = r1.getString(4) ;
			phone_number = r1.getString(5) ;
			password = r1.getString(6) ;
		}
	%>
	<div class="container">
        <div class="title">
            <p>Edit User</p>
        </div>
	    <form action="editSave.jsp" method="post" >
            <div class="user_details">
            	
                    
                 <input type="hidden" id="id" name="id" value ="<%=id%>"  required>
                
                <div class="input_box">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" value ="<%=fullname %>" placeholder="Enter your name" required>
                </div>
                <div class="input_box">
                    <label for="username">user_name</label>
                    <input type="text" id="username" name="username" value ="<%=username %>" placeholder="Enter your username" disabled  required>
                </div>
                <div class="input_box">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value ="<%=email%>" placeholder="Enter your email" disabled  required>
                </div>
                <div class="input_box">
                    <label for="phone">Phone Number</label>
                    <input type="number" id="phone" name="phone" value ="<%=phone_number%>" placeholder="Enter your number" required>
                </div>
                <div class="input_box">
                    <label for="pass">Password</label>
                    <input type="text" id="pass" name="password" value ="<%=password%>" placeholder="Enter your password" required>
                </div>
                <div class="input_box">
                    <label for="confirmPass">Confirm Password</label>
                    <input type="text" id="confirmPass" name="confirmPass" value ="<%=password%>" placeholder="Confirm your password" required>
                </div>
            </div>
            <div class="reg_btn">
                <input type="submit" value="UpdateData" />
            </div>
        </form>
	</div>
</body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: #f6f8fa;
   flex-direction: column ;
    font-family: 'Poppins', sans-serif;
}

.container{
    max-width: 700px;
    width: 100%;
    background: #ffffff;
    border-radius: 0.5rem;
    box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1),
                0px 5px 12px -2px rgba(0, 0, 0, 0.1),
                0px 18px 36px -6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin: 10px;
}

.container .title{
    padding: 25px;
    background: #f6f8fa;
}

.container .title p{
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

.container .title p::before{
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 30px;
    height: 3px;
    background: linear-gradient(to right, #F37A65, #D64141);
}

.user_details{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    padding: 25px;
}

.user_details .input_box{
    width: calc(100% / 2 - 20px);
    margin: 0 0 12px 0;
}

.input_box label{
    font-weight: 500;
    margin-bottom: 5px;
    display: block;
}

.input_box label::after{
    content: " *";
    color: red;
}

.input_box input{
    width: 100%;
    height: 45px;
    border: none;
    outline: none;
    border-radius: 5px;
    font-size: 16px;
    padding-left: 15px;
    box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1);
    background-color: #f6f8fa;
    font-family: 'Poppins', sans-serif;
    transition: all 120ms ease-out 0s;
}


.input_box input:focus,
.input_box input:valid{
    box-shadow: 0px 0px 0px 2px #AC8ECE;
}

form .gender{
    padding: 0px 25px;
}

.gender .gender_title{
    font-size: 20px;
    font-weight: 500;
}

.gender .category{
    width: 80%;
    display: flex;
    justify-content: space-between;
    margin: 5px 0;
}

.gender .category label{
    display: flex;
    align-items: center;
    cursor: pointer;
}

.gender .category label .dot{
    height: 18px;
    width: 18px;
    background: #d9d9d9;
    border-radius: 50%;
    margin-right: 10px;
    border: 4px solid transparent;
    transition: all 0.3s ease;
}

#radio_1:checked ~ .category label .one,
#radio_2:checked ~ .category label .two,
#radio_3:checked ~ .category label .three{
    border-color: #d9d9d9;
    background: #D64141;
}

.gender input{
    display: none;
}

.reg_btn{
    padding: 25px;
    margin: 15px 0;
}

.reg_btn input{
    height: 45px;
    width: 100%;
    border: none;
    font-size: 18px;
    font-weight: 500;
    cursor: pointer;
    background: linear-gradient(to right, #F37A65, #D64141);
    border-radius: 5px;
    color: #ffffff;
    letter-spacing: 1px;
    text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
}

.reg_btn input:hover{
    background: linear-gradient(to right, #D64141, #F37A65);
}

@media screen and (max-width: 584px){

    .user_details{
        max-height: 340px;
        overflow-y: scroll;
    }

    .user_details::-webkit-scrollbar{
        width: 0;
    }

    .user_details .input_box{
        width: 100%;
    }

    .gender .category{
        width: 100%;
    }

}


@media screen and (max-width: 419px){
    .gender .category{
        flex-direction: column;
    }   
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</html>