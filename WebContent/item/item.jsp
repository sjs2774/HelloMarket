<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@page import="Board.BoardDTO" %>
<%@page import="Board.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="/HelloMarket/css/chunk.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<%
	String userId = null;
	String userNick = null;
	int sellerLevel = 0;
	String levelName = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	 if(sellerLevel==1){
			levelName = "화이트";
		}else if(sellerLevel==2){
			levelName ="블루";
		}else{
			levelName="브론즈";
		}
%>
  <div id="__next" style="height: auto !important;">
    <header class="">
      <div class="bar hide"></div>
      <section class="header_top">
        <div class="header_logo header_logo_s">
          <div class="log_box"><img src="/HelloMarket/img/MarketMain.png" class="logo" alt="헬로마켓"></div>
<%
	if(userId == null ){
%>
          <div class="btn_box">
          <a class="btn_login_box">
          <button class="login_btn">로그인</button>
          </a><a class="btn_signup_box"><button class="signup_btn">회원가입</button></a><a href="/msearch">
              <div class="notification_box"></div>
            </a></div>
<%
	}else{
%>
		<div class="btn_box">
    <div class="nick">
    	<img src="/HelloMarket/img/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick %>의 프로필 사진" class="profile_img">
    	<span class="nick_title"><%=userNick %>님</span>
    	</div>
    <div class="notification_box">
    	<a href="" target="_blank" rel="noopener noreferrer">
    		<img src="/HelloMarket/img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
        	<div class="chat_cnt">4</div>
        </a>
        <a id ="alarm_btn" target="_blank">
        	<img src="/HelloMarket/img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
            <div class="alram_cnt">3</div>
        </a></div>
</div>
<% 
	}
%>
          <div style="display: none;">
            <div class="gnb_my_lyr test_type">
                <div class="gnb_my_member_level">
                <%
	if(sellerLevel==1){
%>
		<img class="gnb_my_member_level_img" src="img/img_level1_30.png">
<% 
	}else if(sellerLevel ==2){
%>
		<img class="gnb_my_member_level_img" src="img/img_level2_30.png">
<% 
	}else{
%>
		<img class="gnb_my_member_level_img" src="img/img_level3_30.png">
<% 
	}
