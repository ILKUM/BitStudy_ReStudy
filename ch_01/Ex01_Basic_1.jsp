<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("userid"); //파라미터 userid의 값을 변수 id에 저장 
    
    	request.setAttribute("nick", "root"); //nick이라는 name에 root라는 값을 저장
    	session.setAttribute("runner", "box");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존 방식</h3>
	스크립트릿 : <b><%=id %></b>
	스크립트릿 : <%=request.getAttribute("nick") %><br>
	스크립트릿 : <%=session.getAttribute("runner") %><br>
	
	<hr>
	<h3>EL 방식</h3>
	EL request value 습관적으로 : ${requestScope.nick } <br>
	EL request value requestScope 생략 권장(x): ${nick } <br> 	
	EL session value 습관적으로 : ${sessionScope.runner }	<br>
	EL session value SessionScope 생략 권장(x): ${runner }	<br>
	
	<hr>
	<h3>EL 기본 문법 & 표현식 </h3>
	기존 연산 : <%=1004 + 777 %><br>
	EL 연산 : ${999 - 777 }<br>
	EL 문자 + 슷자 연산 : ${"999" - 777 }<br>
	EL 논리 1: ${1==1 }<br>
	EL 논리 2: ${1==2 }<br>
	EL 논리 3 : ${!false}<br>
	EL 는리 4 비어있는지 확인 (true : 비어있다 , false : 들어있다.) : ${empty y }<br>
	<%--  EL (null 값을 0변환 후 연산):${null + 1 }<br> --%>
</body>
</html>