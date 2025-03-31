<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body>

	<c:if test="${empty user }">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>

	<%@include file="../component/navbar.jsp"%>

	

	<h1
            style="z-index: 2; color: green; padding-left: 25%; padding-top: 2%; position: absolute; font-weight: 600; font-size: 40px; color:#0033ff;font-family:sans-serif"><span style="color:#ff6666;font-size: 55px">O</span>NLINE
                                                                                                                                                                            
            <span style="color:#ff6666;font-size: 55px">E</span>XPENSE  <span style="color:#ff6666;font-size: 55px">T</span>RACKER <span style="color:#ff6666;font-size: 55px">S</span>YSTEM</h1>
	<c:if test="${not empty user}">
		<h2
                    style="position: absolute; margin-top: 7%; z-index: 2; padding-left: 35%;font-weight: 700;  font-size: 40px; color:black">
			Welcome, ${user.name} ! 
			
		</h2>
	</c:if>
	


	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://static.vecteezy.com/system/resources/previews/004/730/388/non_2x/check-mark-on-a-check-box-on-a-paper-photo.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
			<div class="carousel-item">
				<img src="https://c8.alamy.com/comp/2S7AKGN/printed-receipt-on-lavender-gradient-background-symbolizing-expense-tracking-in-business-and-financial-management-2S7AKGN.jpg" class="d-block w-100"
					alt="Internet Issue" height="720px">
			</div>
			<div class="carousel-item">
				<img src="../img/img-3.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
			<div class="carousel-item">
				<img src="https://thumbs.dreamstime.com/b/mastering-personal-finance-budgeting-expense-tracking-investment-strategies-secure-financial-future-understanding-351895155.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
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


	<script>
		window.embeddedChatbotConfig = {
			chatbotId : "bcEFfHt7t41Rd3cbWp415",
			domain : "www.chatbase.co"
		}
	</script>
	<script src="https://www.chatbase.co/embed.min.js"
		chatbotId="bcEFfHt7t41Rd3cbWp415" domain="www.chatbase.co" defer>
		
	</script>
	

</body>
</html>