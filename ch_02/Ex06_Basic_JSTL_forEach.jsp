<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		<h3> JSTL for문 </h3>
		
		<c:forEach var="i" begin="1" end="10"> <!-- 변수 i에 시작 1부터 끝에 10까지 반복 -->
			${i }<br> <!-- 출력 -->
		</c:forEach>
		
		<hr>
		
		<h3> JSTL for문 누적</h3>
		<c:forEach var="i" begin="1" end="10">
			<c:set var="sum" value="${sum+i }"/> <!-- 변수 sum에 EL로 값을 sum에 i값을 누적 -->
			
		</c:forEach>
		누적값 : ${sum }
		
		<hr>
		<h3> JSTL & EL 구구단 9단까지 출력 </h3>
		<table border="1">
		<c:forEach var="i" begin="2" end="9"> <!-- 중첩 for문 가능  -->
			<c:forEach var="j" begin="1" end="9">
				<tr><td>${i }*${j }</td><td>${i*j }</td></tr>
			</c:forEach>
		</c:forEach>
		</table>
		
		<hr>
		<h3> 구구단 + 단수 마다 색깔 표시</h3>
		<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
			<c:choose>
				<c:when test="${j==0 }"> <!-- if문과 유사  -->
					<tr bgcolor="yellow" ><th>${i }단</th></tr>
				</c:when>
				<c:otherwise> 
					<tr><td>${i }*${j }</td><td>${i*j }</td></tr>
				</c:otherwise>
			</c:choose>		
			</c:forEach>
		</c:forEach>
		</table>
		
		<hr>
		<h3>JSTL forEach 객체</h3>
		<%
			int[] arr = new int[]{10,20,30,40,50}; //자바 코드 배열생성
		
			for(int i : arr) { //개선된 for문
				out.print("출력값 : " + i + "<br>"); //출력문 
			}
		
		%>
		<h3>[★★★EL JAVA 객체 직접접근 불가능★★★] </h3>
		<h3>JSTL에 변수를 사용 데이터를 담은후 EL</h3>
		
		arr 배열 [객체] 접근불가 : ${arr } <br>
		<c:set var="intarr" value="<%=arr %>"/> <!-- value값 arr을 변수 intarr에 저장 -->
		c:set 변수에 접근 : ${intarr }<br>
		<hr>
		
		<h3>Java에서의 개선된 for문 (items 제공)</h3>
		<!-- 자바 : for(String s : list) {}  -->
		<c:forEach var="i" items="${intarr }"> <!-- 반복문 객체에 접근한 EL안에 반복대상객체를 변수 i에 저장-->
			배열값 1 : ${i }<br>
		</c:forEach>
		
		<h3> 단순하게 ... (편하게) </h3>
		<c:forEach var="i" items="<%=arr %>"> 
			배열값 2 : ${i }<br>
		</c:forEach>
		
		<h3>재미 삼아서 ...</h3>
		<c:forEach var ="i" items="<%=new int[]{1,2,3,4,5} %>"> <!-- 값에 바로 객체를 생성 가능 잘 사용하지 않음 -->
			배열값 3 : ${i }<br>
		</c:forEach>
		
		<h3>forEach문 활용하기 2</h3>
		<c:forEach var="i" items="${intarr }" varStatus="status">
			index 0 ~ :${status.index } &nbsp;&nbsp;&nbsp;
			count 1 ~ :${status.count } &nbsp;&nbsp;&nbsp;
			value i값 : ${i } <br>
		</c:forEach>
		
		<h3>TODAY POINT (JSTL forEach 활용)</h3>
		
		<%
			List<Emp> emplist = new ArrayList<>();
		
			emplist.add(new Emp(1000,"A"));
			emplist.add(new Emp(2000,"B"));
			emplist.add(new Emp(3000,"C"));
			
			//자바 코드
			for(Emp e : emplist){
				out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
			}
			
		%>
		<h3>JSTL 변환 </h3>
		<c:set var="emp" value="<%=emplist %>"/> <!-- 객체 접근 -->
			<table border="1">
				<tr><td>사번</td><td>이름</td></tr>
				<c:forEach var="i" items="${emp }">
					<tr><td>${i.empno }</td><td>${i.ename }</td></tr>
				</c:forEach>
			</table>
		
		<h3>JSTL 사용 Map 다루기</h3>
		<%
			Map<String,Object> hm = new HashMap();		
			hm.put("name","hong"); /* "key" , "value" 해쉬맵 객체 hm에 저장 */
			hm.put("pwd","1004");
			hm.put("date",new Date());
		
		%>
		
		<h3>Java Map EL & JSTL 출력</h3>
		<c:set var="hm" value="<%=hm %>"/> <!-- value에 HashMap 객체 hm을 변수 hm에 저장 -->
		 <c:forEach var="obj" items="${hm }"> <!-- 접근한 객체를 EL로 반복대상객체를 변수 obj에 저장 -->
			${obj.key} -> ${obj.value}<br> <!-- 출력문 [ obj. ]으로 접근해서 출력  -->
		</c:forEach>
		(key)name : ${hm.name}<br> <!-- 객체 접근됐으면 EL로  바로 출력가능  -->
		
		<h3>JSTL 구분자 처리 </h3>
		<c:forTokens var="token" items="A.B.C.D.E" delims="."> 
		<!-- 변수 token에 items에 있는 값을 .을 기준으로 나눔 -->
			${token }<br>
		</c:forTokens>
		
		<c:set var="nowNum" value="10"></c:set> 
		<c:forEach var="i" begin="0" end="${2016-1990 }"> <!-- 거꾸로 for문  -->
			<c:set var="yearOption" value="${2016-i }"/> <!-- 2016 ~ i값까지  -->
			<option value="${yearOption }">${yearOption }</option>
		
		</c:forEach>
</body>
</html>