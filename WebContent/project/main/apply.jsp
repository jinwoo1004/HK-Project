<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="jsp이JW.applyDao" %>

<%
 request.setCharacterEncoding("UTF-8"); //한글이 깨지지 않게 하기
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 applyDao dao = new applyDao();
 int flag = dao.checkIdPw(id, pw);
 //out.println("flag="+flag);
 if(flag == 1) { //맞은 경우
	 //sesion
  String idS = (String)session.getAttribute("id"); 
  response.sendRedirect("../main/applysue.jsp");
 }
%>
