<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="tcss.css">
	</head>
	<body >
	
		<div class=container>
		<% String str=(String)session.getAttribute("user");
							if(session.getAttribute("user")!=null)
							{
								out.print("login user: "+str);
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
			<table>
				<tr>
				<th class="th1">
				<h3>Heya Participant(s)! <br><br>Welcome to Kode Kombat :)</th>
				</tr>
				<tr>
				<td>
				<h3> See the following instructions to easily use this interface:</h3></td>
				</td>
				</tr>
				<tr>
				<td>1. This Interface contains three rounds, 4th round is Online Coding on Hackerearth.
				</td>
				</tr>
				<tr>
				<td><br>2. The rounds are in sequential order, 1st you need to finish with one round to go to another.
				</td>
				</tr>
				<tr>
				<td><br>3. Each round has a timer which you will see on top once you begin. After timer stops answers will be autosubmitted.
				</td>
				</tr>
				<tr>
				<td><br>4. Do not LOGOUT in any case until we ask you to do so, it has serious consequences which will surely affect you being in the Race.
				</td>
				</tr>
				<tr>
				<td><br>5. Just hover over the event to know the marks of that event.
				</td>
				</tr>
				<tr>
				<th class="th1"><br><br><h3>Happy Kombatting :D</h3>
				</th>
				</tr>
			</table>
			</div>
		</div>
	</body>
</html>
