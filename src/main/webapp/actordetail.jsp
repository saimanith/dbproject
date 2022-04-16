<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actordetailpage</title>
</head>
<body>
<div class="outerbox">
				<%-- <h1>${movieList.get(count+1).filmID}</h1> --%>
				<div class="image">
				<img src=" https://www.pinkvilla.com/files/styles/amp_metadata_content_image/public/tom-cruises-mission-impossible-faces-delay_.jpg" width="300" height="300">
				</img></div>
				<h2>${actorList.actorid }</h2>
				<p>${actorList.firstName}</p>
				<p>${actorList.lastName }</p>
				<p>${actorList.filmsInfo }</p>
				
<%-- 				<c:set var="count" value="${count + 1}" scope="page"/> --%>
 				</div>
				
</body>
</html>