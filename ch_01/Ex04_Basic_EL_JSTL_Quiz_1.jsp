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
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
		
	
%>
<%=id %><img alt="이미지" src="images/2.jpg" style="width : 100px; height : 100px">
<%
	}
%>
<h3>EL + JSTL</h3>
${param.ID }
<c:if test="${param.ID  == 'hong'}"> 
${param.ID} <img alt="이미지" src="imgages/2.jpg" style="width: 100px; height: 100px">
</c:if>
<h3>JSTL IF문 사용</h3>
<c:if test="${param.age > 33 }" var="result">
	param.value:${param.age }<br>
</c:if>
if구문의 변수 : ${result }<br>


</body>
</html>