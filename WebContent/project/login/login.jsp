<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hk.dao.MemberDao"%>

<%

 request.setCharacterEncoding("UTF-8"); //한글이 깨지지 않게 하기
 
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 
 MemberDao dao = new MemberDao();
 int flag = dao.checkIdPw(id, pw);
 //out.println("flag="+flag);
 
 if(flag == 0) { //틀린 경우
  response.sendRedirect("loginfail.jsp");
 } 
 else if(flag == 1) { //맞은 경우
  session.setAttribute("id",""); 
  response.sendRedirect("../main/index.html");
 }
 
%>

