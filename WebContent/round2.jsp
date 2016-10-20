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
							
							if(m.get("round2")==null)
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
			<div class=div3>
				<ul >
					<li class="lis"><a href="#top"><font color="1D4861">LIMITS</font></a></li>
					<li class="lis"><a href="#bottom"><font color="1D4861">RFCL</font></a></li>
				</ul>
			</div>
			<div class=div4>
			<form method="post" action="round2a.jsp" >
				<table class="t">
					<tr>
						<th colspan=3 id="top" title="Code is given, find the  test case that fails. Each Question - 5 Marks">LIMITS</th>
					</tr>
					<tr>
						<th class="th1">Index</th>
						<th class="th2">Question</th>
						<th class="th3">Options</th>
					</tr>
					<tr>
						<td class="td1">1</td>
						<td class="td2">#include&lt;stdio.h&gt;<br>
							#include&lt;stdlib.h&gt;<br>
							<br>
							int maximumFrequency(int arr[],int n){<br>
								&nbsp;&nbsp;int *temp=(int*)malloc(sizeof(int)*n);<br>
								&nbsp;&nbsp;int k,i,max=0;<br>

								&nbsp;&nbsp;for(i=0;i&lt;n;i++)<br>
									&nbsp;&nbsp;&nbsp;&nbsp;temp[i]=arr[i];<br>
								&nbsp;&nbsp;k=n;<br>

								&nbsp;&nbsp;for(i=0;i&lt;n;i++)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;temp[temp[i]%k]=temp[temp[i]%k]+k;<br>
								
								&nbsp;&nbsp;max=arr[0];<br>
								&nbsp;&nbsp;for(i=0;i&lt;n;i++){<br>
									&nbsp;&nbsp;&nbsp;&nbsp;if(max&lt;temp[i]){<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max=temp[i];<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;k=i;<br>
								&nbsp;&nbsp;&nbsp;&nbsp;}<br>
								&nbsp;&nbsp;}<br>
								&nbsp;&nbsp;free(temp);<br>
								&nbsp;&nbsp;return k;<br>
							}<br>

							int main(){<br>
								&nbsp;&nbsp;int n,i,t;<br>
								&nbsp;&nbsp;int *data;<br>
								&nbsp;&nbsp;scanf("%d",&amp;t);<br>
								&nbsp;&nbsp;while(t--){<br>
								&nbsp;&nbsp;&nbsp;&nbsp;scanf("%d",&amp;n);<br>
								&nbsp;&nbsp;&nbsp;&nbsp;data=(int*)malloc(sizeof(int)*n);<br>
								&nbsp;&nbsp;&nbsp;&nbsp;for(i=0;i&lt;n;i++)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;scanf("%d",data+i);<br>
								&nbsp;&nbsp;&nbsp;&nbsp;printf("%d is element with maximum frequency\n", maximumFrequency(data,n));<br>
								&nbsp;&nbsp;&nbsp;&nbsp;free(data);<br>
								&nbsp;&nbsp;&nbsp;&nbsp;data=NULL;<br>
								&nbsp;&nbsp;}<br>
								&nbsp;&nbsp;return 0;<br>
							}<br>

						<td class="td3">
							<textarea placeholder="WHERE THE GIVEN CODE FAILS" name="A"></textarea>
						</td>
					</tr>
					<tr>
						<td class="td1">2</td>
						<td class="td2">#include&lt;stdio.h&gt;<br>
							#include&lt;limits.h&gt;<br>
							#include&lt;stdlib.h&gt;<br>
							#define MAX 1000000007<br>

							int main()<br>
							{<br>
								&nbsp;&nbsp;int n,i,t;<br>
								&nbsp;&nbsp;int data[100];<br>
								&nbsp;&nbsp;int sum;<br>
								&nbsp;&nbsp;scanf("%d",&amp;t);<br>
								&nbsp;&nbsp;while(t--)<br>
								&nbsp;&nbsp;{	sum=0;<br>
										&nbsp;&nbsp;&nbsp;&nbsp;scanf("%d",&amp;n);<br>
										
										&nbsp;&nbsp;&nbsp;&nbsp;for(i=0;i&lt;n;i++)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;scanf("%d",data+i);<br>


										&nbsp;&nbsp;&nbsp;&nbsp;for(i=0;i&lt;n;i++)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;{<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(data[i]&gt;0)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sum+=data[i];<br>
										&nbsp;&nbsp;&nbsp;&nbsp;}<br>
										&nbsp;&nbsp;&nbsp;&nbsp;printf("%d",sum);<br>

								&nbsp;&nbsp;}<br>
							}<br>
						</td>
						<td class="td3">
							<textarea placeholder="WHERE THE GIVEN CODE FAILS" name="B"></textarea>
						</td>
					</tr>
				</table>
				<center><input type="submit" value=SUBMIT style="background-color:0B476A; color:white; font-size:larger;"/></center>
			
						</form>
						<form method="post" action="upload.jsp" enctype="multipart/form-data" >
				<table class="t" algin="center" >
					<tr>
					<th align="center" id="bottom" title="Download and run the executable file. Observe the behaviour and write code to get the same input output format. Each Question - 5 Marks" colspan=3>RFCL</th>
					</tr>
					
					<tr>
						<td class="td1"><a href="RFCL_WINDOWS.zip">Windows File</a></td>
						
						<td class="td3" colspan=2 align="center">
							  
   								 
   							<input type="file" name="fname" width="200"/>
    					 		
						</td>	
					</tr>
					<tr>
						<td class="td1"><a href="RFCL_unix.zip" >Linux File</a></td>
						<td class="td3" colspan=2 align=center>
							    <input type="file" name="fname" width="200"/>
						</td>
					</tr>
				</table>
				
					<center><input type="submit" value=SUBMIT style="background-color:0B476A; color:white; font-size:larger;"/></center>
			
				<br>

				
			</div>
			</div>
		</div>
	</body>
</html>