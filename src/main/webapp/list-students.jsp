<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.webstudentsdemo.models.Student"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
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
	
	<main>
		<div class="container">
			<div class="line-separator"></div>
			<table class="table table-striped table-borderless table-hover">
				<thead>
					<th class="text-center table-primary tb-heading-align">#</th>
					<th class="text-center table-primary tb-heading-align">First Name</th>
					<th class="text-center table-primary tb-heading-align">Last Name</th>
					<th class="text-center table-primary tb-heading-align">Email</th>
				</thead>
				<tbody>
					<%
						for(Student st : students) {					
					%>
						<tr>
							<td class="text-center"><%= st.getId() %></td>
							<td class="text-center"><%= st.getName() %></td>
							<td class="text-center"><%= st.getLastName() %></td>
							<td class="text-center"><%= st.getEmail() %></td>
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