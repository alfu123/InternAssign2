<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<link rel="stylesheet"  type="text/css" href="./style_login.css">
	<title>Login</title>
</head>
<style>
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
	height: 1.5rem;
}

.login-form {
	background: #fff;
	width: 500px;
	margin: 15% auto;
	display: -webkit-box;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-direction: column;
	border-radius: 0.25rem;
	box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
}

.body1 {
	background: #e35869;
	font-family: 'Rubik', sans-serif;
	overflow-y: hidden;
}

.body2 {
	background: #967bab;
	font-family: 'Rubik', sans-serif;
}

.body3 {
	background: #7b9eab;
	font-family: 'Rubik', sans-serif;
}

.form_login {
	margin: 5% 20% 5% 25%;
}

.btn1 {
	width: 100%;
	background-color: #ffea8d;
	color: black;
	border: none;
	height: 2rem;
	border-radius: 1.25rem;
}

.btn2 {
	width: 100%;
	background-color: #00e0ff;
	border: none;
	height: 2rem;
	border-radius: 1.25rem;
}


.form1 {
	margin-left: 5%;
	background: skyblue;
	padding: 2%;
}


</style>
<body class="body1">
	<div class="login-form">
		<form action="/signup" class="form_login" autocomplete="off" method="post">
			<table>
				<tr>
					<td colspan="2"><input type="text" name="uname" class="ip" placeholder="Username" minlength="5" maxlength="50"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="pass" class="ip" placeholder="Password" minlength="5" maxlength="50"></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>
					<button type="submit" class="btn1">Signup</button>
					</td>
				</tr>
					<td>
					<button type="submit" formaction="index.jsp" formmethod="post" class="btn2">Login</button>
					</td>
				</tr>
			</table>
			<%
			if (null != request.getAttribute("errorMessage")) {
				out.println(request.getAttribute("errorMessage"));
			}
			
			%>
		</form>
	</div>
</body>
</html>
</body>
</html>
