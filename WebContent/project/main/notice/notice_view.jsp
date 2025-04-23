<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "hr";
	String pass = "hr";

	int idx = Integer.parseInt(request.getParameter("idx"));

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM NOTICE_BOARD WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
			hit++;
%>

<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/styles.css" type="text/css" />

<title>view</title>
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
					<li><a href="../../main/apply.html">������û</a></li>
					<li class="start selected"><a href="notice_list.jsp">��������</a></li>
					<li><a href="../../main/my_page.html">MY PAGE</a></li>
					<li><a href="../qna/qna_list.jsp">Q&A</a></li>
					<li><a href="../../main/login/login.html">�α׾ƿ�</a></li>
				</ul>
			</nav>

			<div class="clear"></div>
		</div>
	</div>

	<header>
		<div class="width">
			<h2>��������</h2>
		</div>
	</header>
	
	<section id="body" class="width clear">
		<section id="content" class="column-right">
			<article>
				<table>
					<tr>
						<td>
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr style="text-align: center;">
									<th width="5"></th>
									<th>�� ��</th>
									<th width="5"></th>
								</tr>
							</table>

							<table width="413">
								<tr>
									<td align="center" width="76">�۹�ȣ</td>
									<td width="319"><%=idx%></td>
								</tr>

								<tr>
									<td align="center" width="76">��ȸ��</td>
									<td width="319"><%=hit%></td>
								</tr>

								<tr>
									<td align="center" width="76">�̸�</td>
									<td width="319"><%=name%></td>
								</tr>

								<tr>
									<td align="center" width="76">�ۼ���</td>
									<td width="319"><%=time%></td>
								</tr>

								<tr>
									<td align="center" width="76">����</td>
									<td width="319"><%=title%></td>
								</tr>

								<tr>
									<td align="center" width="76">����</td>
									<td width="399" colspan="2" height="200"><%=memo%>
								</tr>
								
								<%
									sql = "UPDATE NOTICE_BOARD SET HIT=" + hit + " where NUM=" + idx;
											stmt.executeUpdate(sql);
											rs.close();
											stmt.close();
											conn.close();
										}
									} catch (SQLException e) {
									}
								%>

								<tr height="1" bgcolor="#0C3A87">
									<td colspan="2" width="407"></td>
								</tr>

								<tr align="center">
									<td width="0">&nbsp;</td>
									<td colspan="2" width="399">
										<input type=button value="�۾���" OnClick="window.location='notice_write.jsp'">
										<input type=button value="���" OnClick="window.location='notice_reply.jsp?idx=<%=idx%>'">
										<input type=button value="���" OnClick="window.location='notice_list.jsp'"> 
										<input type=button value="����" OnClick="window.location='notice_modify.jsp?idx=<%=idx%>'">
										<input type=button value="����" OnClick="window.location='notice_delete.jsp?idx=<%=idx%>'">
									</td>
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
			<p class="left">Copyright (��)�Ѱ���� All rights reserved.</p>
			<p class="right">
				����� �������� ����3�� 15-1 ����޸���Ӻ���� 4�� 401/402ȣ |<br> TEL:
				02-6340-2233 | FAX: 02-6340-2234 |<br>
				Email:itcampus@hankyung.com
			</p>
		</div>
	</footer>
</body>
</html>