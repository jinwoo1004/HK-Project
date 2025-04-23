<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hk.dao.MemberDao"%>
<%@ page import="com.hk.dto.MemberDto"%>

<%
	request.setCharacterEncoding("UTF-8"); // 한글 OK
	
	//넘어온 값들을 받는다.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	//DTO에 담는다.
	MemberDto dto = new MemberDto();
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setTel(tel);
	dto.setEmail(email);
	
	//DB에 저장하는 코드
	MemberDao memberDao = new MemberDao();
	boolean saveOk = memberDao.insert(dto);
	if (saveOk) {
%>
회원가입 완료되었습니다!
<br>
<a href="login.html" class="button">로그인</a>
<%
	} else {
%>
회원 가입 실패했습니다! 다시 가입 바랍니다.
<br>
<a href="join.html" class="button">회원가입</a>
<%
	} // else
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>