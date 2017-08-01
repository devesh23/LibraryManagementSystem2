<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Page</title>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="materialize/css/materialize.min.css" media="screen,projection" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link type="text/css" rel="stylesheet" href="custom.css">


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js">
	
</script>

<script type="text/javascript" src="materialize/js/materialize.min.js"></script>

<script type="text/javascript" src="index.js"></script>

<script type="text/javascript" src="login.js"></script>

</head>

<body>

	<div class="row">
		<!-- Navbar Code -->

		<div>
			<nav>
				<div class="nav-wrapper">
					<a href="index.html" class="flow-text" style="padding-left: 0.5em">Library
						Management System</a>
					<ul id="nav-mobile" class="right">
						<li style="padding-right: 0.5em;">Already Registered?</li>
						<li style="padding-right: 4em;"><a class="white-text"
							href="index.html"> <span>Log In</span>
						</a></li>
					</ul>
				</div>
			</nav>
		</div>

		<!-- Register Form 
	
	Parameter Name - Name
	
	Name - Name
	Username - UserName
	email - Email
	phoneNumber - PhoneNumber
	Password - PassWord
	 -->
		<div class="row" class="registerSign"
			style="height: 50%; width: 50%; top: 50%; left: 50%; z-index: 0px;">
			<div class="col s12">
				<div id="registerSignUp" class="col s12">
					<form class="col s12" name="SignUpForm" method="post" action="useradddb.jsp">
						<div class="form-container">
							<h3 class="teal-text">Welcome</h3>
							<div class="row">
								<div class="input-field col s12">
									<input id="Name" type="text" class="validate" name="Name" required>
									<label for="Name" data-error="Please enter a correct name">Name</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="UserName" type="text" name="UserName" class="validate" required> <label
										for="UserName">User Name</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="email" type="email" class="validate" name="Email" required>
									<label for="email" data-error="Please enter a correct email id">Email</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="email-confirm" type="email" class="validate" required>
									<label for="email-confirm" data-error="Email Does not match">Email Confirmation</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="phoneNumber" type="text" class="validate" required
										name="PhoneNumber"> <label for="phoneNumber">Mobile
										Number</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="password" type="password" class="validate" required
										name="PassWord" data-error="Please follow proper password standard"> <label for="password">Password</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="password-confirm" type="password" class="validate" required>
									<label for="password-confirm" data-error="Password do not match">Password Confirmation</label>
								</div>
							</div>
							<center>
								<input  type="submit" value="submit" class="btn waves-effect waves-light teal">
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>