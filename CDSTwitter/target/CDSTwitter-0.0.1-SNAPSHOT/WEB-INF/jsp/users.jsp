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
	      
	<link rel='stylesheet' href='/resources/css/messages/globalstyles.css'>
	<link rel='stylesheet' href='/resources/css/messages/header.css'>


	<link rel='stylesheet' href='/resources/css/messages/profile.css'>
	<link rel='stylesheet' href='/resources/css/messages.css'>
	<link rel='stylesheet' href='/resources/css/users.css'>
	<link rel='stylesheet' href='/resources/css/messages/globalstyles.css'>
	<link rel='stylesheet' href='/resources/css/messages/header.css'>
	<link rel='stylesheet' href='/resources/css/messages.css'>

</head>
   <body>

   <jsp:include page="includes/header.jsp" />
   <jsp:include page="includes/alert.jsp" />
   
   
   <section class="main-content wrapper col-md-12">

      <div  class="row justify-content-md-center col-md-12">
      
       <c:forEach items="${users}" var="user">                      		
            
         <div class="row justify-content-md-center col-md-3">
            <div class="">
               <div class="twPc-div">
                  <a class="twPc-bg twPc-block">
                     <p class="description">
                        ${user.description}
                     </p>
                  </a>
                  <div>
                     <a title="${user.fullname}" href="" class="twPc-avatarLink">
                     
                      <c:choose>
					    <c:when test="${empty user.avatar}">
					      	<img   alt="${user.fullname}"  src="/resources/images/egg_avatar.jpg" class="twPc-avatarImg">
					    </c:when>
					    <c:otherwise>
					   		 <img   alt="${user.fullname}" src="${user.avatar}" class="twPc-avatarImg">
					       
					    </c:otherwise>
					</c:choose>
					
                     
                    
                     </a>
                     <div class="twPc-divUser">
                        <div class="twPc-divName">
                           <a href="/users/profile?uuid=${user._id}">${user.fullname}</a>
                        </div>
                        <span>
                        <a href="/users/profile?uuid=${user._id}">@<span >${user.username}</span></a>
                        </span>
                     </div>
                  </div>
               </div>
               <br><br>
            </div>
         </div>
          </c:forEach>
      </div>

   </section>
    

