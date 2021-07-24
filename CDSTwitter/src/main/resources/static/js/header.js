$( document ).ready(function() {

	var pathname = window.location.pathname;
	console.log(pathname)
	if(pathname == '/profile'){
		$('#tweetButton').hide();
	}
	
	
	if(pathname == '/users/profile'){
		$('.btn-outline-primary').remove();
		$('#editProfileButton').remove();
	}
	
});


function deslog(){	
	$.ajax({
		type : "GET",
		url : "/login/logout",
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			location.reload();
		},
		error : function(e) {
			console.log(e.responseText)
		}
	}); 
	
}