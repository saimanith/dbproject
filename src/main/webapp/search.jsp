<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchresults</title>
<style type="text/css">

table {
  border-collapse: collapse;
  width: 90%;
  margin-left:4%;
}

th, td {
  padding: 8px;
  text-align: left;
  border: 2px solid #ddd;
  border-color: black;
}


 <% pageContext.setAttribute("colors", new String[] {"#1C6E8C","#F4EEA9","#F4CBC6","#B392AC","#AA4465","#93E1D8","#F7F6C5","#D6FF79","#7681B3","#F0CEA0","#F1BF98","#89AAE6"} , pageContext.SESSION_SCOPE); %>
<c:set var = "i" scope = "page" value = "${0}"/>
<c:set var = "j" scope = "page" value = "${0}"/>

<c:forEach var="movie" items="${movieList}">

tr:nth-child(${i}):hover{background-color: ${colors[j]};font-weight: bold;}
<c:set var="i" value="${i+1}" />
<c:set var="j" value="${(j+1)%12}" />

</c:forEach>



</style>

</head>
<body style="background: #dcdcdc">
	<c:set var="count" scope="page" value="${0}" />
	<table>
		<tr>
			<th><h3>Film ID</h3></th>
			<th><h3>Title</h3></th>
			<th><h3>Description</h3></th>
			<th><h3>Release Year</h3></th>
			<th><h3>Actor First Name</h3></th>
			<th><h3>Actor Last Name</h3></th>
		</tr>
		<c:forEach var="movie" items="${movieList}">

			<tr>


				<td>
					<h3>${movie.filmID }</h3>
				</td>
				<td><a
					href="<%=request.getContextPath()%>/MovieDetailPage?movieItem=${movie.filmID}">${movie.title}</a>
				</td>
				<td>
					<p>${movie.description }</p>
				</td>
				<td>
					<p>${movie.releaseYear }</p>
				</td>
				<td>
					<p>${movie.actorFirstName }</p>
				</td>
				<td>
					<p>${movie.actorLastName }</p>
				</td>



			</tr>

		</c:forEach>
	</table>
</body>
</html>