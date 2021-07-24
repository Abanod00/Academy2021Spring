<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

   <header id="main-header">
      <div class="wrapper">
         <nav class="col-md-4">
            <ul>
               <li>
                  <a href="/messages">
                     <img src="/resources/images/messages/home.svg" alt="home"/>
                     <p>Home</p>
                  </a>
               </li>
               <li>
                  <a href="#/">
                     <img src="/resources/images/messages/notification.svg" alt="notifications"/>
                     <p>Notifications</p>
                  </a>
               </li>
               <li>
                  <a href="#/">
                     <img src="/resources/images/messages/message.svg" alt="messages"/>
                     <p>Messages</p>
                  </a>
               </li>
            </ul>
         </nav>
         <div>
            <img src="/resources/images/messages/logo.svg" alt="Logo Twitter"/>
         </div>
         <section class="main-header-right-side">
            <input type="text" placeholder="Search Twitter"/>
            <a href="/profile">
            
                     <c:choose>
					    <c:when test="${empty user.avatar}">
					         <img  src="/resources/images/egg_avatar.jpg" alt="Avatar"/>
					    </c:when>
					    <c:otherwise>
					    	  <img  src="${user.avatar}" alt="Avatar"/>
					    </c:otherwise>
					</c:choose>			     
            </a>
            <button data-toggle="modal" class="tweet" data-target="#tweetModal" id="tweetButton">Tweet</button>
            <button onclick="deslog()" class="btn btn-link btn-sm logout">
            <span class="fa fa-window-close"></span>
            </button>
         </section>
      </div>
   </header>
   <br><br><br><br><br>
   
<script src="/resources/js/header.js"></script>
   