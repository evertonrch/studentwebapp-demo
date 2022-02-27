<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/student-controller" var="linkForController" />
<c:url value="/list-students.jsp" var="linkForList" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/form-add-styles.css" rel="stylesheet">
<title>Update Student</title>
</head>
<body>
	<jsp:include page="heading.jsp"></jsp:include>
	
	<main>
		<div class="heading-wrapper d-flex align-items-center justify-content-center">
		<h3 class="heading">update student</h3>
		<div class="line"></div>
		</div>
		<form action="${linkForController}" method="GET" class="w-50 mx-auto mt-4">
			<div class="container">
				<div class="row mb-3">
<!-- 						<div class="col-2"> -->
<!-- 							<label>Command:</label> -->
<!-- 						</div> -->
			
						<div class="col-10">
							<input type="hidden" name="command" value="UPDATE" class="form-control">				
						</div>
				</div>
				<div class="row mb-3">
<!-- 						<div class="col-2"> -->
<!-- 							<label>Id:</label> -->
<!-- 						</div> -->
			
						<div class="col-10">
							<input type="hidden" name="studentId" value="${STUDENT.getId()}" class="form-control">				
						</div>
				</div>
				<div class="row mb-3">
					<div class="col-2">
						<label>First Name:</label>
					</div>
		
					<div class="col-10">
						<input type="text" name="firstName" class="form-control"
						value="${STUDENT.getName()}">				
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-2">
						<label>Last Name:</label>
					</div>
		
					<div class="col-10">
						<input type="text" name="lastName" class="form-control"
						value="${STUDENT.getLastName()}">				
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-2">
						<label>Email:</label>
					</div>
		
					<div class="col-10">
						<input type="text" name="email" class="form-control"
						value="${STUDENT.getEmail()}">				
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end gap-2">
						<button type="submit" class="btn btn-success btn-sm">Update Student</button>
					</div>
				</div>
			</div>
		</form>
		<div class="container d-flex align-items-end">
			<a href="<c:url value="/student-controller" />">Back to List</a>
		</div>
	</main>
	
</body>
</html>