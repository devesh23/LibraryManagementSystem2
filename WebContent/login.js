function init(){
	window.location.href = "Admin.html";
}



$(document)
		.ready(
				function() {
					// Submit form with id function.
					$("#btnsubmit")
							.click(
									function() {
										var name = $("#id").val();
										var pass = $("#PassWordLibrarian").val();
										console.log(name);
										console.log(pass);
										if ((name==="admin")&&(pass==="admin")) // Calling
															// validation
															// function.
										{
										    //alert("Correct");
											init();
										}
										else{
											//alert("Incorrect")
											$("#LibraryLoginForm").submit();
										}
									});
				});