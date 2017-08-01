<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="util.MemberAdd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Register Form 
	
	Parameter Name - Name
	
	Name - Name
	Username - UserName
	email - Email
	phoneNumber - PhoneNumber
	Password - PassWord
	 -->
<jsp:useBean id="obj" class="util.MemberBean" scope="session"></jsp:useBean>
<%
String name=request.getParameter("Name");
String username=request.getParameter("UserName");
String email=request.getParameter("Email");
String phone=request.getParameter("PhoneNumber");
String password=request.getParameter("PassWord");

//out.println(name + username + email + phone + password);

obj.setName(name);
obj.setEmail(email);
obj.setUsername(username);
obj.setPhoneNumber(phone);
obj.setPassword(password);

int i=MemberAdd.adduser(obj);
if(i==1)
{
	RequestDispatcher rd=request.getRequestDispatcher("/User.jsp");
	rd.forward(request, response);
}
%>
</body>
</html>