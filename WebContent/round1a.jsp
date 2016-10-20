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
				String[] solution={"A","B","B","A","C","D","C","C","B","C","C","C","B","C","C"};
				String[] solution2={"C","B","C","B","D"};
				Vector<String> round1a=new Vector<String>();
				Vector<String> round1b=new Vector<String>();
				Vector<String> round1c=new Vector<String>();
				int r1=0;
				int r2=0;
				for(int i=1;i<=15;i++)
				{
					String value=request.getParameter("opt"+i+"");
					round1a.add(value);
					if(solution[i-1].equalsIgnoreCase(value))
						r1++;
					
				}
					
				for(int i=1;i<=3;i++)
				{
					String value=request.getParameter("LNTC"+i+"");
					round1b.add(value);
					
				}
				for(int i=1;i<=5;i++)
				{
					String value=request.getParameter("opt3"+i+"");
					round1c.add(value);
					if(solution2[i-1].equalsIgnoreCase(value))
						r2++;
					
				}
				out.print(r1+" ");
				out.print(r2+" ");
				out.print(round1b);
				String email=(String)session.getAttribute("email");
				Connection con;
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
				PreparedStatement st=con.prepareStatement("insert into round1 values('"+email+"',?,?,?,?,?)");
				st.setInt(1,r1);
				st.setInt(5,r2);
				st.setString(2,round1b.elementAt(0));
				st.setString(3,round1b.elementAt(1));
				st.setString(4,round1b.elementAt(2));
				st.execute();
				}
				catch(Exception ex)
				{
					out.print(ex);
				}
				
				response.sendRedirect("index.jsp");
				%>
				
						
			</div>
		</div>
	</body>
</html>
