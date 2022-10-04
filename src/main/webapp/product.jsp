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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Compiled and minified CSS -->


<style>
* {
	
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body style="background-image: linear-gradient(to right, #8078782b, #ffffff, #c1c1c1b0)">

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
	<%
	String path2 = "productpic" + File.separator;
	int pid = Integer.parseInt(request.getParameter("pid"));
	productDao pda = new productDao(connectionProvider.getConnection());
	product p = pda.getproductById(pid);
	%>
	<main class="container fluid text center my-2">
		<div class="row">
			<div class="col-md-6 text-center">
				<img class="img-fluid" src="<%=path2%><%=p.getPimage()%>"
					style="height: 600px;" alt="no image found"> <br> <a
					class=" btn mr-2 btn-success text-white my-3">Buy
					now</a> 
					<%
					if(use==null){
						%>
					<a id="nonuser"
					class="btn btn-warning  text-white my-3"><i
					class="material-icons left">shopping_cart</i>Add to cart</a>
						<%
					}else{
							%>
						
					<a onclick="addcart(<%=use.getId()%>,<%=p.getPid()%>)"
					class=" btn btn-warning text-white my-3"><i
					class="material-icons left">shopping_cart</i>Add to cart</a>
					<% 	
					}
					%>
					

			</div>
			<div class="col-md-6">
				
					<p class="text-left" style="font-size: 30px;"><%=p.getPtitle()%></p>
					<div class="img-rate  text-left display-6">
						<b><%=p.getPrice()%> Rs</b>

					</div>
					<div class="img-content text-left" style="font-size: 25px;">
						<%=p.getPdescription()%>
					</div>
					<br> <br>
					<div class="img-description text-left" style="font-size: 25px;">
						AKmart provides all the veriety of products whichever and whatever
						you wanted it is available in this and we are also available here
						if there is any problem with the product.</div>

				</div>
			
		</div>
	</main>

	<%@ include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
      function addcart(uids,pids){
    	  const  d={
      			pid:pids,
      			uid:uids
      	         }
      	 $.ajax({
      	      type: "POST",
      	      url: "addToCartServlet",
      	      data: d,
      	      success: function (data,textStatus,jqXHR) {
      	    	  if(data.trim()=="done"){
      	    	 swal("Done", "Your Product is Succesfully added to the Cart","success").then(function(e){
      	    		 window.location="shopPage.jsp";
      	    	 });
      	    		  
      	    	  }else{
      	    		  swal("OOH NOO!", data,"error"); 
      	    	  }
      	      }
      	 });
      }
      $(document).ready(function(){
    	  console.log("inside the add cart");
      })
      
      $('#nonuser').click(function(){
		
		console.log("loaded");
	
		
        swal("SORRY", "PLzz Login first","warning");
				   
			 
	})
      </script>
</body>
</html>