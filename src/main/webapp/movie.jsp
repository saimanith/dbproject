<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies</title>

</head>

<body>
<c:set var = "count" scope = "page" value = "${0}"/>
<c:forEach var="movie" items="${movieList}">

				<div class="outerbox">
				<%-- <h1>${movieList.get(count+1).filmID}</h1> --%>
				<div class="image">
				<img src=" https://static-prod.adweek.com/wp-content/uploads/2020/04/social-distance-movies-bad-boy-2020.jpg" width="300" height="300">
				</img></div>
				<h2>${movie.filmID }</h2>
				<a href="<%=request.getContextPath()%>/MovieDetailPage?movieItem=${movie.filmID}">${movie.title}</a>
				<p>${movie.description }</p>
				<p>${movie.releaseYear }</p>
<%-- 				<c:set var="count" value="${count + 1}" scope="page"/> --%>
 				</div>
				
			
		</c:forEach>
<%-- 	<table>
		<thead>
			<tr>
				<th>Film ID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Release year</th>
			</tr>
		</thead>
		<c:forEach var="movie" items="${movieList}">
			<tr>
				
				<td>
				<div class="outerbox">
				<h2>${movie.filmID }</h2>
				<p>${movie.title }</p>
				<p>${movie.description }</p>
				<p>${movie.releaseYear }</p>
				</div>
				
				</td>
			</tr>
		</c:forEach>
	</table> --%>
</body>
</html>