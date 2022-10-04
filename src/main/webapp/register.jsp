<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page errorPage="errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<style>
        .banner-background {
            clip-path: polygon(50% 0%, 77% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0 0, 21% 0);
        }
         .primary-background {
    background:  rgba(0, 0, 0, 0.34)!important;
    color: white;
}
        * {
            padding: 0px;
            margin: 0px;
          }
    </style>
</head>
<body style="background-image: linear-gradient(to right, #8078782b, #ffffff, #c1c1c1b0)">
	<%@ include file="navbar.jsp"%>

	<main class="container my-2">
		<div class="row">
			<div class=" col-md-8 col-12 offset-md-2">
				<div class="card shadow-lg">
					<div class="card-image text-center">

						<i class="material-icons display-2">assignment_ind</i>
						<h4>Register Here</h4>
					</div>
					<div class="card-content">
						<div class="container">
							<form class="form" id="reg-form" action="registerServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">User Name</label> <input
										type="text" class="form-control" name="uname"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Your name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" name="email"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-group">
									<input class="with-gap" name="gender" value="Male"
										id="choice_1" type="radio" /> <label for="choice_1">Male</label>
									<input class="with-gap" name="gender" value="Female"
										id="choice_2" type="radio" /> <label for="choice_2">Female</label>
								</div>
								<div class="form-group">
									<textarea name="about" class="form-control" id="txtarea"
										rows="5" placeholder="Enter about yourself"></textarea>
								</div>
								<div class="form-check">
									<input id="check" type="checkbox" class="filled-in" /> <label
										class="form-check-label" for="exampleCheck1">agree
										Terms and Conditions</label>
								</div>
								<div class="form-check">
									<button type=submit
										class="btn primary-background btn-outline-light">Submit</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>






	<%@ include file="footer.jsp"%>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		  <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		console.log("loaded");
	
		$('#reg-form').on('submit',function(event){
			console.log("done");
			    
			    if ($("#check").is(":checked")) {
			    	
			
			       console.log("thanku");
			    } else {
			    	event.preventDefault();
			        swal("OOH NOO!", "PLzz check the terms and conditions","error");
				   
			    }
		});
	})

</script>
</body>
</html>