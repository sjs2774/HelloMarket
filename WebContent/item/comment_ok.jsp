<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Comment.*" %>
<%
	CommentDAO commentDAO = new CommentDAO();
	CommentDTO commentDTO = new CommentDTO();
	String comment = request.getParameter("comment");
	String userNick = request.getParameter("userNick");
	int pIdx = Integer.parseInt(request.getParameter("pIdx"));
	
	commentDAO.insertComment(pIdx, userNick, comment);
	
%>