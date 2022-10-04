<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/my.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Compiled and minified CSS -->


    <style>
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
<body  style="background-image: linear-gradient(to right, #8078782b, #ffffff, #c1c1c1b0)">
	<%@ include file="navbar.jsp" %>
	 
<main >
<div class="container my-4">
    <div class="row">
        <div class=" col-md-8 col-12 offset-md-2">
          <div class="card shadow-lg">
            <div class="card-image text-center">
                <i class="material-icons display-2">login</i>
                <h2>Login Here</h2>
            </div>
            <div class="card-content">
            <div class="container">
            	<%
            	String s1=(String)session.getAttribute("msg");
            	if(s1!=null){
            		%>
            		
            		<div class="alert alert-danger" role="alert">
                    <%=s1 %>
                   </div>
            		<% 
            	}
            		session.removeAttribute("msg");
            	
            	%>
            	<%
            	String s2=(String)session.getAttribute("msg1");
            	if(s2!=null){
            		%>
            		
            		<div class="alert alert-success" role="alert">
                    <%=s2 %>
                   </div>
            		<% 
            		
            	}
            		session.removeAttribute("msg1");
            	%>
                <form action="loginServlet" method="post">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    <div class="form-group">
                     <button type="submit" class="btn  btn-outline-light primary-background" >Login</button>
                    </div>
                    </form>
            </div>

            </div>
          </div>
</div>
        </div>
      </div>
</main>


	
	<%@ include file="footer.jsp" %>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>