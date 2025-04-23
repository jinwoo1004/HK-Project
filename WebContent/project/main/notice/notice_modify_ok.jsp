<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "hr";
	String pass = "hr";
	String password = "";

	try {

		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		String passw = request.getParameter("password");

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT PASSWORD FROM NOTICE_BOARD WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {
			sql = "UPDATE NOTICE_BOARD SET TITLE='" + title + "' ,MEMO='" + memo + "' WHERE NUM=" + idx;
			stmt.executeUpdate(sql);
%>

<script language=javascript>
	self.window.alert("글이 수정되었습니다.");
	location.href="notice_view.jsp?idx=<%=idx%>";
</script>

<%
	rs.close();
			stmt.close();
			conn.close();

		} else {
%>

<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>

<%
	}

	} catch (SQLException e) {
		out.println(e.toString());
	}
%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_ok</title>
</head>

<body>

</body>

</html>