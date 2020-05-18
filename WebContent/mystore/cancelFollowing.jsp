<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*"%>
<%@ page import = "follow.*" %>
<%
	String myNick = request.getParameter("myNick");
	String yourNick =request.getParameter("yourNick");
	
	FollowDAO followDAO = new FollowDAO();
	
	followDAO.cancelFollow(myNick, yourNick);
	
%>