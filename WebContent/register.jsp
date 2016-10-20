<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="tcss.css">
	</head>
	<body >
		<div class=container>
			<div class=div1> 
				<center><img src="questions/logo.jpg" style="height:100%"></center>
			</div>
			<div class=div2>
				<table width=100% >
				<tr>
					<td style="text-align: center;"><button class="btn" style="vertical-align:middle"><span>ROUND1</span></button></td>
					<td style="text-align: center;"><button class="btn" style="vertical-align:middle"><span>ROUND2</span></button></td>
					<td style="text-align: center;"><button class="btn" style="vertical-align:middle"><span>ROUND3</span></button></td>
				</tr>
				</table>
			</div>
			<div class="divv">
			<br>
			<br>
			<br>
			<%String name=request.getParameter("name");
			String email=request.getParameter("email");
			String mobile=request.getParameter("mobile");
			String password=request.getParameter("password");
			String query="insert into login values('"+name+"','"+email+"','"+mobile+"','"+password+"')";
			Connection con;
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
			Statement st=con.createStatement();
			if(st.execute(query))
			out.println("Susseful registerd");

			}catch(Exception ex)
			{
			out.print(ex);
			}
			response.sendRedirect("login.html");
			
			%>
			
			
			</div>
		</div>
	</body>
</html>
