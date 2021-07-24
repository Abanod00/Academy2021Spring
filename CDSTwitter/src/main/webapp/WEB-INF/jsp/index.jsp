<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!doctype html>
<html>
   <head>
      <title>CDS Twitter</title>
      <link rel="icon"type="image/png"  href="/resources/images/hpe-cds-logo-142-97.png">


      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      
      <link href="/resources/css/login.css" rel="stylesheet">
   </head>
   <body>
   
	<c:if test="${errorMessageBool}">
		<div class="alert alert-danger" role="alert">
			  ${errorMessage}
		</div>
	
	</c:if>
	
   <div class="container">
      <div class="row">
         <div class="col-md-3"></div>
         <div class="col-md-6 p-0 pt-3">
            <img src="/resources/images/hpe-cds-logo-142-97.png" alt="Italian Trulli">
            <h3 class="text-center pt-3" id="welcomemessage">Log in to CDS-Twitter</h3>
            
            
            <form:form method="POST" action="/login/log" modelAttribute="user" class="login-form" id="formLogin">
   
               <div class="mb-3 bg-color">
                  <label>Email, or username</label>
                 <form:input class="form-control input" path="username" name="username" id="username" type="text" />
               </div>
               <div class="mb-3 bg-color">
                  <label>Password</label>
                  <form:input class="form-control input" path="password" name="password" id="password" type="password" />
               </div>
               <button type="submit" class="btn btn-custom btn-lg btn-block mt-3">Log in</button>
               
               <div class="text-center pt-3 pb-3">
                  <a href="#" class="">Forgotten password?</a>
                  <br>
                  <a onclick='singUp();' class="">Sign up for Twitter</a>
               </div>
           </form:form>
           
           <form:form method="POST" action="/login/register" modelAttribute="user" class="login-form" id="formRegister">
           
               <div class="mb-3 bg-color">
                  <label>Username</label>
                  <form:input type="text" class="form-control input" name="reg_username" path="username" />
               </div>
               
               <div class="mb-3 bg-color">
                  <label>Email</label>
                  <form:input type="email" class="form-control input" name="reg_email"  path="email" />
               </div>
               
               <div class="mb-3 bg-color">
                  <label>Full name</label>
                  <form:input type="text" class="form-control input" name="reg_fullname" path="fullname"/>
               </div>
               
               <div class="mb-3 bg-color">
                  <label>Avatar url</label>
                  <form:input type="text" class="form-control input" name="reg_avatar" path="avatar" />
               </div>
               
               <div class="mb-3 bg-color">
                  <label>Password</label>
                  <form:input type="password" class="form-control input" name="reg_password1" path="password" />
               </div>
               
               <div class="mb-3 bg-color">
                  <label>Confirm password</label>
                
               </div>
               
               <button type="submit" class="btn btn-custom btn-lg btn-block mt-3">Register</button>
               <div class="text-center pt-3 pb-3">
                  <a href="#" class="">Forgotten password?</a>
                  <br>
                  <a onclick='logIn();' class="">Log in CDSTwitter</a>
               </div>
            </form:form>
         </div>
      </div>
   </div> 
  
<script src="/resources/js/index.js"></script>
   
   </body>
</html>