%>
                  <div><span class="level_description">나의등급</span><span class="level_description_name"><%=levelName %></span></div>
                </div>
              <ul class="gnb_my_list">
                  <li class="gnb_my_list_first">내상점</li>
                  <li class="gnb_my_list_second">할인쿠폰</li>
                  <li class="gnb_my_list_last">로그아웃</li>
              </ul>
            </div>
          </div>
          <div class="header_search" id="tebas">
            <div class="com_search_box">
                <div>
                    <div><input type="text" class="com_search" placeholder="어떤 상품을 찾고 계세요?" value=""
                            style="border-bottom: 1px solid rgb(158, 164, 170);">
                        <div class="search_icon_box">
                            <div class="search_icon">
                                <div class="search_circle" style="border-color: rgb(158, 164, 170);"></div>
                                <div class="search_rectangle" style="border-color: rgb(158, 164, 170);">
                                </div>
                            </div>
                        </div>
                        <div class="w_search_modal" style="display: none;">
                            <div>
                                <div class="search_contents">
                                    <div class="search_recent">
                                        <p>최근 검색</p>
                                        <ul>
                                            <div class="search_empty">우리조 1등 </div>
                                        </ul>
                                    </div>
                                    <div class="line"></div>
                                    <div class="search_popular">
                                        <p>인기 키워드</p>
                                        <ul>
                                            <li class=""><span>1</span> 눈누난나</li>
                                            <li class=""><span>2</span> ~@~@~@</li>
                                            <li class=""><span>3</span> !@#!@$</li>
                                            <li class=""><span>4</span> css 경로는 알아서</li>
                                            <li class=""><span>5</span> 메인페이지 누구함?</li>
                                            <li class=""><span>6</span> 프린터</li>
                                            <li class=""><span>7</span> jbl</li>
                                            <li class=""><span>8</span> 키보드</li>
                                            <li class=""><span>9</span> 에어컨</li>
                                            <li class="last_child"><span>10</span> 안마기</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_close">
                                <div>닫기</div>
                            </div>
        </div>
      </section>
      <section class="header_cat">
        <div class="header_wrapper">
          <div>
            <div class="btn_box header_wrapper_sub" id="open_cat">
              <input type="checkbox" class="cat_checkbox chkbox1">
              <i class="arrow"></i>
              <span for="cat_checkbox" class="selectbox">카테고리</span>
              <div style="display: none;" id="category_display">
                <div class="cat_list_box left_slidein">
                  <div class="mobile_nav">
                    <div class="cat_avt">
                      <ul class="cat_avt_top">
                        <li><a href="/search?sort=current">최신순 &gt;</a></li>
                        <li><a>가까운순 &gt;</a></li>
                      </ul>
                    </div>
                    <ul class="cat_list mobile_cat_list">
                      <li class="category"><a class="cat_link mobile_cat_link"
                          href="/m/hellopay.hm?type=seller&amp;status=open"><span class="category_text">헬로페이
                            거래내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/wallet/history"><span
                            class="category_text">전자지갑 · 결제관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/order/auto/sales/list.hm"><span
                            class="category_text">일반 결제내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/shipping.hm?type=sender"><span
                            class="category_text">배송관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/coupon"><span
                            class="category_text">할인쿠폰</span></a></li>
                    </ul>
                    <div class="mobile_category_line"></div>
                    <ul class="cat_list mobile_cat_list_none">
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAK0000"><img
                            src="/HelloMarket/img/cate_hak0000.png" alt="휴대폰, 테블릿" class="category_img"><span
                            class="category_text">휴대폰, 테블릿</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAD0000"><img
                            src="/HelloMarket/img/cate_had0000.png" alt="뷰티" class="category_img"><span
                            class="category_text">뷰티</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAA0000"><img
                            src="/HelloMarket/img/cate_haa0000.png" alt="여성의류" class="category_img"><span
                            class="category_text">여성의류</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAC0000"><img
                            src="/HelloMarket/img/cate_hac0000.png" alt="신발,가방,잡화" class="category_img"><span
                            class="category_text">신발,가방,잡화</span></a></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                      <li class="category_blank"></li>
                    </ul>
                    <ul class="mobile mobile_sub_category">
                      <li><a href="/community/list.hm?category=DAC0002">이벤트</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/community/list.hm?category=DAC0004">헬마뉴스</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/help/faq.hm">헬프센터</a><i class="arrow right_arrow"></i></li>
                      <li><a href="./ad/index.html" target="_blank" rel="noopener noreferrer">광고센터</a><i
                          class="arrow right_arrow"></i></li>
                    </ul>
                    <ul class="logout_wrapper">
                      <li>
                        <div class="btn logout">로그아웃</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="sellimg_sub_box header_wrapper_sub" onclick="sellimg('<%=userId%>')">
   			<script>
   		    function sellimg(userId) {

   				if (userId != null) {
   			
   					location.href = "/HelloMarket/sell/sell.jsp";
   			
   				} else {
   			
   					alert("로그인해주세요!");
   					location.href = "/HelloMarket/login/login.html";
   			
   				}

   		}
   			</script>
            <div class="selling_bot"><img src="/HelloMarket/img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span
                class="selling_bot_text">판매하기</span></div>
          </div>
          <div class="link_box header_wrapper_sub">
            <ul>
              <li><a href="/community/list.hm?category=DAC0002&amp;status=begin">이벤트</a></li>
              <li><a href="/help/faq.html">헬프센터</a></li>
              <li><a href="/HelloMarket/ad/index.html" target="_blank" rel="noopener noreferrer"><img
                    src="/HelloMarket/img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
            </ul>
          </div>
        </div>
      </section>
    </header>


