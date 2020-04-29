<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    isELIgnored="false" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!-- 여기까지는 upload_ok에도 있었던 것 -->

<%@page import="Board.BoardDTO" %>
<%@page import="Board.BoardDAO" %>
<jsp:useBean id="boardDTO" class="Board.BoardDTO"/>
<jsp:useBean id="boardDAO" class="Board.BoardDAO"/>

<%
    String userNick = (String)session.getAttribute("userNick");	

	String realName="";
	int maxSize = 10 * 1024 * 1024; // 10MB
	String savePath = "/Users/kyrie/Desktop/Java/WorkSpace/HelloMarket/WebContent/upload/img/";
	System.out.println("현재경로 : " + savePath);
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024];	// 한번에 읽어들일 버퍼의 크기
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, 
				new DefaultFileRenamePolicy());
		
		uploadFile = multi.getFilesystemName("fileflow01"); // form의 input file객체이며, 실제로 업로드된 파일명 (맞다)
		
		
		System.out.println(uploadFile);
	
		File file1 = new File(savePath + uploadFile);
		
		response.sendRedirect("/HelloMarket/Main.jsp"); // 메인으로 가나 보자 (이거 이제 나중에 제품 리스트로 가는 걸로 바꿔요)
		
		
	   	BoardDTO boarddto = new BoardDTO();
	    String user_Nick = userNick;
	    String deal_m1 = multi.getParameter("deal_m1");
	    String deal_m2 = multi.getParameter("deal_m2");
	    String p_image1_path = savePath;
	    String p_title = multi.getParameter("p_title");
	    String p_m_category = multi.getParameter("p_m_category");
	    String p_s_category = multi.getParameter("p_s_category");
	    String p_description = multi.getParameter("p_description");
	    String p_trade_kind = multi.getParameter("p_trade_kind");
	    String p_price = multi.getParameter("p_price");
	    String p_delivery = multi.getParameter("p_delivery");
	    String p_exchange = multi.getParameter("p_exchange");
	    String p_status1 = multi.getParameter("p_status1");
	    String p_status2 = multi.getParameter("p_status2");
	    String p_transac_loc = multi.getParameter("p_transac_loc");
	   
	    
	    boarddto.setUserNick(user_Nick);
	
	    boarddto.setDeal_m1(deal_m1);
	    boarddto.setDeal_m2(deal_m2);
	    boarddto.setP_image1_path(p_image1_path);
	    boarddto.setP_image1_orig_name(uploadFile);
	    boarddto.setP_title(p_title);
	    boarddto.setP_m_category(p_m_category);
	    boarddto.setP_s_category(p_s_category);
	    boarddto.setP_description(p_description);
	    boarddto.setP_trade_kind(p_trade_kind);
	    boarddto.setP_price(p_price);
	    boarddto.setP_delivery(p_delivery);
	    boarddto.setP_exchange(p_exchange);
	    boarddto.setP_status1(p_status1);
	    boarddto.setP_status2(p_status2);
	    boarddto.setP_transac_loc(p_transac_loc);
	    int num = boardDAO.registBoard(boarddto);
	      
      if(num>=1){
         
         out.println("값 성공");

         
      } else {
         out.println("값 실패");
      }
	}catch(Exception e){
		e.printStackTrace();
	}    

   
%>
