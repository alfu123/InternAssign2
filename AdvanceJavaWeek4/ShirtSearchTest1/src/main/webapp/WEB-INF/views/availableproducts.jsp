<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/WEB-INF/reused-components/common_css_js.jsp" %>
<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/reused-components/navbar.jsp" %>
	<h1 style="text-align: center;">All Available Products</h1>
	<hr>
	<h3 style="text-align: center;">${noproducts}</h3>
	<table class="center">
		<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Colour</th>
		<th>Gender</th>
		<th>Size</th>
		<th>Price</th>
		<th>Rating</th>
		</tr>
		<c:forEach var = "product" items = "${products}">
		<tr>
		<td>${product.getId()}</td>
		<td>${product.getName()}</td>
		<td>${product.getColour()}</td>
		<td>${product.getGender()}</td>
		<td>${product.getSize()}</td>
		<td>${product.getPrice()}</td>
		<td>${product.getRating()}</td>
		</tr>	
		</c:forEach>
	</table>
	<br><br>
	<div class="container text-center">
			<a href="product"class="btn btn-outline-danger">Back</a>
	</div>
</body>
</html>