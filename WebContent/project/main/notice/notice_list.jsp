<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/styles.css" type="text/css" />
<title>list</title>
</head>

<body>

	<div id="sitename">
		<div class="width">
			<h1>
				<a href="../index.html"><img src="../../img/ITedu_logo1.jpg"></a>
			</h1>

			<nav>
				<ul>
					<li><a href="../index.html">Home</a></li>
					<li><a href="../../main/apply.html">수강신청</a></li>
					<li class="start selected"><a href="notice_list.jsp">공지사항</a></li>
					<li><a href="../../main/my_page.html">MY PAGE</a></li>
					<li><a href="../qna/qna_list.jsp">Q&A</a></li>
					<li><a href="../../main/login/login.html">로그아웃</a></li>
				</ul>
			</nav>

			<div class="clear"></div>
		</div>
	</div>

	<header>
		<div class="width">
			<h2>공지사항</h2>
		</div>
	</header>
	
	<section id="body" class="width clear">
		<section id="content" class="column-right">
			<article>
				<%
					Class.forName("oracle.jdbc.driver.OracleDriver");
					String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
					String id = "hr";
					String pass = "hr";
					int total = 0;

					try {
						Connection conn = DriverManager.getConnection(url, id, pass);
						Statement stmt = conn.createStatement();

						String sqlCount = "SELECT COUNT(*) FROM NOTICE_BOARD";
						ResultSet rs = stmt.executeQuery(sqlCount);

						if (rs.next()) {
							total = rs.getInt(1);
						}
						rs.close();
						out.print("총 게시물 : " + total + "개");

						String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from NOTICE_BOARD order by REF DESC, STEP ASC";
						rs = stmt.executeQuery(sqlList);
				%>



				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr height="5">
						<td width="5"></td>
					</tr>
					
					<tr style="text-align: center;">
						<th width="73">번호</th>
						<th width="379">제목</th>
						<th width="73">작성자</th>
						<th width="164">작성일</th>
						<th width="58">조회수</th>
					</tr>
					
					<%
						if (total == 0) {
					%>
					
					<tr align="center" height="30">
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
					
					<%
						} else {
								while (rs.next()) {
									int idx = rs.getInt(1);
									String name = rs.getString(2);
									String title = rs.getString(3);
									String time = rs.getString(4);
									int hit = rs.getInt(5);
									int indent = rs.getInt("indent");

									Date date = new Date();
									SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
									String year = (String) simpleDate.format(date);
									String yea = time.substring(0, 10);
					%>
					
					<tr height="25" align="center">
						<td><%=idx%></td>
						<td align="left">
							<%
								for (int j = 0; j < indent; j++) {
							%> &nbsp;&nbsp;&nbsp;<%
					 	}
					 				if (indent != 0) {
					 %> <img src="img/reply_icon.gif" /> <%
					 	}
					 %> <a href="notice_view.jsp?idx=<%=idx%>"><%=title%></a> <%
					 	if (year.equals(yea)) {
					 %> <img src='img/new.jpg'> <%
					 	}
					 %>
						</td>
						<td align="center"><%=name%></td>
						<td align="center"><%=time%></td>
						<td align="center"><%=hit%></td>
					</tr>

					<%
						}
							}
							rs.close();
							stmt.close();
							conn.close();
						} catch (SQLException e) {
							out.println(e.toString());
						}
					%>
					
					<tr height="1" bgcolor="#0C3A87">
						<td colspan="5" width="752"></td>
					</tr>
				</table>

				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td colspan="4" height="5"></td>
					</tr>
					<tr align="center">
						<td><input type=button value="글쓰기" OnClick="window.location='notice_write.jsp'"></td>
					</tr>
				</table>
			</article>
		</section>
	</section>

	<footer class="clear">
		<div class="width">
			<p class="left">Copyright (주)한경닷컴 All rights reserved.</p>
			<p class="right">
				서울시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401/402호 |<br> TEL:
				02-6340-2233 | FAX: 02-6340-2234 |<br>
				Email:itcampus@hankyung.com
			</p>
		</div>
	</footer>
</body>
</html>