<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    <%@page import="util.DBConn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String name=request.getParameter("Name");
String author=request.getParameter("Author");
Connection conn=DBConn.getConnection();

PreparedStatement pst=conn.prepareStatement("Select * from book where name=? and author=?");
pst.setString(1, name);
pst.setString(2, author);

RequestDispatcher rd=request.getRequestDispatcher("searchbook.jsp");
rd.forward(request, response);

%>
</body>
</html>