<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actor</title>
</head>
<body>

<c:set var = "count" scope = "page" value = "${0}"/>
<c:forEach var="actor" items="${actorList}">

				<div class="outerbox">
				<%-- <h1>${movieList.get(count+1).filmID}</h1> --%>
				<div class="image">
				<img src=" https://www.pinkvilla.com/files/styles/amp_metadata_content_image/public/tom-cruises-mission-impossible-faces-delay_.jpg" width="300" height="300">
				</img></div>
				<h2>${actor.actorid }</h2>
				<a href="<%=request.getContextPath()%>/ActorDetailPage?actorItem=${actor.actorid}">${actor.firstName}</a>
				
<%-- 				<c:set var="count" value="${count + 1}" scope="page"/> --%>
 				</div>
				
			
		</c:forEach>
</body>
</html>