 function cancelFollowing(myNick,yourNick){
	    	
	    	$.ajax({
	            url : "/HelloMarket/mystore/cancelFollowing.jsp",
	            type : "POST",
	            cache : false,
	            dataType : "text",
	            data : "myNick="+myNick+"&yourNick="+yourNick,
	            success : function(data){
	            	location.reload();
	            },
	            error : function(request,status,error){
	                var msg = "ERROR : " + request.status + "<br>"
	               console.log(msg);   
	               }
	
	        });
	    }
 
 function addFollowing(myNick,yourNick){
 	
 	$.ajax({
         url : "/HelloMarket/mystore/following_ok.jsp",
         type : "POST",
         cache : false,
         dataType : "text",
         data : "myNick="+myNick+"&yourNick="+yourNick,
         success : function(data){
         	location.reload();
         },
         error : function(request,status,error){
             var msg = "ERROR : " + request.status + "<br>"
            console.log(msg);   
            }

     });
 }