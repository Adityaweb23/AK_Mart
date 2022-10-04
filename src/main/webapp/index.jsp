<%@page import="Project.enteties.product"%>
<%@page import="Project.dao.productDao"%>
<%@page import="Project.enteties.categories"%>
<%@page import="Project.dao.categoriesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project.helper.connectionProvider"%>
<%@page import="java.io.File"%>
<%@page import="Project.dao.offerimageDao"%>
<%@page import="Project.enteties.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/my.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Compiled and minified CSS -->


<style>
.primary-background {
	background: rgba(0, 0, 0, 0.05) !important;
	color: white;
}

* {
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body
	style="background-image: linear-gradient(to right, #8078782b, #ffffff, #c1c1c1b0)">

	<%
	user use = (user) session.getAttribute("currentUser");
	if (use == null) {
	%>
	<%@ include file="navbar.jsp"%>
	<%
	} else {
	%>
	<%@ include file="userNavbar.jsp"%>
	<%
	}
	%>
	<main class="container-fluid">

		<div class="row" style="height: 100vh !important;">

			<div class="col-md-7 col-12 text-center p-3 my-auto">
				<h1 style="font-family: Fantasy;">Welcome To The Electronic
					Market</h1>
				<h3 style="font-family: Monospace;">This is the simple website
					for shop owners who desire for there own website to expand their
					busines</h3>
				<a class="btn btn-info" href="shopPage.jsp"
					style="border-radius: 25px !important">See Products</a>
			</div>
			<div class="col-md-5 col-12 p-3 my-auto">
				<img class="img-fluid" src="img/home.png" alt="not found">
			</div>
		</div>
		<div class="row" style="height: 100vh !important;">
			<div class="col-12">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<%
						offerimageDao oid = new offerimageDao(connectionProvider.getConnection());
						ArrayList<String> al = oid.getImages();
						int i = 0;
						int j = 1;
						for (String str : al) {
							if (i == 0) {
						%>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="<%=i%>" class="active" aria-current="true"
							aria-label="Slide <%=j%>"></button>
						<%
						} else {
						%>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="<%=i%>" aria-current="true"
							aria-label="Slide <%=j%>"></button>

						<%
						}

						i++;
						j++;
						}
						%>
					</div>
					<div class="carousel-inner">
						<%
						String path = "pics" + File.separator;
						offerimageDao oiid = new offerimageDao(connectionProvider.getConnection());
						ArrayList<String> all = oiid.getImages();
						boolean f = true;
						for (String str : all) {
							if (f == true) {
						%>
						<div class="carousel-item active">
							<img src="<%=path%><%=str%>" class="d-block w-100 m-auto"
								style="height: 520px;" alt="computer.png">
						</div>
						<%
						f = false;
						} else {
						%>
						<div class="carousel-item">
							<img src="<%=path%><%=str%>" class="d-block w-100"
								style="height: 520px;" alt="computer.png">
						</div>
						<%
						}
						}
						%>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		<!-- -----category section---- -->

	</main>


	<%@ include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>


</body>
</html>