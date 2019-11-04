<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{border: 1px solid black; border-collapse: collapse;}
		
		tr{border: 1px solid blue; background-color: white; color: black}
		
		td{border: 1px solid red; }
		
	</style>
</head>
<body>
<!--  
	JDBC
	1. 드라이버 참조 (WEB > Webcontent > WEB-INF > lib > 붙여넣기 (ojdbc6.jar)
	2. 드라이버 메모리 로딩 : class.forName("드라이버 클래스명")
	3. DB 연결(연결문자열 : 서버 IP, PORT , 계정 , 비번 )
	
	JAVA JDBC API(Interface , class 제공)
	Connection
	Statement
	PrepareStatement
	ResultSet
	
-->
<table>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>급여</th>
		<th>직종</th>
	</tr>
<%
	Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 임포트(?)
	Connection conn = null; 
	Statement stmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004"); //DB 연결 
	//out.print(conn.isClosed());
	
	stmt = conn.createStatement();
	String sql= "select empno ,ename , sal , job from emp";
	
	rs = stmt.executeQuery(sql);
	while(rs.next()){ //rs의 값이 있으면
%>
	<tr>
		<td><%= rs.getInt(1) %></td> <!-- select 문 순으로 empno -->
		<td><%= rs.getString("ename") %></td><!-- ename -->
		<td><%= rs.getInt(3) %></td> <!-- sal -->
		<td><%= rs.getString("job") %></td> <!-- job -->
	</tr>

<%		
	}
	if(rs != null)try{rs.close();}catch(Exception e){}
	if(stmt != null)try{stmt.close();}catch(Exception e){}
	if(conn != null)try{conn.close();}catch(Exception e){}
%>
</table>
</body>
</html>









