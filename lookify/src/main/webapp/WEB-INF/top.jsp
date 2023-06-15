<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="windows-1256">
	<title>Top Songs</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-info fw-bold mb-4">Top Songs</h1>
		<c:forEach items="${topSongs}" var="song">
			<h5><c:out value="${song.rating}"/> - <c:out value="${song.title}"/> - <c:out value="${song.artist}"/></h5>		
		</c:forEach>
		<h4 class="mt-5">
			<a href="/dashboard">Dashboard</a>
		</h4>
	</div>
</body>
</html>