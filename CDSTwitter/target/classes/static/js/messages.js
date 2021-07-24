$( document ).ready(function() {

	$('.isUserLike').each(function(i, obj) {
		$(obj).css('background-color', 'red');
	});
	
	$('#alert').hide();
	$('#messagesLike').hide();
	
	
    $("#tweetsStr").click(function(e) {
		$('#messagesGlobal').show();
		$('#messagesLike').hide();
		
		$('#tweetsStr').addClass('active');
		$('#likesStr').removeClass('active');
    });
    
    $("#likesStr").click(function(e) {
		$('#messagesGlobal').hide();
		$('#messagesLike').show();
		
		$('#likesStr').addClass('active');
		$('#tweetsStr').removeClass('active');
        
        e.preventDefault();
    });
    
});


function tweet(){

	var image1 = $("#tweet_image1").val();
	var image2 = $("#tweet_image2").val();
	
	var images=[];
	if(image1 != ""){
		images.push(image1);
	}
	if(image2 != ""){
		images.push(image2);
	}
	
	
		
	var data = {
		content : $("#tweet_message").val(),
		images : images
	};

		var json = JSON.stringify(data);
		
	$.ajax({
		type : "POST",
		url : "/messages/post",
		data : json,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			$('#alert').addClass( "alert-success" );
			$('#alert').show();
			$('#alert').text("Tweet succesfully");
			
			setTimeout(function(){
			    location.reload();
			  }, 500);
				
			
		},
		
		error : function(e) {
			
		}
	}); 
	
}	
	function like(element){
		
	    var childs = element.children;
	    var id = element.id;
	    
		$.ajax({
			type : "POST",
			url : "/messages/like?uuid="+id,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				
			},
			error : function(e) {
				
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
				
				setTimeout(function(){
					$('#alert').hide();
				  },  900);


			},
			
			error : function(e) {
				console.log(e)
			}
		}); 
		
	}		



