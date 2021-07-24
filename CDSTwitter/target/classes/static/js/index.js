$( document ).ready(function() {
	$( "#formRegister" ).hide();
	$( "#welcomemessage" ).text("Log in to CDS-Twitter");
});



function singUp(){
	$( "#formRegister" ).show();
	$( "#formLogin" ).hide();
	$( "#welcomemessage" ).text("Register in to CDS-Twitter");
}

function logIn(){
	$( "#formLogin" ).show();
	$( "#formRegister" ).hide();
	$( "#welcomemessage" ).text("Log in to CDS-Twitter");
}
