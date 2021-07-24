
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
		<link rel='stylesheet' href='/resources/css/messages/profilebanner.css'>
		<link rel='stylesheet' href='/resources/css/messages/profileactions.css'>
		<link rel='stylesheet' href='/resources/css/messages/maincontent.css'>
		<link rel='stylesheet' href='/resources/css/messages/profile.css'>
		<link rel='stylesheet' href='/resources/css/messages/timeline.css'>
		<link rel='stylesheet' href='/resources/css/messages/widgets.css'>
		<link rel='stylesheet' href='/resources/css/messages.css'>
		<link rel='stylesheet' href='/resources/css/profile.css'>

	
	
</head>


<body>

   <jsp:include page="includes/header.jsp" />
   <jsp:include page="includes/alert.jsp" />
   
<div class="container" id="profilebody">
    <div class="profile">
        <div class="profile-header">
            <div class="profile-header-cover"></div>
            <div class="profile-header-content">
                <div class="profile-header-img">
                
                     <c:choose>
					    <c:when test="${empty userProfile.avatar}">
					        <img id="userAvatar" src="/resources/images/egg_avatar.jpg" alt="Avatar"/>
					    </c:when>
					    <c:otherwise>
					       <img id="userAvatar" src="${userProfile.avatar}" alt="Avatar"/>
					    </c:otherwise>
					</c:choose>
					
                   <!--  <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" /> -->
                </div>
                <ul class="profile-header-tab nav nav-tabs nav-tabs-v2">
                    <li class="nav-item">
                        <a href="#profile-post" class="nav-link" data-toggle="tab">
                            <div class="nav-field">Posts</div>
                            <div class="nav-value">${numberMessage}</div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#profile-followers" class="nav-link active" data-toggle="tab">
                            <div class="nav-field">Followers</div>
                            <div class="nav-value">1.3m</div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#profile-media" class="nav-link" data-toggle="tab">
                            <div class="nav-field">Photos</div>
                            <div class="nav-value">${numberPhotos}</div>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#profile-followers" class="nav-link" data-toggle="tab">
                            <div class="nav-field">Following</div>
                            <div class="nav-value">${userProfile.follows.size()}</div>
                        </a>
                        
                    </li>
                     <li class="nav-item" >
                        <a id="editProfileButton" data-target="#editprofile"  data-toggle="modal" href="#profile-media" class="nav-link" data-toggle="tab">
                            <div class="nav-field">Edit profile</div>
                            <div class="nav-value"><span class="fa fa-cog fa-lg" aria-hidden="true"></span></div>
         
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="profile-container">
            <div class="profile-sidebar">
                <div class="desktop-sticky-top">
                    <h4 id="userFullname">${userProfile.fullname}</h4>
                    <div id="userUsername" class="font-weight-600 mb-3 text-muted mt-n2">@${userProfile.username}</div>
                    <p id="userDescription">
                        ${userProfile.description}
                    </p>
                    <div class="mb-1"><i class="fa fa-map-marker-alt fa-fw text-muted"></i> CDS Academy, SP</div>
                    <div class="mb-3"><i class="fa fa-link fa-fw text-muted"></i> cdsacademytwitter.com/${user.username}</div>
                    <hr class="mt-4 mb-4" />
                </div>
            </div>

            <div class="profile-content">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="tab-content p-0">
                            <div class="tab-pane fade active show" id="profile-followers">
                                <div class="list-group">

         							<c:forEach items="${follows}" var="follow">
         	
                                    <div class="list-group-item d-flex align-items-center" id="div_${follow._id}">
                                    
	                                    <c:choose>
										    <c:when test="${empty follow.avatar}">
										        <img alt="" width="50px" class="rounded-sm ml-n2" src="/resources/images/egg_avatar.jpg" alt="Avatar"/>
										    </c:when>
										    <c:otherwise>
										       <img alt="" width="50px" class="rounded-sm ml-n2" src="${follow.avatar}" alt="Avatar"/>
										    </c:otherwise>
										</c:choose>
					
                                        <div class="flex-fill pl-3 pr-3">
                                            <div><a  href="/users/profile?uuid=${follow._id}" class="text-dark font-weight-600">@${follow.username}</a></div>
                                            <div class="text-muted fs-13px">${follow.fullname}</div>
                                        </div>
                                        <a class="btn btn-outline-primary" onclick="follow(this)" id="${follow._id}">Unfollow</a>
                                    </div>
                                    </c:forEach>
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


   <!-- Modal -->
   <div class="modal fade" id="editprofile" tabindex="-1" role="dialog" aria-labelledby="editprofile" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
               <div class="container">
                  <div class="row">
                     <div class="span4 well" style="padding-bottom:0">


							<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1">@</span>
							  <input type="text" class="form-control" placeholder="${user.username}" aria-label="Username" aria-describedby="basic-addon1" id="usernameUpdate">
							</div>
							
							<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1"><i class="fa fa-address-card"></i></span>
							  <input type="text" class="form-control" placeholder="${user.fullname}" aria-label="Fullname" aria-describedby="basic-addon1" id="fullnameUpdate">
							</div>
							
							<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1"><i class="fa fa-map-pin"></i></span>
							  <input type="text" class="form-control" placeholder="${user.description}" aria-label="Description" aria-describedby="basic-addon1" id="descriptionUpdate">
							</div>
							
							<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1"><i class="fa fa-camera-retro"></i></span>
							  <input type="text" class="form-control" placeholder="${user.avatar}" aria-label="Avatar" aria-describedby="basic-addon1" id="avatarUpdate">
							</div>
							
							
	                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <button data-dismiss="modal" class="btn btn-info" type="submit" onclick="updateUserInfo()">Update</button>
            </div>
         </div>
      </div>
   </div>
</body>

<script src="/resources/js/profile.js"></script>
   