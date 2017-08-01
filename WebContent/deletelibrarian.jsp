<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConn"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = DBConn.getConnection();
String username=request.getParameter("UserName");
PreparedStatement pst2 = conn.prepareStatement("delete from librarian where username=? ");
pst2.setString(1,username);
pst2.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("/Admin.html");
rd.forward(request, response);
%>
</body>
</html>