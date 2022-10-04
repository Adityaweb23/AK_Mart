<%@page import="Project.dao.cartDao"%>
<%@page import="Project.enteties.product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project.helper.connectionProvider"%>
<%@page import="Project.dao.productDao"%>
<%@page import="java.io.File"%>
<%@page import="Project.enteties.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="errorpage.jsp"%>
<%
user u = (user) session.getAttribute("currentUser");
String uname = u.getUname();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Compiled and minified CSS -->


<style>

* {
	padding: 0px;
	margin: 0px;
}
.navbar{
    position: sticky;
}

</style>
</head>

<body>
	<!-- ----navbar---- -->
	<nav
		class=" nav-extended navbar sticky-top navbar-expand-lg navbar-light bg-light all-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-audio-description"></span>AKmart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon "></span>
		</button>

		<div class="nav-wrapper collapse navbar-collapse"
			id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="	fa fa-home"></span> Home </a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#exampleModal"><span
						class="fa fa-user-circle-o"> </span><%=uname%></a></li>
				<li class="nav-item"><a class="nav-link" href="logoutServlet"><span
						class="fa fa-sign-out"> </span>logout</a></li>
				<li class="nav-item"><a class="nav-link" href="adminLogin.jsp"><span
						class="fa fa-user-secret"> </span> Admin</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link text-dark"
					data-toggle="modal" data-target="#exampleModal2" href="#"><i
						class="material-icons left">shopping_cart</i>Cart</a></li>
			</ul>

		</div>

	</nav>

	<%
	String s1 = (String) session.getAttribute("errormsg");
	if (s1 != null) {
	%>

	<div class="alert alert-danger" role="alert">
		<%=s1%>
	</div>
	<%
	}
	session.removeAttribute("errormsg");
	%>
	<%
	String s2 = (String) session.getAttribute("succesmsg");
	if (s2 != null) {
	%>

	<div class="alert alert-success" role="alert">
		<%=s2%>
	</div>
	<%
	}
	session.removeAttribute("succesmsg");
	%>



	<main>
		<!-- -----modal body starts----- -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header primary-background">
						<h5 class="modal-title" id="exampleModalLabel">User Cart</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<%
								
								String path2 = "productpic" + File.separator;
								
								cartDao cda=new cartDao(connectionProvider.getConnection());
								productDao pdao = new productDao(connectionProvider.getConnection());
								ArrayList<Integer> alp = cda.getProductsbyUid(u.getId());
								int total=0;
								for (int l : alp) {
									product p=pdao.getproductById(l);
									total=total+p.getPrice();
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
										onclick="functp(<%=p.getPid()%>,<%=u.getId()%>)">Remove</a>
								</div>
								<%
								}
								%>
								<div class="col-12">
								Total =<strong><%=total %> Rs</strong>
								</div>
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

		<!-- ------modal body ends------ -->

					<!-- user modal starts -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header primary-background">
						<h5 class="modal-title" id="exampleModalLabel">
							<span class="fa fa-audio-description"></span>AKmart
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="profile" id="profile-table">
							<table class="table">
								<tbody>
									<h2 class="display-7 text-center">Hello <%=u.getUname()%></h2>
									<tr>

										<th>Name</th>
										<td><%=u.getUname()%></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><%=u.getEmail()%></td>
									</tr>
									<tr>
										<th>About</th>
										<td><%=u.getAbout()%></td>
									</tr>
									<tr>

										<th>Gender</th>
										<td><%=u.getGender()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- user model ends -->
						
						<!-- edit user starts -->
						<div class="profile-edit" id="edit-profile" style="display: none;">
							<form class="form" id="reg-form" action="editServlet"
								method="post">
								<div class="form-group">
									<label for="exampleid">User ID</label> <input type="text"
										class="form-control" name="uid" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Your name"
										value="<%=u.getId()%>" >
								</div>
								<div class="form-group">
									<label for="exampleInputName1">User Name</label> <input
										type="text" class="form-control" name="uname"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Your name" value="<%=u.getUname()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" name="email"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email" value="<%=u.getEmail()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password"
										value="<%=u.getPassword()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputgender">gender</label> <input
										type="text" name="gender" class="form-control"
										id="exampleInputgender" placeholder="gender"
										value="<%=u.getGender()%>">
								</div>

								<div class="form-group">
									<textarea name="about" class="form-control" id="txtarea"
										rows="5" placeholder="Enter about yourself"><%=u.getAbout()%></textarea>
								</div>
								<div class="form-check">
									<button type=submit
										class="btn primary-background btn-outline-light">Submit</button>

								</div>
							</form>
						</div>
				
				<!-- edit user ends -->

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-profile-button" type="button"
							class="btn btn-dark">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- -----------nabar ends----------- -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		<script type="text/javascript">
		function functp(pids,uids){
			const d={
					pid:pids,
					uid:uids
			}
			 $.ajax({
	      	      type: "POST",
	      	      url: "deleteFromCartServlet",
	      	      data: d,
	      	      success: function (data,textStatus,jqXHR) {
	      	    	  if(data.trim()=="done"){
	      	    	 swal("Done", "Your Product is Succesfully Removed from the Cart","success").then(function(e){
	      	    		 window.location="shopPage.jsp";
	      	    
	      	    		  
	      	    	  })
	      	    	  }else{
	      	    		  swal("OOH NOO!", data,"error"); 
	      	    	  }
	      	      }
	      	 });
		}
		$(document).ready(function(){
			console.log("inside the cart delete section");
		})		
		</script>
	<script type="text/javascript">
		$(document).ready(function() {
			let editstatus = false;
			$('#edit-profile-button').click(function() {
				if (editstatus == false) {

					$('#profile-table').hide();
					$('#edit-profile').show();
					editstatus = true;
					$(this).text("Back");
				} else {
					$('#profile-table').show();
					$('#edit-profile').hide();
					editstatus = false;
					$(this).text("Edit");

				}
			})
		})
	</script>

</body>
</html>