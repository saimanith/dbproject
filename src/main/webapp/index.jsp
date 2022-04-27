<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MoviesInfo</title>
<style>
.tile1{height:210px; width:210px;float:left; margin-top:5px;  margin-left:35%; margin-right:5px;}
.tile2{height:210px; width:210px;float:left; margin-top:5px;  ; margin-right:30%;}
.row1{margin-top:10px;}
.row2{margin-top:10px;margin-bottom:10px}
.row3{margin-top:30px;margin-bottom:10px}
.genrebutton{background:#B5B8A3}
.mainbody{background:#AEC5EB}
.genretile1{margin-left:20%; float:left;margin-top:10px}
.genretile2{margin-left:20%;float:left;margin-top:10px}
.genretile3{margin-left:20%;float:left;margin-top:10px}
.box { height: 50px; background: #0F0; width: 100%; margin-top: 10px; }
#first { margin-top: 20px; }
#second { background: #00F; }
h1.box { background: #F00; margin-bottom: 50px;  }
</style>
</head>
<body class="mainbody">
<div >
	<center>
		<h1><u>Movies Information<u></h1>
		<div class="row">
		<form>
		<div class = "tile1">
			<button type="submit" style="background:#FDCA40"
				formaction="<%=request.getContextPath()%>/Movies">
				<div >
					<img src="pictures/films.jpeg" width="100" height="100">
					<h6>Movies</h6>
				</div>
			</button>
		</div>
		<div class = "tile2">
		
			<button type="submit" style="background:#FDCA40"
				formaction="<%=request.getContextPath()%>/Actors">
				<div>
					<img src="pictures/actors.webp" width="100" height="100">
					<h6>Actors</h6>
				</div>
			</button>
		</div>
			
		</form>
		</div>
		<div class="row1">
		<form>
			<input type="search" name="sval" placeholder="Search...">
			<button type="submit"
				formaction="<%=request.getContextPath()%>/Search" style="background:#82AC9F">Search</button>

		</form>
		</div>
		<div class="row2">
		<form>
		<div class="genretile1">
			<button type="submit" value="action" name="genre"
				formaction="<%=request.getContextPath()%>/Genre"
				class="genrebutton"
				>
				<div>
					<img src="pictures/action.png" width="100" height="100">
					<h6>Action</h6>
				</div>
			</button>
		</div>
		<div class="genretile2">
			<button type="submit" value="drama" name="genre"
				formaction="<%=request.getContextPath()%>/Genre" class="genrebutton">
				<div>
					<img src="pictures/drama.jpeg" width="100" height="100">
					<h6>Drama</h6>
				</div>
			</button>
		</div>
		<div class="genretile3">
			<button type="submit" value="emotional" name="genre"
				formaction="<%=request.getContextPath()%>/Genre" class="genrebutton">
				<div>
					<img src="pictures/emotional.png" width="100" height="100">
					<h6>Emotional</h6>
				</div>
			</button>
		</div>

		</form>
		</div>


		<form class="row3">
			<div class="genretile1">
			<button type="submit" value="inspiring" name="genre"
				formaction="<%=request.getContextPath()%>/Genre" class="genrebutton">
				<div>
					<img src="pictures/inspiring.jpeg" width="100" height="100">
					<h6>Inspiring</h6>
				</div>
			</button>
</div>
<div class="genretile2">
			<button type="submit" value="documentary" name="genre"
				formaction="<%=request.getContextPath()%>/Genre" class="genrebutton">
				<div>
					<img src="pictures/documentary.jpeg" width="100" height="100">
					<h6>Documentary</h6>
				</div>
			</button>
</div>
<div class="genretile3">
			<button type="submit" value="fanciful" name="genre"
				formaction="<%=request.getContextPath()%>/Genre" class="genrebutton">
				<div>
					<img src="pictures/fancy.jpeg" width="100" height="100">
					<h6>Fantasy</h6>
				</div>
			</button>
</div>
		</form>
	</center>
</div>

</body>
</html>