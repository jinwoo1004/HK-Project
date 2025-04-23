package com.hk.dao;

import java.sql.*;
import com.hk.dto.MemberDto;

public class MemberDao {
	
	public MemberDao() {
	}

	// DB ���� �޼ҵ�
	public Connection getConn() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "hr";
		String password = "hr";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	} // getConn

	// ���̵�� ��й�ȣ�� �´��� üũ
	public int checkIdPw(String id, String pw) {
		int flag = 0;
		// JDBC 5�ܰ�:����̹� �ε�, ����, ���, ���, �ڿ�����
		Connection con = getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from members where id=? and pw=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		} // finally
		return flag;
	}// checkIdPw

	// ȸ�� ���� ����
	public boolean insert(MemberDto dto) {
		boolean saveOk = false;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConn();
			String sql = "insert into members" + "(id, pw, name, tel, email)" + " values(?,?,?,?,?)"; // ctrl
																										// +
																										// shit
																										// +
																										// y
																										// =
																										// �빮�ڸ�
																										// �ҹ��ڷ�
																										// �ٲٱ�
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getEmail());
			int x = ps.executeUpdate(); // 1�� ��ȯ�Ǹ� ���� ����
			if (x == 1) {
				saveOk = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps);
		} // finally
		return saveOk;
	}

	private void close(Connection con, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
			}

		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
			}
		}
	}

	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
		close(con, ps);
	}
}
