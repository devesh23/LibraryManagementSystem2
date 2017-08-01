<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="util.DBConn"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian</title>

<!--  Loading the materialize CSS files -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="materialize/css/materialize.min.css" media="screen,projection" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link type="text/css" rel="stylesheet" href="custom.css">
<!-- --------------------- -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js">
	
</script>

<script type="text/javascript" src="materialize/js/materialize.min.js"></script>

<script type="text/javascript" src="index.js"></script>

</head>

<body>
	<div class="row">
		<div class="col s12">
			<nav class="nav-extended">
				<div class="nav-wrapper">
					<a href="#" class="brand-logo">Library Management System</a> <a
						href="#" data-activates="mobile-demo" class="button-collapse"><i
						class="material-icons">menu</i></a>
					<ul id="nav-mobile" class="right hide-on-med-and-down">
						<li><a href="LibraryAdmin.jsp">Go back</a></li>
					</ul>
					<ul class="side-nav" id="mobile-demo">
						<li><a href="LibraryAdmin.jsp">Go Back</a></li>
					</ul>
				</div>
			</nav>
		
		<div id="SearchResult" class="col s12">

			<%
				String name = request.getParameter("BookName");
				String author = request.getParameter("Author");

				Connection conn = DBConn.getConnection();

				PreparedStatement pst = conn.prepareStatement(
						"Select distinct(name),author,edition,ref_id from book where name=? and author=? and is_issued='no'");
				pst.setString(1, name);
				pst.setString(2, author);
				ResultSet res = pst.executeQuery();
			%>
			<table class="bordered centered responsive-table">
				<thead>
					<tr>
						<th>Book id</th>
						<th>Book Name</th>
						<th>Author</th>
						<th>Edition</th>
						<th>Available</th>

					</tr>
				</thead>
				<tbody>

					<%
						while (res.next()) {
					%>
					<tr>
					    <td><%=res.getInt(4) %></td>
						<td><%=res.getString(1)%></td>
						<td><%=res.getString(2)%></td>
						<td><%=res.getString(3)%></td>
						<td>YES</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				
			%>
		</div>
	</div>
	</div>
</body>
</html>