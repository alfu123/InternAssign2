<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
<style>
input[type=submit] {
  width: 5em; height: 2em;
    font-size: 18px;
}
a{
  font-size: 14px;
}
.sbmt {
	background-color: #D4D4D4;
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 1.5%;
	padding-bottom: 1.5%;
}

.hd {align =left;
	background-color: #D4D4D4;
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 0.005%;
	padding-bottom: 0.005%;
}

.mn {
	background-color: #E4E4E4;
}

span {
	color: red;
}
</style>
</head>
<body>
	<div class="mn">
		<div class="hd">
			<h3>Login</h3>
		</div>
		<form action="Login" method="post" align="center">
			<br> <br> <label>Username &nbsp; &nbsp; &nbsp;
				&nbsp;&nbsp;<span> *&nbsp; </span>
			</label><input type="text" name="uname" required> <br> <br>
			<br> <label> Password &nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span> *&nbsp; </span>
			</label><input type="password" name="pass" required><br> <br>
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
			&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<a href="#">Forgot
				Your Password</a> <br> <br>
			<div class="sbmt" align="right">
				<input type="submit" value="Login>>">
			</div>



		</form>
	</div>
</body>
</html>