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
	background: rgba(0, 0, 0, 0.32) !important;
	color: white;
}

* {
	padding: 0px;
	margin: 0px;
}

.card {
    background-color: #ffffff;
    border-radius: 20px!important;
}
.card:hover{
	background-color: rgba(0, 0, 0, 0.05)!important;
}

p {
    color: #b7b1b1;
    font-weight: 500;
}

.discBtn {
    background-color: #21afa7;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 500
}

.fa-heart {
    color: #f05c5d
}

.fa-balance-scale {
    color: #968888
}

.fa-arrows {
    -webkit-transform: rotate(-45deg);
    -moz-transform: rotate(-45deg)
}

.buy {
    border-radius: 20px;
    background-color: #e8f6f6;
    color: #2bc4ba
}

.cart {
    background-color: #2bc4ba;
    border-radius: 30px;
    position: relative;
    right: 35px;
}

.btn:focus {
    outline: none!important;
    box-shadow: none!important;
}

*:focus {
    outline: none!important;
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

		<!-- -----category section---- -->
		<div class="row">
			<div class="col-md-3 ">
				<div class="list-group my-1 h-100 "
					style="background: white;">
					<a href="#" onclick="getpro(this)"
						class="c-link list-group-item list-group-item-action active primary-background  border-light"
						style="border-radius: 25px;" style="text-decoration: none;">
						All Products</a>
					<%
					categoriesDao cad = new categoriesDao(connectionProvider.getConnection());
					ArrayList<categories> ca = cad.getAllCategories();
					for (categories cat : ca) {
					%>
					<a href="#" onclick="getproducts(<%=cat.getCid()%>,this)"
						class="list-group-item list-group-item-action c-link border-light"
						style="text-decoration: none; border-radius: 20px;"><%=cat.getCname()%></a>
					<%
					}
					%>
				</div>
			</div>
			<!-- -----category section ends---- -->
			<div class="col-md-9">
				<div class="container-fluid">
					<div class="row" id="outer-body">
						<%
						String path2 = "productpic" + File.separator;
						productDao pdao = new productDao(connectionProvider.getConnection());
						ArrayList<product> alp = pdao.getProducts();
						for (product p : alp) {
						%>
							<div class="col-12 col-md-4 col-sm-12 col-xs-12">
						<a href="product.jsp?pid=<%=p.getPid()%>" class="btn text-black" style="text-decoration:none!important;">
								<div class="card pl-4 pr-3 py-2">
									<div class="div1 row py-4 px-2">
										
										<div class="col-7 d-flex justify-content-center">
											<img src="<%=path2%><%=p.getPimage()%>" height="250px"
												width="150%" alt="">
										</div>
										<div class="col-3 d-flex flex-column pl-4">
											<i class="fa fa-heart fa-lg mt-4" aria-hidden="true"></i> <i
												class="fa fa-check-circle fa-lg mt-3 font-weight-bold"
												aria-hidden="true" style="color:lightgreen!important;"></i>
										</div>
									</div>
									<div class="py-2">
										<p class="ml-3 ml-md-5">
											<i class="fa fa-paw" aria-hidden="true"></i> <span
												class="small">20</span> <i class="fa fa-arrows ml-4"
												aria-hidden="true"></i> <span class="small"> 0% 12m</span>
										</p>
										<h5><%=p.getPtitle()%></h5>
										<p>Warrenty included</p>
										<div class="d-flex">
											<h5 class="align-self-center">
												Rs.
												<%=p.getPrice()%></h5>
											<button
												class="buy d-flex ml-auto font-weight-bold pl-4 pr-5 p-2 border-0">
												Buy</button>
											<span class="cart text-white d-flex p-2"><i
												class="fa fa-shopping-cart fa-lg align-self-center"
												aria-hidden="true"></i></span>
										</div>
									</div>
								</div>
						</a>
						</div>

						<%
						}
						%>
					</div>
					<div class="row" id="inner-body" style="display: none;"></div>
				</div>
			</div>
		</div>

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

	<script type="text/javascript">
		function getproducts(pids,temp){
		const d={
			pid:pids					
		}
		$(".c-link").removeClass('active primary-background');
		$.ajax({
			data:d,
			url:"loadProducts.jsp",
			success:function(data,textStatus,jqXHR){
				
				console.log(data);
				$('#inner-body').html(data);
				$('#inner-body').show();
				$('#outer-body').hide();
				$(temp).addClass('active primary-background');
			}
		})
		}
		function getpro(temp){
		
		$(".c-link").removeClass('active primary-background');
		
				$('#inner-body').hide();
				$('#outer-body').show();
				$(temp).addClass('active primary-background');
		
		}
		
		</script>
</body>
</html>