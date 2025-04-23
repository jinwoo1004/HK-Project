<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<title>공지사항</title>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" href="../css/styles.css" type="text/css" />
</head>

<body>
 <%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	String url = "jdbc:odbc:board2";
	String id = "";
	String pass = "";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT from board order by NUM DESC";
		rs = stmt.executeQuery(sqlList);
		
%>

	<div id="sitename">
		<div class="width">
			<h1>
				<a href="index.html"><img src="../img/ITedu_logo1.jpg"></a>
			</h1>

			<nav>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="apply.html">수강신청</a></li>
					<li class="start selected"><a href="notice.html">공지사항</a></li>
					<li><a href="my_page.html">MY PAGE</a></li>
					<li><a href="qna.html">Q&A</a></li>
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

		
				<table>
					<tr>
						<th width="10%">번호</th>
						<th width="55%">게시글</th>
						<th width="20%">작성자</th>
						<th width="10%">조회수</th>
					</tr>
					<tr>
						<td>1</td>
						<td>John Smith</td>
						<td>28</td>
						<td>28</td>

					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Rachel Johnson</td>
						<td>19</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Fred James</td>
						<td>49</td>
						<td>28</td>
					</tr>
					

				</table>
				<p>&nbsp;</p>
				</fieldset>
			</article>
		</section>

	</section>
	<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><%=title %></td>
	<td align="center"><%=name %></td>
	<td align="center"><%=time %></td>
	<td align="center"><%=hit %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기"></td>
  </tr>
</table>

	<footer class="clear">
		<div class="width">
			<p class="left">Copyright (주)한경닷컴 All rights reserved.</p>
			<p class="right">
				서울시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401/402호   |<br>
				TEL: 02-6340-2233   |   FAX: 02-6340-2234   |<br>
				Email:itcampus@hankyung.com
			</p>
		</div>
	</footer>
</body>
</html>
