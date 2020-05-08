<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@ page import = "Board.*" %>
<%@ page import ="java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디님의 상품 | 안녕마켓 - 100% 안전한 중고거래 장터</title>
    <link href="../css/chunk.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
    <div id="__next">
        <%
    UserDAO userDAO = new UserDAO();
    UserDTO uploaderDTO = new UserDTO();
    BoardDAO boardDAO = new BoardDAO();
    List<BoardDTO> uploaderItems = new ArrayList<BoardDTO>();
    BoardDTO boardDTO = new BoardDTO();
    int uploaderLevel = 0;
   	int uploaderIdx =0;
   	int uploaderItemCnt = 0;
    String uploaderLevelName = null;   
        
        
	String userId = null;
	String userNick = null;
	String userProfile = null;
	int sellerLevel = 0;
	String levelName = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		userProfile = (String) session.getAttribute("userProf");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	
	if(sellerLevel==1){
		levelName = "화이트";
	}else if(sellerLevel==2){
		levelName ="블루";
	}else{
		levelName="브론즈";
	}
	if(request.getParameter("userIdx") != null){
		
		uploaderIdx = Integer.parseInt(request.getParameter("userIdx"));
		uploaderDTO = userDAO.getUserInfo(uploaderIdx);
		uploaderItemCnt = boardDAO.showUserItemCnt(uploaderDTO.getUserNick());
		uploaderItems = boardDAO.showUserItem(uploaderDTO.getUserNick());
		
	}
	
%>
      
        
          <header class="">
      <div class="bar hide"></div>
      <section class="header_top">
        <div class="header_logo header_logo_s">
          <div class="log_box"><a href="../Main.jsp"><img src="../img/MarketMain.png" class="logo" alt="헬로마켓"><img
                src="https://ccimage.hellomarket.com/web/2020/common/img_title_logo.png" class="mobile_logo"
                alt="헬로마켓"></a></div>
