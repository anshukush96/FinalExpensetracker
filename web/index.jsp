<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Expense Tracker System</title>

<%@include file="component/all_css.jsp"%>

</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<%-- <%@include file="piechart.jsp"%> --%>

	<h1
            style="z-index: 2; color: green; padding-left: 25%; padding-top: 2%; position: absolute; font-weight: 600; font-size: 40px; color:#0033ff;font-family:sans-serif"><span style="color:#ff6666;font-size: 55px">O</span>NLINE
                                                                                                                                                                            
            <span style="color:#ff6666;font-size: 55px">E</span>XPENSE  <span style="color:#ff6666;font-size: 55px">T</span>RACKER <span style="color:#ff6666;font-size: 55px">S</span>YSTEM</h1>
	
	


	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/img-4.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-2.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-3.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-7.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



<!--	<script>
		window.embeddedChatbotConfig = {
			chatbotId : "bcEFfHt7t41Rd3cbWp415",
			domain : "www.chatbase.co"
		}
	</script>
	<script src="https://www.chatbase.co/embed.min.js"
		chatbotId="bcEFfHt7t41Rd3cbWp415" domain="www.chatbase.co" defer>
		
	</script>-->

</body>
</html>