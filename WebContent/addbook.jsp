<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="util.DBConn"%>
<%@page import="util.AddBook"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Optum Library</title>
</head>
<body>
	<jsp:useBean id="obj" class="util.BookBean" scope="session"></jsp:useBean>
	<%
		int num = 0;
		String name = request.getParameter("Name");
		String author = request.getParameter("Author");
		String publication = request.getParameter("Publication");
		String edition = request.getParameter("Edition");
		String cost = request.getParameter("cost");
		Connection conn = DBConn.getConnection();
		Statement st = conn.createStatement();
		String s = "select max(ref_id) from book";
		ResultSet rs = st.executeQuery(s);
		while (rs.next()) {
			num = rs.getInt(1);
		}
		num++;

		obj.setNum(num);
		obj.setAuthor(author);
		obj.setCost(cost);
		obj.setEdition(edition);
		obj.setPublication(publication);
		obj.setName(name);

		int i = AddBook.addbook(obj);
		if (i == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("LibraryAdmin.jsp");
			rd.forward(request, response);
		}
	%>
</body>
</html>