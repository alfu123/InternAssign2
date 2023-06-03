<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/reused-components/common_css_js.jsp" %>
<link rel="stylesheet" href="/WEB-INF/css/style.css" >
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/reused-components/navbar.jsp" %>
	<div class="container">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card mt-3">
				<div class="card-header">
					<h3>Login Here</h3>
				</div>
				<div class="card-body">
				<%@include file="/WEB-INF/reused-components/message.jsp" %>
				<form action="checkuser" method="post">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">User Name</label>
				    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  <a href="${pageContext.request.contextPath }/register">Create New Account</a>
				  <div class="container text-center">
				  <button type="submit" class="btn btn-primary border-0">Submit</button>
				  <button type="reset" class="btn btn-primary border-0">Reset</button>
				  </div>
				</form>
				</div>				
			</div>
			
			
			
		</div>
	</div>
</div>	
</body>
</html>