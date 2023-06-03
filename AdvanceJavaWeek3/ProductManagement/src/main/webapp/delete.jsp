<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*"%>


<%
String id = request.getParameter("id");
Connection con;
PreparedStatement pst;
ResultSet rs;
String t = session.getAttribute("username").toString();
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/productdb", "root", "root");
pst = con.prepareStatement("delete from " + t + " where id = ?");
pst.setString(1, id);
pst.executeUpdate();
%>

<script>
	alert("Record Deleted");
</script>
<%
response.sendRedirect("welcome.jsp");
%>
