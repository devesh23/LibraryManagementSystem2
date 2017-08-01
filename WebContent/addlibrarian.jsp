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
<% int k=0;
Connection conn = DBConn.getConnection();
	PreparedStatement pst1 = conn.prepareStatement("select max(lib_id) from librarian ");
		ResultSet res1 = pst1.executeQuery();
		while (res1.next()) {
			k = res1.getInt(1);
			k=k+1;}
		String name=request.getParameter("Name");
		String email=request.getParameter("Email");
		String phone=request.getParameter("PhoneNo");
		String Username=request.getParameter("UserName");
		String password=request.getParameter("PassWord");
	
		PreparedStatement pst2= conn.prepareStatement("insert into librarian values (?,?,?,?,?,?)");
		pst2.setInt(1,k);
		pst2.setString(2,name);
		pst2.setString(3,email);
		pst2.setString(4,phone);
		pst2.setString(5,password);
		pst2.setString(6,Username);
		
		pst2.executeUpdate();
		RequestDispatcher rd=request.getRequestDispatcher("/Admin.html");
		rd.forward(request, response);
		%>
</body>
</html>