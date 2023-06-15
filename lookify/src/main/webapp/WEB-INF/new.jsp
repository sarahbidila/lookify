<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="windows-1256">
	<title>Add Song</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<h1 class="fw-bold mb-3">Add Song</h1>
		<form:form action="/songs/new" method="post" modelAttribute="newSong">
			<div class="mb-3">
				<form:label path="title">Title:</form:label>
				<form:errors class="text-danger fw-bold" path="title"/>
				<form:input path="title"/>
			</div>
			<div class="mb-3">
				<form:label path="artist">Artist:</form:label>
				<form:errors class="text-danger fw-bold" path="artist"/>
				<form:input path="artist"/>
			</div>
			<div class="mb-3">
				<form:label path="rating">Rating:</form:label>
				<form:errors class="text-danger fw-bold" path="rating"/>
				<form:input path="rating" type="number"/>
			</div>
			<input type="submit" value="Submit" class="btn btn-success"/>
		</form:form>
		<h4 class="mt-5">
			<a href="/dashboard">Dashboard</a>
		</h4>
	</div>
</body>
</html>