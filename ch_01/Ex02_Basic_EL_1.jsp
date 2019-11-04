<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Date day = new Date();
    	
    	request.setAttribute("now", day);
    	session.setAttribute("now2", day);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 목적</h3>
	기존방식 : <%=request.getAttribute("now") %> <br>
	EL requestScope 생략 : ${now } <br>
	EL 습관식 (requestScope): ${requestScope.now } <br>
	EL 습관식 (sessionScope): ${sessionScope.now2 } <br>
</body>
</html>