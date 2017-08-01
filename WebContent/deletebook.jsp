<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int book_id=Integer.parseInt(request.getParameter("Book_id"));
String name=request.getParameter("Name");
Connection conn=DBConn.getConnection();
PreparedStatement pst=conn.prepareStatement("Delete from book where ref_id=?");
pst.setInt(1, book_id);
int i=pst.executeUpdate();

RequestDispatcher rd=request.getRequestDispatcher("LibraryAdmin.jsp");
rd.forward(request, response);
%>
</body>
</html>