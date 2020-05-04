<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Board.*"%>
<%@ page import = "User.*" %>
<%
	int pIdx = Integer.parseInt(request.getParameter("pIdx"));
	int userIdx = Integer.parseInt(request.getParameter("userIdx"));
%>