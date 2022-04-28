<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actordetailpage</title>
<style type="text/css">
.outerbox {
	background: white;
	display: flex;
	margin-left: 20%;
	border: 1px solid;
	margin-right: 20%;
	border-radius: 25px;
	transition: box-shadow .1s;
}

.outerbox:hover {
	box-shadow: 0 0 18px rgba(33, 33, 33, .2);
}

.img {
	border-radius: 25px
}

.content {
	border-bottom: 0.5px solid #808080;
	margin-left: 15px;
	margin-right: 15px;
	border-radius: 25px
}
</style>
</head>
<body
	style="margin-bottom: 15%; background-color: #e5e5f7; opacity: 1; background-image: repeating-radial-gradient(circle at 0 0, transparent 0, #f4f4f4 300px), repeating-linear-gradient(#999999, #a6a6a6);">
	<center>
		<h1 style="margin-top: 10%">
			<u>Actor Detail Information</u>
		</h1>

		<div class="outerbox">
			<div class="image">
				<img src="pictures/actors.webp" style="border-radius: 25px"
					width="300" height="300"> </img>
			</div>
			<div class="info" style="margin-top: 3%">
				<h3 style="color: blue">${actorList.firstName}
					${actorList.lastName}</h3>

				<p class="conten">
					<b><u>Movies List: </u></b>
					<td><c:set var="i" scope="page" value="${0}" /> <c:set
							var="filmsInfoParts"
							value="${fn:split(actorList.filmsInfo, ';')}" /> <c:forEach
							var="film" items="${filmsInfoParts}">
							<% pageContext.setAttribute("colors", new String[] {"#F4EEA9","#F4CBC6","#93E1D8","#D6FF79","#F0CEA0","#F1BF98","#89AAE6"} , pageContext.SESSION_SCOPE); %>

							<c:if test="${i le 4 }">
								<p class="film" style="background:${colors[i]}">${film}</p>
								<c:set var="i" value="${i+1}" />
							</c:if>
						</c:forEach></td>
				</p>
			</div>

		</div>
	</center>
</body>
</html>