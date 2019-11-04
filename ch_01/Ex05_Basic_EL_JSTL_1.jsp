<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h3>EL의 파라미터 받기</h3>
	${param.id} - ${param.pwd}<br>
	
	<h3>EL 파라미터 값 변수 저장</h3>
	<c:set var="userid" value="${param.id}" /> 
	<c:set var="userpwd" value="${param.pwd }" />
	
	<h3>JSTL 변수출력</h3>
	id:${userid} <br>
	pwd:${userpwd }<br>

</body>
</html>