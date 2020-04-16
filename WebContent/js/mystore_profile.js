$(function(){
    const typed = false;

    function nickchange(){
        const nick_check = RegExp(/^[a-zA-Z0-9]{4,16}$/);
        const nick_button = $("#nick_change")

        $(nick_button).on('click',function(){
            if(!nick_check.test($("#nick_area").val())){
                $(".ReactModalPortal").css('display','block');
                $("#idCheck_not").css('display','block');
                $(".popup_type2_footer").on('click',function(){
                    $(".ReactModalPortal").css('display','none');
                })
            }
        })
        
    }

    function init(){
        nickchange();
    }
    init();
})