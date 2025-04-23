<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<script language="javascript">

	function replyCheck() {
		var form = document.replyform;

		if (!form.name.value) // form 에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요"); // 경고창 띄움
			form.name.focus(); // form 에 있는 name 위치로 이동
			return;
		}

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}

		form.submit();
	}
</script>

<!DOCTYPE html>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "hr";
	String pass = "hr";
	String title = "";

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT TITLE FROM QNA_BOARD WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			title = rs.getString(1);
		}

		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {
	}
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/styles.css" type="text/css" />
<title>reply</title>
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
					<li><a href="../notice/notice_list.jsp">공지사항</a></li>
					<li><a href="../../main/my_page.html">MY PAGE</a></li>
					<li class="start selected"><a href="qna_list.jsp">Q&A</a></li>
					<li><a href="../../main/login/login.html">로그아웃</a></li>
				</ul>
			</nav>

			<div class="clear"></div>
		</div>
	</div>

	<header>
		<div class="width">
			<h2>Q & A</h2>
		</div>
	</header>
	<section id="body" class="width clear">
		<section id="content" class="column-right">
			<article>
				<table>
					<form name=replyform method=POST action="qna_reply_ok.jsp?idx=<%=idx%>">
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr style="text-align: center;">
										<th width="5"></th>
										<th>답글</th>
										<th width="5"></th>
									</tr>
								</table>

								<table>
									<tr>
										<td>&nbsp;</td>
										<td align="center">제목</td>
										<td><input name="title" size="50" maxlength="100" value="<%=title%>"></td>
										<td>&nbsp;</td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td align="center">이름</td>
										<td><input name="name" size="50" maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td align="center">비밀번호</td>
										<td><input name="password" type="password" size="50" maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td align="center">내용</td>
										<td><textarea name="memo" cols="50" rows="13"></textarea></td>
										<td>&nbsp;</td>
									</tr>

									<tr height="1" bgcolor=""#0C3A87"">
										<td colspan="4"></td>
									</tr>

									<tr align="center">
										<td>&nbsp;</td>
										<td colspan="2">
											<input type=button value="등록" OnClick="javascript:replyCheck();"> 
											<input type=button value="취소" OnClick="javascript:history.back(-1)">
										</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</td>
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