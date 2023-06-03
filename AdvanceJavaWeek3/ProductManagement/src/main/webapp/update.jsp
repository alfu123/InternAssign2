<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*"%>

<%
if (request.getParameter("submit") != null) {
	String id = request.getParameter("id");
	String Pname = request.getParameter("pname");
	String Quantity = request.getParameter("quantity");
	String Size = request.getParameter("size");
	String Image = request.getParameter("image");

	//HttpSession session = request.getSession();
	String t = session.getAttribute("username").toString();

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/productdb", "root", "root");
	pst = con.prepareStatement("update " + t + " set pname = ?,quantity =?,size= ?,image= ? where id = ?");
	//   pst.setString(1,t);
	pst.setString(1, Pname);
	pst.setString(2, Quantity);
	pst.setString(3, Size);
	pst.setString(4, Image);
	pst.setString(5, id);
	pst.executeUpdate();
%>


<script>
	alert("Record Updated Sucessfully");
</script>
<%
}
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />



</head>
<body>
	<h1>Student Update</h1>


	<div class="row">
		<div class="col-sm-4">
			<form method="POST" action="#">

				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;

				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/productdb", "root", "root");

				String id = request.getParameter("id");
				String t = session.getAttribute("username").toString();
				pst = con.prepareStatement("select * from " + t + " where id = ?");
				pst.setString(1, id);
				rs = pst.executeQuery();

				while (rs.next()) {
				%>
				<div alight="left">
					<label class="form-label">Title</label> <input type="text"
						class="form-control" placeholder="Title"
						value="<%=rs.getString("pname")%>" name="pname" id="pname"
						required>
				</div>

				<div alight="left">
					<label class="form-label">Quantity</label> <input type="text"
						class="form-control" placeholder="Quantity" name="quantity"
						value="<%=rs.getString("quantity")%>" id="quantity" required>
				</div>

				<div alight="left">
					<label class="form-label">Size</label> <input type="text"
						class="form-control" placeholder="Size" name="size" id="size"
						value="<%=rs.getString("size")%>" required>
				</div>
				<div alight="left">
					<label class="form-label">Image</label> <input type="file"
						class="form-control" placeholder="Image" name="image" id="image"
						value="<%=rs.getString("image")%>"
						accept="image/png, image/jpeg,image/png" required>
				</div>

				<%
				}
				%>



				</br>

				<div alight="right">
					<input type="submit" id="submit" value="submit" name="submit"
						class="btn btn-info"> <input type="reset" id="reset"
						value="reset" name="reset" class="btn btn-warning">
				</div>

				<div align="right">

					<p>
						<a href="welcome.jsp">Go to Dashboard</a>
					</p>



				</div>

			</form>
		</div>
	</div>

</body>
</html>
