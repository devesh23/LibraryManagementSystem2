<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConn" %>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
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
						<li><a href="Logout.jsp">Log Out</a></li>
					</ul>
					<ul class="side-nav" id="mobile-demo">
						<li><a href="Logout.jsp">Log Out</a></li>
					</ul>
				</div>

				<div class="nav-content">
					<ul class="tabs tabs-transparent">
						<li class="tab"><a href="#AddBook">Add Book</a></li>
						<li class="tab"><a href="#DeleteBook">Delete Book</a></li>
						<li class="tab"><a href="#IssueRequest">Issue Request</a>
						<li class="tab"><a href="#IssuedBook">Issued Book</a></li>
						<li class="tab"><a href="#HistoryIssue">Issued History</a>
						<li class="tab"><a href="#CollectionBook">Catalogue</a></li>
						<li class="tab"><a href="#ReturnBook">Return Book</a></li>
						<li class="tab"><a href="#SearchBook">Search Book</a></li>
					</ul>
				</div>

			</nav>
		</div>
			<div id="AddBook" class="col s12">

				<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="register" class="col s12">
							<form class="col s12" name="AddBookForm" method="post" action="addbook.jsp">
								<div class="form-container">
									<h3 class="teal-text">Welcome</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="Name" type="text" class="validate" name="Name" required>
											<label for="Name">Name</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Author" type="text" class="validate" name="Author" required>
											<label for="Author">Author</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Publication" type="text" class="validate" required
												name="Publication"> <label for="Publication">Publication
											</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Edition" type="text" class="validate" required
												name="Edition"> <label for="Edition">Edition</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Cost" type="text" name="cost" class="validate" required> <label
												for="Cost">Cost</label>
										</div>
									</div>
									<center>
										<button class="btn waves-effect waves-light teal"
											type="submit" name="action">Add</button>
									</center>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<div id="DeleteBook" class="col s12">

				<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="DeleteBook" class="col s12">
							<form class="col s12" name="DeleteBookForm" method="post"
								action="deletebook.jsp">
								<div class="form-container">
									<h3 class="teal-text">Enter book details</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="Author" type="text" class="validate" name="Book_id" required>
											<label for="ID">Book Id</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Name" type="text" class="validate" name="Name">
											<label for="Name">Name</label>
										</div>
									</div>
									<center>
										<button type="submit" name="action" class="btn waves-effect waves-light teal"
											>Delete</button>
									</center>
								</div>
							</form>
						</div>
					</div>
				</div>


			</div>
			<div id="IssuedBook" class="col s12" style="left: 10%;">
