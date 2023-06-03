<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*"%>
<%
if (request.getParameter("submit") != null) {
	String Pname = request.getParameter("pname");
	String Quantity = request.getParameter("quantity");
	String Size = request.getParameter("size");
	String Image = request.getParameter("image");
	String Photo = request.getParameter("photo");
	//HttpSession session = request.getSession();
	String t = session.getAttribute("username").toString();

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/productdb", "root", "root");
	pst = con.prepareStatement("insert into " + t + " (pname,quantity,size,image)values(?,?,?,?)");
	//   pst.setString(1,t);
	pst.setString(1, Pname);
	pst.setString(2, Quantity);
	pst.setString(3, Size);
	pst.setString(4, Image);
	pst.executeUpdate();
%>
<script>
	alert("Record Added");
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dashboard</title>
<style>
body {
	border: 2px solid black;
	margin: 5px;
	padding: 5px;
}

.form1 {
	margin: 5px;
	padding: 5px;
}

#section {
	width: 90%;
	padding: 2%;
	display: table;
}

#section ul li {
	display: table-cell;
}

#section ul li a {
	vertical-align: middle;
	text-align: center;
}

#section ul li a img {
	vertical-align: middle;
	text-align: center;
}
</style>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

</head>
<body>
	<%
	response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div style="clear: both">
		<h3 style="float: left">Product Management Tool</h3>
		<h5 style="float: right">
			Hi <%=	 session.getAttribute("username").toString().toUpperCase() %>,

			<form action="Logout" class="form1">
				<input type="submit" value="Logout">

			</form>
		</h5>
	</div>

	</br>
	</br>
	</br>


	<div class="row">
		<div class="col-sm-4">
			<form method="POST" action="#">

				<div alight="left">
					<label class="form-label">&nbsp; &nbsp; Title</label> <input
						type="text" class="form-control" placeholder="Product Title"
						name="pname" id="sname" required>
				</div>
				&nbsp; &nbsp; &nbsp;
				<div alight="left">
					<label class="form-label">&nbsp; &nbsp;Quantity</label> <input
						type="text" class="form-control" placeholder="Quantity"
						name="quantity" id="course" required>
				</div>
				&nbsp; &nbsp; &nbsp;

				<div alight="left">
					<label class="form-label">&nbsp; &nbsp;Size</label> <input
						type="text" class="form-control" placeholder="Size" name="size"
						id="size" required>
				</div>
				&nbsp; &nbsp; &nbsp;

				<div alight="left">
					<label class="form-label">&nbsp; &nbsp;Image</label> <input
						type="file" class="form-control" placeholder="Image Link"
						name="image" id="Image" accept="image/png, image/jpeg,image/png"
						required>
				</div>
				&nbsp; &nbsp; &nbsp;

				<!--  <div alight="left">
					<label class="form-label">&nbsp; &nbsp;Photo</label> <input
						type="file" class="form-control" placeholder="photo" name="photo"
						id="photo" accept="image/*">
				</div> -->
				</br>

				<div alight="right">
					<input type="submit" id="submit" value="submit" name="submit"
						class="btn btn-info"> <input type="reset" id="reset"
						value="reset" name="reset" class="btn btn-warning">
				</div>

			</form>
		</div>

		<div class="row-sm-8">
			</br>
			<div class="panel-body">
				<table id="tbl-student"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%">
					<thead>
						<tr>
							<th>Sl No.</th>
							<th>Title</th>
							<th>Quantity</th>
							<th>Size</th>
							<th>Image</th>
							<th>Action</th>
							<!-- <th>Delete</th>  -->
						</tr>

						<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost/productdb", "root", "root");
						String t = session.getAttribute("username").toString();
						String query = "select * from " + t;
						Statement st = con.createStatement();

						rs = st.executeQuery(query);
						int n = 1;
						while (rs.next()) {
							String id = rs.getString("id");
							;
						%>

						<tr>
							<td><%=n%></td>
							<td><%=rs.getString("pname").toUpperCase()%></td>
							<td><%=rs.getString("quantity")%></td>
							<td><%=rs.getString("size")%></td>
							<td><img
								src="http://localhost:8888/ProductManagement/image/<%=rs.getString("image")%>"
								alter="img" height="150px" width="200px"></td>
							<td>
								<div id="section">
									<ul>
										<li><a class="bt btleft" href="update.jsp?id=<%=id%>"><img
												src="http://localhost:8888/ProductManagement/image/edit.png"
												width="80px"></a> &nbsp;&nbsp;&nbsp; <a class="bt btleft"
											href="delete.jsp?id=<%=id%>"><img
												src="http://localhost:8888/ProductManagement/image/<%="delete.jpg"%>"
												width="80px" height="65px"></a></li>
									</ul>
								</div>
							</td>

						</tr>


						<%
						n++;
						}
						%>
					
				</table>
			</div>

		</div>
	</div>
</body>
</html>