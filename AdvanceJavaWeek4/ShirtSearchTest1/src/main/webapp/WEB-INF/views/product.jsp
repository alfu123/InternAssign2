<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Object str1=session.getAttribute("current-user");
	if(str1==null)
	{
		session.setAttribute("message","You are not LOGGED in!! LOGIN first!!");
		response.sendRedirect("index.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/WEB-INF/reused-components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="/WEB-INF/reused-components/navbar.jsp" %>
	<h1 style="text-align: center;">Product Search Application</h1>
	<hr>
	<form action="searchproducts" method="post">

		<label for="products">Colour : </label><input type="text" name="colour" required>
		 
		<br> <br> <label for="products">Gender : </label>
		<select id="products" name="gender">
			<option value="F">Female</option>
			<option value="M">Male</option>
			<option value="U">Unisexual</option>
		</select>
		<br> <br> <label for="products">Size : </label>
		<select id="products" name="size">
			<option value="S">S</option>
			<option value="M">M</option>
			<option value="L">L</option>
			<option value="XL">XL</option>
			<option value="XXL">XXL</option>
		</select>  
		<br> <br><label for="pref">Output preference : </label> 
		<select	id="pref" name="outpref">
			<option value="1">Fare</option>
			<option value="2"> Rating</option>
		</select> 
		<br> <br> <input type="submit" value="Search product">

	</form>
</body>
</html>