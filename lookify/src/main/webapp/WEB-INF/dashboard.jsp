<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="windows-1256">
	<title>Lookify</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="d-flex justify-content-between">
			<div>
				<a href="/songs/new">Add New</a> &nbsp; &nbsp;
				<a href="/songs/top-ten" style="color: violet;">Top Songs</a>
			</div>
			<div>
				<form action="/dashboard" method="post">
					<input type="text" id="artist" name="artist" placeholder="Search"/>
					<input type="submit" value="Search" class="btn btn-primary"/>
				</form>
			</div>
		</div>
		<table class="table table-striped text-center mt-3">
			<thead class="bg-black text-warning">
				<tr>
					<th>Name</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="song" items="${songs}">
					<tr>
						<td>								
							<a href="/songs/${song.id}">
								<c:out value="${song.title}"/>								
							</a>
						</td>
						<td>
							<c:out value="${song.rating}"/>
						</td>
						<td>
							<form:form action="/delete/${song.id}" method="delete">
								<input type="submit" value="Delete" class="btn btn-danger"/>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>