<%
						Connection conn2=DBConn.getConnection();
						Statement statement2 = conn2.createStatement();
						String s2="Select * from issue";
						ResultSet res1= statement2.executeQuery(s2);
						%>
				<div class="row">
					<div class="col s12">
						<h3>Issued Books:</h3>
					</div>
				</div>
				<div class="row">
					<table class="bordered centered responsive-table">
						<thead>
							<tr>
								<th>Issue ID</th>
								<th>User Name</th>
								<th>Book Name</th>
								<th>Librarian Name</th>
								<th>Issue Date</th>
								<th>Due Date</th>
							</tr>
						</thead>
						<tbody>
						<% 
                           while (res1.next()) {
                           %>
							<tr>
								<td><%=res1.getInt(1)%></td>
								<td><%=res1.getString(2)%></td>
								<td><%=res1.getInt(3) %></td>
								<td><%=res1.getInt(4) %></td>
								<td><%=res1.getDate(5) %></td>
								<td><%=res1.getDate(6) %></td>
								
								</tr>
								<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="HistoryIssue" class="col s12">
<%
						Connection conn1=DBConn.getConnection();
						Statement statement1 = conn1.createStatement();
						String s1="Select * from history_table";
						ResultSet res= statement1.executeQuery(s1);
						%>
				<div class="row">
					<div class="col s12">
						<h3>History of Issued Book:</h3>
					</div>
				</div>
				<div class="row">
					<table class="bordered centered responsive-table">
						<thead>
							<tr>
								<th>History ID</th>
								<th>User ID</th>
								<th>Book ID</th>
								<th>Librarian ID</th>
								<th>Issue Date</th>
								<th>Return Date</th>
								<th>Fine(in Rs.)</th>
							</tr>
						</thead>
						<tbody>
						<% 
                           while (res.next()) {
                           %>
							<tr>
								<td><%=res.getInt(1)%></td>
								<td><%=res.getString(2)%></td>
								<td><%=res.getInt(3) %></td>
								<td><%=res.getInt(4) %></td>
								<td><%=res.getDate(5) %></td>
								<td><%=res.getDate(6) %></td>
								<td><%=res.getInt(7) %></td>
								</tr>
								<%} %>
						</tbody>
					</table>
				</div>

			</div>
			<div id="CollectionBook" class="col s12">
			<%
						Connection conn=DBConn.getConnection();
						Statement statement = conn.createStatement();
						String s="Select * from book";
						ResultSet rs= statement.executeQuery(s);
						%>
				<table class="bordered centered responsive-table">
					<thead>
						<tr>
							<th>Book ID</th>
							<th>Book Name</th>
							<th>Author</th>
							<th>Publication</th>
							<th>Edition</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						
						<% 
                           while (rs.next()) {
                           %>
						<tr>
							<td><%=rs.getInt(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getInt(7)%></td>
						</tr>
						<% } %>
					</tbody>
				</table>
				<%
                // close all the connections.
               
                 %>
			</div>

			<div id="IssueRequest" class="col s12">
			<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="DeleteBook" class="col s12">
							<form class="col s12" name="ReturnBookForm" method="post"
								action="issuebook1.jsp">
								<div class="form-container">
									<h3 class="teal-text">Enter book details</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="bookId1" type="text" class="validate" required name="BookId1">
											<label for="BookId1">Book Id</label>
										</div>
									</div>
								<div class="row">
										<div class="input-field col s12">
											<input id="Name" type="text" class="validate" required name="UserName1">
											<label for="Name">User Name</label>
										</div>
									</div> 
									<div class="row">
										<div class="input-field col s12">
											<input id="libraryid" type="text" class="validate" required name="libraryid">
											<label for="libraryid">libraryid</label>
										</div>
									</div> 
									<center>
										<button type="submit" value="submit" name="action" class="btn waves-effect waves-light teal"
											>Request</button>
									</center>
								</div>
							</form>
						</div>
					</div>
			</div>
			</div>
			<div id="ReturnBook" class="col s12">
				<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="DeleteBook" class="col s12">
							<form class="col s12" name="ReturnBookForm" method="post"
								action="returnbook.jsp">
								<div class="form-container">
									<h3 class="teal-text">Enter book details</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="bookId" type="text" class="validate" required name="BookId">
											<label for="BookId">Book Id</label>
										</div>
									</div>
								<!--	<div class="row">
										<div class="input-field col s12">
											<input id="Name" type="text" class="validate" name="UserName">
											<label for="Name">User Name</label>
										</div>
									</div> --->
									<center>
										<button type="submit" value="submit" name="action" class="btn waves-effect waves-light teal"
											>Return</button>
									</center>
								</div>
							</form>
						</div>
					</div>
			</div>
		</div>
		<div id="SearchBook" class="col s12">

				<div class="row"
					style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
					<div class="col s12">
						<div id="SearchBookInside" class="col s12">
							<form class="col s12" name="SearchBookForm" method="post" required action="searchresult1.jsp">
								<div class="form-container">
									<h3 class="teal-text">Welcome</h3>
									<div class="row">
										<div class="input-field col s12">
											<input id="BookName" type="text" required class="validate" name="BookName">
											<label for="BookName">Book Name</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s12">
											<input id="Author" type="text" required class="validate" name="Author">
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
											type="submit" name="action" required>Search</button>
									</center>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
	<footer id="footer"></footer>
</body>
</html>