<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "hr";
	String pass = "hr";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT REF, INDENT, STEP FROM NOTICE_BOARD WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}

		sql = "UPDATE NOTICE_BOARD SET STEP=STEP+1 where REF=" + ref + " and STEP>" + step;
		stmt.executeUpdate(sql);

		sql = "INSERT INTO NOTICE_BOARD(NUM, USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP) "
				+ "values(NUM.NEXTVAL,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent + 1);
		pstmt.setInt(7, step + 1);

		pstmt.execute();
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();

	} catch (Exception e) {

	}
%>

<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "notice_list.jsp";
</script>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reply_ok</title>
</head>

<body>

</body>

</html>