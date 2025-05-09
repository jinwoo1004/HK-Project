<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8"); //받아오는 값들을 한글로 인코딩합니다.

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "hr";
	String pass = "hr";

	String name = request.getParameter("name"); 			//write.jsp에서 name에 입력한 데이터값
	String password = request.getParameter("password");		//write.jsp에서 password에 입력한 데이터값
	String title = request.getParameter("title"); 			//write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("memo"); 			//write.jsp에서 memo에 입력한 데이터값

	int max = 0;

	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT MAX(NUM) FROM QNA_BOARD";
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			max = rs.getInt(1);
		}

		sql = "INSERT INTO QNA_BOARD(NUM, USERNAME, PASSWORD, TITLE, MEMO, REF) VALUES(NUM.NEXTVAL,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max + 1);

		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>

<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "qna_list.jsp";
</script>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write_ok</title>
</head>

<body>


</body>

</html>