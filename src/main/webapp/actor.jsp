<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actor</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 90%;
	margin-left: 4%;
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
<c:forEach var="actor" items="${actorList}">
tr:nth-child(${i}):hover{background-color: ${colors[j]};font-weight: bold;}
<c:set var="i" value="${i+1}" />
<c:set var="j" value="${(j+1)%12}" />
</c:forEach>
</style>
</head>



<body>
	<c:set var="count" scope="page" value="${0}" />
	<table>
		<tr>
			<th><h3>Actor ID</h3></th>
			<th><h3>First Name</h3></th>
			<th><h3>Last Name</h3></th>
			<th><h3>Film Info</h3></th>
		</tr>
		<c:forEach var="actor" items="${actorList}">
			<tr>
				<td>
					<h3>${actor.actorid }</h3>
				</td>
				<td><a
					href="<%=request.getContextPath()%>/ActorDetailPage?actorItem=${actor.actorid}">${actor.firstName}</a>
				</td>

				<td>
					<p>${actor.lastName}</p>
				</td>
				<td><c:set var="i" scope="page" value="${0}" /> <c:set
						var="filmsInfoParts" value="${fn:split(actor.filmsInfo, ';')}" />
					<c:forEach var="film" items="${filmsInfoParts}">
						<c:if test="${i le 1 }">
							<p class="film">${film}</p>
							<c:set var="i" value="${i+1}" />
						</c:if>
					</c:forEach> .......</td>

			</tr>

		</c:forEach>
	</table>



</body>
</html>