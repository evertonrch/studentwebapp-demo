<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/student-controller" var="linkForList" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<title>Add Student</title>
</head>
<body>
	<jsp:include page="heading.jsp"></jsp:include>
	
	<main>
		<form class="w-50 mx-auto mt-4"">
			<div class="container">
				<div class="row mb-3">
					<div class="col-2">
						<label>First Name:</label>
					</div>
		
					<div class="col-10">
						<input type="text" class="form-control">				
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-2">
						<label>Last Name:</label>
					</div>
		
					<div class="col-10">
						<input type="text" class="form-control">				
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-2">
						<label>Email:</label>
					</div>
		
					<div class="col-10">
						<input type="text" class="form-control">				
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end gap-2">
						<button class="btn btn-success btn-sm">Add Student</button>
						<a 
							class="btn btn-danger btn-sm"
							onclick="window.location.href='${linkForList}; return false'">
							Back to List
						</a>
					</div>
				</div>
			</div>
		</form>
			
	</main>
	
</body>
</html>