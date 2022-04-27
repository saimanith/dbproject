<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.outerbox{border:1px solid;margin-left:10px}
</style>
<meta charset="UTF-8">
<title>Movies</title>

</head>

<body>
<c:set var = "count" scope = "page" value = "${0}"/>
<table>
<c:forEach var="movie" items="${movieList}">
<tr>
				<!-- <div class="outerbox"> -->
				 <td>
				<div class="image">
				<img src=" https://static-prod.adweek.com/wp-content/uploads/2020/04/social-distance-movies-bad-boy-2020.jpg" 
				width="200" height="200">
				</img></div>
				</td>
				<td>
				<h2>${movie.filmID }</h2>
				</td>
				<td>
				<a href="<%=request.getContextPath()%>/MovieDetailPage?movieItem=${movie.filmID}">${movie.title}</a>
				</td>
				<td>
				<h5>${movie.description }</h5>
				</td>
				<td>
				<h5>${movie.releaseYear }</h5>
				</td>
<!--  				</div> -->

		</tr>		
			
</c:forEach>
</table>

</body>
</html>