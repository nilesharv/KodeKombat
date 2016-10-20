<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="tcss.css">
	</head>
	<body >
	
		<div class=container>
		<% String user=(String)session.getAttribute("user");
							if(session.getAttribute("user")!=null)
							{
								out.print("login user: "+user);
								%>
								<br>
								<form method="post" action="logout.jsp">
								
								<input type="submit" value="logout" >
								</form>
								<%
							}
							else
							{
								response.sendRedirect("login.html");
							}
				%>	
	
			<div class=div1> 
				<center><img src="questions/logo.jpg" style="height:100%"></center>
				
			</div>
			<div class=div2>
				<table width=100% >
				<tr>
					<td style="text-align: center;"><a href="round1.jsp" > <button class="btn" style="vertical-align:middle">  <span>ROUND1</span></button></a></td>
					<td style="text-align: center;"><a href="round2.jsp" ><button class="btn" style="vertical-align:middle"><span>ROUND2</span></button></a></td>
					<td style="text-align: center;"><a href="round3.jsp" ><button class="btn" style="vertical-align:middle"><span>ROUND3</span></button></a></td>
					</tr>
				</table>
			</div>
			<div class="divv">
				<%
				
				
				
				String A=request.getParameter("A");
				String B=request.getParameter("B");
				
				String email=(String)session.getAttribute("email");
				
				try
				{
					Connection con;
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
				PreparedStatement st=con.prepareStatement("insert into round2 values('"+email+"',?,?)");
				st.setString(1,A);
				st.setString(2,B);
				st.execute();
				response.sendRedirect("index.jsp");
				}
				catch(Exception ex)
				{
					out.print(ex);
				}
				
				
				%>
				
						
			</div>
		</div>
	</body>
</html>
