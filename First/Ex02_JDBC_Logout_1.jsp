<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.invalidate(); //세션값을 없애고 새로운 세션 값을 얻음 
    	response.sendRedirect("Ex02_JDBC_Login.jsp");
    %>
