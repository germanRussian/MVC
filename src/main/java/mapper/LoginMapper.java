package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.LoginDTO;
import domain.LoginVO;
import domain.MyPageDTO;

public class LoginMapper {

	public LoginVO read(LoginDTO dto) {
		String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM g_member ");
		sql.append(" WHERE uid = ? AND upw = sha1(?) ");
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);

			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, dto.getUid());
			stmt.setString(2, dto.getUpw());

			rs = stmt.executeQuery();

			if (rs.next()) {
				LoginVO vo = new LoginVO();

				vo.setUid(rs.getString("uid"));
				vo.setUname(rs.getString("uname"));
				vo.setSchoolname(rs.getString("schoolname"));

				return vo;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

}
