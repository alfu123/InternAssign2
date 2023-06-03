<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.spring.LibraryCrud.Table.Author"%>
<%@ page import="com.spring.LibraryCrud.Table.Book"%>
<%@ page import="com.trainee.LibraryManagement.Controller.UserController"%>
<%@ page import="org.springframework.http.ResponseEntity"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="org.springframework.web.client.RestTemplate"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
</head>
<link rel="stylesheet" href="./bootstrap.css">
<link rel="stylesheet" href="./style_login.css">
<style>
.table1 {
	width: 100%;
	border-spacing: 0px;
	text-align: center;
	background: #8cb3a2;
	background-image: linear-gradient(to right, #434343 0%, black 100%);
	color: white;
	border-radius: 0.5rem;
	margin-top: 0.5rem;
}
.form_login {
	margin: 5% ;
}
.form_login1 {
	margin: 0% 20% 5% 25%;
}
.login-form {
	background: #fff;
	width: 500px;
	margin: 10% auto 0 auto;
	display: -webkit-box;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-direction: column;
	border-radius: 0.25rem;
	box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
}

</style>
<body class="body2">
	<%
	if(null!= request.getAttribute("uname"))
	{
	request.getAttribute("uname");
	session.setAttribute("uname", request.getAttribute("uname"));
	}
	else
	{
		session.getAttribute("uname");
	}
	
	RestTemplate restTemplate = new RestTemplate();
	Map<String, String> param = new HashMap<>();
	param.put("bookcode", request.getParameter("bookcode"));

	Book b = restTemplate.getForObject("http://localhost:8082/book/{bookcode}", Book.class, param);

	
	%>

	<header>
		<table class="table1">
			<tr>
				<td style="width: 70%; text-align: center; background: transparent;"><h2 id="heading" style=" margin-left: 25%;">Library Management</h2></td>
				<td style="width: 20%; text-align: center; background: transparent; text-transform: capitalize">Welcome,${uname}</td>
				<td style="background: transparent;width: 10%;">
				<form>
				<button type="submit" formaction="/logout" formmethod="post" style="color: white; background: green; width: 60%; font-size: 12px; border-radius: 10px; height: 1.6rem;">Logout</button>
				</form>
				</td>
			</tr>
		</table>
	</header>
	
	<div class="login-form">
	<form action="/edit" method="post" autocomplete="off" class="form_login">
	<table style="width:100%">
		<tr>
		<td>Book Code:</td> 
		<td><input type="text" disabled="disabled" name="bookcode" value=<%=b.getBookcode()%>></td>
		<% 
		session.setAttribute("bookcode", b.getBookcode());
		%>
		</tr>
		<tr>
		<td>Book Name:</td>
		<td><input type="text" name="bookname" value=<%=b.getBookname() %>></td></tr> 
		<tr>
		<td>Author:</td>
		<td>
		<select id="author" name="author" style="width:65%" required="required">
		<%
							RestTemplate rest = new RestTemplate();
							ResponseEntity<Author[]> books = rest.getForEntity("http://localhost:8082/author", Author[].class);
							request.getSession().setAttribute("auth", Arrays.asList(books.getBody()));
							List<Author> obj = (List<Author>) session.getAttribute("auth");
							if (obj != null) {
								for (Author a : obj) {
									if(a.getAuthor().equals(b.getAuthor()))
									{
							%>
							<option name=<%=a.getAuthor()%> selected="selected"><%=a.getAuthor()%></option>
							
							<%}
									else
									{
									%>
							<option name=<%=a.getAuthor()%>><%=a.getAuthor()%></option>
							<%
									}
									}
							}
							%>
					</select></td></tr>
		<tr>
		<td>Added On:</td>
		<td><input type="text" disabled="disabled"  name="date" value=<%=b.getDate() %>></td>
		<% 
		session.setAttribute("date", b.getDate());
		%>
		</tr>
		
		</table>
		<input type="submit" value="Submit"
		style="color: white;background: #000a80;width: 50%;font-size: 12px;border-radius: 10px;height: 1.6rem;border-color: transparent;margin: 5% 25% 0 25%;">
	</form>

	<form action="welcome.jsp" class="form_login1">
		<input type="submit" value="Cancel" 
		style="color: white; background: #000a80; width: 82%; font-size: 12px; border-radius: 10px; height: 1.6rem; border-color: transparent; margin-left:5%">
	</form>
	</div>
	
</body>
</html>