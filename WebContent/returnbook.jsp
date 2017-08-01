<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConn" %>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Optum Library</title>
</head>
<body>
<% int k=0; 
int id=Integer.parseInt(request.getParameter("BookId"));
//String author=request.getParameter("UserName");
Connection conn = DBConn.getConnection();
		PreparedStatement pst1 = conn.prepareStatement(" select ISSUE_ID,MEM_ID,REF_ID,lIB_ID,ISSUE_DATE,DUE_DATE,ROUND(to_number(dUE_DATE - sysDATE))*10,SYSDATE from issue WHERE ref_id=?	");
		pst1.setInt(1, id);		
		ResultSet res = pst1.executeQuery();
		PreparedStatement pst2 = conn.prepareStatement("select max(his_id) from history_table ");
		ResultSet res1= pst2.executeQuery();
		while(res1.next())
		{  k=res1.getInt(1);
			k=k+1;
		}
		while(res.next())
		{ 
			int issue_id=res.getInt(1);
			String memid=res.getString(2);
			int refid=res.getInt(3);
			int libid=res.getInt(4);
			Date issuedate=res.getDate(5);
			Date duedate=res.getDate(6);
			int value=res.getInt(7);
			Date today=res.getDate(8);
		    Connection conn2=DBConn.getConnection();
			PreparedStatement pst3=	conn2.prepareStatement("insert into history_table values(?,?,?,?,?,?,?)");
			pst3.setInt(1, k);
			pst3.setString(2, memid);
			pst3.setInt(3, refid);
			pst3.setInt(4, libid);
			pst3.setDate(5,issuedate);
			pst3.setDate(6, today);
			pst3.setInt(7,value);
			pst3.executeUpdate();
			
			PreparedStatement pst4=	conn2.prepareStatement("delete from issue where ref_id=?");
			pst4.setInt(1, id);
			pst4.executeUpdate();
			
			PreparedStatement pst5=	conn2.prepareStatement("Update book set is_issued='no' where ref_id=?");
			pst5.setInt(1, id);
			pst5.executeUpdate();
			
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("/LibraryAdmin.jsp");
		rd.forward(request, response);
%>
</body>
</html>