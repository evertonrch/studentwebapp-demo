<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/form-add-student.jsp" var="linkForAdd"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet">
<title>List Students</title>
</head>
<body>
	<jsp:include page="heading.jsp"></jsp:include>
	
	<main>
		<div class="container">
			<div class="line-separator d-flex align-items-center">
<!-- 				<button  -->
<!-- 					type="submit" -->
<%-- 					onclick="window.location.href='${linkForAdd}; return false'" --%>
<!-- 					class="btn btn-secondary btn-sm btn-add btn-sm" -->
<!-- 				>Add Student</button> -->
				<a href="${linkForAdd}" class="btn-add btn btn-secondary btn-sm">Add Student</a>
			</div>
			<table class="table table-striped table-borderless table-hover">
				<thead>
					<th class="text-center table-primary text-white bg-primary">#</th>
					<th class="text-center table-primary text-white bg-primary">First Name</th>
					<th class="text-center table-primary text-white bg-primary">Last Name</th>
					<th class="text-center table-primary text-white bg-primary">Email</th>
					<th class="text-center table-primary text-white bg-primary">Action</th>
				</thead>
				<tbody>
					<c:forEach var="student" items="${student_list}">
					
					<c:url var="tempLink" value="/student-controller">
						<c:param name="command" value="LOAD"></c:param>
						<c:param name="studentId" value="${student.getId()}"></c:param>
					</c:url>
					
					<c:url var="deleteLink" value="/student-controller">
						<c:param name="command" value="DELETE"></c:param>
						<c:param name="studentId" value="${student.getId()}"></c:param>
					</c:url>
					
						<tr>
							<td class="text-center">${student.getId()}</td>
							<td class="text-center">${student.getName()}</td>
							<td class="text-center">${student.getLastName()}</td>
							<td class="text-center">${student.getEmail()}</td>
							<td class="text-center">
								<a class="btn btn-warning btn-sm" 
									href="${tempLink}">
									<i class="fa-solid fa-pen-to-square"></i>
								</a>
								<a class="btn btn-danger btn-sm" 
									href="${deleteLink}"
									onclick="if(!(confirm('Are you sure you want to delete this student?'))) return false;">
									<i class="fa-solid fa-trash-can"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	
</body>
</html>