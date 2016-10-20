<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String email=request.getParameter("email");
String password=request.getParameter("password");
String query="select * from login where email='"+email+"' and password='"+password+"'";
Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
Statement st=con.createStatement();
ResultSet result=st.executeQuery(query);
if(result.next())
{
session.setAttribute("user",result.getString(1));	
session.setAttribute("email",result.getString(2));	
session.setAttribute("mobile",result.getString(3));	
}
}catch(Exception ex)
{
out.print(ex);
}
response.sendRedirect("index.jsp");
%>
</body>
</html>