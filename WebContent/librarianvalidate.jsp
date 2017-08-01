<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.librariancheck" %>
    <%@page import="util.DBConn" %>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("LibraryId");
String pswd=request.getParameter("PassWord");

//String name="Devesh123";
//String pswd="123456784564";
int s = 0;
		Connection conn5 = DBConn.getConnection();
		PreparedStatement pst6 = conn5.prepareStatement(" select lib_id from librarian where username=?");
		pst6.setString(1, name);
		ResultSet res5 = pst6.executeQuery();
		while (res5.next()) {
			s = res5.getInt(1);
		}
boolean sta=librariancheck.resu(name, pswd);
if(sta)
{   session.setAttribute("lib", s);
	RequestDispatcher rd=request.getRequestDispatcher("/LibraryAdmin.jsp");
	rd.forward(request, response);
}
else
{
	%>
	<script language="javascript">
	
	window.location.href='index.html';
	</script>
	<%
	
}
%>
</body>
</html>