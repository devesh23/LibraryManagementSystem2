<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="util.DBConn" %>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
						<li><a href="Logout.jsp">Log Out</a></li>
					</ul>
					<ul class="side-nav" id="mobile-demo">
						<li><a href="Logout.jsp">Log Out</a></li>
					</ul>
				</div>

				<div class="nav-content">
					<ul class="tabs tabs-transparent">
						<li class="tab"><a href="#SearchBook">Search Book</a></li>
						<li class="tab"><a href="#IssueHistory">Issue History</a>
					</ul>
				</div>
			</nav>
			
			<div id="SearchBook" class="col s12">

				<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="SearchBookInside" class="col s12">
							<form class="col s12" name="SearchBookForm" method="post" action="searchresult.jsp">
								<div class="form-container">
									<h3 class="teal-text">Welcome</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="BookName" type="text" class="validate" name="BookName">
											<label for="BookName">Book Name</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Author" type="text" class="validate" name="Author">
											<label for="Author">Author</label>
										</div>
									</div>
							<!--  	<div class="row">
										<div class="input-field col s12">
											<input id="Publication" type="text" class="validate"
												name="Publication"> <label for="Publication">Publication
											</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Edition" type="text" class="validate"
												name="Edition"> <label for="Edition">Edition</label>
										</div>
									</div>    -->	
									<center>
										<button class="btn waves-effect waves-light teal"
											type="submit" name="action">Search</button>
									</center>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="IssueHistory" class="col s12">

				<div class="row">
					<div class="col s12">
						<h3>History of Issued Book:</h3>
					</div>
				</div>
				
				<%String s=(String)session.getAttribute("user");
				Connection conn=DBConn.getConnection();
				PreparedStatement pst1 = conn.prepareStatement(" select b.NAME, b.AUTHOR, i.issue_date,i.due_date from BOOK b inner join issue i on b.ref_id=i.ref_id where b.REF_ID in (select i1.REF_ID  from issue i1 where i1.MEM_ID=?)");
				pst1.setString(1,s);
				ResultSet res= pst1.executeQuery();
				Connection conn1=DBConn.getConnection();
				PreparedStatement pst2 = conn1.prepareStatement("select b.NAME, b.AUTHOR, h.issue_date,h.return_date,h.fine from BOOK b inner join history_table h on b.ref_id=h.ref_id where b.REF_ID in (select h1.REF_ID from history_table h1 where h1.MEM_ID=?)");
				pst2.setString(1,s);
				ResultSet res1= pst2.executeQuery();
				%>
				<div class="row">
					<table class="bordered centered responsive-table" >
						<thead>
							<tr>
								<th>Book Name</th>
								<th>Author</th>
								<th>Issue Date</th>
								<th>Return Date</th>
								<th>Fine</th>
							</tr>
						</thead>
						<%while(res.next()){ %>
						<tbody>
							<tr>
								<td><%=res.getString(1)%></td>
								<td><%=res.getString(2) %></td>
								<td><%=res.getDate(3) %></td>
								<td><%=res.getDate(4) %></td>
								<td>Not yet Submitted</td>
								
							</tr>
							<%} %>
							<%while(res1.next()){ %>
							<tr>
							<td><%=res1.getString(1)%></td>
								<td><%=res1.getString(2) %></td>
								<td><%=res1.getDate(3) %></td>
								<td><%=res1.getDate(4) %></td>
								<td><%=res1.getInt(5) %></td>
							</tr>
							<%
							
							
							
							} %>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		</div>
		<%
		res1.close();
		res.close();
		pst2.close();
		pst1.close();
	    conn.close();
		conn1.close();
		%>
		
<footer id="footer"></footer>
</body>
</html>