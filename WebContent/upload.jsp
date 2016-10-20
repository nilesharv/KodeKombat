 <%@ page import="java.io.*" %>
 <%@ page import="com.oreilly.servlet.MultipartRequest" %>  
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
    try
    {
    String str=(String)session.getAttribute("email");
    File f=new File("//home//krishna//Code//"+str+"//");
  		 if(f.exists()==false)
	   			f.mkdir();
    
    MultipartRequest m = new MultipartRequest(request, "//home//krishna//Code//"+str+"//");  
   	response.sendRedirect("index.jsp");
    }catch(Exception ex)
    {
    	out.print(ex);
    	
    }
    %>  
</body>
</html>