<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.webstudentsdemo.models.Student"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>List Students</title>
</head>
<body>
	<%
		List<Student> students = (List<Student>) request.getAttribute("student_list");
	%>
	
	<nav>
		<div class="container">
			<header>
				<h2>FooBar University</h2>
			</header>
		</div>
	</nav>
	
	<div class="line-separator" style="height: 6px; background-color: black"></div>
	
	<main>
		<div class="container">
			<table class="table table-striped mt-3">
				<thead>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
				</thead>
				<tbody>
					<%
						for(Student st : students) {					
					%>
						<tr>
							<td><%= st.getName() %></td>
							<td><%= st.getLastName() %></td>
							<td><%= st.getEmail() %></td>
						</tr>
					<%
						}					
					%>
				</tbody>
			</table>
		</div>
	</main>
	
</body>
</html>