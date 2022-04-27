<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchresults</title>
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
				<p>${movie.actorFirstName }</p>
				<p>${movie.actorLastName }</p>
				
<%-- 				<c:set var="count" value="${count + 1}" scope="page"/> --%>
 				</div>
				
			
</c:forEach>			
</body>
</html>