<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = request.getParameter("name");
	if(name.equals("kglim")){
		out.print("<b>" + name + "</b>");
	}else if(name.equals("hong")){
		out.print("<i>" + name + "</i");
	}else{
		out.print("<h3>" + name + "</h3>");
	}
	out.print("<hr>");



%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> EL & JSTL 사용 (Choose 구문 : Java 코드 if() {} else if(){} .. 처리)
	Java 코드 : switch ~ case </h3>

</body>
</html>