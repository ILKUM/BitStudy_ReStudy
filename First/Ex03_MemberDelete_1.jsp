<%@page import="java.sql.ResultSet"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8"); //한글 처리

	 
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) { //회원이 아니거나 , 회원인데 id가 admin이 아닌경우 
		out.print("<script> location.href = 'Ex02_JDBC_Login.jsp' </script>"); //로그인 페이지로 이동
	}
	/* 어드민만 볼 수 있는 페이지 */
	String id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle"); //DB 연결 
		String sql="delete from koreamember where id=?"; //SQL 삭제 구문
		pstmt = conn.prepareStatement(sql); //SQL문을 자바로 변환
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); //select쿼리 결과값을 저장해줌 
		response.sendRedirect("Ex03_Memberlist.jsp"); //리스트 페이지로 이동
	}catch(Exception e) {
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>
					

					


