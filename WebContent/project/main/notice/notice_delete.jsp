<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	function deleteCheck() {

		var form = document.deleteform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/styles.css" type="text/css" />
<title>delete</title>

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
				<table>
					<form name=deleteform method=POST action="notice_delete_ok.jsp?idx=<%=idx%>">
						<tr>
							<td>
								<table style="width: 400px;" cellpadding="0" cellspacing="0" border="0">
									<tr style="text-align: center;">
										<th colspan="2">삭제 하시겠습니까?</th>
									</tr>

									<tr height="200px" text-align="center">
										<td align="center">비밀번호</td>
										<td><input name="password" type="password" size="30" maxlength="100"></td>
									</tr>

									<tr height="1" bgcolor="#0C3A87">
										<td colspan="2"></td>
									</tr>

									<tr align="center">
										<td colspan="2">
											<input type=button value="삭제" OnClick="javascript:deleteCheck();"> 
											<input type=button value="취소" OnClick="javascript:history.back(-1)">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</form>
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