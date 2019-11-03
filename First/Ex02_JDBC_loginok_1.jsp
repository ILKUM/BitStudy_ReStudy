<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	
		request.setCharacterEncoding("UTF-8");


		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//Class.forName("oracle.jdbc.OracleDriver"); tomcat 9.0 생략 가능
		try{
			
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
			//비기능적 요구사항
			conn = Singleton_Helper.getConnection("oracle"); //위에 Class.forName("oracle.jdbc.OracleDriver"); 대신에서 사용
			String sql="select id, pwd from koreamember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id); //첫번째 칸에 id로 설정 
			rs = pstmt.executeQuery(); 
			
			//업무 
			while(rs.next()){ //DB에 일치하는 데이터가 있다. (id가 존재)
				
				
				
				if(pwd.equals(rs.getString("pwd"))) { 
					//DB에 아이디가 존재하고 
					//정상회원
					
					//Top.jsp 정보 로그인 상태 
					session.setAttribute("userid", rs.getString("id")); //id값을 userid 속성에 저장
					
					//이동 처리
					response.sendRedirect("Ex02_JDBC_Main.jsp"); //로그인 성공시 링크로 이동
				}else { //ID는 일치하지만 PWD가 틀린경우 
				
					out.print("<script>");
					out.print("location.href='Ex02_JDBC_Login.jsp'"); //다시 로그인 페이지로 이동해서 기회를 줌				
					out.print("</script>");
				}
			}//while end
			//while문을 타지 않으면 ID , PWD가 DB에 없는 경우  
			
			out.print("<script>");
			out.print("location.href='Ex02_JDBC_JoinForm.jsp'"); //회원가입 페이지로 이동					
			out.print("</script>");
			
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			Singleton_Helper.close(rs);
			Singleton_Helper.close(pstmt);
		} 
		
		%>