<%
	if(userId == null ){
%>
   	<script>
   		alert('로그인을 해주세요');
   		location.href = "../login/login.html";
   	</script>
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
            <div class="gnb_my_lyr test_type"><a href="mystore/level.jsp">
                <div class="gnb_my_member_level">
<%
		  if(sellerLevel==1){
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level1_30.png" alt="뱃지 이미지">
<% 			  
		  }else if(sellerLevel==2){
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level2_30.png" alt="뱃지 이미지">
<%
		  }else{
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level3_30.png" alt="뱃지 이미지">
<% 
		  }
%>
                  <div><span class="level_description">나의등급</span><span class="level_description_name"><%=levelName %></span></div>
                </div>
              </a>
              <ul class="gnb_my_list">
              	<a href="/HelloMarket/mystore/index.jsp?<%=userNick%>">
                  <li class="gnb_my_list_first">내상점</li>
                </a>
                <a href="/HelloMarket/mystore/coupon.jsp">
                  <li>할인쿠폰</li>
                </a>
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
                  <div class="mobile_login_wrapper">
                    <div class="btn_close_wrapper"><input type="checkbox" class="close_checkbox chkbox1" id="btnClose"
                        name="btnClose"><button type="button" class="btn_close" for="btnClose">닫기</button></div>
                    <div class="member_info"><a class="nick" href="/s/@15979427?tab=item">
                        <div class="profile_wrapper"><img src="../img/img_default_profile_60x60.png"
                            alt="n15979427의 프로필 사진" id="loginProfileImg" class="profile_img"></div>
                        <div class="member_info_txt">n15979427</div>
                      </a></div>
                  </div>
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
          <div class="sellimg_sub_box header_wrapper_sub">
            <div class="selling_bot"><img src="../img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span
                class="selling_bot_text">판매하기</span></div>
          </div>
          <div class="link_box header_wrapper_sub">
            <ul>
              <li><a href="/community/list.hm?category=DAC0002&amp;status=begin">이벤트</a></li>
              <li><a href="/help/faq.html">헬프센터</a></li>
              <li><a href="ad/index.html" target="_blank" rel="noopener noreferrer"><img
                    src="../img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
            </ul>
          </div>
        </div>
      </section>
    </header>

        <section class="content">
            <div class="item_list_area">
                <h1> 회원프로필 </h1>
                <div class="breadcrumbs" id="breadcrumbs">
                    <ul>
                        <li><a href="/">HOME</a></li>
                        <li> &gt; <a href="/s/@14474743?type=item">나의메뉴</a></li>
                    </ul>
                </div>
                <div class="main_area">
                    <div class="main_area_center">
                        <div class="main">
                            <h2> 회원프로필 영역</h2>
                            <%
                            	if(uploaderIdx != 0){
                           	%>
                            		<div class="my_profile_left">
                                    <div class="my_profile_info">
                                        <div class="my_profile_image"><img
                                                src="../img/img_apply_profile_4x_0419.png"
                                                alt="n14474743의 프로필 이미지"><img
                                                src="../img/img_level_5_x2.png"
                                                alt="뱃지 이미지"></div>
                                        <div class="my_profile_nick"><%=uploaderDTO.getUserNick() %></div>
                                        <div class="my_profile_shop_created">
                                            <div class="my_profile_start_mobile">태조 2년 시작</div>
                                            <div class="my_profile_shop"><a href="/m/profile"><button
                                                        type="button">상점주소생성</button></a></div>
                                            <div class="my_profile_start">태조 2년 시작</div>
                                        </div>
                                        <div class="my_profile_follow"><a href="/m/following">
                                                <div class="my_profile_follow_count"><span>팔로잉</span><span><%=uploaderDTO.getUserFollowing() %></span></div>
                                            </a>
                                            <div class="my_profile_follow_line">|</div><a href="/m/followers">
                                                <div class="my_profile_follow_count"><span>팔로워</span><span><%=uploaderDTO.getUserFollower() %></span></div>
                                            </a>
                                        </div>
                                        <div class="my_profile_pro_review">
                                            <div class="my_profile_pro_review_box"><a
                                                    href="/s/@14474743?tab=item"><span>상품</span><span><%=uploaderItemCnt %></span></a></div>
                                            <div class="my_profile_pro_review_box"><a
                                                    href="/s/@14474743?tab=review"><span>거래후기</span><span>123871</span>
                                                    <div class="my_profile_pro_review_rating"><img
                                                            src="../img/img_review_star_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 1"><img
                                                            src="../img/img_review_star_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 2"><img
                                                            src="../img/img_review_star_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 3"><img
                                                            src="../img/img_review_star_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 4"><img
                                                            src="../img/img_review_star_half_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 5"></div>
                                                </a></div>
                                        </div><span class="my_profile_more_text" width="0"><span><span><%=uploaderDTO.getUserProf() %></span></span><span
                                                style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><span
                                                    class="text_trcucate_more">... <p>전체보기</p></span></span></span>
                                    </div>
                                    <div class="my_profile_nav">
                                        <ul>
                                            <li class="my_profile_m_nav"><a class="active active" id="undefined"
                                                    href="/s/@14474743?tab=item"><span>상품 0</span></a></li>
                                            <li class="my_profile_m_nav"><a
                                                    href="/s/@14474743?tab=review"><span>거래후기&nbsp;</span><span>0</span>
                                                    <div class="my_profile_pro_review_rating"><img
                                                            src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 1"><img
                                                            src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 2"><img
                                                            src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 3"><img
                                                            src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 4"><img
                                                            src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                            alt="프로필 별점 없는 이미지 5"></div>
                                                </a></li>
                                            <li><a href="level.jsp"><span>나의 등급</span></a></li>
                                            <li><a href="profile.jsp"><span>내정보 설정</span></a></li>
                                            <li><a href="/m/specialist/list.hm"><span>전문판매자 신청</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            <% 
                            	}else{
                            %>
                            <div class="my_profile_left">
                                <div class="my_profile_info">
                                    <div class="my_profile_image"><img
                                            src="../img/img_apply_profile_4x_0419.png"
                                            alt="n14474743의 프로필 이미지"><img
                                            src="../img/img_level_5_x2.png"
                                            alt="뱃지 이미지"></div>
                                    <div class="my_profile_nick"><%=userNick %></div>
                                    <div class="my_profile_shop_created">
                                        <div class="my_profile_start_mobile">태조 2년 시작</div>
                                        <div class="my_profile_shop"><a href="/m/profile"><button
                                                    type="button">상점주소생성</button></a></div>
                                        <div class="my_profile_start">태조 2년 시작</div>
                                    </div>
                                    <div class="my_profile_follow"><a href="/m/following">
                                            <div class="my_profile_follow_count"><span>팔로잉</span><span>7777</span></div>
                                        </a>
                                        <div class="my_profile_follow_line">|</div><a href="/m/followers">
                                            <div class="my_profile_follow_count"><span>팔로워</span><span>60억명</span></div>
                                        </a>
                                    </div>
                                    <div class="my_profile_pro_review">
                                        <div class="my_profile_pro_review_box"><a
                                                href="/s/@14474743?tab=item"><span>상품</span><span>555555</span></a></div>
                                        <div class="my_profile_pro_review_box"><a
                                                href="/s/@14474743?tab=review"><span>거래후기</span><span>123871</span>
                                                <div class="my_profile_pro_review_rating"><img
                                                        src="../img/img_review_star_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 1"><img
                                                        src="../img/img_review_star_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 2"><img
                                                        src="../img/img_review_star_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 3"><img
                                                        src="../img/img_review_star_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 4"><img
                                                        src="../img/img_review_star_half_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 5"></div>
                                            </a></div>
                                    </div><span class="my_profile_more_text" width="0"><span><span>이 시대 최고의 판매왕</span></span><span
                                            style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><span
                                                class="text_trcucate_more">... <p>전체보기</p></span></span></span>
                                </div>
                                <div class="my_profile_nav">
                                    <ul>
                                        <li class="my_profile_m_nav"><a class="active active" id="undefined"
                                                href="/s/@14474743?tab=item"><span>상품 0</span></a></li>
                                        <li class="my_profile_m_nav"><a
                                                href="/s/@14474743?tab=review"><span>거래후기&nbsp;</span><span>0</span>
                                                <div class="my_profile_pro_review_rating"><img
                                                        src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 1"><img
                                                        src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 2"><img
                                                        src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 3"><img
                                                        src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 4"><img
                                                        src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png"
                                                        alt="프로필 별점 없는 이미지 5"></div>
                                            </a></li>
                                        <li><a href="level.html"><span>나의 등급</span></a></li>
                                        <li><a href="profile.jsp"><span>내정보 설정</span></a></li>
                                        <li><a href="/m/specialist/list.hm"><span>전문판매자 신청</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <% } %>
                            <h2> 회원 탭 영역 </h2>
                            <%
                            	if(uploaderIdx!=0){
                            %>
                            	<section class="left_main profile_right_main">
                                <div class="tab_content">
									    <div>
									        <div class="infinite-scroll-component " style="height: auto; overflow: auto;">
									            <ul class="mian_row profile_main_row">
									            <%
									            	for(BoardDTO b : uploaderItems){
									            %>
									                <li class="main_col_3"><a class="card card_list" href="/HelloMarket/item/item.jsp?p_idx=<%=b.getP_idx()%>">
									                        <div class="card_box">
									                            <div class="image_wrapper">
									                                <div class="image_outside">
									                                    <div class="image_centerbox">
									                                    <img src="/HelloMarket/upload/img/<%=b.getP_image1_orig_name() %>" class="thumbnail_img" alt="<%=b.getP_title()%> "></div>
									                                </div>
									                            </div>
									                            <div class="cont">
									                                <div class="item_title"><%=b.getP_title() %> </div>
									                                <div class="item_price"><%=b.getP_price() %></div>
									                            </div>
									                        </div>
									                    </a></li>
									                    <%} %>
									                
									            </ul>
									        </div>
									    </div>
									    <div class="paging">
									        <ul>
									            <li></li>
									            <li class="active"><a href="/s/@15979427?type=item&amp;page=1">
									                    <div class="paging_box">1</div>
									                </a></li>
									            <li></li>
									        </ul>
									    </div>
									</div>
									                                    
                                    	
                                    
                                    
                                  
                            </section>
                            <% 
                            	}else{
                            %>
                            <section class="left_main profile_right_main">
                                <div class="tab_content">
                                    <div class="my_profile_item_menu">
                                        <ul>
                                            <li class="active"><a class="active">판매상품</a>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="cat_box">
                                        <div class="my_specialist_name">전체&nbsp;<span>0</span></div>
                                        <div class="profile_right_search">
                                            <div class="tab_type profile_tab_type">
                                                <ul><a href="/s/@14474743?tab=item&amp;tabType=list">
                                                        <li class="list"></li>
                                                    </a><a href="/s/@14474743?tab=item&amp;tabType=thumbnail">
                                                        <li class="thumbnail active"></li>
                                                    </a></ul>
                                            </div>
                                            <div class="regist_search_category_profile">
                                                <form><input type="text" placeholder="상품명 검색" class="keyword_search"
                                                        value=""><img
                                                        src="../img/img_search_n.png"
                                                        alt="카테고리 검색 아이콘" class="keyword_image"></form>
                                            </div>
                                        </div>
                                        <div class="regist_category_profile"><select>
                                                <option value="">카테고리 전체</option>
                                            </select></div>
                                    </div>
                                    
                                    	<div class="tab_content">
                                        <ul class="mian_row profile_main_row">
                                            <li class="main_col_3"><a class="card card_list" href="/item/166077188?viewPath=profile">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/03/18/20/4008287_4868316_1.jpeg?size=s4" class="thumbnail_img" alt="아이패드5321"><img src="https://ccimage.hellomarket.com/web/2019/item/img_tag_sale_itemlist_card_reserve_hellopay_x2.png" alt="예약중" class="thumbnail_state_img"></div>
                                                                <div class="dealer_text_position"><img src="../img/ico_badge_thumbnail_hellopay.png" alt="헬로페이 아이콘"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title">아이패드5321</div>
                                                            <div class="item_price">100원</div>
                                                        </div>
                                                    </div>
                                                </a></li>
                                        </ul>
                                    </div>
                                    
                                    <div class="tab_content">
                                        <ul class="mian_row profile_main_row">
                                            <li class="main_col_3"><a class="card card_list" href="/item/166077188?viewPath=profile">
                                                    <div class="card_box">
                                                        <div class="image_wrapper">
                                                            <div class="image_outside">
                                                                <div class="image_centerbox"><img src="https://ccimg.hellomarket.com/images/2020/item/03/18/20/4008287_4868316_1.jpeg?size=s4" class="thumbnail_img" alt="아이패드5321"><img src="https://ccimage.hellomarket.com/web/2019/item/img_tag_sale_itemlist_card_reserve_hellopay_x2.png" alt="예약중" class="thumbnail_state_img"></div>
                                                                <div class="dealer_text_position"><img src="../img/ico_badge_thumbnail_hellopay.png" alt="헬로페이 아이콘"></div>
                                                            </div>
                                                        </div>
                                                        <div class="cont">
                                                            <div class="item_title">아이패드5321</div>
                                                            <div class="item_price">100원</div>
                                                        </div>
                                                    </div>
                                                </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </section>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="footer">
            <div class="footer_area">
                <div class="footer_top">
                    <div class="f_wrapper">
                        <ul class="f_left">
                            <li><a href="http://company.hellomarket.com" class="link_info" target="_blank"
                                    rel="noopener noreferrer">Hellomarket Inc.</a></li>
                            <li><a class="link_info" href="/help/faq.hm">FAQ</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/terms.hm">이용약관</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/protection.hm">개인정보 처리방침</a></li>
                        </ul>
                        <ul class="f_right">
                            <li><a href="https://itunes.apple.com/kr/app/id469381475?mt=8&amp;ls=1" target="_blank"
                                    rel="noopener noreferrer"><img
                                        src="../img/img_footer_appstore.png"
                                        alt="appstore" class="appstore_n_btn"></a></li>
                            <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket"
                                    target="_blank" rel="noopener noreferrer"><img
                                        src="../img/img_footer_googleplay.png"
                                        alt="googleplay" class="googleplay_n_btn"></a></li>
                            <li><a href="https://blog.naver.com/tuckandco" target="_blank"
                                    rel="noopener noreferrer"><img
                                        src="../img/img_naver_gray_blog.png"
                                        alt="naverblog" class="naver_blog_n_btn"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer_bottom">
                    <div class="f_wrapper">
                        <div class="footer_wrapper_left">
                            <div class="fb_logobox"><img
                                    src="../img/img_footer_logo_171127.png"
                                    alt="hellomarket"></div>
                            <ul class="footer_company_info">
                                <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                                <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a
                                            href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305"
                                            class="link_info" target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">사업자정보확인</a></span></li>
                                <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                                <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm"
                                            target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">헬프센터 - 문의</a></span><span> | <a
                                            href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200"
                                            target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">제휴문의</a></span></li><br>
                                <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지
                                        않습니다.</span></li>
                                <li><span>©(주)헬로마켓. All rights reserved.</span></li>
                            </ul>
                        </div>
                        <div class="footer_wrapper_right">
                            <ul class="box">
                                <li style="font-weight: bold;">기업은행 구매 안전 서비스 (채무지급보증)</li>
                                <li>안전거래를 위해 현금 등으로 결제 시,</li>
                                <li>저희 사이트에서 가입한 기업은행의</li>
                                <li>구매안전서비스를 이용하실 수 있습니다.</li>
                                <li><img src="../img/btn_footer_service_n.png"
                                        alt="services" class="footer_service_btn"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../js/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="../js/mystore_index.js"></script>

</html>