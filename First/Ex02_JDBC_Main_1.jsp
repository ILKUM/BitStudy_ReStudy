<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<!-- 메인 페이지  -->
				<%
					String id = null; //자바 ID변수값을 null로 초기화
					id = (String)session.getAttribute("userid"); //세션을 종료할때까지 userid값을 String으로 다운 캐스팅
					
					if(id !=null) { //id가 있다면 회원으로 인식
				
						out.print(id + " 회원님 방가방가 ^^7 <br> "); //회원이면 뜨는 인사말 
						if(id.equals("admin")){ //id가 admin이면 
							out.print("<a href='Ex03_Memberlist.jsp'>회원관리</a>"); //회원관리 페이지 이동 버튼 생김
						}
					}else{ //회원이 아니면 메인페이지 인사말이 보이지 않음 
						
						out.print("사이트 방문을 환영합니다. ^^7 <br> 회원가입좀 하지 ");
						
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>