$(document).ready(function(){
	$('#navigation li a').click(function(e){
		e.preventDefault(); // ngan khong cho link toi url
		var hrefval = $(this).attr('href');

		if(hrefval=="#about"){
			var distance = $('#mainpage').css('bottom'); // lay gia tri left
			if(distance=="auto" || distance=="0px")
			{
				$(this).addClass('open');
				openSlidepage();
			}
			else{
				closeSlidepage();
			}
				
		}
	});

	$("#navigation li a").on("hover", function(){  
 		var classval = $(this).hasClass("hovertrigger");  
   
 		if(classval == true) {  
  		var distance = $('#mainpage').css('bottom');  
    
  		if(distance == "auto" || distance == "0px") {  
   			$(this).addClass("open");  
   				openSlidepage();  
  			}  
 		}
 	
	});

	function openSlidepage()
	{
		$('#mainpage').animate({
			bottom:'350px'
		},400,'easeOutBack');
	}

	function closeSlidepage()
	{
		$("#navigation li a").removeClass("open"); 
		$('#mainpage').animate({
			bottom:'0px'
		},400,'easeOutQuint');
	}

	$("#closebtn").on("click", function(e){  
 		e.preventDefault();  
 		closeSlidepage();  
	}); // end close button event handler 

});