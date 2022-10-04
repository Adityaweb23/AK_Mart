<%@page import="Project.enteties.product"%>
<%@page import="Project.dao.productDao"%>
<%@page import="Project.dao.categoriesDao"%>
<%@page import="Project.enteties.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project.helper.connectionProvider"%>
<%@page import="Project.dao.offerimageDao"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/my.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Compiled and minified CSS -->


<style>
.banner-background {
	clip-path: polygon(50% 0%, 77% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0
		100%, 0 0, 21% 0);
}

* {
	padding: 0px;
	margin: 0px;
}
 .primary-background {
    background:  rgba(0, 0, 0, 0.34)!important;
    color: white;
}
</style>
</head>
<body class="all-background">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<h1 class="text-center">
				<i class="fa fa-user-secret" style="font-size: 120px"></i>Welcome
				Master
			</h1>
			<div class="col-md-5 m-md-3 my-2">
				<a href="" data-toggle="modal" data-target="#exampleModal"
					style="text-decoration: none; color: rgb(114, 111, 111);">
					<div class="card shadow-lg">
						<div class="card-body text-center">
							<i class="fa fa-image" style="font-size: 159px"></i>
							<p>Manage Offer Images</p>
						</div>
					</div>
				</a>
			</div>


			<!-- offer page Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header primary-background">
							<h5 class="modal-title" id="exampleModalLabel">Offer Images</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="add-post-form" action="offerSectionServlet"
								method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label>Select your Pic..</label> <input name="ppic" type="file"
										class="form-control">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-outline-dark">ADD</button>
								</div>
							</form>
							<hr>
							<div class="container-fluid">
								<div class="row">
									<%
									String path = "pics" + File.separator;
									offerimageDao oid = new offerimageDao(connectionProvider.getConnection());
									ArrayList<String> al = oid.getImages();
									for (String str : al) {
									%>

									<div class="col-4">
										<img alt="nothing found here" src="<%=path%><%=str%>"
											style="height: 60px;">
									</div>
									<div class="col-4">
										<p><%=str%></p>
									</div>
									<div class="col-4">
										<%
										String pathy = path + str;
										%>
										<a class="btn btn-danger text-white" href="#"
											onclick="funck('<%=str%>')">Delete</a>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- ---offer page model ends---- -->
			<div class="col-md-6 m-md-3 my-2" style="margin-left: auto !important;">
				<a href="" data-toggle="modal" data-target="#exampleModal5"
					style="text-decoration: none; color: rgb(114, 111, 111);">
					<div class="card shadow-lg">
						<div class="card-body text-center">
							<i class="fa fa-cart-plus" style="font-size: 159px"></i>
							<p>Manage Items Section</p>
						</div>
					</div>
				</a>
			</div>




			<!-- -----product section model--- -->




			<div class="modal fade" id="exampleModal5" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header primary-background">
							<h5 class="modal-title" id="exampleModalLabel">Product
								Handling</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid add" id="add-page">
								<form class="form" id="reg-form" action="addProductServlet"
									method="post" enctype="multipart/form-data">
									<div class="form-group">

										<label for="inputGroupSelect01">Options</label> <select
											class="custom-select" name="cid" id="inputGroupSelect01">
											<option selected disabled>Select your category</option>
											<%
											categoriesDao cadd = new categoriesDao(connectionProvider.getConnection());
											ArrayList<categories> caa = cadd.getAllCategories();
											for (categories cat : caa) {
											%>
											<option value="<%=cat.getCid()%>"><%=cat.getCname()%></option>
											<%
											}
											%>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Product Title</label> <input
											type="text" class="form-control" name="ptitle"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter product title">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Product price</label> <input
											type="text" class="form-control" name="pprice"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter price">
									</div>
									<div class="form-group">
										<label>Select Pic for Product</label> <input name="pimage"
											type="file" class="form-control">
									</div>
									<div class="form-group">
										<textarea name="pdescription" class="form-control"
											id="txtarea" rows="5" placeholder="Enter Product description"></textarea>
									</div>

									<div class="form-check text-center">
										<button type=submit
											class="btn primary-background btn-outline-light">ADD</button>
									</div>
								</form>
							</div>
					
						<div class="edit" id="edit-page" style="display: none;">
							<div class="container-fluid">
								<div class="row">
									<%
									String path2 = "productpic" + File.separator;
									productDao pdao = new productDao(connectionProvider.getConnection());
									ArrayList<product> alp = pdao.getProducts();
									for (product p : alp) {
									%>

									<div class="col-4">
										<img alt="nothing found here"
											src="<%=path2%><%=p.getPimage()%>" style="height: 60px;">
									</div>
									<div class="col-4">
										<p><%=p.getPtitle()%></p>
										<p><%=p.getPrice()%> Rs</p>
									</div>
									<div class="col-4">
										<a class="btn btn-danger text-white" href="#"
											onclick="functio('<%=p.getPid()%>','<%=p.getPimage()%>')">Delete</a>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" id="product-flip" class="btn btn-dark">Edit
							Products</button>
					</div>
				</div>
			</div>
		</div>
		<!-- -----product section model ends---- -->



		<div class="col-md-12 m-md-3 my-2">
			<a href="" data-toggle="modal" data-target="#exampleModal1"
				style="text-decoration: none; color: rgb(114, 111, 111);">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<i class="fa fa-newspaper-o" style="font-size: 159px"></i>
						<p>Manage The Categories</p>
					</div>
				</div>
			</a>
		</div>



		<!-- Category page Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header primary-background">
						<h5 class="modal-title" id="exampleModalLabel">ALL Categories</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="add-post-form" action="categoriesServlet" method="post">
							<div class="form-group">
								<label>Enter Category name</label> <input name="category"
									type="text" class="form-control">
							</div>
							<div class="form-group">
								<textarea name="categorydis" class="form-control" id="txtarea"
									rows="3" placeholder="Category description"></textarea>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-dark">ADD
									category</button>
							</div>
						</form>
						<hr>
						<div class="container-fluid">
							<div class="row">
								<%
								categoriesDao cad = new categoriesDao(connectionProvider.getConnection());
								ArrayList<categories> ca = cad.getAllCategories();
								for (categories cat : ca) {
								%>
								<div class="col-8">
									<p>
										<b><%=cat.getCname()%></b>
									</p>
									<p><%=cat.getCdescription()%></p>
								</div>
								<div class="col-4">
									<a class="btn btn-danger text-white" href="#"
										onclick="funcky(<%=cat.getCid()%>)">Delete</a>
								</div>
								<%
								}
								%>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ---Category page model ends---- -->
	</div>
	</div>



	<%@ include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$('#product-flip').click(function() {

				if (editStatus == false) {

					$('#add-page').hide();
					$('#edit-page').show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#add-page').show();
					$('#edit-page').hide();
					editStatus = false;
					$(this).text("Edit product");

				}
			})
		})
	</script>
	<script type="text/javascript">
        function funck(imgg){
        	const  c={
        			imgs:imgg
        	         }
        	 $.ajax({
        	      type: "POST",
        	      url: "deleteImageServlet",
        	      data: c,
        	      success: function (data,textStatus,jqXHR) {
        	           window.location="admin.jsp";
        	      }
        	 });
        };
        function funcky(id){
        	const  d={
        			ids:id
        	         }
        	 $.ajax({
        	      type: "POST",
        	      url: "deleteCategoryServlet",
        	      data: d,
        	      success: function (data,textStatus,jqXHR) {
        	           window.location="admin.jsp";
        	      }
        	 });
        };
        function functio(idm,image){
        	const  z={
        			did:idm,
        			pimage:image
        	         }
        	 $.ajax({
        	      type: "POST",
        	      url: "deleteProductServlet",
        	      data: z,
        	      success: function (data,textStatus,jqXHR) {
        	           window.location="admin.jsp";
        	      }
        	 });
        };
        $(document).ready(function(e){
        	console.log("loaded...");
        })
        
        </script>
</body>
</html>