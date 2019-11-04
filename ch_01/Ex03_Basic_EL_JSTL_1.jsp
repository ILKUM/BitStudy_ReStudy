<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Emp e = new Emp();
	e.setEmpno(9999);
	e.setEname("kim");

	HashMap<String, String> hp = new HashMap<>();
	hp.put("text", "study");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존 방식</h3>
	<%=e%>
	<br>
	<%=e.getEmpno()%>
	<br>
	<%=e.getEname() %>
	<br>
	
	<h3>EL 방식</h3>
	자바 객체출력 [객체 직접접근 불가] : ${e } <br>
	자바객체 속성출력 : ${e.getEmpno() }
	
	<h3>JSTL 사용해서 EL로 출력 </h3>
	<c:set var="a" value="<%=e%>" />
	JSTL로 변수 l을 생성 (e객체의 주소값) : ${a} <br>
	
	<hr>
	EL 출력 (JSTL 변수 출력) : ${l} <br>
	EL 출력 (JSTL 변수  + 기존방식 *잘안씀*) : ${ a.getEmpno()} <br>
	EL 출력 (JSTL 변수 + getter 함수 호출)(member 필드 명) : ${a.empno} <br>
	EL 출력 (JSTL 변수 + getter 함수 호출)(member 필드 명)) : ${ a.ename} <br>
	
	<hr>
	<h3>JSTL 변수 만들고 Scope 정의</h3>
	<c:set var="job" value="축구선수" scope="request"></c:set>
	당신 직업은 ? : ${job} 입니다 <br>
	만약에 당신이[include][forward] 한 페이지가 있다면 그 페이지에서 job변수 사용가능 
	<hr>
	<c:set var="job2" value="야구선수" scope="request"></c:set>
	당신 직업은 ? :${job2 } 입니다<br>
	변수삭제기능 <br>
	<c:remove var="job2" ></c:remove>
	당신 직업은 ? :${job2 } 임니다.<br>
	
	<c:set var="vhp" value="<%=hp %>"> </c:set>
	hp객체:${vhp }<br>
	hp객체:${vhp.data} <br>
	
	<c:set target="${vhp}" property="color" value="red" > </c:set> 
	hp객체:${vhp}<br> <!-- EL출력  -->
</body>
</html>