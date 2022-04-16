<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviedetailpage</title>
</head>
<body>
<div class="outerbox">
				<%-- <h1>${movieList.get(count+1).filmID}</h1> --%>
				<div class="image">
				<img src=" https://static-prod.adweek.com/wp-content/uploads/2020/04/social-distance-movies-bad-boy-2020.jpg" width="300" height="300">
				</img></div>
				<h2>${movieList.filmID }</h2>
				<p>${movieList.title}</p>
				<p>${movieList.description }</p>
				<p>${movieList.releaseYear }</p>
				<p>${movieList.languageid}</p>
				<p>${movieList.length }</p>
				<p>${movieList.rating }</p>
<%-- 				<c:set var="count" value="${count + 1}" scope="page"/> --%>
 				</div>
				
</body>
</html>