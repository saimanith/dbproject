<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviedetailpage</title>
<style>
.outerbox {
	background: white;
	display: flex;
	margin-left: 15%;
	border: 1px solid;
	margin-right: 15%;
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
<body class="mainbody"
	style="margin-bottom: 15%; background-color: #e5e5f7; opacity: 1; background-image: repeating-radial-gradient(circle at 0 0, transparent 0, #ffffd4 300px), repeating-linear-gradient(#FAFA37, #FAFA37);">
	<center>
		<h1 style="margin-top: 10%">
			<u>Movie Detail Information</u>
		</h1>
		<div class="outerbox">

			<div class="image">
				<img class="img" src=" pictures/films.jpeg" width="300" height="300">
				</img>
			</div>
			<%
			pageContext.setAttribute("colors",
					new String[] { "#F4EEA9", "#F4CBC6", "#93E1D8", "#D6FF79", "#F0CEA0", "#F1BF98", "#89AAE6" },
					pageContext.SESSION_SCOPE);
			%>

			<div class="info" style="margin-top: 3%">
				<h3 class="content" style="color: blue">${movieList.title}</h3>
				<p class="content"
					style="background:${colors[0]};margin-left: 16px; margin-right: 16px">${movieList.description }</p>
				<p class="content" style="background:${colors[1]}">
					<b>Release Year: </b>${movieList.releaseYear }</p>
				<p class="content" style="background:${colors[2]}">
					<c:if test="${movieList.languageid eq 1}">
						<b>Language: </b>English
</c:if>
				</p>
				<p class="content" style="background:${colors[3]}">
					<b>Duration :</b> ${movieList.length}mins
				</p>
				<p class="content" style="background:${colors[4]}">
					<b>Rating: </b>${movieList.rating }</p>
			</div>
		</div>
	</center>

</body>
</html>


