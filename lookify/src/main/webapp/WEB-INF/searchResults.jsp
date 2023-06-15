<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="windows-1256">
	<title>Search</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<h1 class="fw-bold">Songs by: <c:out value="${searchTerm}"></c:out></h1>
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
							<a href="/songs/${song.id}"><c:out value="${song.title}"></c:out></a>
						</td>
						<td>
							<c:out value="${song.rating}"></c:out>
						</td>
						<td>
							<a href="/delete/${song.id}"><c:out value="delete"></c:out></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4 class="mt-5">
			<a href="/dashboard">Dashboard</a>
		</h4>
	</div>
</body>
</html>