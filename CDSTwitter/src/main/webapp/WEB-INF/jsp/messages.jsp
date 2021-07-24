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
	
</head>
   <body>

   <jsp:include page="includes/header.jsp" />
   <jsp:include page="includes/alert.jsp" />
   
   
   <section class="main-content wrapper col-md-12">
      <article class="timeline col-md-8">
         <nav>
            <a id="tweetsStr" class="active">Tweets (${messages.size()})</a>
            <a href="">Tweets & replies</a>
            <a href="">Media</a>
            <a id="likesStr" href="">Likes (${messagesLike.size()})</a>
         </nav>
         
         <ul id="messagesGlobal">
         
         	<c:forEach items="${messages}" var="message">
            <li>
               <a href="/"> 
                  <div class="tweet">
                     <div class="avatar">
                     
                     <c:choose>
					    <c:when test="${empty message.avatar}">
					        <img src="/resources/images/egg_avatar.jpg" alt="Avatar"/>
					    </c:when>
					    <c:otherwise>
					       <img  src="${message.avatar}" alt="Avatar"/>
					    </c:otherwise>
					</c:choose>
					
                     </div>
                     
                     <div class="content">
                        <header>
                           <strong>${message.userFullname}</strong>
                           <span>@${message.userUsername} · ${message.date}</span>
                        </header>
                        <p>${message.content}</p>
                        <div class="content-images">
                        	<c:forEach items="${message.images}" var="image">
                           		<img src="${image}" alt="${image}"/>
                            </c:forEach>
                        </div>
                        <ul>
                           <li>
                              <p>
                                 <img src="/resources/images/messages/comments.svg" alt="Comments"/>${message.conversation.length} 
                              </p>
                           </li>
                           <li>
                              <p>
                                 <img src="/resources/images/messages/retweet.svg" alt="Retweets"/>257
                              </p>
                           </li>
                           
                             <c:choose>
							    <c:when test="${message.userLike}">
							       <li onclick="like(this)" id="${message._id}">
		                              <p class="p_likes">
		                                 <img id="img_like_{{message._id}}" src="/resources/images/messages/like.svg" alt="Likes"  class="isUserLike"/>
		                              <p id="like_${message._id}}">${message.like}</p>
		                           </li>
							    </c:when>
							    <c:otherwise>
							       <li onclick="like(this)" id="${message._id}" class="isNotUserLike">
		                              <p class="p_likes">
		                                 <img id="img_like_{{message._id}}" src="/resources/images/messages/like.svg" alt="Likes"/>
		                              <p id="like_${message._id}}">${message.like}</p>
		                           </li>
							    </c:otherwise>
							</c:choose>
					

                           <li>
                              <p>
                                 <img src="/resources/images/messages/message.svg" alt="Share"/>
                              </p>
                           </li>
                        </ul>
                     </div>
                  </div>
               </a>
            </li>
            </c:forEach>
            </ul>
            
            <ul id="messagesLike">
			<c:forEach items="${messagesLike}" var="messageLike">
            <li>
               <a href="/"> 
                  <div class="tweet">
                     <div class="avatar">
                     
                     <c:choose>
					    <c:when test="${empty messageLike.avatar}">
					        <img src="/resources/images/egg_avatar.jpg" alt="Avatar"/>
					    </c:when>
					    <c:otherwise>
					       <img  src="${messageLike.avatar}" alt="Avatar"/>
					    </c:otherwise>
					</c:choose>
					
                     </div>
                     
                     <div class="content">
                        <header>
                           <strong>${messageLike.userFullname}</strong>
                           <span>@${messageLike.userUsername} · ${messageLike.date}</span>
                        </header>
                        <p>${messageLike.content}</p>
                        <div class="content-images">
                        	<c:forEach items="${messageLike.images}" var="image">
                           		<img src="${image}" alt="${image}"/>
                            </c:forEach>
                        </div>
                        <ul>
                           <li>
                              <p>
                                 <img src="/resources/images/messages/comments.svg" alt="Comments"/>${messageLike.conversation.length} 
                              </p>
                           </li>
                           <li>
                              <p>
                                 <img src="/resources/images/messages/retweet.svg" alt="Retweets"/>257
                              </p>
                           </li>
						       <li id="${messageLike._id}">
	                              <p class="p_likes">
	                                 <img  src="/resources/images/messages/like.svg" alt="Likes"  class="isUserLike"/>
	                            <p>${messageLike.like}</p>

                           <li>
                              <p>
                                 <img src="/resources/images/messages/message.svg" alt="Share"/>
                              </p>
                           </li>
                        </ul>
                     </div>
                  </div>
               </a>
            </li>
            </c:forEach>
            
         </ul>
      </article>
      <aside class="widgets col-md-4">
         <div class="widget follow">
            <div>
               <h1>You might like</h1>
            </div>
            <ul>
            
            <c:forEach items="${randomUsers}" var="userRdn">
                <li>
                  <a>
                  
                    <c:choose>
					    <c:when test="${empty userRdn.avatar}">
					       <img  src="/resources/images/egg_avatar.jpg" alt="@${userRdn.username}"/>
					    </c:when>
					    <c:otherwise>
					      
					        <img  src="${userRdn.avatar}" alt="@${userRdn.username}"/>
					    </c:otherwise>
					</c:choose>
                  
                     <div>
                        <strong>${userRdn.fullname}</strong>
                        <span>@${userRdn.username}</span>
                     </div>
                     <button  onclick="follow(this)" id="${userRdn._id}">Follow</button>
                  </a>
               </li>     		
             </c:forEach>
             
                <li>
                  <a href="/users">
                     <p>Show more</p>
                  </a>
               </li>   
            </ul>
         </div>
         <div class="widget trends">

            <ul>
            
            <c:forEach items="${trendictopic}" var="tt">  
	               <li >
	                  <a href="/">
	                  <span>Academy · (${tt.count})</span>
	                  <strong>${tt.content}</strong>
	                  </a>
	               </li>
               </c:forEach>
               <li>
                  <a href="/trending">
                     <p>Show more</p>
                  </a>
               </li>
            </ul>
         </div>
         <footer>
            <nav>
               <a href="/">Terms</a>
               <a href="/">Privacy policy</a>
               <a href="/">Cookies</a>
               <a href="/">Ads info</a>
               <a href="/">More</a>
               <p href="/">© 2021 CDS Academy.</p>
            </nav>
         </footer>
      </aside>
   </section>
    
   <!-- Modal -->
   <div class="modal fade" id="tweetModal" tabindex="-1" role="dialog" aria-labelledby="tweetModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
               <div class="container">
                  <div class="row">
                     <div class="span4 well" style="padding-bottom:0">
                        <textarea maxlength="140" class="tweet_message span4 col-md-12" id="tweet_message" name="new_message" placeholder="Type in your message" rows="5"></textarea>
                        <input type="text" class="addImage form-control" name="image1" id="tweet_image1" class="input" placeholder="Add image"> 
                        <input type="text" class="addImage form-control" name="image2" id="tweet_image2" class="input" placeholder="Add image">
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <button data-dismiss="modal" class="btn btn-info" type="submit" onclick="tweet()">Tweet</button>
            </div>
         </div>
      </div>
   </div>
</body>

<script src="/resources/js/messages.js"></script>