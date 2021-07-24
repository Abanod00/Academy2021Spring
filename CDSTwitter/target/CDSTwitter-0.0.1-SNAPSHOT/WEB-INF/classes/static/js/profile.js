$( document ).ready(function() {
	$('#alert').hide();
});


function updateUserInfo(){	
	
	var username = $("#usernameUpdate").val();
	var fullname = $("#fullnameUpdate").val();
	var description = $("#descriptionUpdate").val();
	var avatar = $("#avatarUpdate").val();
	
	
	var data = {
		username:username,
		fullname: fullname,
		description: description,
		avatar: avatar
	};

	var json = JSON.stringify(data);
			
	$.ajax({
		type : "POST",
		url : "/profile/update",
		contentType : "application/json; charset=utf-8",
		data : json,
		dataType : "json",
		
		success : function(data) {
			$('#alert').addClass( "alert-success" );
			$('#alert').show();
			$('#alert').text(data.message);

			
			$("#userUsername").text(username);
			$("#userFullname").text(fullname);
			$("#userDescription").text(description);
			$("#userAvatar").attr("src",avatar);
			
			clearInputs();
			
			setTimeout(function(){
				$('#alert').hide();
			  }, 900);
			
		},
		error : function(e) {
			$('#alert').addClass( "alert-danger" );
			$('#alert').show();
			$('#alert').text("Error updating user information.");
			
			setTimeout(function(){
				$('#alert').hide();
			  }, 900);
		}
	}); 
	
}

function follow(element){
	
    var childs = element.children;
    var id = element.id;
    
		$.ajax({
			type : "POST",
			url : "/users/follow?uuid="+id,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				$('#alert').addClass( "alert-success" );
				$('#alert').show();
				$('#alert').text(data.message);
				$('#div_' + id).remove();
				
				setTimeout(function(){
					$('#alert').hide();
				  },  900);


			},
			
			error : function(e) {
				console.log(e)
			}
		}); 
		
	}		

function clearInputs(element){
	
	$("#usernameUpdate").val("");
	$("#fullnameUpdate").val("");
	$("#descriptionUpdate").val("");
	$("#avatarUpdate").val("");
		
}	