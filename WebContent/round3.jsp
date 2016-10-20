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
							
							
							
							Connection con;
							Map<String,Boolean> m=new HashMap<String,Boolean>();
							try
							{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
							Statement st=con.createStatement();
							ResultSet result=st.executeQuery("select * from round");
							
							while(result.next())
							{
								m.put(result.getString(1),result.getBoolean(2));
								
							}
							
							if(m.get("round3")==null)
								response.sendRedirect("index.jsp");
								
							}catch(Exception ex)
							{
							}
				%>	
	<div id="timer">
    	
    	 </div>
			<div class=div1> 
				<img src="questions/logo.jpg" style="height:100%; object-fit: contain;">
				
				<img src="questions/logo.jpg" style="height:100% ; object-fit: contain; float: right;">
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
			<div >
				<div class="div3">
				<ul >
					<li class="lis"><font color="1D4861">ORDER ORDER</font></li>
				</ul>
				</div>
			
				<div class="div4">
			
				<table class="t">
				<tr>
				<td class="th1">
			Q. Below are given three points according to which you need to code in order. Output of one point should go as input to another.
				</td>
				</tr>
				<tr>
				<td class="td2">
			1. Include a facility in your code to take String input from the user. Calculate the no. of different places entered in that String.
			<br><br>Note - the string will always be in the given format. Watch closely.
			<br><br>Input 1: I live in CHINA. CHINA is a nice place but I like JAPAN more. Everytime we hear about JAPAN we are reminded of brutal nuclear bombing in
			HIROSHIMA and NAGASAKI.
			<br>Output 1: 4
			<br><br>Input 2: DELHI is the heart of INDIA and MUMBAI is its soul. KOLKATA breathes in still the essence of united BENGAL.
			<br>Output 2: 5.
				</td>
				</tr>
				<tr>
				<td class="td2">
			2. This output from 1. should be the input number(n) and you have to include in your code to store fibonacci series for n terms without using loop.
			<br><br>Output 1 : 0 1 1 2
			<br><br>Output 2 : 0 1 1 2 3
				</td>
				</tr>
				<tr>
				<td class="td2">
			3. The output from 1. and 2. is input to this part. Display Seperate Places and corresponding Fibonacci term.
			<br><br>Output 1: CHINA 0 JAPAN 1 HIROSHIMA 1 NAGASIKA 2
			<br><br>Output 2: DELHI 0 INDIA 1 MUMBAI 1 KOLKATA 2 BENGAL 3 
				</td>
				</tr>
				<tr>
				<td class="td2">Note - Do not take shortcuts, we will be looking at your code.
				</td>
				</tr>
				<tr>
				<td class="td2">You can upload either single file or three different file (file name should be 1,2,3 in case of three different).
				</td>
				</tr>
			</table>
			
				<form method="post" action="upload.jsp" enctype="multipart/form-data" >
				<table align="center">
				<tr><td><input type="file" name="fname"/></td></tr>
				<tr></tr>
				<tr><td><input type="file" name="fname"/></td></tr>
				<tr></tr>
				<tr><td><input type="file" name="fname"/></td></tr>
				<tr><td><input type="submit" name="submit" value="upload"/></td></tr>
				</table>	
				</form>
			
			</div>
		</div>
	</div>
	</body>
</html>
