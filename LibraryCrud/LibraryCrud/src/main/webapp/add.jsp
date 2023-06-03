<%@page import="com.spring.LibraryCrud.Table.Author"%>
<%@page import="com.trainee.LibraryManagement.Controller.UserController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.springframework.web.client.RestTemplate"%>
<%@page import="org.springframework.http.ResponseEntity"%>

<html>
<link rel="stylesheet" href="./bootstrap.css">
<link rel="stylesheet" href="./style_login.css">
<style>
.table1 {
	width: 100%;
	border-spacing: 0px;
	text-align: center;
	background-image: linear-gradient(to right, #434343 0%, black 100%);
	color: white;
	border-radius: 0.5rem;
	margin-top: 0.5rem;
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
.form_login {
	margin: 5%;
}
.addbtn1
{
color: white;
background: #000a80;
width: 50%;
font-size: 12px;
border-radius: 10px;
height: 1.6rem;
border-color: transparent;
margin: 5% 25% 0 25%;
}
.addbtn2
{
color: white;
background: #000a80;
width: 45%;
font-size: 12px;
border-radius: 10px;
height: 1.6rem;
border-color: transparent;
margin: 0 27%;
}
</style>
<body class="body2">
	<header>
		<table class="table1">
			<tr>
				<td style="width: 70%; text-align: center; background: transparent;"><h2 id="heading" style=" margin-left: 25%;">Library Management</h2></td>
				<td style="width: 20%; text-align: center; background: transparent; text-transform: capitalize">Welcome,${uname}</td>
				<td style="background: transparent;width: 10%;">
				<form style="margin-top:10%">
				<button type="submit" formaction="/logout" formmethod="post" style="color: white; background: green; width: 60%; font-size: 12px; border-radius: 10px; height: 1.6rem;">Logout</button>
				</form>
				</td>
			</tr>
		</table>
	</header>
<%
session.setAttribute("uname", session.getAttribute("uname"));
%>
	<div class="login-form">

		<form action="/add_book" method="post" autocomplete="off" class="form_login">
			<table style="width:100%">
				<h2>Add Book Details</h2>
				<tr>
					<td>Book Code:</td>
					<td><input type="text" name="bookcode" required="required"></td>
				</tr>
				
				<tr>
					<td>Book Name:</td>
					<td><input type="text" name="bookname"required="required"></td>
				</tr>
				
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
							%>
							<option name=<%=a.getAuthor()%>><%=a.getAuthor()%></option>
							<%
							}
							}
							%>
					</select>
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>Added On:</td>
					<td>
					<label for="date" id="date" style="width:65%; text-align:left;"></label>
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>
						<%
						if (null != request.getAttribute("message")) {
							out.println(request.getAttribute("message"));
						}
						%>
					</td>
				</tr>
			</table>
		<button type="submit" class="addbtn1">Add</button>
		</form>
		<form>
		<button type="submit" formaction="welcome.jsp" formmethod="post" class="addbtn2">Cancel</button>
		</form>

	</div>
	<script type="text/javascript">
		date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		document.getElementById("date").innerHTML = day + "-" + month + "-"
				+ year;
	</script>

</body>
</html>