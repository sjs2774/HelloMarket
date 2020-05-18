
    const profile_menu = $(".my_profile_item_menu").children().children('li');

    function profile_slide(){
        for(let i=0;i<$(profile_menu).length;i++){
            $(profile_menu[i]).on('click',function(e){
                $(this).addClass('active').children('a').addClass('active');
                $(this).siblings().children('a').removeClass('active').end().siblings().removeClass('active')
            })
        }
    }
    
    function following(myNick,yourNick){
    	
    	$.ajax({
            url : "/HelloMarket/mystore/following_ok.jsp",
            type : "POST",
            cache : false,
            dataType : "text",
            data : "myNick="+myNick+"&yourNick="+yourNick,
            success : function(data){
//              $(".follow_info_blue").addClass(".follow_info_white");
//              $(".follow_info_blue").html("<img src='../img/ico_white_check_14x14_x2.png' alt='상점 팔로우 이미지' class='follower_image'><span>팔로워</span>")
//              $(".follow_info_blue").removeClass(".follow_info_blue");
//             
              location.reload();

            },
            error : function(request,status,error){
                var msg = "ERROR : " + request.status + "<br>"
               console.log(msg);   
               }

        });
    }
    
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

    function init(){
        $(profile_menu).on('click',profile_slide)
    }
    
   
    init();
