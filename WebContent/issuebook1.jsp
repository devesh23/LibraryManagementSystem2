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
		int k = 0;
		int h = 0;
		Date one=null;
		Date two=null;
		Connection conn = DBConn.getConnection();
		int s = Integer.parseInt(request.getParameter("BookId1"));
		String memid = request.getParameter("UserName1");
		int libid = Integer.parseInt(request.getParameter("libraryid"));
		
		PreparedStatement pst2 = conn.prepareStatement("select max(issue_id),sysdate,sysdate+30 from issue ");
		ResultSet res1 = pst2.executeQuery();
		while (res1.next()) {
			k = res1.getInt(1);
			one=res1.getDate(2);
			two=res1.getDate(3);
		 k=k+1;
		}
		
		PreparedStatement pst = conn.prepareStatement("Select * from book where ref_id=?");
		pst.setInt(1, s);
       // out.println(k);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			try {
				Connection conn2 = DBConn.getConnection();
				PreparedStatement pst3 = conn2.prepareStatement("insert into issue values(?,?,?,?,?,?)");
				pst3.setInt(1, k);
				pst3.setString(2, memid);
				pst3.setInt(3, s);
				pst3.setInt(4, libid);
				pst3.setDate(5, one);
				pst3.setDate(6, two);
				h = pst3.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			if (h == 1) {
				Connection conn3 = DBConn.getConnection();
				PreparedStatement pst4 = conn3.prepareStatement("Update book set is_issued='yes' where ref_id=?");
				pst4.setInt(1, s);
				pst4.executeUpdate();
			}

		}
		RequestDispatcher rd=request.getRequestDispatcher("/LibraryAdmin.jsp");
		rd.forward(request, response);
	%>
</body>
</html>