<%@page import="Project.enteties.product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project.helper.connectionProvider"%>
<%@page import="Project.dao.productDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body>
	<%
	String path2 = "productpic" + File.separator;
	productDao pdao = new productDao(connectionProvider.getConnection());
	ArrayList<product> alp = pdao.getProducts();
	for (product p : alp) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		if (p.getCid() == pid) {
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
												class="fa fa-balance-scale mt-3 font-weight-bold"
												aria-hidden="true"></i>
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
	}
	%>
</body>
</html>