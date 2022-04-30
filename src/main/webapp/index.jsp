<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MoviesInfo</title>
<style>
.button:hover {
	box-shadow: 0 0 28px rgba(33, 33, 33, .2);
}

.button {
	transition: box-shadow .1s;
}

.tile1 {
	height: 210px;
	width: 210px;
	float: left;
	margin-top: 5px;
	margin-left: 35%;
	margin-right: 5px;
}

.tile2 {
	height: 210px;
	width: 210px;
	float: left;
	margin-top: 5px;;
	margin-right: 30%;
}

.row1 {
	margin-top: 10px;
}

.row2 {
	margin-top: 10px;
	margin-bottom: 10px
}

.row3 {
	margin-top: 30px;
	margin-bottom: 10px
}

.genrebutton {
	background: #B5B8A3;
	border-radius: 20px;
	transition: box-shadow .1s;
}

.genrebutton:hover {
	box-shadow: 0 0 28px rgba(33, 33, 33, .2);
}

.mainbody {
	background-color: #e5e5f7;
	opacity: 1;
	background: radial-gradient(circle, transparent 20%, #e5e5f7 20%, #e5e5f7 80%,
		transparent 80%, transparent),
		radial-gradient(circle, transparent 20%, #e5e5f7 20%, #e5e5f7 80%,
		transparent 80%, transparent) 25px 25px,
		linear-gradient(#a6a6a6 2px, transparent 2px) 0 -1px,
		linear-gradient(90deg, #a6a6a6 2px, #e5e5f7 2px) -1px 0;
	background-size: 50px 50px, 50px 50px, 25px 25px, 25px 25px;
}

.genretile1 {
	margin-left: 18%;
	float: left;
	margin-top: 10px
}

.genretile2 {
	margin-left: 20%;
	float: left;
	margin-top: 10px
}

.genretile3 {
	margin-left: 20%;
	float: left;
	margin-top: 10px
}

.box {
	height: 50px;
	background: #0F0;
	width: 100%;
	margin-top: 10px;
}

#first {
	margin-top: 20px;
}

#second {
	background: #00F;
}

h1.box {
	background: #F00;
	margin-bottom: 50px;
}
</style>
</head>
<body class="mainbody">
	<div>
		<center>
			<div class:"mainbox" >
				<h1>
					<u>Movie Space<u>
				</h1>
				<div class="row">
					<form>
						<div class="tile1">
							<button type="submit" class="button"
								style="background: #FDCA40; border-radius: 20px"
								formaction="<%=request.getContextPath()%>/Movies">
								<div>
									<img src="pictures/films.jpeg" style="border-radius: 20px"
										width="100" height="100">
									<h3>Movies</h3>
								</div>
							</button>
						</div>
						<div class="tile2">

							<button type="submit" class="button"
								style="background: #FDCA40; border-radius: 20px"
								"
				formaction="<%=request.getContextPath()%>/Actors">
								<div>
									<img src="pictures/actors.webp" style="border-radius: 20px"
										width="100" height="100">
									<h3>Actors</h3>
								</div>
							</button>
						</div>

					</form>
				</div>
				<div class="row1">
					<form>
						<input type="search" class="button" name="sval"
							placeholder="Search...">
						<button type="submit" class="button"
							formaction="<%=request.getContextPath()%>/Search"
							style="background: #82AC9F">Search</button>

					</form>
				</div>
				<div class="row2">
					<form>
						<div class="genretile1">
							<button type="submit" value="action" name="genre"
								formaction="<%=request.getContextPath()%>/Genre"
								class="genrebutton">
								<div>
									<img src="pictures/action.png" style="border-radius: 20px"
										width="100" height="100">
									<h3>Action</h3>
								</div>
							</button>
						</div>
						<div class="genretile2">
							<button type="submit" value="drama" name="genre"
								formaction="<%=request.getContextPath()%>/Genre"
								class="genrebutton">
								<div>
									<img src="pictures/drama.jpeg" style="border-radius: 20px"
										width="100" height="100">
									<h3>Drama</h3>
								</div>
							</button>
						</div>
						<div class="genretile3">
							<button type="submit" value="emotional" name="genre"
								formaction="<%=request.getContextPath()%>/Genre"
								class="genrebutton">
								<div>
									<img src="pictures/emotional.png" style="border-radius: 20px"
										width="100" height="100">
									<h3>Emotional</h3>
								</div>
							</button>
						</div>

					</form>
				</div>


				<form class="row3">
					<div class="genretile1">
						<button type="submit" value="inspiring" name="genre"
							formaction="<%=request.getContextPath()%>/Genre"
							class="genrebutton">
							<div>
								<img src="pictures/inspiring.jpeg" style="border-radius: 20px"
									width="100" height="100">
								<h3>Inspiring</h3>
							</div>
						</button>
					</div>
					<div class="genretile2">
						<button type="submit" value="documentary" name="genre"
							formaction="<%=request.getContextPath()%>/Genre"
							class="genrebutton">
							<div>
								<img src="pictures/documentary.jpeg" style="border-radius: 20px"
									width="100" height="100">
								<h3>Documentary</h3>
							</div>
						</button>
					</div>
					<div class="genretile3">
						<button type="submit" value="fanciful" name="genre"
							formaction="<%=request.getContextPath()%>/Genre"
							class="genrebutton">
							<div>
								<img src="pictures/fancy.jpeg" style="border-radius: 20px"
									width="100" height="100">
								<h3>Fantasy</h3>
							</div>
						</button>
					</div>
				</form>
	</div>
	</center>
	</div>

</body>
</html>