<%@page import="com.spring.LibraryCrud.Table.Book"%>
<%@page import="com.trainee.LibraryManagement.Controller.UserController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.springframework.web.client.RestTemplate"%>
<%@page import="org.springframework.http.ResponseEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<link rel="stylesheet" href="./bootstrap.css">
<style>
body {
	font-family: 'Rubik', sans-serif;
	background-image: linear-gradient(to right, #c6ffdd, #fbd786, #f7797d);
}

.form1 {
	margin: 1% 5%;
}

h1 {
	text-align: center;
	padding: 1% 0;
	background-image: linear-gradient(to right, #434343 0%, black 100%);
	color: white;
	border-radius: 0.5rem;
}

.h3class {
	margin: 2% 5%;
}

.submit {
	margin: 5% 40% 0% 40%;
	border: none;
	width: 20%;
	height: 2.5rem;
	background: #59da39;
	color: white;
	border-radius: 0.5rem;
}

.rsize1 {
	background-image: linear-gradient(109.6deg, rgba(156, 252, 248, 1) 11.2%,
		rgb(185, 191, 246) 91.1%);
	width: 43%;
	float: left;
	padding: 2%;
	height: 15rem;
	border-radius: 0.5rem;
}

.rsize2 {
	background-image: linear-gradient(109.6deg, rgba(156, 252, 248, 1) 11.2%,
		rgba(110, 123, 251, 1) 91.1%);
	width: 43%;
	float: right;
	padding: 2%;
	height: 15rem;
	border-radius: 0.5rem;
}

.lab {
	font-size: 20px;
	font-weight: bold;
}

.ip {
	font-size: 18px;
	display: block;
	font-family: 'Rubik', sans-serif;
	border: 0;
	border-bottom: 1px solid #747474;
	outline: none;
	-webkit-transition: all .2s;
	transition: all .2s;
	background: transparent;
}

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

.add
{
padding: 1%;
float: right;
}
.actionbtn
{
color: white;
border-color: transparent; 
border-radius: 0.5rem; 
font-size: 10px; 
width: 25%;
}
.editbtn
{
background-color: green;
}
.delbtn
{
background-color: red;
}
</style>
<body>
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
	
	<form action="add.jsp" class="add" method="post">
		<input type="submit" name="button" id="btn" value="Add" style="color: white; background: #000a80; width: 10rem; font-size: 12px; border-radius: 10px; height: 1.6rem; border-color: transparent;">
	</form>

	<table class="table mt-2 table-bordered table-dark table-striped"
		style="width: 100%; vertical-align: middle">
		<thead>
			<tr>
				<th style="width: 15%">Book Code</th>
				<th style="width: 25%">Book Name</th>
				<th style="width: 25%">Author</th>
				<th style="width: 20%">Added On</th>
				<th style="width: 15%">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			RestTemplate rest = new RestTemplate();
			ResponseEntity<Book[]> books = rest.getForEntity("http://localhost:8082/book", Book[].class);
			request.getSession().setAttribute("book", Arrays.asList(books.getBody()));
			List<Book> obj = (List<Book>) session.getAttribute("book");
			for (Book b : obj) {
			%>
			<tr>
				<td><%=b.getBookcode()%></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getDate()%></td>
				<td style="width: 20%; justify-content: space-between; vertical-align: middle">
					<form>
					<button type="submit" formaction="edit_details.jsp" formmethod="post" value=<%=b.getBookcode()%> name="bookcode" class="editbtn actionbtn" onclick="myfn()">Edit</button>
					<button type="submit" formaction="/Delete" formmethod="post" value=<%=b.getBookcode()%> name="bookcode" class="delbtn actionbtn">Delete</button>
					</form>
				</td>

			</tr>
			<%
			}
			%>


		</tbody>
	</table>

<script>
function myfn()
{

}
</script>


</body>
</html>
