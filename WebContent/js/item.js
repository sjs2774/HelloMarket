
	function commentup(userNick,pIdx){
			const comment = $(".input_txt").val();
			$.ajax({
	            url : "/HelloMarket/item/comment_ok.jsp",
	            type : "POST",
	            cache : false,
	            dataType : "text",
	            data : "comment="+comment+"&userNick="+userNick+"&pIdx="+pIdx,
	            
	            success : function(data){
	            	$(".input_custorm").after()
	            	
	            	
	            	
	
	            },
	            error : function(request,status,error){
	                var msg = "ERROR : " + request.status + "<br>"
	               console.log(msg);   
	               }
	
	        });
	}
	
	


