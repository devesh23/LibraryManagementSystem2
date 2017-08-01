<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="util.membercheck"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="util.DBConn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("UserName");
		String pswd = request.getParameter("PassWord");

		String s = "";
		Connection conn5 = DBConn.getConnection();
		PreparedStatement pst6 = conn5.prepareStatement(" select mem_id from member where user_id=?");
		pst6.setString(1, name);
		ResultSet res5 = pst6.executeQuery();
		while (res5.next()) {
			s = res5.getString(1);
		}
		//System.out.println(s + "------------------------------");
		boolean sta = membercheck.resu(name, pswd);
		System.out.print("status " + sta);
		if (session.isNew()) {
			session.setAttribute("user", s);
		}
		if (sta) {
			RequestDispatcher rd = request.getRequestDispatcher("User.jsp");
			rd.forward(request, response);
		} else {
			session.invalidate();
	%>
	<script language="javascript">
		window.location.href = 'index.html';
	</script>
	<%  res5.close();
	pst6.close();
		conn5.close();
	
		}
	%>
</body>
</html>