<section class="content" style="height: auto !important;">
    <h1>14k 반지 | 헬로마켓</h1>
    <h2>안녕하세요14k 18k쥬얼리 상점 입니다


        ♥구매및상담 문의 카톡Idkkh1122 번호01090227136
        ♥♥상품정보♥♥
        ★14k상품중량 55g
        가격26만 ...</h2>
    <div class="banner_area pc_display">
        <div class="banner_pos">
            <div class="google_banner">
                <div class="google_banner_absolute" style="height: auto !important;"><ins class=" adsbygoogle" data-ad-client="ca-pub-9169594828612333" data-ad-slot="4176407792" data-ad-layout="" data-ad-layout-key="" data-ad-format="auto" data-full-width-responsive="false" style="width: 160px; height: 600px; display: inline-block;" data-adsbygoogle-status="done"><ins id="aswift_0_expand" style="display:inline-table;border:none;height:600px;margin:0;padding:0;position:relative;visibility:visible;width:160px;background-color:transparent;"><ins id="aswift_0_anchor" style="display: block; border: none; height: 600px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 160px; background-color: transparent; overflow: visible;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:160px;height:600px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="160" height="600" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-9169594828612333&amp;output=html&amp;h=600&amp;slotname=4176407792&amp;adk=3935954076&amp;adf=1644442599&amp;w=160&amp;fwrn=1&amp;fwrnh=100&amp;lmt=1588138289&amp;rafmt=1&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=160x600&amp;url=https%3A%2F%2Fwww.hellomarket.com%2Fitem%2F166593275%3FviewPath%3Dmain_feed%26clickPath%3Dhome%26feedType%3Dranking%26featuredFeedType%3DRankingItem%26escrowType%3Dcommon%26feedPosition%3D3&amp;flash=0&amp;fwr=0&amp;fwrattr=false&amp;rh=600&amp;rw=160&amp;rpe=1&amp;resp_fmts=4&amp;wgl=1&amp;dt=1588138289907&amp;bpp=6&amp;bdt=946512&amp;idt=-M&amp;shv=r20200427&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dd077faa77778f306%3AT%3D1583485911%3AS%3DALNI_MZ4jvWIHPkHvPhWKywGCZFHfS2HIA&amp;crv=1&amp;prev_fmts=250x336%2C0x0%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C250x336&amp;nras=1&amp;correlator=3639033420052&amp;frm=20&amp;pv=1&amp;ga_vid=1440211444.1583485911&amp;ga_sid=1588137344&amp;ga_hid=1951705424&amp;ga_fc=0&amp;iag=0&amp;icsg=561034296895&amp;dssz=25&amp;mdo=0&amp;mso=0&amp;u_tz=540&amp;u_his=16&amp;u_java=0&amp;u_h=1120&amp;u_w=1792&amp;u_ah=1024&amp;u_aw=1792&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=1006&amp;ady=196&amp;biw=991&amp;bih=913&amp;scr_x=0&amp;scr_y=0&amp;eid=21065472%2C21065474%2C44716443%2C44716445&amp;oid=3&amp;psts=AKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2C%2C%2C%2C&amp;pvsid=3798168746060099&amp;pem=294&amp;ref=https%3A%2F%2Faccount.hellomarket.com%2Flogin%3Fcontinue_url%3Dhttps%253A%252F%252Fwww.hellomarket.com%252F&amp;rx=0&amp;eae=0&amp;fc=896&amp;brdim=0%2C23%2C0%2C23%2C1792%2C23%2C1792%2C1024%2C991%2C913&amp;vis=1&amp;rsz=%7C%7CfeE%7C&amp;abl=CF&amp;pfx=0&amp;fu=8336&amp;bc=31&amp;ifi=35&amp;uci=a!z&amp;fsb=1&amp;xpc=Ibf0S1RigN&amp;p=https%3A//www.hellomarket.com&amp;dtd=8" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!z" data-google-query-id="COTMjJX0jOkCFYcZKgodG34G_A" data-load-complete="true"></iframe></ins></ins></ins></div>
            </div>
        </div>
    </div>
    <div class="item_list_area" style="height: auto !important;">
        <div class="item_list_area_box" style="height: auto !important;">
            <div class="breadcrumbs">
                <ul>
                    <li><a href="/">HOME</a></li>
                    <li><a href="/search?category=HAC0000">&gt; 신발,가방,잡화</a></li>
                    <li><a href="/search?category=HAC0007">&gt; 시계,보석</a></li>
                </ul>
            </div>
            <div class="main_area" style="height: auto !important;">
                <div class="main_area_center" style="height: auto !important;">
                    <div class="main">
                        <div class="detail_box">
                            <div class="detail_box_top">
                                <div class="detail_top_area">
                                    <div class="photo_area">
                                        <div class="large_img">
                                            <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                                                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                                    <div class="swiper-slide thumbnail_wrapper swiper-slide-active" style="width: 460px;">
                                                        <div class="badeagle">
                                                            <div class="centered"><img alt="14k 반지의 상세 이미지 1" class="view thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_1.jpg?size=s6"></div>
                                                        </div>
                                                    </div>
                                                    <div class="swiper-slide thumbnail_wrapper swiper-slide-next" style="width: 460px;">
                                                        <div class="badeagle">
                                                            <div class="centered"><img alt="14k 반지의 상세 이미지 2" class="view thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_2.jpg?size=s6"></div>
                                                        </div>
                                                    </div>
                                           
                                                </div>
                                                <div class="swiper-pagination swiper-pagination-white auto_item_image_pagination swiper-pagination-fraction"><span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">7</span></div>
                                                <div class="swiper-button-next auto_swiper_next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"><svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                                                        <path d="M27,22L27,22L5,44l-2.1-2.1L22.8,22L2.9,2.1L5,0L27,22L27,22z"></path>
                                                    </svg></div>
                                                <div class="swiper-button-prev auto_swiper_prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"><svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                                                        <path d="M0,22L22,0l2.1,2.1L4.2,22l19.9,19.9L22,44L0,22L0,22L0,22z"></path>
                                                    </svg></div><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                                            </div>
                                        </div>
                                        <div class="als_image_viewport">
                                            <div class="als_prev"></div>
                                            <div class="als_container">
                                                <div class="als_viewport" style="transform: translateX(0px);">
                                                    <div class="als_item als_normal_item"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_1.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_2.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_3.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_4.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_5.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_6.jpg?size=s6"></a></div>
                                                    <div class="als_item als_normal_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimg.hellomarket.com/images/2018/item/06/29/08/5354_277815_7.jpg?size=s6"></a></div>
                                                    <div class="als_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimage.hellomarket.com/web/2019/item/img_itemdetails_thumbnail_noimage50x50_x2.png"></a></div>
                                                    <div class="als_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimage.hellomarket.com/web/2019/item/img_itemdetails_thumbnail_noimage50x50_x2.png"></a></div>
                                                    <div class="als_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimage.hellomarket.com/web/2019/item/img_itemdetails_thumbnail_noimage50x50_x2.png"></a></div>
                                                    <div class="als_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimage.hellomarket.com/web/2019/item/img_itemdetails_thumbnail_noimage50x50_x2.png"></a></div>
                                                    <div class="als_item als_item_other"><a><img alt="작은 썸네일 이미지" class="thumbnail_img" src="https://ccimage.hellomarket.com/web/2019/item/img_itemdetails_thumbnail_noimage50x50_x2.png"></a></div>
                                                </div>
                                            </div>
                                            <div class="als_next"></div>
                                        </div>
                                    </div>
                                    <div class="item_info">
                                        <div class="item_title_area"><span class="item_tag"><span class="used_type_tag">새상품</span><span class="delivery_tag used_type_tag_active  used_type_tag_active">배송비별도</span><span class="share_box item_share_box"><img src="https://ccimage.hellomarket.com/web/2018/item/btn_share_16x16_x2.png" alt="공유이미지" class="share_icon"></span><span class="wish_box"><img src="https://ccimage.hellomarket.com/web/2020/item/ico_zzim_24x23_s_x2.png" alt="찜하기이미지" class="wish_icon"><label>2</label></span></span></div><span class="item_title">14k 반지</span>
                                        <div class="item_price_box item_price_box_bottom">
                                            <div class="item_price_box_bottom_low">
                                                <div class="item_price item_price_bottom">260,000원</div>
                                                <div class="item_coupon_download">
                                                    <div class="download_title">할인 쿠폰 받기</div>
                                                    <div class="download_image"><img src="https://ccimage.hellomarket.com/web/2019/item/ico_download_white_x2.png" alt="다운로드 이미지"></div>
                                                </div>
                                            </div>
                                            <div class="item_sns item_detail_sns">
                                                <div class="item_hello_box">
                                                    <div class="item_hello_box_talk">
                                                        <div class="wish_img_box"><img src="https://ccimage.hellomarket.com/web/2018/item/ico_zzim.png" alt="찜하기이미지" class="wish_icon"></div><button type="button" class="hello_talk_btn canpayment_hello_talk_btn">헬로톡</button>
                                                    </div>
                                                    <div class="item_hello_box_pay item_hello_box_chat_pay"><button type="button" class="hello_pay_btn">헬로페이 구매</button></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="detail_box_bottom detail_box_item" style="padding-top: 20px;">
                                    <div class="detail_comment">
                                        <div class="pc_item_user_info">
                                            <div class="profile_img"><a href="/s/@1388926"><img class="profile" src="https://ccimg.hellomarket.com/images/2018/member_profile/06/28/15/3517_277815_1.jpg?size=s4" alt="모바일 상품 회원 프로필 이미지"><img class="profile_img_level" src="https://ccimage.hellomarket.com/web/2020/item/img_level_3.png" alt="뱃지 이미지"></a></div>
                                            <div class="nick"><a href="/s/@1388926">최저가금방</a>
                                                <div class="detail_member_level">Lv 3 브론즈</div>
                                            </div>
                                            <div class="item_count"><a href="/s/@1388926?type=item"><span class="item_count_title">상품</span><span class="item_count_number">169</span></a></div>
                                            <div class="detail_profile_review"><a href="/s/@1388926?tab=review"><span class="review_label">거래후기</span><span class="item_count_rating">(10)</span><span class="item_count_rating_image"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 모바일 별점 한개 이미지 1"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 모바일 별점 한개 이미지 2"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 모바일 별점 한개 이미지 3"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 모바일 별점 한개 이미지 4"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 모바일 별점 한개 이미지 5"></span></a></div>
                                        </div>
                                        <div class="description">
                                            <div class="description_title">상세설명</div>
                                            <div class="detail_item_description">
                                                <div class="description_text">안녕하세요^^14k 18k쥬얼리 상점 입니다 <br> <br> <br>♥구매및상담 문의 / 카톡Id:kkh1122 번호:010-9022-7136 <br>♥♥상품정보♥♥ <br>★14k상품중량- 5.5g <br>가격:26만 <br> <br> <br> <br>▶14k/18k Gold보증서첨부 <br>▶케이스 포장 (선물용으로 좋아요^^) <br>▶기성 상품 구매시 당일 배송가능 <br> <br>- 기성제품 설명 - <br>#귀걸이 <br>#팔찌 길이:17.5cm <br>#목걸이 길이:42cm <br>#반지사이즈:남18호 여12호 <br>▶반지 당일발송 구매시 조절은 ±3호 정도가능하며 당일 오후4시전 주문건에 한해서 당일 택배발송 됩니다 <br> <br>※호수에따라 ±10% 중량오차가 있을수있습니다. <br>※ 귀금속 제품은 환불이 안되오니 신중한 구매부탁드립니다 <br></div>
                                            </div>
                                        </div>
                                        <div class="detail_bottom_box">
                                            <div class="detail_bottom_area"><img src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_time_x2.png" alt="지도아이콘" class="item_location_img"><span class="time">2일전</span></div>
                                            <div class="detail_bottom_area"><img src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_location_x2.png" alt="지도아이콘" class="item_location_img"><span>서울 종로구 봉익동</span></div>
                                            <div class="detail_bottom_area"><img src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_category_x2.png" alt="지도아이콘" class="item_location_img"><a href="/search?category=HAC0000"><span>신발,가방,잡화</span></a>
                                                <div> &gt; </div><a href="/search?category=HAC0007"><span>시계,보석</span></a>
                                            </div>
                                        </div>
                                        <div class="item_buy_area">
                                            <div class="item_wish_box">
                                                <div class="item_wish_box_border"><button type="button" class="image_wish_box_btn"><img src="https://ccimage.hellomarket.com/web/2018/item/ico_zzim.png" alt="찜하기이미지" class="ad_wish_icon"></button></div>
                                            </div>
                                            <div class="item_talk_box">
                                                <div class="item_talk">헬로톡</div>
                                            </div>
                                            <div class="item_buy_box"><button type="button" class="item_buy">헬로페이 구매</button></div>
                                        </div>
                                        <div class="item_user_info mobile_item_user_info">
                                            <div class="profile_img"><a href="/s/@1388926"><img src="https://ccimg.hellomarket.com/images/2018/member_profile/06/28/15/3517_277815_1.jpg?size=s4" alt="상품 상세 회원 프로필 이미지"></a></div>
                                            <div class="nick"><a href="/s/@1388926">최저가금방</a></div>
                                            <div class="item_count"><span class="member_level">Lv 3 브론즈</span><span class="item_count_middot">・</span><span class="item_count_rating_image"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 별점 한개 이미지 1"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 별점 한개 이미지 2"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 별점 한개 이미지 3"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 별점 한개 이미지 4"><img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_16x16_x2.png" alt="상품 상세 별점 한개 이미지 5"></span><span class="item_count_rating">(10)</span></div><span class="item_count_number mw_item_count_number">상품 169개</span>
                                        </div>
                                        <div class="comment_title">
                                            <div class="comment_title_comment">댓글</div><span>(0)</span>
                                        </div>
                                        <div class="input_custorm">
                                            <div class="cm_in_box"><textarea type="text" placeholder="댓글을 입력해주세요." class="input_txt"></textarea></div>
                                            <div class="cms_btn_box">
                                                <div class="comment_send_btn">댓글등록</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pc_display_center" style="height: auto !important;"><ins class=" adsbygoogle" data-ad-client="ca-pub-9169594828612333" data-ad-slot="9845669852" data-ad-layout="" data-ad-layout-key="" data-ad-format="auto" data-full-width-responsive="false" style="width: 970px; height: 350px; display: inline-block;" data-adsbygoogle-status="done"><ins id="aswift_2_expand" style="display: inline-table; border: none; height: 350px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 970px; background-color: transparent;"><ins id="aswift_2_anchor" style="display: block; border: none; height: 350px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 970px; background-color: transparent; overflow: hidden;"><iframe id="aswift_2" name="aswift_2" style="left: 0px; position: absolute; top: 0px; border: 0px; width: 970px; height: 350px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="970" height="350" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-9169594828612333&amp;output=html&amp;h=280&amp;slotname=9845669852&amp;adk=3806366087&amp;adf=286206833&amp;w=970&amp;fwrn=1&amp;fwrnh=100&amp;lmt=1588138289&amp;rafmt=1&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=970x280&amp;url=https%3A%2F%2Fwww.hellomarket.com%2Fitem%2F166593275%3FviewPath%3Dmain_feed%26clickPath%3Dhome%26feedType%3Dranking%26featuredFeedType%3DRankingItem%26escrowType%3Dcommon%26feedPosition%3D3&amp;flash=0&amp;fwr=0&amp;fwrattr=false&amp;rh=250&amp;rw=970&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;dt=1588138289907&amp;bpp=1&amp;bdt=946512&amp;idt=1&amp;shv=r20200427&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dd077faa77778f306%3AT%3D1583485911%3AS%3DALNI_MZ4jvWIHPkHvPhWKywGCZFHfS2HIA&amp;crv=1&amp;prev_fmts=250x336%2C0x0%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C250x336%2C160x600&amp;nras=1&amp;correlator=3639033420052&amp;frm=20&amp;pv=1&amp;ga_vid=1440211444.1583485911&amp;ga_sid=1588137344&amp;ga_hid=1951705424&amp;ga_fc=0&amp;iag=0&amp;icsg=561034296895&amp;dssz=25&amp;mdo=0&amp;mso=0&amp;u_tz=540&amp;u_his=16&amp;u_java=0&amp;u_h=1120&amp;u_w=1792&amp;u_ah=1024&amp;u_aw=1792&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=11&amp;ady=1845&amp;biw=991&amp;bih=913&amp;scr_x=0&amp;scr_y=0&amp;eid=21065472%2C21065474%2C44716443%2C44716445&amp;oid=3&amp;psts=AKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2C%2C%2C%2C&amp;pvsid=3798168746060099&amp;pem=294&amp;ref=https%3A%2F%2Faccount.hellomarket.com%2Flogin%3Fcontinue_url%3Dhttps%253A%252F%252Fwww.hellomarket.com%252F&amp;rx=0&amp;eae=0&amp;fc=896&amp;brdim=0%2C23%2C0%2C23%2C1792%2C23%2C1792%2C1024%2C991%2C913&amp;vis=1&amp;rsz=%7C%7CoeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8336&amp;bc=31&amp;ifi=36&amp;uci=a!10&amp;btvi=22&amp;fsb=1&amp;xpc=umeGIEaoYI&amp;p=https%3A//www.hellomarket.com&amp;dtd=17" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!10" data-google-query-id="CK-EjJX0jOkCFdh6iwodOzcBBw" data-load-complete="true"></iframe></ins></ins></ins></div>
                    <div class="item_relation_wrapper">
                        <div class="item_relation">
                            <div class="item_relation_normal_title">이런 상품은 어때요?</div>
                            <div class="item_relation_item_list">
                                <div>
                                    <div class="infinite-scroll-component " style="height: auto; overflow: hidden auto;">
                                        <ul>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166591808?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/27/11/1248276_2561936_1.jpg?size=s4" alt="14k반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k반지</div>
                                                            <div class="item_price relation_item_price">380,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/160729889?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2018/item/12/16/18/5157_2738734_1.jpg?size=s4" alt="레이싱휠 거치대의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">레이싱휠 거치대</div>
                                                            <div class="item_price relation_item_price">50,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166583977?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/26/15/4624477_4131060_1.jpg?size=s4" alt="14k반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k반지</div>
                                                            <div class="item_price relation_item_price">115,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/161256958?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/02/06/12/5245_3660789_1.jpg?size=s4" alt="아리아퍼니처 엔틱 빈티지 4인식탁세트의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">아리아퍼니처 엔틱 빈티지 4인식탁세트</div>
                                                            <div class="item_price relation_item_price">400,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166566056?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/24/22/0159116_3056614_1.jpg?size=s4" alt="14k 반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 반지</div>
                                                            <div class="item_price relation_item_price">120,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/162219497?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/04/23/21/3138_4071694_1.jpg?size=s4" alt="14k 하트반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 하트반지</div>
                                                            <div class="item_price relation_item_price">143,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166620703?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/29/13/3311234_3342475_1.jpg?size=s4" alt="14k 반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 반지</div>
                                                            <div class="item_price relation_item_price">210,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/162380126?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/05/11/20/5823_3361655_2.jpg?size=s4" alt="14K로렉스팔찌+반지12호의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14K로렉스팔찌+반지12호</div>
                                                            <div class="item_price relation_item_price">950,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166582315?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/26/12/5545182_4867421_1.jpg?size=s4" alt="14k반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k반지</div>
                                                            <div class="item_price relation_item_price">290,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166535472?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/22/18/2617133_1107191_2.jpg?size=s4" alt="필그림 14k 반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">필그림 14k 반지</div>
                                                            <div class="item_price relation_item_price">80,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/162733399?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/06/07/14/3608_277815_1.png?size=s4" alt="14k 나사목걸이의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 나사목걸이</div>
                                                            <div class="item_price relation_item_price">140,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166579166?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/26/00/5006189_4099160_1.jpg?size=s4" alt="14k 블루큐 반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 블루큐 반지</div>
                                                            <div class="item_price relation_item_price">202,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/162880835?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/06/19/17/2855_887945_1.jpg?size=s4" alt="특특가[95~110] (정품) 디스커버리 남성 에어닷 공유 블루종의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">특특가[95~110] (정품) 디스커버리 남성 에어닷 공유 블루종</div>
                                                            <div class="item_price relation_item_price">59,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166562496?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/24/17/4244024_4667984_1.jpg?size=s4" alt="14k 반지 귀걸이의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 반지 귀걸이</div>
                                                            <div class="item_price relation_item_price">270,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/162887713?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/06/20/09/0152_563727_1.jpg?size=s4" alt="14k 샤엘 민써클 팔찌의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 샤엘 민써클 팔찌</div>
                                                            <div class="item_price relation_item_price">235,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166565792?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/06/13/19/3033_4202918_1.jpg?size=s4" alt="✔14k컷팅반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">✔14k컷팅반지</div>
                                                            <div class="item_price relation_item_price">24,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/163029254?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/07/02/11/0122_277815_1.png?size=s4" alt="14k 18k 커플링의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 18k 커플링</div>
                                                            <div class="item_price relation_item_price">250,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166584470?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/26/16/3020704_4884394_1.jpg?size=s4" alt="14k 티파니반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 티파니반지</div>
                                                            <div class="item_price relation_item_price">150,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/163147793?viewPath=together&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2019/item/07/12/11/3816_277815_5.png?size=s4" alt="14k 18k 컷팅 사각 두줄팔찌의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k 18k 컷팅 사각 두줄팔찌</div>
                                                            <div class="item_price relation_item_price">290,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                            <div>전문</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="main_col_4"><a class="card card_list relation_card_list" href="/item/166552489?viewPath=similar&amp;clickPath=relation">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/04/23/21/5744168_4631756_1.jpg?size=s4" alt="14k진주반지의 사진" class="thumbnail_img"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title relation_item_title">14k진주반지</div>
                                                            <div class="item_price relation_item_price">290,000원</div>
                                                        </div>
                                                        <div class="item_type">
                                                            <div>헬로페이</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="relation_image_wish_box image_wish_box"><button type="button" class="image_wish_box_btn"><svg viewBox="0 0 24 24" fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2" focusable="false" aria-label="찜하기" role="img" stroke-linecap="round" stroke-linejoin="round" class="image_wish_box_img">
                                                            <path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path>
                                                        </svg></button></div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>