<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%  
  String filename ="a.out";//request.getParameter("program"); 
  String filepath = "//home//krishna//Pictures//"; 
 
  File file=new File(filepath+	filename);
  response.setContentType("application");
  response.setContentLength((int) file.length());
  response.setHeader("Content-Disposition","attachment; filename=\"" + file.getName() + "\"");
  InputStream in = new BufferedInputStream(new FileInputStream(file));
  OutputStream out1 = response.getOutputStream();
  byte[] buffer = new byte[4096];
  while (true) {
     int bytesRead = in.read(buffer, 0, buffer.length);
     if (bytesRead < 0)
        break;
     out1.write(buffer, 0, bytesRead);
  }
  out1.flush();
  out1.close();
  in.close();
%> 
</body>
</html>